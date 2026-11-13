#!/usr/bin/env python3
"""
Automated Experimental Benchmarking Harness for Assignment 3:
Parallel Matrix Multiplication and Optional Vectorisation.

Executes:
1. Build of sequential and parallel_omp binaries (-O3 -march=native -fopenmp)
   and extraction of compiler vectorisation diagnostics (-fopt-info-vec-optimized).
2. Pre-benchmarking correctness verification suite (Identity, Zero, Reference).
3. Controlled benchmarking across n in {256, 512, 1024, 1536, 2048} and
   p in {1, 2, 4, 6, 8, 12, 14, 16, 24, 32} with 2 warm-ups and 5 measured runs.
4. Optional SIMD vectorisation benchmark comparing scalar vs. AVX2 SIMD across
   matrix sizes and thread counts.
5. Aggregation of medians, IQRs, Speedup S(p), Efficiency E(p), and p=1 overhead.
"""

import os
import sys
import csv
import subprocess
from pathlib import Path
import numpy as np
import pandas as pd

PROJECT_DIR = Path(__file__).resolve().parent.parent
DATA_DIR = PROJECT_DIR / "data"
RESULTS_DIR = PROJECT_DIR / "results"
FIGURES_DIR = RESULTS_DIR / "figures"

MATRIX_SIZES = [256, 512, 1024, 1536, 2048]
THREAD_COUNTS = [1, 2, 4, 6, 8, 12, 14, 16, 24, 32]
WARMUP_RUNS = 2
MEASURED_RUNS = 5

IS_WINDOWS = os.name == "nt"
SEQ_BIN = PROJECT_DIR / ("sequential.exe" if IS_WINDOWS else "sequential")
OMP_BIN = PROJECT_DIR / ("parallel_omp.exe" if IS_WINDOWS else "parallel_omp")


def compile_binaries():
    print("=== Step 1: Compiling C Binaries with -O3 -march=native -fopenmp ===")
    ldflags = ["-lm", "-lpsapi"] if IS_WINDOWS else ["-lm"]

    cmd_seq = [
        "gcc", "-O3", "-march=native", "-std=c11", "-Wall", "-Wextra",
        "-fopt-info-vec-optimized",
        str(PROJECT_DIR / "src" / "sequential.c"),
        str(PROJECT_DIR / "src" / "matrix_common.c"),
        "-o", str(SEQ_BIN),
        *ldflags,
    ]
    res_seq = subprocess.run(cmd_seq, cwd=PROJECT_DIR, capture_output=True, text=True, check=True)

    cmd_omp = [
        "gcc", "-O3", "-march=native", "-fopenmp", "-std=c11", "-Wall", "-Wextra",
        "-fopt-info-vec-optimized",
        str(PROJECT_DIR / "src" / "parallel_omp.c"),
        str(PROJECT_DIR / "src" / "matrix_common.c"),
        "-o", str(OMP_BIN),
        *ldflags,
    ]
    res_omp = subprocess.run(cmd_omp, cwd=PROJECT_DIR, capture_output=True, text=True, check=True)

    # Save assembly snippets and vectorization report for the report
    cmd_asm_seq = [
        "gcc", "-O3", "-march=native", "-std=c11", "-S", "-fverbose-asm",
        str(PROJECT_DIR / "src" / "sequential.c"),
        "-o", str(RESULTS_DIR / "sequential.s"),
    ]
    subprocess.run(cmd_asm_seq, cwd=PROJECT_DIR, capture_output=True, text=True, check=True)

    cmd_asm = [
        "gcc", "-O3", "-march=native", "-fopenmp", "-std=c11", "-S", "-fverbose-asm",
        str(PROJECT_DIR / "src" / "parallel_omp.c"),
        "-o", str(RESULTS_DIR / "parallel_omp.s"),
    ]
    subprocess.run(cmd_asm, cwd=PROJECT_DIR, capture_output=True, text=True, check=True)

    vec_report_path = RESULTS_DIR / "vectorization_evidence.txt"
    with open(vec_report_path, "w", encoding="utf-8") as f:
        f.write("=== GCC Auto-Vectorization Report (-fopt-info-vec-optimized) ===\n")
        f.write("--- sequential.c ---\n")
        f.write(res_seq.stderr or res_seq.stdout)
        f.write("\n--- parallel_omp.c ---\n")
        f.write(res_omp.stderr or res_omp.stdout)

    print(f"[OK] Compiled {SEQ_BIN.name} and {OMP_BIN.name}")
    print(f"[OK] Saved compiler vectorization evidence to {vec_report_path}")


