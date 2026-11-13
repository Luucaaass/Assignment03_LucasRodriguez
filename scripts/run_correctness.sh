#!/usr/bin/env bash
# Automated Correctness Verification Suite for Assignment 3
# Validates Identity (A * I = A), Zero (A * 0 = 0), and numerical agreement
# against sequential reference across n in {16, 64, 67, 128} and thread counts
# p in {1, 2, 4, 8, 16, 32} with strict tolerances (atol = 1e-9, rtol = 1e-9).

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd "${PROJECT_DIR}"

export OPENBLAS_NUM_THREADS=1
export MKL_NUM_THREADS=1
# OMP_PROC_BIND=false matches the benchmark harness; MinGW-w64 libgomp does not
# support affinity and would print "libgomp: Affinity not supported" otherwise.
export OMP_PROC_BIND=false

echo "============================================================"
echo " Building Sequential and OpenMP Parallel Binaries (-O3)"
echo "============================================================"
make all

echo ""
echo "============================================================"
echo " Executing Sequential Baseline Validation Suite"
echo "============================================================"
if [[ -f "./sequential.exe" ]]; then
    ./sequential.exe --check
else
    ./sequential --check
fi

echo ""
echo "============================================================"
echo " Executing OpenMP Parallel & SIMD Validation Suite"
echo "============================================================"
if [[ -f "./parallel_omp.exe" ]]; then
    ./parallel_omp.exe --check
else
    ./parallel_omp --check
fi

echo ""
echo "[SUCCESS] All correctness checks passed within strict tolerance (atol=1e-9, rtol=1e-9)."

