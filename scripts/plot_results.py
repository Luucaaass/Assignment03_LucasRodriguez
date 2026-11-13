#!/usr/bin/env python3
"""
Publication-Quality Figure and Summary Table Generator for Assignment 3:
Parallel Matrix Multiplication and Optional Vectorisation.

Generates required high-resolution charts in results/figures/:
1. runtime_vs_size.png       : Median execution time vs. n across thread counts (log-log scale)
2. speedup_vs_threads.png    : Observed S(p) vs. thread count p with linear ideal reference
3. efficiency_vs_threads.png : Parallel efficiency E(p) vs. p across core regimes
4. overhead_p1.png           : Percentage overhead of 1-thread OpenMP over sequential baseline
5. memory_vs_threads.png     : Peak resident memory usage across thread counts
6. simd_vectorization.png    : Controlled evaluation of SIMD vectorisation vs. scalar code
"""

from pathlib import Path
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

PROJECT_DIR = Path(__file__).resolve().parent.parent
DATA_DIR = PROJECT_DIR / "data"
RESULTS_DIR = PROJECT_DIR / "results"
FIGURES_DIR = RESULTS_DIR / "figures"

# Measured topology of the benchmark host (scripts/cpu_topology.c, GetLogicalProcessorInformationEx):
# Intel Core Ultra 9 285H, 1 package, 16 physical cores, 16 logical processors (no SMT),
# hybrid: 6 P-cores (EfficiencyClass 1) + 10 E-cores (EfficiencyClass 0; 8 E-cores sharing
# the 24 MB L3 + 2 low-power E-cores outside the L3 domain).
P_CORES = 6
L3_CORES = 14          # P-cores + E-cores attached to the shared L3
PHYSICAL_CORES = 16
LOGICAL_CPUS = 16


def add_topology_annotations(ax, threads):
    ax.axvline(x=P_CORES, color="tab:blue", linestyle=":", alpha=0.75, linewidth=1.3,
               label=f"{P_CORES} P-cores")
    ax.axvline(x=L3_CORES, color="tab:purple", linestyle=":", alpha=0.6, linewidth=1.2,
               label=f"{L3_CORES} cores on shared L3 (6P + 8E)")
    ax.axvline(x=LOGICAL_CPUS, color="tab:red", linestyle="-.", alpha=0.75, linewidth=1.3,
               label=f"{PHYSICAL_CORES} physical = {LOGICAL_CPUS} logical (no SMT)")
    ax.axvspan(LOGICAL_CPUS, max(threads) + 1, color="mistyrose", alpha=0.35,
               label=f"Oversubscription ($p > {LOGICAL_CPUS}$)")

plt.rcParams.update({
    "font.size": 10.5,
    "axes.titlesize": 12,
    "axes.labelsize": 11,
    "xtick.labelsize": 9.5,
    "ytick.labelsize": 9.5,
    "legend.fontsize": 9.0,
    "figure.titlesize": 13,
    "axes.grid": True,
    "grid.alpha": 0.35,
    "grid.linestyle": "--",
})


def compute_iqr(series):
    return float(np.percentile(series, 75) - np.percentile(series, 25))


