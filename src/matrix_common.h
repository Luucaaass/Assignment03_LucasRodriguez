#ifndef MATRIX_COMMON_H
#define MATRIX_COMMON_H

#include <stdint.h>
#include <stddef.h>

#define DEFAULT_SEED 42ULL
#define DEFAULT_ATOL 1e-9
#define DEFAULT_RTOL 1e-9

/* High-resolution monotonic wall-clock timer in seconds */
double get_wall_time_sec(void);

/* Process CPU time (user + kernel) in seconds for CPU utilization tracking */
double get_cpu_time_sec(void);

/* Peak Resident Set Size (RSS) in kilobytes (KB) */
long get_peak_rss_kb(void);

/* Deterministic 64-bit xorshift64* PRNG (reused from Assignment 2) */
void set_rng_seed(uint64_t seed);
double rand_uniform_symmetric(void);

/* Allocate 64-byte aligned contiguous 1D row-major matrix of size n x n */
double *alloc_matrix(int n);
void free_matrix(double *M);

/* Matrix initialization utilities (outside timed region) */
void generate_random_matrix(double *M, int n, uint64_t seed);
void generate_identity_matrix(double *M, int n);
void generate_zero_matrix(double *M, int n);

/* Reference sequential ikj multiplication for correctness checks */
void reference_matmul_ikj(const double *A, const double *B, double *C, int n);

/* Naive sequential ijk multiplication (for algorithmic baseline reference) */
void reference_matmul_ijk(const double *A, const double *B, double *C, int n);

/* Strict tolerance validation: |y - y_hat| <= atol + rtol * |y_hat| */
int verify_matrix_tolerance(const double *ref, const double *test, int n,
                            double atol, double rtol, const char *label);

/* Lightweight strided checksum to prevent dead-code elimination */
double compute_checksum(const double *C, int n);

#endif /* MATRIX_COMMON_H */

