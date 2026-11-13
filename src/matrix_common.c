#include "matrix_common.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#ifdef _WIN32
#include <windows.h>
#include <psapi.h>
#include <malloc.h>
#else
#define _POSIX_C_SOURCE 200809L
#include <time.h>
#include <sys/resource.h>
#endif

double get_wall_time_sec(void) {
#ifdef _WIN32
    LARGE_INTEGER freq, counter;
    QueryPerformanceFrequency(&freq);
    QueryPerformanceCounter(&counter);
    return (double)counter.QuadPart / (double)freq.QuadPart;
#else
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (double)ts.tv_sec + (double)ts.tv_nsec * 1e-9;
#endif
}

#ifdef _WIN32
static double g_cycles_per_sec = 0.0;

static void calibrate_cpu_cycles(void) {
    if (g_cycles_per_sec > 0.0) return;
    ULONG64 c0 = 0, c1 = 0;
    double t0 = get_wall_time_sec();
    QueryProcessCycleTime(GetCurrentProcess(), &c0);
    volatile double sink = 0.0;
    for (int i = 0; i < 2000000; i++) {
        sink += (double)i * 1e-7;
    }
    QueryProcessCycleTime(GetCurrentProcess(), &c1);
    double t1 = get_wall_time_sec();
    double dt = t1 - t0;
    if (dt > 1e-5 && c1 > c0) {
        g_cycles_per_sec = (double)(c1 - c0) / dt;
    } else {
        g_cycles_per_sec = 3.0e9;
    }
    (void)sink;
}
#endif

double get_cpu_time_sec(void) {
#ifdef _WIN32
    calibrate_cpu_cycles();
    ULONG64 cycles = 0;
    if (QueryProcessCycleTime(GetCurrentProcess(), &cycles) && g_cycles_per_sec > 0.0) {
        return (double)cycles / g_cycles_per_sec;
    }
    FILETIME create_time, exit_time, kernel_time, user_time;
    if (GetProcessTimes(GetCurrentProcess(), &create_time, &exit_time, &kernel_time, &user_time)) {
        ULARGE_INTEGER k, u;
        k.LowPart = kernel_time.dwLowDateTime;
        k.HighPart = kernel_time.dwHighDateTime;
        u.LowPart = user_time.dwLowDateTime;
        u.HighPart = user_time.dwHighDateTime;
        return (double)(k.QuadPart + u.QuadPart) * 1e-7;
    }
    return 0.0;
#else
    struct timespec ts;
    if (clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &ts) == 0) {
        return (double)ts.tv_sec + (double)ts.tv_nsec * 1e-9;
    }
    struct rusage usage;
    if (getrusage(RUSAGE_SELF, &usage) == 0) {
        double u = (double)usage.ru_utime.tv_sec + (double)usage.ru_utime.tv_usec * 1e-6;
        double s = (double)usage.ru_stime.tv_sec + (double)usage.ru_stime.tv_usec * 1e-6;
        return u + s;
    }
    return 0.0;
#endif
}

long get_peak_rss_kb(void) {
#ifdef _WIN32
    PROCESS_MEMORY_COUNTERS pmc;
    if (GetProcessMemoryInfo(GetCurrentProcess(), &pmc, sizeof(pmc))) {
        return (long)(pmc.PeakWorkingSetSize / 1024ULL);
    }
    return 0L;
#else
    struct rusage usage;
    if (getrusage(RUSAGE_SELF, &usage) == 0) {
#ifdef __APPLE__
        return (long)(usage.ru_maxrss / 1024L);
#else
        return (long)usage.ru_maxrss;
#endif
    }
    return 0L;
#endif
}

static uint64_t rng_state = DEFAULT_SEED;

void set_rng_seed(uint64_t seed) {
    rng_state = seed ? seed : 1ULL;
}

