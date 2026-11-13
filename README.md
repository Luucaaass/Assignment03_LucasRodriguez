# Assignment 3 — Parallel Matrix Multiplication and Optional Vectorisation

**Author:** Lucas Rodríguez Hernández
**Course:** Big Data — Grado en Ciencia e Ingeniería de Datos (ULPGC), Academic Year 2026–2027
**Repository:** [https://github.com/Luucaaass/Assignment03_LucasRodriguez](https://github.com/Luucaaass/Assignment03_LucasRodriguez)

This repository compares an equivalent sequential baseline (`ikj` dense matrix multiplication, C) with a
shared-memory OpenMP implementation of *the same* algorithm, data layout and arithmetic. It also includes an
optional controlled study of SIMD vectorisation (scalar vs. compiler auto-vectorised vs. explicit AVX2 FMA).
The full report is in [`report/report.md`](report/report.md).

## 1. Benchmark environment

| Item | Value |
|---|---|
| CPU | Intel® Core™ Ultra 9 285H (Arrow Lake-H), 1 package |
| Cores / logical processors | 16 physical cores / 16 logical processors, **no SMT** |
| Hybrid layout (measured with `GetLogicalProcessorInformationEx`) | 6 P-cores (EfficiencyClass 1) + 10 E-cores (EfficiencyClass 0): 8 E-cores share the L3 + 2 low-power E-cores outside the L3 |
| Caches | L1d 48 KB (P) / 32 KB (E) per core; L2 3 MB per P-core, 4 MB per 4-E-core cluster, 2 MB for the LP-E pair; L3 24 MB shared by 14 cores |
| RAM | 63.40 GiB usable (68 073 553 920 bytes) |
| OS | Windows 11 (build 10.0.26300), 64-bit |
| Compiler | GCC 16.2.0 (x86_64-w64-mingw32, w64devkit distribution) |
| OpenMP | GNU libgomp, `_OPENMP = 202111` (OpenMP 5.2) |
| Flags | `-O3 -march=native -std=c11 -Wall -Wextra` (+ `-fopenmp` for the parallel binary); link `-lm -lpsapi` |
| Python (analysis only) | CPython 3.14.4, numpy 2.5.2, pandas 3.0.6, matplotlib 3.11.2 |

The exact values captured during the benchmark run are written to `results/environment.txt`.

## 2. Repository structure

```text
assignment_03/
├── src/
│   ├── matrix_common.h / .c   # aligned allocation, xorshift64* RNG, timers, peak RSS, tolerance checks
│   ├── sequential.c           # sequential ikj baseline (+ scalar and explicit-AVX2 variants for the SIMD study)
│   └── parallel_omp.c         # OpenMP ikj (#pragma omp parallel for schedule(static)) (+ scalar / AVX2 variants)
├── scripts/
│   ├── run_correctness.sh     # build + validation suite (identity, zero, reference, tolerances)
│   ├── benchmark_runner.py    # build, correctness, warm-ups, repeated runs, CSV + summaries + figures
│   ├── plot_results.py        # figures and summary tables
│   └── cpu_topology.c         # Windows hardware topology probe (cores, SMT, P/E class, caches)
├── data/
│   ├── raw_measurements.csv   # main experiment: every measured repetition (n, impl, numeric_type, p, run)
│   └── raw_vectorization.csv  # optional SIMD experiment: every measured repetition
├── results/
│   ├── summary_metrics.csv          # medians, IQR, S(p), E(p), p=1 overhead, RSS, GFLOP/s
│   ├── summary_vectorization.csv    # SIMD medians, IQR, SIMD speedups
│   ├── correctness_log.txt          # output of the validation suite
│   ├── vectorization_evidence.txt   # GCC -fopt-info-vec-optimized report
│   ├── parallel_omp.s               # generated OpenMP assembly (evidence of vector instructions)
│   ├── sequential.s                 # generated sequential assembly (evidence of 2-k unroll-and-jam)
│   ├── environment.txt              # host/compiler metadata captured at run time
│   ├── benchmark_console.log        # full benchmark console output log
│   └── figures/                     # PNG (300 dpi) + SVG figures
├── report/
│   ├── report.md                    # research report (English, 8 mandatory sections)
│   └── Assignment03_LucasRodriguez_Report.pdf # rendered PDF report
├── Makefile
└── README.md
```

## 3. Reproduction

All commands are run from the `assignment_03/` directory with `gcc` (w64devkit / MinGW-w64) and Python 3 on
`PATH`. On Linux the same sources compile unchanged (POSIX timers and `getrusage` are used automatically).

```bash
# 1) Build both binaries
make all                       # or: mingw32-make all

# 2) Correctness suite (identity, zero, reference ikj/ijk, p in {1,2,4,8,16,32}, atol = rtol = 1e-9)
make check                     # or: bash scripts/run_correctness.sh

# 3) Full experiment: rebuild, validate, benchmark, summarise and plot (~10 min on the host above)
python scripts/benchmark_runner.py        # Windows launcher: py scripts/benchmark_runner.py

# 4) Re-generate figures/tables only from existing CSVs
python scripts/plot_results.py
```

Single runs (each prints `CSV,n,impl,numeric_type,p,run,kernel_time_sec,peak_rss_kb,cpu_util_pct,checksum`, with `numeric_type=float64`):

```bash
./sequential.exe   <n> [warmups=2] [runs=5] [sequential|seq_scalar|seq_avx2]
./parallel_omp.exe <n> <p> [warmups=2] [runs=5] [parallel_omp|omp_scalar|omp_avx2]
```

### Experimental protocol

* Sizes `n ∈ {256, 512, 1024, 1536, 2048}`; threads `p ∈ {1, 2, 4, 6, 8, 12, 14, 16, 24, 32}`
  (6 = P-cores, 14 = cores on the shared L3, 16 = all cores, 24/32 = oversubscription).
* 2 untimed warm-up runs and 5 timed repetitions per configuration, each configuration in a fresh process.
* Timed window = the multiplication kernel only, **including zero-initialisation of `C`** (in both versions);
  allocation, random generation, checksum and RSS queries are outside it.
* Environment: `OMP_NUM_THREADS=p`, `OMP_DYNAMIC=FALSE`, `OMP_PROC_BIND=false`,
  `OPENBLAS_NUM_THREADS=1`, `MKL_NUM_THREADS=1` (no BLAS library is linked; set as a safeguard).
* Statistics: median and IQR over the 5 repetitions; `S(p) = median(T_seq)/median(T_p)`, `E(p) = S(p)/p`,
  `p=1` overhead `= (T_1 − T_seq)/T_seq`.

## 4. Known limitations

* Thread pinning is not enforced: libgomp on Windows does not implement `OMP_PLACES`/`OMP_PROC_BIND`
  affinity the way it does on Linux, so placement on P- vs. E-cores is decided by the Windows scheduler
  (Thread Director). See the report, Section 4.
* `cpu_util_pct` comes from a process CPU-cycle counter converted to seconds with a run-time calibration;
  for sub-millisecond kernels it is noisy, and if the wall-clock time cannot be measured it is reported as
  `NaN` (never imputed).
* Peak RSS is the process-wide `PeakWorkingSetSize` (the Windows equivalent of `ru_maxrss`).

