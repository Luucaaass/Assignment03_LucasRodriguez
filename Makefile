CC       ?= gcc
CFLAGS   ?= -O3 -march=native -std=c11 -Wall -Wextra
OMPFLAGS ?= -fopenmp

ifeq ($(OS),Windows_NT)
    EXE      := .exe
    LDFLAGS  := -lm -lpsapi
    RM       := del /Q /F
else
    EXE      :=
    LDFLAGS  := -lm
    RM       := rm -f
endif

SEQ_BIN  := sequential$(EXE)
OMP_BIN  := parallel_omp$(EXE)
TOPO_BIN := cpu_topology$(EXE)
COMMON   := src/matrix_common.c

.PHONY: all clean check vec-report

all: $(SEQ_BIN) $(OMP_BIN)

$(SEQ_BIN): src/sequential.c $(COMMON) src/matrix_common.h
	$(CC) $(CFLAGS) src/sequential.c $(COMMON) -o $(SEQ_BIN) $(LDFLAGS)

$(OMP_BIN): src/parallel_omp.c $(COMMON) src/matrix_common.h
	$(CC) $(CFLAGS) $(OMPFLAGS) src/parallel_omp.c $(COMMON) -o $(OMP_BIN) $(LDFLAGS)

check: all
	./$(SEQ_BIN) --check
	./$(OMP_BIN) --check

vec-report:
	$(CC) $(CFLAGS) $(OMPFLAGS) -fopt-info-vec-optimized src/parallel_omp.c $(COMMON) -o $(OMP_BIN) $(LDFLAGS)

clean:
	-$(RM) $(SEQ_BIN) $(OMP_BIN) $(TOPO_BIN)