def run_correctness_checks():
    print("\n=== Step 2: Running Pre-Benchmarking Correctness Suite ===")
    env = os.environ.copy()
    env["OPENBLAS_NUM_THREADS"] = "1"
    env["MKL_NUM_THREADS"] = "1"
    # OMP_PROC_BIND=false matches run_main_benchmarks(); MinGW-w64 libgomp does not
    # support thread affinity and would print "Affinity not supported" otherwise.
    env["OMP_PROC_BIND"] = "false"

    res_seq = subprocess.run([str(SEQ_BIN), "--check"], cwd=PROJECT_DIR, env=env,
                             capture_output=True, text=True, check=True)
    print(res_seq.stdout.strip())

    res_omp = subprocess.run([str(OMP_BIN), "--check"], cwd=PROJECT_DIR, env=env,
                             capture_output=True, text=True, check=True)
    print(res_omp.stdout.strip())

    log_path = RESULTS_DIR / "correctness_log.txt"
    with open(log_path, "w", encoding="utf-8") as f:
        f.write(res_seq.stdout)
        f.write("\n")
        f.write(res_omp.stdout)
    print(f"[OK] Saved correctness verification log to {log_path}")


def parse_csv_lines(stdout_text):
    rows = []
    for line in stdout_text.splitlines():
        line = line.strip()
        if line.startswith("CSV,"):
            parts = line.split(",")
            # CSV,matrix_size_n,implementation,numeric_type,thread_count,run_index,
            #     kernel_time_sec,peak_rss_kb,cpu_util_pct,checksum
            rows.append({
                "matrix_size_n": int(parts[1]),
                "implementation": parts[2],
                "numeric_type": parts[3],
                "thread_count": int(parts[4]),
                "run_index": int(parts[5]),
                "kernel_time_sec": float(parts[6]),
                "peak_rss_kb": int(parts[7]),
                "cpu_util_pct": float(parts[8]),
                "checksum": float(parts[9]),
            })
    return rows