static double rand_uniform_01(void) {
    uint64_t x = rng_state;
    x ^= x >> 12;
    x ^= x << 25;
    x ^= x >> 27;
    rng_state = x;
    return ((x * 0x2545F4914F6CDD1DULL) >> 11) * (1.0 / 9007199254740992.0);
}

double rand_uniform_symmetric(void) {
    return rand_uniform_01() * 2.0 - 1.0;
}

double *alloc_matrix(int n) {
    size_t bytes = (size_t)n * (size_t)n * sizeof(double);
#ifdef _WIN32
    double *ptr = (double *)_aligned_malloc(bytes, 64);
#else
    void *raw = NULL;
    if (posix_memalign(&raw, 64, bytes) != 0) {
        raw = NULL;
    }
    double *ptr = (double *)raw;
#endif
    if (!ptr) {
        fprintf(stderr, "[FATAL] Memory allocation failed for n=%d (%zu bytes)\n", n, bytes);
        exit(EXIT_FAILURE);
    }
    return ptr;
}

void free_matrix(double *M) {
    if (!M) return;
#ifdef _WIN32
    _aligned_free(M);
#else
    free(M);
#endif
}

void generate_random_matrix(double *M, int n, uint64_t seed) {
    set_rng_seed(seed);
    long total = (long)n * (long)n;
    for (long i = 0; i < total; i++) {
        M[i] = rand_uniform_symmetric();
    }
}

void generate_identity_matrix(double *M, int n) {
    memset(M, 0, (size_t)n * (size_t)n * sizeof(double));
    for (int i = 0; i < n; i++) {
        M[(long)i * n + i] = 1.0;
    }
}

void generate_zero_matrix(double *M, int n) {
    memset(M, 0, (size_t)n * (size_t)n * sizeof(double));
}

void reference_matmul_ikj(const double *A, const double *B, double *C, int n) {
    for (int i = 0; i < n; i++) {
        double *c_row = &C[(long)i * n];
        for (int j = 0; j < n; j++) {
            c_row[j] = 0.0;
        }
        for (int k = 0; k < n; k++) {
            double a_ik = A[(long)i * n + k];
            const double *b_row = &B[(long)k * n];
            for (int j = 0; j < n; j++) {
                c_row[j] += a_ik * b_row[j];
            }
        }
    }
}

void reference_matmul_ijk(const double *A, const double *B, double *C, int n) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            double sum = 0.0;
            for (int k = 0; k < n; k++) {
                sum += A[(long)i * n + k] * B[(long)k * n + j];
            }
            C[(long)i * n + j] = sum;
        }
    }
}

int verify_matrix_tolerance(const double *ref, const double *test, int n,
                            double atol, double rtol, const char *label) {
    long total = (long)n * (long)n;
    double max_abs_err = 0.0;
    for (long idx = 0; idx < total; idx++) {
        double y_hat = ref[idx];
        double y = test[idx];
        double diff = fabs(y - y_hat);
        double bound = atol + rtol * fabs(y_hat);
        if (diff > max_abs_err) {
            max_abs_err = diff;
        }
        if (diff > bound || isnan(y)) {
            int row = (int)(idx / n);
            int col = (int)(idx % n);
            fprintf(stderr,
                    "[FAIL] %s (n=%d): mismatch at (%d,%d) -> test=%.15e, ref=%.15e, diff=%.3e > bound=%.3e\n",
                    label, n, row, col, y, y_hat, diff, bound);
            return 0;
        }
    }
    printf("[PASS] %-42s | n=%4d | max_abs_err=%.3e (atol=%.1e, rtol=%.1e)\n",
           label, n, max_abs_err, atol, rtol);
    return 1;
}

double compute_checksum(const double *C, int n) {
    double sum = 0.0;
    long total = (long)n * (long)n;
    long stride = (n > 64) ? 17 : 1;
    for (long i = 0; i < total; i += stride) {
        sum += C[i];
    }
    return sum;
}