def load_summaries():
    summary_path = RESULTS_DIR / "summary_metrics.csv"
    if summary_path.exists():
        df_sum = pd.read_csv(summary_path)
    else:
        df_raw = pd.read_csv(DATA_DIR / "raw_measurements.csv")
        df_sum = (
            df_raw.groupby(["matrix_size_n", "implementation", "numeric_type", "thread_count"], as_index=False)
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
        seq_map = (
            df_sum[df_sum["implementation"] == "sequential"]
            .set_index("matrix_size_n")["median_time_sec"]
            .to_dict()
        )
        df_sum["seq_baseline_sec"] = df_sum["matrix_size_n"].map(seq_map)
        df_sum["speedup"] = df_sum["seq_baseline_sec"] / df_sum["median_time_sec"]
        df_sum["efficiency"] = df_sum["speedup"] / df_sum["thread_count"]
        df_sum["efficiency_pct"] = df_sum["efficiency"] * 100.0
        df_sum["gflops"] = (2.0 * (df_sum["matrix_size_n"] ** 3) * 1e-9) / df_sum["median_time_sec"]
        df_sum["theoretical_mem_kb"] = (3 * (df_sum["matrix_size_n"] ** 2) * 8) / 1024.0
        df_sum["overhead_vs_seq_pct"] = (
            (df_sum["median_time_sec"] - df_sum["seq_baseline_sec"]) / df_sum["seq_baseline_sec"]
        ) * 100.0
        df_sum.to_csv(summary_path, index=False)

    vec_path = RESULTS_DIR / "summary_vectorization.csv"
    df_vec = pd.read_csv(vec_path) if vec_path.exists() else None
    return df_sum, df_vec


def plot_runtime_vs_size(df_sum):
    fig, ax = plt.subplots(figsize=(8.5, 5.4))

    seq = df_sum[df_sum["implementation"] == "sequential"].sort_values("matrix_size_n")
    ax.errorbar(
        seq["matrix_size_n"], seq["median_time_sec"], yerr=seq["iqr_time_sec"] / 2.0,
        label="Sequential Baseline (ikj)", color="black", linestyle="-", marker="o",
        linewidth=2.2, capsize=3.5, zorder=5
    )

    selected_threads = [1, 2, 4, 6, 8, 16, 32]
    cmap = plt.get_cmap("tab10")
    markers = ["s", "^", "v", "D", "P", "*", "X"]

    omp = df_sum[df_sum["implementation"] == "parallel_omp"]
    for idx, p in enumerate(selected_threads):
        sub = omp[omp["thread_count"] == p].sort_values("matrix_size_n")
        if sub.empty:
            continue
        ax.errorbar(
            sub["matrix_size_n"], sub["median_time_sec"], yerr=sub["iqr_time_sec"] / 2.0,
            label=f"OpenMP p={p}", color=cmap(idx), marker=markers[idx % len(markers)],
            linewidth=1.8, capsize=3, alpha=0.9
        )

    # Reference O(n^3) slope anchored at sequential n=256
    n_vals = np.array( sorted(df_sum["matrix_size_n"].unique()), dtype=float )
    t_ref = seq["median_time_sec"].iloc[0] * ((n_vals / n_vals[0]) ** 3)
    ax.plot(n_vals, t_ref, linestyle=":", color="gray", linewidth=1.5, label=r"Cubic Reference $\mathcal{O}(n^3)$")

    ax.set_xscale("log", base=2)
    ax.set_yscale("log")
    ax.set_xticks(n_vals)
    ax.set_xticklabels([str(int(x)) for x in n_vals])
    ax.set_xlabel("Matrix Dimension $n$ ($n \\times n$ elements, log$_2$ scale)")
    ax.set_ylabel("Kernel Execution Time [s] (Median $\\pm$ IQR/2, log$_{10}$ scale)")
    ax.set_title("Execution Time Scaling vs. Matrix Size $n$ Across Thread Counts", pad=10)
    ax.legend(ncol=2, loc="upper left", frameon=True)
    fig.tight_layout()
    fig.savefig(FIGURES_DIR / "runtime_vs_size.png", dpi=300, bbox_inches="tight", pad_inches=0.15)
    fig.savefig(FIGURES_DIR / "runtime_vs_size.svg", bbox_inches="tight", pad_inches=0.15)
    plt.close(fig)


def plot_speedup_vs_threads(df_sum):
    fig, ax = plt.subplots(figsize=(8.5, 5.4))

    omp = df_sum[df_sum["implementation"] == "parallel_omp"]
    threads = sorted(omp["thread_count"].unique())

    # Ideal linear speedup reference up to 16 cores
    ideal_p = np.array([p for p in threads if p <= LOGICAL_CPUS], dtype=float)
    ax.plot(ideal_p, ideal_p, linestyle="--", color="black", linewidth=1.8, label="Linear Ideal $S(p) = p$")

    add_topology_annotations(ax, threads)

    markers = ["o", "s", "^", "D", "P"]
    for idx, n in enumerate(sorted(omp["matrix_size_n"].unique())):
        sub = omp[omp["matrix_size_n"] == n].sort_values("thread_count")
        ax.plot(
            sub["thread_count"], sub["speedup"],
            marker=markers[idx % len(markers)], linewidth=2.0,
            label=f"$n = {n}$ ({3 * n * n * 8 / (1024**2):.1f} MB)"
        )

    ax.set_xticks(threads)
    ax.set_xlim(0.5, max(threads) + 1)
    ax.set_xlabel("Thread Count $p$ (OpenMP Threads)")
    ax.set_ylabel("Speedup $S(p) = \\mathrm{Median}(T_{\\mathrm{seq}}) / \\mathrm{Median}(T_p)$")
    ax.set_title("Strong Scaling Speedup $S(p)$ vs. Thread Count $p$", pad=10)
    ax.legend(loc="upper left", ncol=2, frameon=True)
    fig.tight_layout()
    fig.savefig(FIGURES_DIR / "speedup_vs_threads.png", dpi=300, bbox_inches="tight", pad_inches=0.15)
    fig.savefig(FIGURES_DIR / "speedup_vs_threads.svg", bbox_inches="tight", pad_inches=0.15)
    plt.close(fig)


def plot_efficiency_vs_threads(df_sum):
    fig, ax = plt.subplots(figsize=(8.5, 5.4))

    omp = df_sum[df_sum["implementation"] == "parallel_omp"]
    threads = sorted(omp["thread_count"].unique())

    ax.axhline(y=1.0, linestyle="--", color="black", linewidth=1.6, label="Ideal Efficiency $E(p) = 1.0$ (100%)")
    add_topology_annotations(ax, threads)

    markers = ["o", "s", "^", "D", "P"]
    for idx, n in enumerate(sorted(omp["matrix_size_n"].unique())):
        sub = omp[omp["matrix_size_n"] == n].sort_values("thread_count")
        ax.plot(
            sub["thread_count"], sub["efficiency"],
            marker=markers[idx % len(markers)], linewidth=2.0,
            label=f"$n = {n}$"
        )

    ax.set_xticks(threads)
    ax.set_xlim(0.5, max(threads) + 1)
    ax.set_ylim(0.0, max(1.15, omp["efficiency"].max() * 1.08))
    ax.set_xlabel("Thread Count $p$ (OpenMP Threads)")
    ax.set_ylabel("Parallel Efficiency $E(p) = S(p) / p$")
    ax.set_title("Parallel Efficiency $E(p)$ Across Hybrid P/E-Core Tiers and Oversubscription", pad=10)
    ax.legend(loc="upper right", ncol=2, frameon=True)
    fig.tight_layout()
    fig.savefig(FIGURES_DIR / "efficiency_vs_threads.png", dpi=300, bbox_inches="tight", pad_inches=0.15)
    fig.savefig(FIGURES_DIR / "efficiency_vs_threads.svg", bbox_inches="tight", pad_inches=0.15)
    plt.close(fig)


def plot_overhead_p1(df_sum):
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(10.5, 4.6))

    seq = df_sum[df_sum["implementation"] == "sequential"].sort_values("matrix_size_n")
    p1 = df_sum[(df_sum["implementation"] == "parallel_omp") & (df_sum["thread_count"] == 1)].sort_values("matrix_size_n")

    sizes = seq["matrix_size_n"].values
    x = np.arange(len(sizes))
    width = 0.36

    # Left panel: percentage overhead [(T1 - Tseq) / Tseq] * 100%
    overheads = p1["overhead_vs_seq_pct"].values
    colors = ["tab:orange" if val >= 0 else "tab:green" for val in overheads]
    bars = ax1.bar(x, overheads, width=0.52, color=colors, edgecolor="black", alpha=0.85)
    ax1.axhline(0.0, color="black", linewidth=1.2, linestyle="--")
    ax1.set_xticks(x)
    ax1.set_xticklabels([f"n={s}" for s in sizes])
    ax1.set_xlabel("Matrix Dimension $n$")
    ax1.set_ylabel("Relative Overhead $[(T_1 - T_{\\mathrm{seq}}) / T_{\\mathrm{seq}}] \\times 100\\%$")
    ax1.set_title("OpenMP Runtime Overhead at $p = 1$ vs. Sequential", pad=10)

    for bar, val in zip(bars, overheads):
        va = "bottom" if val >= 0 else "top"
        y_pos = val + (0.25 if val >= 0 else -0.25)
        ax1.text(bar.get_x() + bar.get_width() / 2.0, y_pos, f"{val:+.2f}%",
                 ha="center", va=va, fontsize=8.8, fontweight="bold")

    y_pad = max(3.0, np.max(np.abs(overheads)) * 1.35)
    ax1.set_ylim(min(-2.0, np.min(overheads) - 2.0), y_pad)

    # Right panel: GFLOP/s throughput comparison between Sequential and OpenMP (p=1)
    ax2.bar(x - width / 2, seq["gflops"].values, width=width, label="Sequential Baseline ($T_{\\mathrm{seq}}$)",
            color="tab:blue", edgecolor="black", alpha=0.85)
    ax2.bar(x + width / 2, p1["gflops"].values, width=width, label="OpenMP 1-Thread ($T_1$)",
            color="tab:orange", edgecolor="black", alpha=0.85)
    ax2.set_xticks(x)
    ax2.set_xticklabels([f"n={s}" for s in sizes])
    ax2.set_xlabel("Matrix Dimension $n$")
    ax2.set_ylabel("Effective Throughput [GFLOP/s] (Median)")
    ax2.set_title("Single-Core Throughput: $T_{\\mathrm{seq}}$ vs. $T_1$", pad=10)
    ax2.legend(loc="best", frameon=True)

    fig.tight_layout()
    fig.savefig(FIGURES_DIR / "overhead_p1.png", dpi=300, bbox_inches="tight", pad_inches=0.15)
    fig.savefig(FIGURES_DIR / "overhead_p1.svg", bbox_inches="tight", pad_inches=0.15)
    plt.close(fig)