def run_main_benchmarks():
    print("\n=== Step 3: Running Main Scaling Benchmarks (Sequential vs. OpenMP) ===")
    all_rows = []

    base_env = os.environ.copy()
    base_env["OPENBLAS_NUM_THREADS"] = "1"
    base_env["MKL_NUM_THREADS"] = "1"
    base_env["OMP_DYNAMIC"] = "FALSE"

    for n in MATRIX_SIZES:
        # 1. Sequential baseline
        env_seq = base_env.copy()
        env_seq["OMP_NUM_THREADS"] = "1"
        cmd_seq = [str(SEQ_BIN), str(n), str(WARMUP_RUNS), str(MEASURED_RUNS), "sequential"]
        res = subprocess.run(cmd_seq, cwd=PROJECT_DIR, env=env_seq,
                             capture_output=True, text=True, check=True)
        seq_rows = parse_csv_lines(res.stdout)
        all_rows.extend(seq_rows)
        med_seq = np.median([r["kernel_time_sec"] for r in seq_rows])
        print(f"  n={n:4d} | sequential   (p= 1) | median={med_seq:.6f} s")

        # 2. Parallel OpenMP across thread counts p
        for p in THREAD_COUNTS:
            env_omp = base_env.copy()
            env_omp["OMP_NUM_THREADS"] = str(p)
            env_omp["OMP_PROC_BIND"] = "false"

            cmd_omp = [str(OMP_BIN), str(n), str(p), str(WARMUP_RUNS), str(MEASURED_RUNS), "parallel_omp"]
            res = subprocess.run(cmd_omp, cwd=PROJECT_DIR, env=env_omp,
                                 capture_output=True, text=True, check=True)
            omp_rows = parse_csv_lines(res.stdout)
            all_rows.extend(omp_rows)
            med_omp = np.median([r["kernel_time_sec"] for r in omp_rows])
            sp = med_seq / med_omp if med_omp > 0 else 0.0
            eff = (sp / p) * 100.0
            print(f"  n={n:4d} | parallel_omp (p={p:2d}) | median={med_omp:.6f} s | S(p)={sp:5.2f}x | E(p)={eff:5.1f}%")

    raw_csv_path = DATA_DIR / "raw_measurements.csv"
    fieldnames = [
        "matrix_size_n",
        "implementation",
        "numeric_type",
        "thread_count",
        "run_index",
        "kernel_time_sec",
        "peak_rss_kb",
        "cpu_util_pct",
    ]
    with open(raw_csv_path, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        for r in all_rows:
            writer.writerow({k: r[k] for k in fieldnames})

    print(f"[OK] Saved {len(all_rows)} raw measurements to {raw_csv_path}")
    return pd.DataFrame(all_rows)


def run_vectorization_benchmarks():
    print("\n=== Step 4: Running Controlled SIMD Vectorisation Extension Benchmarks ===")
    vec_rows = []
    base_env = os.environ.copy()
    base_env["OPENBLAS_NUM_THREADS"] = "1"
    base_env["MKL_NUM_THREADS"] = "1"
    base_env["OMP_DYNAMIC"] = "FALSE"
    base_env["OMP_PROC_BIND"] = "false"

    # Part 4A: Single-thread (p=1) across all matrix sizes: seq_scalar vs sequential (auto-SIMD) vs seq_avx2
    for n in MATRIX_SIZES:
        for variant in ["seq_scalar", "sequential", "seq_avx2"]:
            cmd = [str(SEQ_BIN), str(n), str(WARMUP_RUNS), str(MEASURED_RUNS), variant]
            res = subprocess.run(cmd, cwd=PROJECT_DIR, env=base_env,
                                 capture_output=True, text=True, check=True)
            rows = parse_csv_lines(res.stdout)
            vec_rows.extend(rows)
            med = np.median([r["kernel_time_sec"] for r in rows])
            print(f"  [SIMD p=1] n={n:4d} | {variant:12s} | median={med:.6f} s")

    # Part 4B: Multi-thread (p in {1, 2, 4, 6, 8, 16}) at n=1024 and n=2048: omp_scalar vs parallel_omp vs omp_avx2
    for n in [1024, 2048]:
        for p in [1, 2, 4, 6, 8, 16]:
            env_omp = base_env.copy()
            env_omp["OMP_NUM_THREADS"] = str(p)
            for variant in ["omp_scalar", "parallel_omp", "omp_avx2"]:
                cmd = [str(OMP_BIN), str(n), str(p), str(WARMUP_RUNS), str(MEASURED_RUNS), variant]
                res = subprocess.run(cmd, cwd=PROJECT_DIR, env=env_omp,
                                     capture_output=True, text=True, check=True)
                rows = parse_csv_lines(res.stdout)
                vec_rows.extend(rows)
                med = np.median([r["kernel_time_sec"] for r in rows])
                print(f"  [SIMD OMP] n={n:4d} | p={p:2d} | {variant:12s} | median={med:.6f} s")

    vec_csv_path = DATA_DIR / "raw_vectorization.csv"
    fieldnames = [
        "matrix_size_n",
        "implementation",
        "numeric_type",
        "thread_count",
        "run_index",
        "kernel_time_sec",
        "peak_rss_kb",
        "cpu_util_pct",
    ]
    with open(vec_csv_path, "w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        for r in vec_rows:
            writer.writerow({k: r[k] for k in fieldnames})

    print(f"[OK] Saved {len(vec_rows)} SIMD vectorisation measurements to {vec_csv_path}")
    return pd.DataFrame(vec_rows)


def compute_iqr(series):
    return float(np.percentile(series, 75) - np.percentile(series, 25))


def summarize_results(df_main, df_vec):
    print("\n=== Step 5: Computing Summary Statistics (Medians, IQRs, Speedup, Efficiency) ===")
    summary = (
        df_main.groupby(["matrix_size_n", "implementation", "numeric_type", "thread_count"], as_index=False)
        .agg(
            repetitions=("run_index", "count"),
            median_time_sec=("kernel_time_sec", "median"),
            iqr_time_sec=("kernel_time_sec", compute_iqr),
            min_time_sec=("kernel_time_sec", "min"),
            max_time_sec=("kernel_time_sec", "max"),
            median_rss_kb=("peak_rss_kb", "median"),
            iqr_rss_kb=("peak_rss_kb", compute_iqr),
            median_cpu_pct=("cpu_util_pct", "median"),
        )
    )

    seq_lookup = (
        summary[summary["implementation"] == "sequential"]
        .set_index("matrix_size_n")["median_time_sec"]
        .to_dict()
    )

    summary["seq_baseline_sec"] = summary["matrix_size_n"].map(seq_lookup)
    summary["speedup"] = summary["seq_baseline_sec"] / summary["median_time_sec"]
    summary["efficiency"] = summary["speedup"] / summary["thread_count"]
    summary["efficiency_pct"] = summary["efficiency"] * 100.0
    summary["gflops"] = (2.0 * (summary["matrix_size_n"] ** 3) * 1e-9) / summary["median_time_sec"]
    summary["theoretical_mem_kb"] = (3 * (summary["matrix_size_n"] ** 2) * 8) / 1024.0
    summary["overhead_vs_seq_pct"] = (
        (summary["median_time_sec"] - summary["seq_baseline_sec"]) / summary["seq_baseline_sec"]
    ) * 100.0

    summary_path = RESULTS_DIR / "summary_metrics.csv"
    summary.to_csv(summary_path, index=False)
    print(f"[OK] Saved main summary table to {summary_path}")

    # Vectorization summary
    vec_summary = (
        df_vec.groupby(["matrix_size_n", "implementation", "numeric_type", "thread_count"], as_index=False)
        .agg(
            repetitions=("run_index", "count"),
            median_time_sec=("kernel_time_sec", "median"),
            iqr_time_sec=("kernel_time_sec", compute_iqr),
            median_rss_kb=("peak_rss_kb", "median"),
        )
    )
    scalar_lookup = (
        vec_summary[vec_summary["implementation"].isin(["seq_scalar", "omp_scalar"])]
        .set_index(["matrix_size_n", "thread_count"])["median_time_sec"]
        .to_dict()
    )
    vec_summary["scalar_baseline_sec"] = vec_summary.apply(
        lambda r: scalar_lookup.get((r["matrix_size_n"], r["thread_count"]), np.nan), axis=1
    )
    vec_summary["simd_speedup"] = vec_summary["scalar_baseline_sec"] / vec_summary["median_time_sec"]
    vec_summary["gflops"] = (2.0 * (vec_summary["matrix_size_n"] ** 3) * 1e-9) / vec_summary["median_time_sec"]

    vec_summary_path = RESULTS_DIR / "summary_vectorization.csv"
    vec_summary.to_csv(vec_summary_path, index=False)
    print(f"[OK] Saved vectorization summary table to {vec_summary_path}")


def record_environment():
    """Store host/compiler metadata next to the results (no values are hardcoded)."""
    import platform
    import datetime
    lines = [f"timestamp_utc: {datetime.datetime.now(datetime.timezone.utc).isoformat()}",
             f"platform: {platform.platform()}",
             f"python: {platform.python_version()}",
             f"numpy: {np.__version__}, pandas: {pd.__version__}"]
    try:
        import ctypes

        class MEMORYSTATUSEX(ctypes.Structure):
            _fields_ = [("dwLength", ctypes.c_ulong), ("dwMemoryLoad", ctypes.c_ulong),
                        ("ullTotalPhys", ctypes.c_ulonglong), ("ullAvailPhys", ctypes.c_ulonglong),
                        ("ullTotalPageFile", ctypes.c_ulonglong), ("ullAvailPageFile", ctypes.c_ulonglong),
                        ("ullTotalVirtual", ctypes.c_ulonglong), ("ullAvailVirtual", ctypes.c_ulonglong),
                        ("sullAvailExtendedVirtual", ctypes.c_ulonglong)]
        st = MEMORYSTATUSEX()
        st.dwLength = ctypes.sizeof(st)
        if ctypes.windll.kernel32.GlobalMemoryStatusEx(ctypes.byref(st)):
            lines.append(f"total_physical_ram_bytes: {st.ullTotalPhys} ({st.ullTotalPhys / 1024**3:.2f} GiB)")
    except Exception as exc:  # non-Windows host
        lines.append(f"ram_query_failed: {exc}")

    gcc_ver = subprocess.run(["gcc", "--version"], capture_output=True, text=True).stdout.splitlines()[0]
    macros = subprocess.run(["gcc", "-fopenmp", "-dM", "-E", "-x", "c", "-"], input="",
                            capture_output=True, text=True).stdout
    omp = [m for m in macros.splitlines() if "_OPENMP" in m]
    lines += [f"gcc: {gcc_ver}", f"openmp_macro: {omp[0] if omp else 'n/a'}",
              "cflags: -O3 -march=native -std=c11 -Wall -Wextra [-fopenmp]"]

    if IS_WINDOWS:
        topo_bin = PROJECT_DIR / "cpu_topology.exe"
        subprocess.run(["gcc", "-O2", str(PROJECT_DIR / "scripts" / "cpu_topology.c"), "-o", str(topo_bin)],
                       capture_output=True, text=True)
        if topo_bin.exists():
            lines.append("--- cpu_topology.exe ---")
            lines.append(subprocess.run([str(topo_bin)], capture_output=True, text=True).stdout.strip())

    out = RESULTS_DIR / "environment.txt"
    out.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"[OK] Saved environment metadata to {out}")


def main():
    DATA_DIR.mkdir(parents=True, exist_ok=True)
    RESULTS_DIR.mkdir(parents=True, exist_ok=True)
    FIGURES_DIR.mkdir(parents=True, exist_ok=True)

    record_environment()
    compile_binaries()
    run_correctness_checks()
    df_main = run_main_benchmarks()
    df_vec = run_vectorization_benchmarks()
    summarize_results(df_main, df_vec)

    import plot_results
    plot_results.main()
    print("\n[DONE] All benchmarks, summaries, and plots completed successfully.")


if __name__ == "__main__":
    main()
