/* Hardware topology probe (Windows): physical cores, logical processors,
 * SMT per core, hybrid efficiency class (P-core vs E-core), and cache sizes.
 * Build: gcc -O2 scripts/cpu_topology.c -o cpu_topology.exe */
#ifndef _WIN32_WINNT
#define _WIN32_WINNT 0x0A00
#endif
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>

static int popcount64(KAFFINITY m) { int c = 0; while (m) { c += (int)(m & 1); m >>= 1; } return c; }

int main(void) {
    char name[256] = {0}; DWORD sz = sizeof(name); HKEY k;
    if (RegOpenKeyExA(HKEY_LOCAL_MACHINE, "HARDWARE\\DESCRIPTION\\System\\CentralProcessor\\0", 0, KEY_READ, &k) == ERROR_SUCCESS) {
        RegQueryValueExA(k, "ProcessorNameString", NULL, NULL, (LPBYTE)name, &sz); RegCloseKey(k);
    }
    printf("CPU model: %s\n", name);

    DWORD len = 0;
    GetLogicalProcessorInformationEx(RelationAll, NULL, &len);
    BYTE *buf = (BYTE *)malloc(len);
    if (!GetLogicalProcessorInformationEx(RelationAll, (PSYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX)buf, &len)) {
        fprintf(stderr, "GetLogicalProcessorInformationEx failed\n"); return 1;
    }
    int cores = 0, logical = 0, smt_cores = 0, cls_count[8] = {0}, cls_logical[8] = {0}, packages = 0;
    for (BYTE *p = buf; p < buf + len;) {
        PSYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX e = (PSYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX)p;
        if (e->Relationship == RelationProcessorCore) {
            int lp = 0;
            for (int g = 0; g < e->Processor.GroupCount; g++) lp += popcount64(e->Processor.GroupMask[g].Mask);
            cores++; logical += lp; if (e->Processor.Flags & LTP_PC_SMT) smt_cores++;
            int c = e->Processor.EfficiencyClass & 7; cls_count[c]++; cls_logical[c] += lp;
        } else if (e->Relationship == RelationProcessorPackage) {
            packages++;
        } else if (e->Relationship == RelationCache) {
            CACHE_RELATIONSHIP *c = &e->Cache;
            const char *t = c->Type == CacheData ? "Data" : c->Type == CacheInstruction ? "Instr" : "Unified";
            printf("Cache L%d %-7s size=%6lu KB line=%u B mask=0x%llx\n", c->Level, t,
                   (unsigned long)(c->CacheSize / 1024), c->LineSize, (unsigned long long)c->GroupMask.Mask);
        }
        p += e->Size;
    }
    printf("Packages: %d\nPhysical cores: %d\nLogical processors: %d\nCores with SMT: %d\n", packages, cores, logical, smt_cores);
    for (int c = 7; c >= 0; c--)
        if (cls_count[c]) printf("EfficiencyClass %d: %d cores, %d logical processors\n", c, cls_count[c], cls_logical[c]);
    free(buf);
    return 0;
}

