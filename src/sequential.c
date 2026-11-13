#include "matrix_common.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <immintrin.h>

/* Equivalent sequential baseline: ikj loop order for unit-stride spatial locality */
void matmul_sequential_ikj(const double * __restrict__ A,
                           const double * __restrict__ B,
                           double * __restrict__ C,
                           int n) {
    for (int i = 0; i < n; i++) {
        double * __restrict__ c_row = &C[(long)i * n];
        for (int j = 0; j < n; j++) {
            c_row[j] = 0.0;
        }
        for (int k = 0; k < n; k++) {
            double a_ik = A[(long)i * n + k];
            const double * __restrict__ b_row = &B[(long)k * n];
            for (int j = 0; j < n; j++) {
                c_row[j] += a_ik * b_row[j];
            }
        }
    }
}

/* Non-vectorised sequential ikj baseline (Optional Vectorisation Extension control) */
void matmul_sequential_scalar_ikj(const double * __restrict__ A,
                                  const double * __restrict__ B,
                                  double * __restrict__ C,
                                  int n) {
    for (int i = 0; i < n; i++) {
        double * __restrict__ c_row = &C[(long)i * n];
#pragma GCC novector
        for (int j = 0; j < n; j++) {
            c_row[j] = 0.0;
        }
        for (int k = 0; k < n; k++) {
            double a_ik = A[(long)i * n + k];
            const double * __restrict__ b_row = &B[(long)k * n];
#pragma GCC novector
            for (int j = 0; j < n; j++) {
                c_row[j] += a_ik * b_row[j];
            }
        }
    }
}

/* Explicit AVX2 256-bit FMA vectorised sequential ikj (4x YMM register unrolled) */
void matmul_sequential_avx2_ikj(const double * __restrict__ A,
                                const double * __restrict__ B,
                                double * __restrict__ C,
                                int n) {
    for (int i = 0; i < n; i++) {
        double * __restrict__ c_row = &C[(long)i * n];
        int j = 0;
        __m256d z0 = _mm256_setzero_pd();
        for (; j <= n - 4; j += 4) {
            _mm256_storeu_pd(&c_row[j], z0);
        }
        for (; j < n; j++) {
            c_row[j] = 0.0;
        }
        for (int k = 0; k < n; k++) {
            __m256d va = _mm256_set1_pd(A[(long)i * n + k]);
            const double * __restrict__ b_row = &B[(long)k * n];
            int jj = 0;
            for (; jj <= n - 16; jj += 16) {
                __m256d vc0 = _mm256_loadu_pd(&c_row[jj]);
                __m256d vc1 = _mm256_loadu_pd(&c_row[jj + 4]);
                __m256d vc2 = _mm256_loadu_pd(&c_row[jj + 8]);
                __m256d vc3 = _mm256_loadu_pd(&c_row[jj + 12]);

                vc0 = _mm256_fmadd_pd(va, _mm256_loadu_pd(&b_row[jj]), vc0);
                vc1 = _mm256_fmadd_pd(va, _mm256_loadu_pd(&b_row[jj + 4]), vc1);
                vc2 = _mm256_fmadd_pd(va, _mm256_loadu_pd(&b_row[jj + 8]), vc2);
                vc3 = _mm256_fmadd_pd(va, _mm256_loadu_pd(&b_row[jj + 12]), vc3);

                _mm256_storeu_pd(&c_row[jj], vc0);
                _mm256_storeu_pd(&c_row[jj + 4], vc1);
                _mm256_storeu_pd(&c_row[jj + 8], vc2);
                _mm256_storeu_pd(&c_row[jj + 12], vc3);
            }
            for (; jj <= n - 4; jj += 4) {
                __m256d vc = _mm256_loadu_pd(&c_row[jj]);
                __m256d vb = _mm256_loadu_pd(&b_row[jj]);
                vc = _mm256_fmadd_pd(va, vb, vc);
                _mm256_storeu_pd(&c_row[jj], vc);
            }
            double a_ik = A[(long)i * n + k];
            for (; jj < n; jj++) {
                c_row[jj] += a_ik * b_row[jj];
            }
        }
    }
}