def plot_memory_vs_threads(df_sum):
    fig, ax = plt.subplots(figsize=(8.5, 5.2))

    omp = df_sum[df_sum["implementation"] == "parallel_omp"]
    threads = sorted(omp["thread_count"].unique())
    markers = ["o", "s", "^", "D", "P"]
    cmap = plt.get_cmap("tab10")

    for idx, n in enumerate(sorted(omp["matrix_size_n"].unique())):
        sub = omp[omp["matrix_size_n"] == n].sort_values("thread_count")
        rss_mb = sub["median_rss_kb"] / 1024.0
        theo_mb = (3.0 * (n ** 2) * 8.0) / (1024.0 ** 2)
        ax.plot(
            sub["thread_count"], rss_mb,
            marker=markers[idx % len(markers)], color=cmap(idx), linewidth=2.0,
            label=f"Peak RSS $n={n}$ (Array: {theo_mb:.1f} MB)"
        )
        ax.axhline(y=theo_mb, color=cmap(idx), linestyle=":", alpha=0.55, linewidth=1.2)

    ax.set_xticks(threads)
    ax.set_xlabel("Thread Count $p$ (OpenMP Threads)")
    ax.set_ylabel("Peak Process Resident Memory (RSS) [MB]")
    ax.set_title("Peak Resident Memory (RSS) vs. Thread Count $p$ (Dotted = $3n^2 \\times 8$ B)", pad=10)
    ax.legend(loc="center right", frameon=True, fontsize=8.8)
    fig.tight_layout()
    fig.savefig(FIGURES_DIR / "memory_vs_threads.png", dpi=300, bbox_inches="tight", pad_inches=0.15)
    fig.savefig(FIGURES_DIR / "memory_vs_threads.svg", bbox_inches="tight", pad_inches=0.15)
    plt.close(fig)