static int run_sequential_correctness(void) {
    printf("=== Sequential Baseline Correctness Verification ===\n");
    const int test_sizes[] = {16, 64, 67, 128};
    const int num_sizes = (int)(sizeof(test_sizes) / sizeof(test_sizes[0]));
    int all_ok = 1;

    for (int s = 0; s < num_sizes; s++) {
        int n = test_sizes[s];
        double *A = alloc_matrix(n);
        double *B = alloc_matrix(n);
        double *I = alloc_matrix(n);
        double *Z = alloc_matrix(n);
        double *C_ref = alloc_matrix(n);
        double *C_test = alloc_matrix(n);

        generate_random_matrix(A, n, DEFAULT_SEED + (uint64_t)n);
        generate_random_matrix(B, n, DEFAULT_SEED + (uint64_t)n + 1000ULL);
        generate_identity_matrix(I, n);
        generate_zero_matrix(Z, n);

        /* 1. Identity test: A * I = A */
        matmul_sequential_ikj(A, I, C_test, n);
        all_ok &= verify_matrix_tolerance(A, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
                                          "Sequential Identity (A * I == A)");

        /* 2. Zero test: A * 0 = 0 */
        matmul_sequential_ikj(A, Z, C_test, n);
        all_ok &= verify_matrix_tolerance(Z, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
                                          "Sequential Zero (A * 0 == 0)");

        /* 3. Cross-check against naive ijk reference */
        reference_matmul_ijk(A, B, C_ref, n);
        matmul_sequential_ikj(A, B, C_test, n);
        all_ok &= verify_matrix_tolerance(C_ref, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
                                          "Sequential ikj vs Reference ijk");

        /* 4. Cross-check scalar and explicit AVX2 variants */
        matmul_sequential_scalar_ikj(A, B, C_test, n);
        all_ok &= verify_matrix_tolerance(C_ref, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
                                          "Sequential scalar ikj vs Reference ijk");

        matmul_sequential_avx2_ikj(A, B, C_test, n);
        all_ok &= verify_matrix_tolerance(C_ref, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
                                          "Sequential AVX2 ikj vs Reference ijk");

        free_matrix(A);
        free_matrix(B);
        free_matrix(I);
        free_matrix(Z);
        free_matrix(C_ref);
        free_matrix(C_test);
    }
    return all_ok;
}

int main(int argc, char **argv) {
    if (argc >= 2 && strcmp(argv[1], "--check") == 0) {
        return run_sequential_correctness() ? EXIT_SUCCESS : EXIT_FAILURE;
    }

    int n = (argc >= 2) ? atoi(argv[1]) : 512;
    int warmup_runs = (argc >= 3) ? atoi(argv[2]) : 2;
    int measured_runs = (argc >= 4) ? atoi(argv[3]) : 5;
    const char *impl_name = (argc >= 5) ? argv[4] : "sequential";

    if (n <= 0 || warmup_runs < 0 || measured_runs <= 0) {
        fprintf(stderr, "Usage: %s <n> [warmup_runs=2] [measured_runs=5] [impl_name=sequential]\n", argv[0]);
        return EXIT_FAILURE;
    }

    /* Outside timed window: allocation and deterministic initialization */
    double *A = alloc_matrix(n);
    double *B = alloc_matrix(n);
    double *C = alloc_matrix(n);

    generate_random_matrix(A, n, DEFAULT_SEED + (uint64_t)n);
    generate_random_matrix(B, n, DEFAULT_SEED + (uint64_t)n + 1000ULL);

    /* Untimed warm-up runs */
    for (int w = 0; w < warmup_runs; w++) {
        if (strcmp(impl_name, "seq_scalar") == 0) {
            matmul_sequential_scalar_ikj(A, B, C, n);
        } else if (strcmp(impl_name, "seq_avx2") == 0) {
            matmul_sequential_avx2_ikj(A, B, C, n);
        } else {
            matmul_sequential_ikj(A, B, C, n);
        }
    }

    /* Timed repetitions (isolated multiplication kernel) */
    for (int r = 1; r <= measured_runs; r++) {
        double cpu_t0 = get_cpu_time_sec();
        double wall_t0 = get_wall_time_sec();

        if (strcmp(impl_name, "seq_scalar") == 0) {
            matmul_sequential_scalar_ikj(A, B, C, n);
        } else if (strcmp(impl_name, "seq_avx2") == 0) {
            matmul_sequential_avx2_ikj(A, B, C, n);
        } else {
            matmul_sequential_ikj(A, B, C, n);
        }

        double wall_t1 = get_wall_time_sec();
        double cpu_t1 = get_cpu_time_sec();

        double kernel_time_sec = wall_t1 - wall_t0;
        double cpu_time_sec = cpu_t1 - cpu_t0;
        double cpu_util_pct = (kernel_time_sec > 1e-9)
                                  ? ((cpu_time_sec / kernel_time_sec) * 100.0)
                                  : NAN; /* not measurable: reported as missing, never imputed */

        /* Outside timed window: checksum and peak RSS measurement */
        double chk = compute_checksum(C, n);
        long peak_rss_kb = get_peak_rss_kb();

        /* CSV,n,implementation,numeric_type,thread_count,run_index,time,rss,cpu,checksum */
        printf("CSV,%d,%s,float64,1,%d,%.9f,%ld,%.2f,%.6f\n",
               n, impl_name, r, kernel_time_sec, peak_rss_kb, cpu_util_pct, chk);
        fflush(stdout);
    }

    free_matrix(A);
    free_matrix(B);
    free_matrix(C);
    return EXIT_SUCCESS;
}