def plot_simd_vectorization(df_vec):
    if df_vec is None or df_vec.empty:
        return

    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(11.0, 4.8))

    # Left panel: p=1 GFLOP/s across matrix sizes for seq_scalar vs sequential (auto-SIMD) vs seq_avx2
    p1_vec = df_vec[df_vec["thread_count"] == 1]
    for impl, label, marker, color in [
        ("seq_scalar", "Scalar ikj (#pragma GCC novector)", "o", "tab:red"),
        ("sequential", "Auto-Vectorized ikj (-O3 -march=native)", "s", "tab:blue"),
        ("seq_avx2", "Explicit AVX2 FMA (_mm256_fmadd_pd)", "^", "tab:green"),
    ]:
        sub = p1_vec[p1_vec["implementation"] == impl].sort_values("matrix_size_n")
        if not sub.empty:
            ax1.plot(sub["matrix_size_n"], sub["gflops"], marker=marker, color=color,
                     linewidth=2.0, label=label)

    ax1.set_xticks(sorted(p1_vec["matrix_size_n"].unique()))
    ax1.set_xlabel("Matrix Dimension $n$")
    ax1.set_ylabel("Single-Thread Throughput [GFLOP/s]")
    ax1.set_title("SIMD Vectorisation Impact at $p=1$ (Isolated from Threading)", pad=10)
    ax1.legend(loc="best", frameon=True, fontsize=8.5)

    # Right panel: Multi-thread speedup at n=2048 comparing omp_scalar vs parallel_omp vs omp_avx2
    n_target = 2048 if 2048 in df_vec["matrix_size_n"].values else 1024
    sub_n = df_vec[df_vec["matrix_size_n"] == n_target]
    scalar_p1 = sub_n[(sub_n["implementation"] == "omp_scalar") & (sub_n["thread_count"] == 1)]["median_time_sec"].iloc[0]

    for impl, label, marker, color in [
        ("omp_scalar", "OpenMP + Scalar Inner Loop", "o", "tab:red"),
        ("parallel_omp", "OpenMP + Auto-Vectorized AVX2", "s", "tab:blue"),
        ("omp_avx2", "OpenMP + Explicit AVX2 FMA", "^", "tab:green"),
    ]:
        sub = sub_n[sub_n["implementation"] == impl].sort_values("thread_count")
        if not sub.empty:
            total_sp = scalar_p1 / sub["median_time_sec"]
            ax2.plot(sub["thread_count"], total_sp, marker=marker, color=color,
                     linewidth=2.0, label=label)

    ax2.set_xticks(sorted(sub_n["thread_count"].unique()))
    ax2.set_xlabel("Thread Count $p$")
    ax2.set_ylabel(f"Combined Speedup over 1-Thread Scalar ($n={n_target}$)")
    ax2.set_title(f"Combined Thread + SIMD Scaling ($n={n_target}$)", pad=10)
    ax2.legend(loc="upper left", frameon=True, fontsize=8.5)

    fig.tight_layout()
    fig.savefig(FIGURES_DIR / "simd_vectorization.png", dpi=300, bbox_inches="tight", pad_inches=0.15)
    fig.savefig(FIGURES_DIR / "simd_vectorization.svg", bbox_inches="tight", pad_inches=0.15)
    plt.close(fig)


def main():
    FIGURES_DIR.mkdir(parents=True, exist_ok=True)
    df_sum, df_vec = load_summaries()

    plot_runtime_vs_size(df_sum)
    plot_speedup_vs_threads(df_sum)
    plot_efficiency_vs_threads(df_sum)
    plot_overhead_p1(df_sum)
    plot_memory_vs_threads(df_sum)
    plot_simd_vectorization(df_vec)

    print("\n=== SUMMARY METRICS TABLE ===")
    cols = [
        "matrix_size_n", "implementation", "numeric_type", "thread_count", "repetitions",
        "median_time_sec", "iqr_time_sec", "speedup", "efficiency_pct",
        "overhead_vs_seq_pct", "median_rss_kb", "median_cpu_pct"
    ]
    print(df_sum[cols].to_string(index=False))

    if df_vec is not None:
        print("\n=== SIMD VECTORISATION SUMMARY TABLE ===")
        vcols = [
            "matrix_size_n", "implementation", "numeric_type", "thread_count",
            "median_time_sec", "iqr_time_sec", "simd_speedup", "gflops"
        ]
        print(df_vec[vcols].to_string(index=False))

    print(f"\n[OK] Generated all figures in {FIGURES_DIR}")


if __name__ == "__main__":
    main()

