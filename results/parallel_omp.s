	.file	"parallel_omp.c"
 # GNU C11 (GCC) version 16.2.0 (x86_64-w64-mingw32)
 #	compiled by GNU C version 16.2.0, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.4.1, isl version none
 # GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 # options passed: -march=arrowlake -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -mno-sse4a -mno-fma4 -mno-xop -mfma -mno-avx512f -mbmi -mbmi2 -maes -mpclmul -mno-avx512vl -mno-avx512bw -mno-avx512dq -mno-avx512cd -mno-avx512vbmi -mno-avx512ifma -mno-avx512vpopcntdq -mno-avx512vbmi2 -mgfni -mvpclmulqdq -mno-avx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mclwb -mno-clzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mno-hle -msahf -mno-lwp -mlzcnt -mmovbe -mmovdir64b -mmovdiri -mno-mwaitx -mno-pconfig -mno-pku -mprfchw -mptwrite -mrdpid -mrdrnd -mrdseed -mno-rtm -mserialize -mno-sgx -msha -mshstk -mno-tbm -mno-tsxldtrk -mvaes -mwaitpkg -mno-wbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -mno-uintr -mhreset -mno-kl -mno-widekl -mavxvnni -mno-avx512fp16 -mavxifma -mavxvnniint8 -mavxneconvert -mcmpccxadd -mno-amx-fp16 -mno-prefetchi -mno-raoint -mno-amx-complex -mno-avxvnniint16 -mno-sm3 -mno-sha512 -mno-sm4 -mno-apxf -mno-usermsr -mno-avx10.1 -mno-avx10.2 -mno-amx-avx512 -mno-amx-tf32 -mno-amx-fp8 -mno-movrs -mno-amx-movrs -mno-avx512bmm --param=l1-cache-size=48 --param=l1-cache-line-size=64 --param=l2-cache-size=24576 -mtune=arrowlake -mthreads -O3 -std=c11 -fopenmp
	.text
	.p2align 4
	.def	matmul_parallel_omp_ikj._omp_fn.0;	.scl	3;	.type	32;	.endef
	.seh_proc	matmul_parallel_omp_ikj._omp_fn.0
matmul_parallel_omp_ikj._omp_fn.0:
	pushq	%r15	 #
	.seh_pushreg	%r15
	pushq	%r14	 #
	.seh_pushreg	%r14
	pushq	%r13	 #
	.seh_pushreg	%r13
	pushq	%r12	 #
	.seh_pushreg	%r12
	pushq	%rbp	 #
	.seh_pushreg	%rbp
	pushq	%rdi	 #
	.seh_pushreg	%rdi
	pushq	%rsi	 #
	.seh_pushreg	%rsi
	pushq	%rbx	 #
	.seh_pushreg	%rbx
	subq	$120, %rsp	 #,
	.seh_stackalloc	120
	.seh_endprologue
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:18: #pragma omp parallel for schedule(static) num_threads(num_threads)
	movl	24(%rcx), %ebp	 # *.omp_data_i_13(D).n, n
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:18: #pragma omp parallel for schedule(static) num_threads(num_threads)
	movq	%rcx, %rdi	 # .omp_data_i, .omp_data_i
	call	omp_get_num_threads	 #
	movl	%eax, %ebx	 # _18, _18
	call	omp_get_thread_num	 #
	movl	%eax, %r8d	 #, _19
	movl	%ebp, %eax	 # n, tmp192
	cltd
	idivl	%ebx	 # _18
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:18: #pragma omp parallel for schedule(static) num_threads(num_threads)
	cmpl	%edx, %r8d	 # tmp193, _19
	leal	1(%rax), %ecx	 #, tmp238
	cmovl	%ecx, %eax	 # tmp238,, q.4_1
	movl	$0, %ecx	 #, tmp240
	cmovl	%ecx, %edx	 # tmp193,, tmp240, tt.5_2
	imull	%eax, %r8d	 # q.4_1, _23
	leal	(%r8,%rdx), %r9d	 #, i
	addl	%r9d, %eax	 # i, _25
	cmpl	%eax, %r9d	 # _25, i
	movl	%eax, 84(%rsp)	 # _25, %sfp
	jge	.L40	 #,
	movq	16(%rdi), %rax	 # *.omp_data_i_13(D).C, C
	movl	%r9d, %r11d	 # i, ivtmp.101
	movq	8(%rdi), %rsi	 # *.omp_data_i_13(D).B, B
	imull	%ebp, %r11d	 # n, ivtmp.101
	movq	%rax, 56(%rsp)	 # C, %sfp
	movq	(%rdi), %rax	 # *.omp_data_i_13(D).A, A
	movq	%rax, 88(%rsp)	 # A, %sfp
.L5:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:21:         for (int j = 0; j < n; j++) {
	testl	%ebp, %ebp	 # n
	jg	.L4	 #,
	addl	$1, %r9d	 #, i
	addl	%ebp, %r11d	 # n, ivtmp.101
	cmpl	%r9d, 84(%rsp)	 # i, %sfp
	jne	.L5	 #,
.L40:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:18: #pragma omp parallel for schedule(static) num_threads(num_threads)
	addq	$120, %rsp	 #,
	popq	%rbx	 #
	popq	%rsi	 #
	popq	%rdi	 #
	popq	%rbp	 #
	popq	%r12	 #
	popq	%r13	 #
	popq	%r14	 #
	popq	%r15	 #
	ret	
.L4:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:22:             c_row[j] = 0.0;
	leal	-1(%rbp), %eax	 #,
	movl	%ebp, %ebx	 # n, bnd.40
	movl	%ebp, %r12d	 # n, _48
	movl	%r9d, 80(%rsp)	 # i, %sfp
	shrl	$2, %ebx	 #, bnd.40
	movl	%eax, 52(%rsp)	 # _117, %sfp
	leaq	8(,%rax,8), %rax	 #, _114
	leaq	0(,%r12,8), %rdi	 #, _47
	movq	%rax, 96(%rsp)	 # _114, %sfp
	movl	%ebx, %eax	 # bnd.40, _30
	movl	%ebp, %r15d	 # n, niters.53
	sall	$2, %ebx	 #, niters_vector_mult_vf.41
	movq	%rax, 104(%rsp)	 # _30, %sfp
	subl	%ebx, %r15d	 # niters_vector_mult_vf.41, niters.53
	movq	%rdi, 72(%rsp)	 # _47, %sfp
	.p2align 4,,10
	.p2align 3
.L12:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:20:         double * __restrict__ c_row = &C[(long)i * n];
	movslq	%r11d, %rdi	 # ivtmp.101, _27
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:20:         double * __restrict__ c_row = &C[(long)i * n];
	movq	56(%rsp), %rax	 # %sfp, C
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:22:             c_row[j] = 0.0;
	movq	96(%rsp), %r8	 # %sfp,
	xorl	%edx, %edx	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:20:         double * __restrict__ c_row = &C[(long)i * n];
	leaq	0(,%rdi,8), %r13	 #, _28
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:20:         double * __restrict__ c_row = &C[(long)i * n];
	movl	%r11d, 48(%rsp)	 # ivtmp.101, %sfp
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:20:         double * __restrict__ c_row = &C[(long)i * n];
	leaq	(%rax,%r13), %rcx	 #, c_row
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:20:         double * __restrict__ c_row = &C[(long)i * n];
	movq	%rdi, 64(%rsp)	 # _27, %sfp
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:22:             c_row[j] = 0.0;
	call	memset	 #
	movq	88(%rsp), %rdx	 # %sfp, A
	movl	48(%rsp), %r11d	 # %sfp, ivtmp.101
	xorl	%r10d, %r10d	 # ivtmp.91
	movq	%rax, %rcx	 #, c_row
	leaq	(%rdi,%r12), %rax	 #, _175
	leaq	(%rdx,%rax,8), %r14	 #, _149
	movq	56(%rsp), %rax	 # %sfp, _63
	leaq	0(%r13,%rdx), %r8	 #, ivtmp.89
	subq	%rsi, %rax	 # B, _63
	leaq	-8(%r13,%rax), %rax	 #, _93
	movq	%rax, 40(%rsp)	 # _93, %sfp
	movq	104(%rsp), %rax	 # %sfp, _39
	salq	$5, %rax	 #, _39
.L11:
	cmpl	$1, %ebp	 #, n
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:25:             double a_ik = A[(long)i * n + k];
	vmovsd	(%r8), %xmm2	 # MEM[(const double *)_188], a_ik
	je	.L43	 #,
.L6:
	movq	40(%rsp), %rdx	 # %sfp, _73
	leaq	0(,%r10,8), %r9	 #, _132
	subq	%r9, %rdx	 # _132, _73
	cmpq	$16, %rdx	 #, _73
	jbe	.L7	 #,
	cmpl	$2, 52(%rsp)	 #, %sfp
	jbe	.L23	 #,
	vbroadcastsd	%xmm2, %ymm1	 # a_ik, _130
	addq	%rsi, %r9	 # B, vectp.47
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:27:             for (int j = 0; j < n; j++) {
	xorl	%edx, %edx	 # ivtmp.81
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L20:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:28:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%r9,%rdx), %ymm1, %ymm0	 # MEM <const vector(4) double> [(const double *)vectp.47_131 + ivtmp.81_46 * 1], _130, vect__47.49_137
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:28:                 c_row[j] += a_ik * b_row[j];
	vaddpd	(%rcx,%rdx), %ymm0, %ymm0	 # MEM <vector(4) double> [(double *)_106 + ivtmp.81_46 * 1], vect__47.49_137, vect__48.50_138
	vmovupd	%ymm0, (%rcx,%rdx)	 # vect__48.50_138, MEM <vector(4) double> [(double *)_106 + ivtmp.81_46 * 1]
	addq	$32, %rdx	 #, ivtmp.81
	cmpq	%rdx, %rax	 # ivtmp.81, _39
	jne	.L20	 #,
	cmpl	%ebp, %ebx	 # n, niters_vector_mult_vf.41
	movl	%ebx, %edx	 # niters_vector_mult_vf.41,
	je	.L13	 #,
	cmpl	$1, %r15d	 #, niters.53
	movl	%ebx, 48(%rsp)	 # niters_vector_mult_vf.41, %sfp
	movl	%r15d, %edi	 # niters.53, niters.53
	je	.L14	 #,
.L19:
	movq	64(%rsp), %r13	 # %sfp, _27
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:28:                 c_row[j] += a_ik * b_row[j];
	vmovddup	%xmm2, %xmm0	 # a_ik, _182
	movq	56(%rsp), %r9	 # %sfp, C
	addq	%rdx, %r13	 # _176, _177
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:28:                 c_row[j] += a_ik * b_row[j];
	addq	%r10, %rdx	 # ivtmp.91, tmp199
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:28:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%rsi,%rdx,8), %xmm0, %xmm0	 # MEM <const vector(2) double> [(const double *)vectp.61_183], _182, vect__67.63_191
	movl	%edi, %edx	 # niters.53, niters_vector_mult_vf.55
	andl	$-2, %edx	 #, niters_vector_mult_vf.55
	andl	$1, %edi	 #, niters.53
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:28:                 c_row[j] += a_ik * b_row[j];
	vaddpd	(%r9,%r13,8), %xmm0, %xmm0	 # MEM <vector(2) double> [(double *)vectp.58_174], vect__67.63_191, vect__66.64_192
	vmovupd	%xmm0, (%r9,%r13,8)	 # vect__66.64_192, MEM <vector(2) double> [(double *)vectp.58_174]
	je	.L15	 #,
	addl	%edx, 48(%rsp)	 # niters_vector_mult_vf.55, %sfp
.L14:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:28:                 c_row[j] += a_ik * b_row[j];
	movslq	48(%rsp), %r9	 # %sfp, _152
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:24:         for (int k = 0; k < n; k++) {
	addq	$8, %r8	 #, ivtmp.89
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:28:                 c_row[j] += a_ik * b_row[j];
	leaq	(%rcx,%r9,8), %rdx	 #, _154
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:28:                 c_row[j] += a_ik * b_row[j];
	addq	%r10, %r9	 # ivtmp.91, tmp207
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:24:         for (int k = 0; k < n; k++) {
	cmpq	%r14, %r8	 # _149, ivtmp.89
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:28:                 c_row[j] += a_ik * b_row[j];
	vmulsd	(%rsi,%r9,8), %xmm2, %xmm2	 # *_158, a_ik, _160
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:28:                 c_row[j] += a_ik * b_row[j];
	vaddsd	(%rdx), %xmm2, %xmm2	 # *_154, _160, _161
	vmovsd	%xmm2, (%rdx)	 # _161, *_154
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:24:         for (int k = 0; k < n; k++) {
	je	.L10	 #,
.L41:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:25:             double a_ik = A[(long)i * n + k];
	vmovsd	(%r8), %xmm2	 #* ivtmp.89, a_ik
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:24:         for (int k = 0; k < n; k++) {
	addq	%r12, %r10	 # _48, ivtmp.91
	jmp	.L6	 #
	.p2align 4,,10
	.p2align 3
.L43:
	leaq	0(,%r10,8), %r9	 #, _132
.L7:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:27:             for (int j = 0; j < n; j++) {
	movq	72(%rsp), %rdi	 # %sfp, _47
	addq	%rsi, %r9	 # B, _50
	xorl	%edx, %edx	 # ivtmp.76
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L17:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:28:                 c_row[j] += a_ik * b_row[j];
	vmulsd	(%r9,%rdx), %xmm2, %xmm0	 # MEM[(const double *)_50 + ivtmp.76_74 * 1], a_ik, _86
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:28:                 c_row[j] += a_ik * b_row[j];
	vaddsd	(%rcx,%rdx), %xmm0, %xmm0	 # MEM[(double *)c_row_29 + ivtmp.76_74 * 1], _86, _85
	vmovsd	%xmm0, (%rcx,%rdx)	 # _85, MEM[(double *)c_row_29 + ivtmp.76_74 * 1]
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:27:             for (int j = 0; j < n; j++) {
	addq	$8, %rdx	 #, ivtmp.76
	cmpq	%rdx, %rdi	 # ivtmp.76, _47
	jne	.L17	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:24:         for (int k = 0; k < n; k++) {
	addq	$8, %r8	 #, ivtmp.89
	addq	%r12, %r10	 # _48, ivtmp.91
	cmpq	%r14, %r8	 # _149, ivtmp.89
	jne	.L11	 #,
	.p2align 4,,10
	.p2align 3
.L10:
	addl	$1, 80(%rsp)	 #, %sfp
	addl	%ebp, %r11d	 # n, ivtmp.101
	movl	80(%rsp), %eax	 # %sfp, i
	cmpl	%eax, 84(%rsp)	 # i, %sfp
	je	.L44	 #,
	vzeroupper
	jmp	.L12	 #
	.p2align 4,,10
	.p2align 3
.L15:
	addq	$8, %r8	 #, ivtmp.89
	cmpq	%r8, %r14	 # ivtmp.89, _149
	jne	.L41	 #,
	jmp	.L10	 #
	.p2align 4,,10
	.p2align 3
.L13:
	addq	$8, %r8	 #, ivtmp.89
	cmpq	%r14, %r8	 # _149, ivtmp.89
	jne	.L41	 #,
	jmp	.L10	 #
.L23:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:27:             for (int j = 0; j < n; j++) {
	movl	$0, 48(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:22:             c_row[j] = 0.0;
	movl	%ebp, %edi	 # n, niters.53
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:27:             for (int j = 0; j < n; j++) {
	xorl	%edx, %edx	 #
	jmp	.L19	 #
.L44:
	vzeroupper
	jmp	.L40	 #
	.seh_endproc
	.p2align 4
	.def	matmul_parallel_omp_scalar_ikj._omp_fn.0;	.scl	3;	.type	32;	.endef
	.seh_proc	matmul_parallel_omp_scalar_ikj._omp_fn.0
matmul_parallel_omp_scalar_ikj._omp_fn.0:
	pushq	%r15	 #
	.seh_pushreg	%r15
	pushq	%r14	 #
	.seh_pushreg	%r14
	pushq	%r13	 #
	.seh_pushreg	%r13
	pushq	%r12	 #
	.seh_pushreg	%r12
	pushq	%rbp	 #
	.seh_pushreg	%rbp
	pushq	%rdi	 #
	.seh_pushreg	%rdi
	pushq	%rsi	 #
	.seh_pushreg	%rsi
	pushq	%rbx	 #
	.seh_pushreg	%rbx
	subq	$72, %rsp	 #,
	.seh_stackalloc	72
	.seh_endprologue
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:41: #pragma omp parallel for schedule(static) num_threads(num_threads)
	movl	24(%rcx), %r12d	 # *.omp_data_i_13(D).n, n
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:41: #pragma omp parallel for schedule(static) num_threads(num_threads)
	movq	%rcx, %rsi	 # .omp_data_i, .omp_data_i
	call	omp_get_num_threads	 #
	movl	%eax, %ebx	 # _18, _18
	call	omp_get_thread_num	 #
	movl	%eax, %r13d	 #, _19
	movl	%r12d, %eax	 # n, tmp139
	cltd
	idivl	%ebx	 # _18
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:41: #pragma omp parallel for schedule(static) num_threads(num_threads)
	cmpl	%edx, %r13d	 # tmp140, _19
	leal	1(%rax), %r10d	 #, tmp158
	cmovge	%eax, %r10d	 # tmp158,, tmp139, q.11_1
	movl	$0, %eax	 #, tmp160
	cmovl	%eax, %edx	 # tmp140,, tmp160, tt.12_2
	imull	%r10d, %r13d	 # q.11_1, _23
	addl	%edx, %r13d	 # tt.12_2, i
	addl	%r13d, %r10d	 # i, _25
	cmpl	%r10d, %r13d	 # _25, i
	jge	.L60	 #,
	movq	16(%rsi), %rax	 # *.omp_data_i_13(D).C, C
	movl	%r13d, %r14d	 # i, ivtmp.126
	movq	(%rsi), %r15	 # *.omp_data_i_13(D).A, A
	imull	%r12d, %r14d	 # n, ivtmp.126
	movq	%rax, 32(%rsp)	 # C, %sfp
	movq	8(%rsi), %rax	 # *.omp_data_i_13(D).B, B
	movq	%rax, 40(%rsp)	 # B, %sfp
.L49:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:45:         for (int j = 0; j < n; j++) {
	testl	%r12d, %r12d	 # n
	jg	.L48	 #,
	addl	$1, %r13d	 #, i
	addl	%r12d, %r14d	 # n, ivtmp.126
	cmpl	%r13d, %r10d	 # i, _25
	jne	.L49	 #,
.L60:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:41: #pragma omp parallel for schedule(static) num_threads(num_threads)
	addq	$72, %rsp	 #,
	popq	%rbx	 #
	popq	%rsi	 #
	popq	%rdi	 #
	popq	%rbp	 #
	popq	%r12	 #
	popq	%r13	 #
	popq	%r14	 #
	popq	%r15	 #
	ret	
.L48:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:46:             c_row[j] = 0.0;
	leal	-1(%r12), %eax	 #, _116
	movl	%r12d, %edi	 # n, _104
	movl	%r10d, 60(%rsp)	 # _25, %sfp
	leaq	8(,%rax,8), %rax	 #, _114
	leaq	0(,%rdi,8), %rbx	 #, _103
	movq	%rax, 48(%rsp)	 # _114, %sfp
	movq	%rdi, %rax	 # _104, _104
	movq	%r15, %rdi	 # A, A
	movq	%rax, %r15	 # _104, _104
	.p2align 4,,10
	.p2align 3
.L52:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:43:         double * __restrict__ c_row = &C[(long)i * n];
	movq	32(%rsp), %rax	 # %sfp, C
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:43:         double * __restrict__ c_row = &C[(long)i * n];
	movslq	%r14d, %rbp	 # ivtmp.126, _27
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:46:             c_row[j] = 0.0;
	movq	48(%rsp), %r8	 # %sfp,
	xorl	%edx, %edx	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:43:         double * __restrict__ c_row = &C[(long)i * n];
	leaq	0(,%rbp,8), %rsi	 #, _28
	addq	%r15, %rbp	 # _104, _96
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:43:         double * __restrict__ c_row = &C[(long)i * n];
	leaq	(%rax,%rsi), %rcx	 #, c_row
	addq	%rdi, %rsi	 # A, ivtmp.118
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:46:             c_row[j] = 0.0;
	call	memset	 #
	movq	40(%rsp), %rdx	 # %sfp, ivtmp.121
	leaq	(%rdi,%rbp,8), %r8	 #, _93
	movq	%rax, %rcx	 #, c_row
	.p2align 4,,10
	.p2align 3
.L51:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:49:             double a_ik = A[(long)i * n + k];
	vmovsd	(%rsi), %xmm1	 # MEM[(const double *)_99], a_ik
	xorl	%eax, %eax	 # ivtmp.114
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L50:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:53:                 c_row[j] += a_ik * b_row[j];
	vmulsd	(%rdx,%rax), %xmm1, %xmm0	 # MEM[(const double *)_53 + ivtmp.114_120 * 1], a_ik, _47
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:53:                 c_row[j] += a_ik * b_row[j];
	vaddsd	(%rcx,%rax), %xmm0, %xmm0	 # MEM[(double *)c_row_29 + ivtmp.114_120 * 1], _47, _48
	vmovsd	%xmm0, (%rcx,%rax)	 # _48, MEM[(double *)c_row_29 + ivtmp.114_120 * 1]
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:52:             for (int j = 0; j < n; j++) {
	addq	$8, %rax	 #, ivtmp.114
	cmpq	%rbx, %rax	 # _103, ivtmp.114
	jne	.L50	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:48:         for (int k = 0; k < n; k++) {
	addq	$8, %rsi	 #, ivtmp.118
	addq	%rbx, %rdx	 # _103, ivtmp.121
	cmpq	%rsi, %r8	 # ivtmp.118, _93
	jne	.L51	 #,
	addl	$1, %r13d	 #, i
	addl	%r12d, %r14d	 # n, ivtmp.126
	cmpl	%r13d, 60(%rsp)	 # i, %sfp
	jne	.L52	 #,
	jmp	.L60	 #
	.seh_endproc
	.p2align 4
	.def	matmul_parallel_omp_avx2_ikj._omp_fn.0;	.scl	3;	.type	32;	.endef
	.seh_proc	matmul_parallel_omp_avx2_ikj._omp_fn.0
matmul_parallel_omp_avx2_ikj._omp_fn.0:
	pushq	%r15	 #
	.seh_pushreg	%r15
	pushq	%r14	 #
	.seh_pushreg	%r14
	pushq	%r13	 #
	.seh_pushreg	%r13
	pushq	%r12	 #
	.seh_pushreg	%r12
	pushq	%rbp	 #
	.seh_pushreg	%rbp
	pushq	%rdi	 #
	.seh_pushreg	%rdi
	pushq	%rsi	 #
	.seh_pushreg	%rsi
	pushq	%rbx	 #
	.seh_pushreg	%rbx
	subq	$184, %rsp	 #,
	.seh_stackalloc	184
	.seh_endprologue
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:65: #pragma omp parallel for schedule(static) num_threads(num_threads)
	movl	24(%rcx), %ebx	 # *.omp_data_i_19(D).n, n
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:65: #pragma omp parallel for schedule(static) num_threads(num_threads)
	movq	%rcx, %r12	 # .omp_data_i, .omp_data_i
	call	omp_get_num_threads	 #
	movl	%eax, %esi	 # _24, _24
	call	omp_get_thread_num	 #
	movl	%eax, %r8d	 #, _25
	movl	%ebx, %eax	 # n, tmp271
	cltd
	idivl	%esi	 # _24
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:65: #pragma omp parallel for schedule(static) num_threads(num_threads)
	cmpl	%edx, %r8d	 # tmp272, _25
	leal	1(%rax), %ecx	 #, tmp370
	cmovge	%eax, %ecx	 # tmp370,, tmp271, q.18_1
	movl	$0, %eax	 #, tmp372
	cmovl	%eax, %edx	 # tmp272,, tmp372, tt.19_2
	imull	%ecx, %r8d	 # q.18_1, _29
	leal	(%r8,%rdx), %edi	 #, i
	leal	(%rcx,%rdi), %r11d	 #, _31
	cmpl	%r11d, %edi	 # _31, i
	jge	.L94	 #,
	movslq	%ebx, %rdx	 # n, _299
	movq	16(%r12), %rsi	 # *.omp_data_i_19(D).C, C
	leal	-4(%rbx), %r10d	 #, _256
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:70:         for (; j <= n - 4; j += 4) {
	leal	-3(%rbx), %r14d	 #, _129
	movq	%rdx, 56(%rsp)	 # _299, %sfp
	leaq	0(,%rdx,8), %rbp	 #, _298
	movl	%ebx, %edx	 # n, _294
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:74:             c_row[j] = 0.0;
	leal	-1(%rbx), %ecx	 #, _46
	imull	%edi, %edx	 # i, _294
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:65: #pragma omp parallel for schedule(static) num_threads(num_threads)
	movq	%rsi, 88(%rsp)	 # C, %sfp
	movq	8(%r12), %r13	 # *.omp_data_i_19(D).B, B
	movl	%r11d, 144(%rsp)	 # _31, %sfp
	movl	%r10d, 156(%rsp)	 # _256, %sfp
	movslq	%edx, %rdx	 # _294, ivtmp.175
	movq	%rdx, 72(%rsp)	 # ivtmp.175, %sfp
	salq	$3, %rdx	 #, _292
	addq	%rdx, %rsi	 # _292, ivtmp.173
	addq	(%r12), %rdx	 # *.omp_data_i_19(D).A, _292
	movq	%rdx, %r15	 # _292, ivtmp.174
	movl	%r10d, %edx	 # _256, _255
	andl	$-4, %edx	 #, _255
	addl	$4, %edx	 #, j
	testl	%r14d, %r14d	 # _129
	movl	%edx, 152(%rsp)	 # j, %sfp
	cmovle	%eax, %edx	 # j_4,, tmp372, j_4
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:74:             c_row[j] = 0.0;
	subl	%edx, %ecx	 # j_4, _245
	cmpl	%ebx, %edx	 # n, j_4
	movslq	%edx, %rdx	 # j_4, _241
	leaq	8(,%rcx,8), %r8	 #, _243
	movl	$8, %ecx	 #, tmp284
	cmovl	%r8, %rcx	 # _243,, tmp284
	salq	$3, %rdx	 #, _240
	movq	%rdx, 160(%rsp)	 # _240, %sfp
	movq	%rcx, 168(%rsp)	 # tmp284, %sfp
	leal	-16(%rbx), %ecx	 #, _262
	movl	%ecx, %edx	 # _262, _261
	andl	$-16, %edx	 #, _261
	addl	$16, %edx	 #, jj
	cmpl	$15, %ebx	 #, n
	cmovle	%eax, %edx	 # jj,, tmp372, jj
	shrl	$4, %ecx	 #, _327
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:97:                 __m256d vc = _mm256_loadu_pd(&c_row[jj]);
	movslq	%edx, %rax	 # jj, _140
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:96:             for (; jj <= n - 4; jj += 4) {
	leal	4(%rdx), %r9d	 #, _115
	movl	%edx, 52(%rsp)	 # jj, %sfp
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:97:                 __m256d vc = _mm256_loadu_pd(&c_row[jj]);
	salq	$3, %rax	 #, _131
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:96:             for (; jj <= n - 4; jj += 4) {
	movl	%r9d, 80(%rsp)	 # _115, %sfp
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:97:                 __m256d vc = _mm256_loadu_pd(&c_row[jj]);
	movq	%rax, 64(%rsp)	 # _131, %sfp
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:97:                 __m256d vc = _mm256_loadu_pd(&c_row[jj]);
	movslq	%r9d, %rax	 # _115, _117
	salq	$3, %rax	 #, _116
	movq	%rax, 96(%rsp)	 # _116, %sfp
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:96:             for (; jj <= n - 4; jj += 4) {
	leal	8(%rdx), %eax	 #, jj
	movl	%eax, 128(%rsp)	 # jj, %sfp
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:97:                 __m256d vc = _mm256_loadu_pd(&c_row[jj]);
	cltq
	salq	$3, %rax	 #, _62
	movq	%rax, 112(%rsp)	 # _62, %sfp
	movl	%r10d, %eax	 # _256, _270
	subl	%edx, %eax	 # jj, _270
	andl	$-4, %eax	 #, _269
	addl	%r9d, %eax	 # _115, jj
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:70:         for (; j <= n - 4; j += 4) {
	testl	%r14d, %r14d	 # _129
	movl	%eax, 84(%rsp)	 # jj, %sfp
	leal	1(%rcx), %eax	 #, _45
	movl	%eax, 148(%rsp)	 # _45, %sfp
	jle	.L68	 #,
	.p2align 4,,10
	.p2align 3
.L64:
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/avxintrin.h:843:   *(__m256d_u *)__P = __A;
	movl	156(%rsp), %eax	 # %sfp, _259
	xorl	%edx, %edx	 #
	movq	%rsi, %rcx	 # ivtmp.173,
	shrl	$2, %eax	 #, _259
	leal	1(%rax), %r8d	 #, _252
	salq	$5, %r8	 #,
	call	memset	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:73:         for (; j < n; j++) {
	cmpl	%ebx, 152(%rsp)	 # n, %sfp
	jge	.L80	 #,
.L65:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:74:             c_row[j] = 0.0;
	movq	160(%rsp), %rax	 # %sfp, _240
	movq	168(%rsp), %r8	 # %sfp,
	xorl	%edx, %edx	 #
	leaq	(%rsi,%rax), %rcx	 #, _239
	call	memset	 #
.L80:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:97:                 __m256d vc = _mm256_loadu_pd(&c_row[jj]);
	movq	64(%rsp), %rax	 # %sfp, _131
	movl	%edi, 132(%rsp)	 # i, %sfp
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:97:                 __m256d vc = _mm256_loadu_pd(&c_row[jj]);
	xorl	%r8d, %r8d	 # ivtmp.167
	xorl	%edx, %edx	 # ivtmp.162
	movq	%rbp, 136(%rsp)	 # _298, %sfp
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:97:                 __m256d vc = _mm256_loadu_pd(&c_row[jj]);
	leaq	(%rax,%rsi), %r12	 #, _128
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:97:                 __m256d vc = _mm256_loadu_pd(&c_row[jj]);
	movq	96(%rsp), %rax	 # %sfp, _116
	addq	%rsi, %rax	 # ivtmp.173, _48
	movq	%rax, 104(%rsp)	 # _48, %sfp
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:97:                 __m256d vc = _mm256_loadu_pd(&c_row[jj]);
	movq	112(%rsp), %rax	 # %sfp, _62
	addq	%rsi, %rax	 # ivtmp.173, _63
	movq	%rax, 120(%rsp)	 # _63, %sfp
	movl	148(%rsp), %eax	 # %sfp, _345
	salq	$7, %rax	 #, _50
	addq	%rsi, %rax	 # ivtmp.173, _322
	movq	%rax, 40(%rsp)	 # _322, %sfp
	.p2align 4,,10
	.p2align 3
.L67:
	leaq	0(%r13,%r8,8), %r10	 #, ivtmp.158
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:80:             for (; jj <= n - 16; jj += 16) {
	cmpl	$15, %ebx	 #, n
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/avxintrin.h:1266:   return __extension__ (__m256d){ __A, __A, __A, __A };
	vbroadcastsd	(%r15,%rdx,8), %ymm0	 # MEM[(const double *)_312 + ivtmp.162_321 * 8], _96
	movq	40(%rsp), %rax	 # %sfp, _322
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:78:             const double * __restrict__ b_row = &B[(long)k * n];
	movq	%r10, %r9	 # ivtmp.158, b_row
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:80:             for (; jj <= n - 16; jj += 16) {
	movq	%rsi, %rcx	 # ivtmp.173, ivtmp.157
	jle	.L79	 #,
	.p2align 4,,10
	.p2align 3
.L78:
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/fmaintrin.h:49:   return (__m256d)__builtin_ia32_vfmaddpd256 ((__v4df)__A, (__v4df)__B,
	vmovupd	(%r10), %ymm4	 # MEM[(__m256d_u * {ref-all})_333], tmp339
	vmovupd	32(%r10), %ymm3	 # MEM[(__m256d_u * {ref-all})_333 + 32B], tmp342
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:80:             for (; jj <= n - 16; jj += 16) {
	subq	$-128, %rcx	 #, ivtmp.157
	subq	$-128, %r10	 #, ivtmp.158
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/fmaintrin.h:49:   return (__m256d)__builtin_ia32_vfmaddpd256 ((__v4df)__A, (__v4df)__B,
	vmovupd	-64(%r10), %ymm2	 # MEM[(__m256d_u * {ref-all})_333 + 64B], tmp345
	vmovupd	-32(%r10), %ymm1	 # MEM[(__m256d_u * {ref-all})_333 + 96B], tmp348
	vfmadd213pd	-128(%rcx), %ymm0, %ymm4	 # MEM[(__m256d_u * {ref-all})_341], _96, tmp339
	vfmadd213pd	-96(%rcx), %ymm0, %ymm3	 # MEM[(__m256d_u * {ref-all})_341 + 32B], _96, tmp342
	vfmadd213pd	-64(%rcx), %ymm0, %ymm2	 # MEM[(__m256d_u * {ref-all})_341 + 64B], _96, tmp345
	vfmadd213pd	-32(%rcx), %ymm0, %ymm1	 # MEM[(__m256d_u * {ref-all})_341 + 96B], _96, tmp348
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/avxintrin.h:843:   *(__m256d_u *)__P = __A;
	vmovupd	%ymm4, -128(%rcx)	 # tmp339, MEM[(__m256d_u * {ref-all})_341]
	vmovupd	%ymm3, -96(%rcx)	 # tmp342, MEM[(__m256d_u * {ref-all})_341 + 32B]
	vmovupd	%ymm2, -64(%rcx)	 # tmp345, MEM[(__m256d_u * {ref-all})_341 + 64B]
	vmovupd	%ymm1, -32(%rcx)	 # tmp348, MEM[(__m256d_u * {ref-all})_341 + 96B]
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:80:             for (; jj <= n - 16; jj += 16) {
	cmpq	%rcx, %rax	 # ivtmp.157, _322
	jne	.L78	 #,
	movq	%rax, 40(%rsp)	 # _322, %sfp
.L79:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:96:             for (; jj <= n - 4; jj += 4) {
	movl	52(%rsp), %edi	 # %sfp, jj
	cmpl	%edi, %r14d	 # jj, _129
	jle	.L95	 #,
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/fmaintrin.h:49:   return (__m256d)__builtin_ia32_vfmaddpd256 ((__v4df)__A, (__v4df)__B,
	movq	64(%rsp), %rdi	 # %sfp, _131
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:96:             for (; jj <= n - 4; jj += 4) {
	cmpl	%r14d, 80(%rsp)	 # _129, %sfp
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/fmaintrin.h:49:   return (__m256d)__builtin_ia32_vfmaddpd256 ((__v4df)__A, (__v4df)__B,
	vmovupd	(%r9,%rdi), %ymm1	 # MEM[(__m256d_u * {ref-all})_126], tmp325
	vfmadd213pd	(%r12), %ymm0, %ymm1	 # MEM[(__m256d_u * {ref-all})_128], _96, tmp325
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/avxintrin.h:843:   *(__m256d_u *)__P = __A;
	vmovupd	%ymm1, (%r12)	 # tmp325, MEM[(__m256d_u * {ref-all})_128]
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:96:             for (; jj <= n - 4; jj += 4) {
	jge	.L76	 #,
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/fmaintrin.h:49:   return (__m256d)__builtin_ia32_vfmaddpd256 ((__v4df)__A, (__v4df)__B,
	movq	96(%rsp), %rax	 # %sfp, _116
	movq	104(%rsp), %rdi	 # %sfp, _48
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:96:             for (; jj <= n - 4; jj += 4) {
	cmpl	%r14d, 128(%rsp)	 # _129, %sfp
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/fmaintrin.h:49:   return (__m256d)__builtin_ia32_vfmaddpd256 ((__v4df)__A, (__v4df)__B,
	vmovupd	(%r9,%rax), %ymm1	 # MEM[(__m256d_u * {ref-all})_16], tmp328
	vfmadd213pd	(%rdi), %ymm0, %ymm1	 # MEM[(__m256d_u * {ref-all})_48], _96, tmp328
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/avxintrin.h:843:   *(__m256d_u *)__P = __A;
	vmovupd	%ymm1, (%rdi)	 # tmp328, MEM[(__m256d_u * {ref-all})_48]
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:96:             for (; jj <= n - 4; jj += 4) {
	jge	.L76	 #,
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/fmaintrin.h:49:   return (__m256d)__builtin_ia32_vfmaddpd256 ((__v4df)__A, (__v4df)__B,
	movq	120(%rsp), %rax	 # %sfp, _63
	movq	112(%rsp), %rdi	 # %sfp, _62
	vmovupd	(%rax), %ymm5	 # MEM[(__m256d_u * {ref-all})_63], tmp487
	vfmadd132pd	(%r9,%rdi), %ymm5, %ymm0	 # MEM[(__m256d_u * {ref-all})_65], tmp487, tmp331
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/avxintrin.h:843:   *(__m256d_u *)__P = __A;
	vmovupd	%ymm0, (%rax)	 # tmp331, MEM[(__m256d_u * {ref-all})_63]
.L76:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:97:                 __m256d vc = _mm256_loadu_pd(&c_row[jj]);
	movl	84(%rsp), %ecx	 # %sfp, jj
.L77:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:103:             for (; jj < n; jj++) {
	cmpl	%ecx, %ebx	 # jj, n
	jle	.L75	 #,
	movl	%ebx, %r10d	 # n, _102
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:102:             double a_ik = A[(long)i * n + k];
	vmovsd	(%r15,%rdx,8), %xmm0	 # MEM[(const double *)_312 + ivtmp.162_321 * 8], a_ik
	movl	%ecx, %edi	 # jj, _52
	subl	%ecx, %r10d	 # jj, _102
	cmpl	$1, %r10d	 #, _102
	je	.L74	 #,
	movq	72(%rsp), %r11	 # %sfp, ivtmp.175
	movq	88(%rsp), %rbp	 # %sfp, C
	addq	%rdi, %r11	 # _52, _104
	leaq	0(%rbp,%r11,8), %r11	 #, _112
	leaq	(%rdi,%r8), %rbp	 #, _234
	leaq	8(%r13,%rbp,8), %rax	 #, _223
	cmpq	%rax, %r11	 # _223, _112
	je	.L74	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:104:                 c_row[jj] += a_ik * b_row[jj];
	vmovddup	%xmm0, %xmm1	 # a_ik, _172
	vmulpd	0(%r13,%rbp,8), %xmm1, %xmm1	 # MEM <const vector(2) double> [(const double *)vectp.144_171], _172, vect__57.146_163
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:104:                 c_row[jj] += a_ik * b_row[jj];
	vaddpd	(%r11), %xmm1, %xmm1	 # MEM <vector(2) double> [(double *)_112], vect__57.146_163, vect__58.147_162
	vmovupd	%xmm1, (%r11)	 # vect__58.147_162, MEM <vector(2) double> [(double *)_112]
	movl	%r10d, %r11d	 # _102, niters_vector_mult_vf.138
	andl	$-2, %r11d	 #, niters_vector_mult_vf.138
	andl	$1, %r10d	 #, _102
	je	.L75	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:104:                 c_row[jj] += a_ik * b_row[jj];
	addl	%ecx, %r11d	 # jj, tmp.139_182
	movslq	%r11d, %r11	 # tmp.139_182, _201
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:104:                 c_row[jj] += a_ik * b_row[jj];
	vmulsd	(%r9,%r11,8), %xmm0, %xmm0	 # *_197, a_ik, _195
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:104:                 c_row[jj] += a_ik * b_row[jj];
	vaddsd	(%rsi,%r11,8), %xmm0, %xmm0	 # *_199, _195, _194
	vmovsd	%xmm0, (%rsi,%r11,8)	 # _194, *_199
.L75:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:76:         for (int k = 0; k < n; k++) {
	addq	$1, %rdx	 #, ivtmp.162
	addq	56(%rsp), %r8	 # %sfp, ivtmp.167
	cmpl	%edx, %ebx	 # ivtmp.162, n
	jg	.L67	 #,
	movl	132(%rsp), %edi	 # %sfp, i
	movq	136(%rsp), %rbp	 # %sfp, _298
	movq	56(%rsp), %rdx	 # %sfp, _299
	addl	$1, %edi	 #, i
	addq	%rbp, %rsi	 # _298, ivtmp.173
	addq	%rbp, %r15	 # _298, ivtmp.174
	addq	%rdx, 72(%rsp)	 # _299, %sfp
	cmpl	%edi, 144(%rsp)	 # i, %sfp
	je	.L96	 #,
	vzeroupper
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:70:         for (; j <= n - 4; j += 4) {
	testl	%r14d, %r14d	 # _129
	jg	.L64	 #,
.L68:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:73:         for (; j < n; j++) {
	testl	%ebx, %ebx	 # n
	jg	.L65	 #,
.L97:
	addl	$1, %edi	 #, i
	cmpl	%edi, 144(%rsp)	 # i, %sfp
	je	.L94	 #,
	movq	56(%rsp), %rdx	 # %sfp, _299
	addq	%rbp, %rsi	 # _298, ivtmp.173
	addq	%rbp, %r15	 # _298, ivtmp.174
	addq	%rdx, 72(%rsp)	 # _299, %sfp
	testl	%ebx, %ebx	 # n
	jg	.L65	 #,
	jmp	.L97	 #
	.p2align 4,,10
	.p2align 3
.L95:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:96:             for (; jj <= n - 4; jj += 4) {
	movl	%edi, %ecx	 # jj, jj
	jmp	.L77	 #
	.p2align 4,,10
	.p2align 3
.L74:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:104:                 c_row[jj] += a_ik * b_row[jj];
	vmulsd	(%r9,%rdi,8), %xmm0, %xmm1	 # *_56, a_ik, _58
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:104:                 c_row[jj] += a_ik * b_row[jj];
	leaq	0(,%rdi,8), %r10	 #, _53
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:103:             for (; jj < n; jj++) {
	leal	1(%rcx), %r11d	 #, jj_207
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:103:             for (; jj < n; jj++) {
	cmpl	%r11d, %ebx	 # jj_207, n
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:104:                 c_row[jj] += a_ik * b_row[jj];
	vaddsd	(%rsi,%r10), %xmm1, %xmm1	 # *_54, _58, _60
	vmovsd	%xmm1, (%rsi,%r10)	 # _60, *_54
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:103:             for (; jj < n; jj++) {
	jle	.L75	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:104:                 c_row[jj] += a_ik * b_row[jj];
	vmulsd	8(%r9,%r10), %xmm0, %xmm1	 # *_161, a_ik, _132
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:103:             for (; jj < n; jj++) {
	addl	$2, %ecx	 #, jj_149
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:103:             for (; jj < n; jj++) {
	cmpl	%ecx, %ebx	 # jj_149, n
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:104:                 c_row[jj] += a_ik * b_row[jj];
	vaddsd	8(%rsi,%r10), %xmm1, %xmm1	 # *_158, _132, _59
	vmovsd	%xmm1, 8(%rsi,%r10)	 # _59, *_158
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:103:             for (; jj < n; jj++) {
	jle	.L75	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:104:                 c_row[jj] += a_ik * b_row[jj];
	vmulsd	16(%r9,%r10), %xmm0, %xmm0	 # *_213, a_ik, _211
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:104:                 c_row[jj] += a_ik * b_row[jj];
	vaddsd	16(%rsi,%r10), %xmm0, %xmm0	 # *_215, _211, _210
	vmovsd	%xmm0, 16(%rsi,%r10)	 # _210, *_215
	jmp	.L75	 #
.L96:
	vzeroupper
.L94:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:65: #pragma omp parallel for schedule(static) num_threads(num_threads)
	addq	$184, %rsp	 #,
	popq	%rbx	 #
	popq	%rsi	 #
	popq	%rdi	 #
	popq	%rbp	 #
	popq	%r12	 #
	popq	%r13	 #
	popq	%r14	 #
	popq	%r15	 #
	ret	
	.seh_endproc
	.p2align 4
	.globl	matmul_parallel_omp_ikj
	.def	matmul_parallel_omp_ikj;	.scl	2;	.type	32;	.endef
	.seh_proc	matmul_parallel_omp_ikj
matmul_parallel_omp_ikj:
	subq	$72, %rsp	 #,
	.seh_stackalloc	72
	.seh_endprologue
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:18: #pragma omp parallel for schedule(static) num_threads(num_threads)
	movq	%r8, 48(%rsp)	 # C, .omp_data_o.3.C
	movl	112(%rsp), %r8d	 # num_threads,
	movl	%r9d, 56(%rsp)	 # n, .omp_data_o.3.n
	xorl	%r9d, %r9d	 #
	movq	%rdx, 40(%rsp)	 # B, .omp_data_o.3.B
	leaq	32(%rsp), %rdx	 #, tmp104
	movq	%rcx, 32(%rsp)	 # A, .omp_data_o.3.A
	leaq	matmul_parallel_omp_ikj._omp_fn.0(%rip), %rcx	 #,
	call	GOMP_parallel	 #
	nop	
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:32: }
	addq	$72, %rsp	 #,
	ret	
	.seh_endproc
	.p2align 4
	.globl	matmul_parallel_omp_scalar_ikj
	.def	matmul_parallel_omp_scalar_ikj;	.scl	2;	.type	32;	.endef
	.seh_proc	matmul_parallel_omp_scalar_ikj
matmul_parallel_omp_scalar_ikj:
	subq	$72, %rsp	 #,
	.seh_stackalloc	72
	.seh_endprologue
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:41: #pragma omp parallel for schedule(static) num_threads(num_threads)
	movq	%r8, 48(%rsp)	 # C, .omp_data_o.10.C
	movl	112(%rsp), %r8d	 # num_threads,
	movl	%r9d, 56(%rsp)	 # n, .omp_data_o.10.n
	xorl	%r9d, %r9d	 #
	movq	%rdx, 40(%rsp)	 # B, .omp_data_o.10.B
	leaq	32(%rsp), %rdx	 #, tmp104
	movq	%rcx, 32(%rsp)	 # A, .omp_data_o.10.A
	leaq	matmul_parallel_omp_scalar_ikj._omp_fn.0(%rip), %rcx	 #,
	call	GOMP_parallel	 #
	nop	
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:57: }
	addq	$72, %rsp	 #,
	ret	
	.seh_endproc
	.p2align 4
	.globl	matmul_parallel_omp_avx2_ikj
	.def	matmul_parallel_omp_avx2_ikj;	.scl	2;	.type	32;	.endef
	.seh_proc	matmul_parallel_omp_avx2_ikj
matmul_parallel_omp_avx2_ikj:
	subq	$72, %rsp	 #,
	.seh_stackalloc	72
	.seh_endprologue
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:65: #pragma omp parallel for schedule(static) num_threads(num_threads)
	movq	%r8, 48(%rsp)	 # C, .omp_data_o.17.C
	movl	112(%rsp), %r8d	 # num_threads,
	movl	%r9d, 56(%rsp)	 # n, .omp_data_o.17.n
	xorl	%r9d, %r9d	 #
	movq	%rdx, 40(%rsp)	 # B, .omp_data_o.17.B
	leaq	32(%rsp), %rdx	 #, tmp104
	movq	%rcx, 32(%rsp)	 # A, .omp_data_o.17.A
	leaq	matmul_parallel_omp_avx2_ikj._omp_fn.0(%rip), %rcx	 #,
	call	GOMP_parallel	 #
	nop	
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:108: }
	addq	$72, %rsp	 #,
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "parallel_omp\0"
.LC1:
	.ascii "--check\0"
	.align 8
.LC2:
	.ascii "=== OpenMP Parallel Implementation Correctness Verification ===\0"
	.align 8
.LC6:
	.ascii "OpenMP (p=4) Identity (A * I == A)\0"
	.align 8
.LC7:
	.ascii "OpenMP (p=4) Zero (A * 0 == 0)\0"
	.align 8
.LC8:
	.ascii "OpenMP parallel_omp (p=%2d) vs Seq Ref\0"
	.align 8
.LC9:
	.ascii "OpenMP omp_scalar (p=8) vs Seq Ref\0"
	.align 8
.LC10:
	.ascii "OpenMP omp_avx2 (p=8) vs Seq Ref\0"
	.align 8
.LC11:
	.ascii "Usage: %s <n> <threads> [warmup_runs=2] [measured_runs=5] [impl_name=parallel_omp]\12\0"
.LC12:
	.ascii "omp_scalar\0"
.LC13:
	.ascii "omp_avx2\0"
	.align 8
.LC15:
	.ascii "CSV,%d,%s,float64,%d,%d,%.9f,%ld,%.2f,%.6f\12\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%r15	 #
	.seh_pushreg	%r15
	pushq	%r14	 #
	.seh_pushreg	%r14
	pushq	%r13	 #
	.seh_pushreg	%r13
	pushq	%r12	 #
	.seh_pushreg	%r12
	pushq	%rbp	 #
	.seh_pushreg	%rbp
	pushq	%rdi	 #
	.seh_pushreg	%rdi
	pushq	%rsi	 #
	.seh_pushreg	%rsi
	pushq	%rbx	 #
	.seh_pushreg	%rbx
	subq	$328, %rsp	 #,
	.seh_stackalloc	328
	vmovaps	%xmm6, 256(%rsp)	 #,
	.seh_savexmm	%xmm6, 256
	vmovaps	%xmm7, 272(%rsp)	 #,
	.seh_savexmm	%xmm7, 272
	vmovaps	%xmm8, 288(%rsp)	 #,
	.seh_savexmm	%xmm8, 288
	vmovaps	%xmm9, 304(%rsp)	 #,
	.seh_savexmm	%xmm9, 304
	.seh_endprologue
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:171: int main(int argc, char **argv) {
	movl	%ecx, %esi	 # argc, argc
	movq	%rdx, %rbp	 # argv, argv
	call	__main	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:172:     if (argc >= 2 && strcmp(argv[1], "--check") == 0) {
	cmpl	$1, %esi	 #, argc
	jle	.L127	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:172:     if (argc >= 2 && strcmp(argv[1], "--check") == 0) {
	movq	8(%rbp), %rbx	 # MEM[(char * *)argv_39(D) + 8B], _1
	leaq	.LC1(%rip), %rdx	 #,
	movq	%rbx, %rcx	 # _1,
	call	strcmp	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:172:     if (argc >= 2 && strcmp(argv[1], "--check") == 0) {
	testl	%eax, %eax	 # _2
	je	.L141	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:176:     int n = (argc >= 2) ? atoi(argv[1]) : 512;
	movq	%rbx, %rcx	 # _1,
	call	atoi	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:177:     int threads = (argc >= 3) ? atoi(argv[2]) : omp_get_max_threads();
	cmpl	$2, %esi	 #, argc
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:176:     int n = (argc >= 2) ? atoi(argv[1]) : 512;
	movl	%eax, %ebx	 # n, n
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:177:     int threads = (argc >= 3) ? atoi(argv[2]) : omp_get_max_threads();
	je	.L102	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:177:     int threads = (argc >= 3) ? atoi(argv[2]) : omp_get_max_threads();
	movq	16(%rbp), %rcx	 # MEM[(char * *)argv_39(D) + 16B], MEM[(char * *)argv_39(D) + 16B]
	call	atoi	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:178:     int warmup_runs = (argc >= 4) ? atoi(argv[3]) : 2;
	cmpl	$3, %esi	 #, argc
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:177:     int threads = (argc >= 3) ? atoi(argv[2]) : omp_get_max_threads();
	movl	%eax, %edi	 # threads, threads
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:178:     int warmup_runs = (argc >= 4) ? atoi(argv[3]) : 2;
	je	.L108	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:178:     int warmup_runs = (argc >= 4) ? atoi(argv[3]) : 2;
	movq	24(%rbp), %rcx	 # MEM[(char * *)argv_39(D) + 24B], MEM[(char * *)argv_39(D) + 24B]
	call	atoi	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:179:     int measured_runs = (argc >= 5) ? atoi(argv[4]) : 5;
	cmpl	$4, %esi	 #, argc
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:178:     int warmup_runs = (argc >= 4) ? atoi(argv[3]) : 2;
	movl	%eax, %r9d	 # warmup_runs, warmup_runs
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:179:     int measured_runs = (argc >= 5) ? atoi(argv[4]) : 5;
	jne	.L142	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:179:     int measured_runs = (argc >= 5) ? atoi(argv[4]) : 5;
	movl	$5, 88(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:180:     const char *impl_name = (argc >= 6) ? argv[5] : "parallel_omp";
	leaq	.LC0(%rip), %rsi	 #, impl_name
.L109:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:182:     if (n <= 0 || threads <= 0 || warmup_runs < 0 || measured_runs <= 0) {
	testl	%ebx, %ebx	 # n
	jle	.L110	 #,
	testl	%edi, %edi	 # threads
	jle	.L110	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:182:     if (n <= 0 || threads <= 0 || warmup_runs < 0 || measured_runs <= 0) {
	testl	%r9d, %r9d	 # warmup_runs
	js	.L110	 #,
	cmpl	$0, 88(%rsp)	 #, %sfp
	jg	.L111	 #,
.L110:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:183:         fprintf(stderr,
	movq	0(%rbp), %rbx	 # *argv_39(D), _13
	movl	$2, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:183:         fprintf(stderr,
	leaq	.LC11(%rip), %rdx	 #,
	movq	%rbx, %r8	 # _13,
	movq	%rax, %rcx	 # _14,
	call	__mingw_fprintf	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:186:         return EXIT_FAILURE;
	movl	$1, %eax	 #, <retval>
	jmp	.L101	 #
.L141:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:111:     printf("=== OpenMP Parallel Implementation Correctness Verification ===\n");
	leaq	.LC2(%rip), %rcx	 #,
	leaq	192(%rsp), %r15	 #, tmp276
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:147:             snprintf(label, sizeof(label), "OpenMP parallel_omp (p=%2d) vs Seq Ref", p);
	movl	$1, %r14d	 #, all_ok
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:111:     printf("=== OpenMP Parallel Implementation Correctness Verification ===\n");
	call	puts	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:112:     const int test_sizes[] = {16, 64, 67, 128};
	movabsq	$274877906960, %rax	 #, tmp361
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:114:     const int test_threads[] = {1, 2, 4, 8, 16, 32};
	vmovdqa	.LC3(%rip), %xmm0	 #, tmp184
	vmovsd	.LC5(%rip), %xmm6	 #, tmp275
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:112:     const int test_sizes[] = {16, 64, 67, 128};
	movq	%rax, 112(%rsp)	 # tmp361, MEM <unsigned long long> [(int *)&test_sizes]
	movabsq	$549755813955, %rax	 #, tmp362
	movq	%rax, 120(%rsp)	 # tmp362, MEM <unsigned long long> [(int *)&test_sizes + 8B]
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:114:     const int test_threads[] = {1, 2, 4, 8, 16, 32};
	movabsq	$137438953488, %rax	 #, tmp185
	movq	%rax, 144(%rsp)	 # tmp185, MEM <vector(2) int> [(int *)&test_threads + 16B]
	leaq	112(%rsp), %rax	 #, ivtmp.211
	movq	%rax, 88(%rsp)	 # ivtmp.211, %sfp
	vmovdqa	%xmm0, 128(%rsp)	 # tmp184, MEM <vector(4) int> [(int *)&test_threads]
.L105:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:119:         int n = test_sizes[s];
	movq	88(%rsp), %rax	 # %sfp, ivtmp.211
	movslq	(%rax), %rdi	 # MEM[(int *)_255],
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:120:         double *A = alloc_matrix(n);
	movl	%edi, %ecx	 # n,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:119:         int n = test_sizes[s];
	movq	%rdi, %rbx	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:120:         double *A = alloc_matrix(n);
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:121:         double *B = alloc_matrix(n);
	movl	%edi, %ecx	 # n,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:120:         double *A = alloc_matrix(n);
	movq	%rax, %rbp	 #, A
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:121:         double *B = alloc_matrix(n);
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:122:         double *I = alloc_matrix(n);
	movl	%edi, %ecx	 # n,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:121:         double *B = alloc_matrix(n);
	movq	%rax, %r12	 #, B
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:122:         double *I = alloc_matrix(n);
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:123:         double *Z = alloc_matrix(n);
	movl	%edi, %ecx	 # n,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:122:         double *I = alloc_matrix(n);
	movq	%rax, 96(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:123:         double *Z = alloc_matrix(n);
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:124:         double *C_ref = alloc_matrix(n);
	movl	%edi, %ecx	 # n,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:123:         double *Z = alloc_matrix(n);
	movq	%rax, %r13	 #, Z
	movq	%rax, 104(%rsp)	 # Z, %sfp
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:124:         double *C_ref = alloc_matrix(n);
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:125:         double *C_test = alloc_matrix(n);
	movl	%edi, %ecx	 # n,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:124:         double *C_ref = alloc_matrix(n);
	movq	%rax, 80(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:125:         double *C_test = alloc_matrix(n);
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:127:         generate_random_matrix(A, n, DEFAULT_SEED + (uint64_t)n);
	leaq	42(%rdi), %r8	 #,
	movl	%edi, %edx	 # n,
	movq	%rbp, %rcx	 # A,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:125:         double *C_test = alloc_matrix(n);
	movq	%rax, %rsi	 #, C_test
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:127:         generate_random_matrix(A, n, DEFAULT_SEED + (uint64_t)n);
	call	generate_random_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:128:         generate_random_matrix(B, n, DEFAULT_SEED + (uint64_t)n + 1000ULL);
	leaq	1042(%rdi), %r8	 #,
	movl	%edi, %edx	 # n,
	movq	%r12, %rcx	 # B,
	call	generate_random_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:129:         generate_identity_matrix(I, n);
	movl	%edi, %edx	 # n,
	movq	96(%rsp), %rdi	 # %sfp, I
	movq	%rdi, %rcx	 # I,
	call	generate_identity_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:130:         generate_zero_matrix(Z, n);
	movl	%ebx, %edx	 # n,
	movq	%r13, %rcx	 # Z,
	call	generate_zero_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:132:         reference_matmul_ikj(A, B, C_ref, n);
	movq	80(%rsp), %r8	 # %sfp,
	movl	%ebx, %r9d	 # n,
	movq	%r12, %rdx	 # B,
	movq	%rbp, %rcx	 # A,
	call	reference_matmul_ikj	 #
	xorl	%r9d, %r9d	 #
	movl	$4, %r8d	 #,
	movq	%r15, %rdx	 # tmp276,
	leaq	matmul_parallel_omp_ikj._omp_fn.0(%rip), %rcx	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:18: #pragma omp parallel for schedule(static) num_threads(num_threads)
	movq	%rdi, 200(%rsp)	 # I, MEM[(struct .omp_data_s.1 *)_168].B
	movl	%ebx, 216(%rsp)	 # n, MEM[(struct .omp_data_s.1 *)_168].n
	movq	%rsi, 208(%rsp)	 # C_test, MEM[(struct .omp_data_s.1 *)_168].C
	movq	%rbp, 192(%rsp)	 # A, MEM[(struct .omp_data_s.1 *)_168].A
	call	GOMP_parallel	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:136:         all_ok &= verify_matrix_tolerance(A, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	leaq	.LC6(%rip), %rax	 #, tmp366
	movl	%ebx, %r8d	 # n,
	movq	%rsi, %rdx	 # C_test,
	movq	%rax, 40(%rsp)	 # tmp366,
	vmovapd	%xmm6, %xmm3	 # tmp275,
	movq	%rbp, %rcx	 # A,
	vmovsd	%xmm6, 32(%rsp)	 # tmp275,
	call	verify_matrix_tolerance	 #
	xorl	%r9d, %r9d	 #
	movl	$4, %r8d	 #,
	movq	%r15, %rdx	 # tmp276,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:136:         all_ok &= verify_matrix_tolerance(A, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	andl	%r14d, %eax	 # all_ok, _147
	leaq	matmul_parallel_omp_ikj._omp_fn.0(%rip), %rcx	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:18: #pragma omp parallel for schedule(static) num_threads(num_threads)
	movl	%ebx, 216(%rsp)	 # n, MEM[(struct .omp_data_s.1 *)_168].n
	leaq	128(%rsp), %r14	 #, tmp370
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:136:         all_ok &= verify_matrix_tolerance(A, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	movl	%eax, %edi	 # _147, all_ok
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:18: #pragma omp parallel for schedule(static) num_threads(num_threads)
	movq	%rsi, 208(%rsp)	 # C_test, MEM[(struct .omp_data_s.1 *)_168].C
	movq	%r13, 200(%rsp)	 # Z, MEM[(struct .omp_data_s.1 *)_168].B
	movq	%rbp, 192(%rsp)	 # A, MEM[(struct .omp_data_s.1 *)_168].A
	call	GOMP_parallel	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:140:         all_ok &= verify_matrix_tolerance(Z, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	leaq	.LC7(%rip), %rax	 #, tmp369
	movl	%ebx, %r8d	 # n,
	movq	%rsi, %rdx	 # C_test,
	movq	%rax, 40(%rsp)	 # tmp369,
	vmovapd	%xmm6, %xmm3	 # tmp275,
	movq	%r13, %rcx	 # Z,
	vmovsd	%xmm6, 32(%rsp)	 # tmp275,
	call	verify_matrix_tolerance	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:140:         all_ok &= verify_matrix_tolerance(Z, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	andl	%eax, %edi	 # _150, all_ok
	.p2align 4,,10
	.p2align 3
.L104:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:145:             int p = test_threads[t];
	movl	(%r14), %r13d	 # MEM[(int *)_173], p
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:147:             snprintf(label, sizeof(label), "OpenMP parallel_omp (p=%2d) vs Seq Ref", p);
	leaq	.LC8(%rip), %r8	 #,
	movl	$64, %edx	 #,
	movq	%r15, %rcx	 # tmp276,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:144:         for (int t = 0; t < num_t; t++) {
	addq	$4, %r14	 #, ivtmp.204
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:147:             snprintf(label, sizeof(label), "OpenMP parallel_omp (p=%2d) vs Seq Ref", p);
	movl	%r13d, %r9d	 # p,
	call	__mingw_snprintf	 #
	xorl	%r9d, %r9d	 #
	movl	%r13d, %r8d	 # p,
	leaq	160(%rsp), %rdx	 #, tmp371
	leaq	matmul_parallel_omp_ikj._omp_fn.0(%rip), %rcx	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:18: #pragma omp parallel for schedule(static) num_threads(num_threads)
	movl	%ebx, 184(%rsp)	 # n, .omp_data_o.3.n
	movq	%rsi, 176(%rsp)	 # C_test, .omp_data_o.3.C
	movq	%r12, 168(%rsp)	 # B, .omp_data_o.3.B
	movq	%rbp, 160(%rsp)	 # A, .omp_data_o.3.A
	call	GOMP_parallel	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:149:             all_ok &= verify_matrix_tolerance(C_ref, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL, label);
	movq	%r15, 40(%rsp)	 # tmp276,
	movq	80(%rsp), %rcx	 # %sfp,
	movl	%ebx, %r8d	 # n,
	vmovsd	%xmm6, 32(%rsp)	 # tmp275,
	vmovapd	%xmm6, %xmm3	 # tmp275,
	movq	%rsi, %rdx	 # C_test,
	call	verify_matrix_tolerance	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:149:             all_ok &= verify_matrix_tolerance(C_ref, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL, label);
	andl	%eax, %edi	 # _155, all_ok
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:144:         for (int t = 0; t < num_t; t++) {
	leaq	152(%rsp), %rax	 #, tmp372
	cmpq	%r14, %rax	 # ivtmp.204, tmp372
	jne	.L104	 #,
	xorl	%r9d, %r9d	 #
	movl	$8, %r8d	 #,
	movq	%r15, %rdx	 # tmp276,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:41: #pragma omp parallel for schedule(static) num_threads(num_threads)
	movl	%ebx, 216(%rsp)	 # n, MEM[(struct .omp_data_s.8 *)_168].n
	leaq	matmul_parallel_omp_scalar_ikj._omp_fn.0(%rip), %rcx	 #,
	movq	%rsi, 208(%rsp)	 # C_test, MEM[(struct .omp_data_s.8 *)_168].C
	movq	%r12, 200(%rsp)	 # B, MEM[(struct .omp_data_s.8 *)_168].B
	movq	%rbp, 192(%rsp)	 # A, MEM[(struct .omp_data_s.8 *)_168].A
	call	GOMP_parallel	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:154:         all_ok &= verify_matrix_tolerance(C_ref, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	leaq	.LC9(%rip), %rax	 #, tmp373
	movq	80(%rsp), %r13	 # %sfp, C_ref
	movl	%ebx, %r8d	 # n,
	movq	%rax, 40(%rsp)	 # tmp373,
	vmovapd	%xmm6, %xmm3	 # tmp275,
	movq	%rsi, %rdx	 # C_test,
	vmovsd	%xmm6, 32(%rsp)	 # tmp275,
	movq	%r13, %rcx	 # C_ref,
	call	verify_matrix_tolerance	 #
	xorl	%r9d, %r9d	 #
	movl	$8, %r8d	 #,
	movq	%r15, %rdx	 # tmp276,
	leaq	matmul_parallel_omp_avx2_ikj._omp_fn.0(%rip), %rcx	 #,
	movl	%eax, %r14d	 #, _159
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:65: #pragma omp parallel for schedule(static) num_threads(num_threads)
	movl	%ebx, 216(%rsp)	 # n, MEM[(struct .omp_data_s.15 *)_168].n
	movq	%rsi, 208(%rsp)	 # C_test, MEM[(struct .omp_data_s.15 *)_168].C
	movq	%r12, 200(%rsp)	 # B, MEM[(struct .omp_data_s.15 *)_168].B
	movq	%rbp, 192(%rsp)	 # A, MEM[(struct .omp_data_s.15 *)_168].A
	call	GOMP_parallel	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:158:         all_ok &= verify_matrix_tolerance(C_ref, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	leaq	.LC10(%rip), %rax	 #, tmp374
	movl	%ebx, %r8d	 # n,
	movq	%rsi, %rdx	 # C_test,
	movq	%rax, 40(%rsp)	 # tmp374,
	vmovapd	%xmm6, %xmm3	 # tmp275,
	movq	%r13, %rcx	 # C_ref,
	vmovsd	%xmm6, 32(%rsp)	 # tmp275,
	call	verify_matrix_tolerance	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:161:         free_matrix(A);
	movq	%rbp, %rcx	 # A,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:158:         all_ok &= verify_matrix_tolerance(C_ref, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	andl	%eax, %r14d	 # _161, _264
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:161:         free_matrix(A);
	call	free_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:162:         free_matrix(B);
	movq	%r12, %rcx	 # B,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:158:         all_ok &= verify_matrix_tolerance(C_ref, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	andl	%edi, %r14d	 # all_ok, all_ok
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:118:     for (int s = 0; s < num_sizes; s++) {
	leaq	128(%rsp), %rdi	 #, tmp377
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:162:         free_matrix(B);
	call	free_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:163:         free_matrix(I);
	movq	96(%rsp), %rcx	 # %sfp,
	call	free_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:164:         free_matrix(Z);
	movq	104(%rsp), %rcx	 # %sfp,
	call	free_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:165:         free_matrix(C_ref);
	movq	%r13, %rcx	 # C_ref,
	call	free_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:166:         free_matrix(C_test);
	movq	%rsi, %rcx	 # C_test,
	call	free_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:118:     for (int s = 0; s < num_sizes; s++) {
	addq	$4, 88(%rsp)	 #, %sfp
	cmpq	%rdi, 88(%rsp)	 # tmp377, %sfp
	jne	.L105	 #,
	movl	%r14d, %eax	 # all_ok, all_ok
	xorl	$1, %eax	 #, all_ok
.L101:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:247: }
	vmovaps	256(%rsp), %xmm6	 #,
	vmovaps	272(%rsp), %xmm7	 #,
	vmovaps	288(%rsp), %xmm8	 #,
	vmovaps	304(%rsp), %xmm9	 #,
	addq	$328, %rsp	 #,
	popq	%rbx	 #
	popq	%rsi	 #
	popq	%rdi	 #
	popq	%rbp	 #
	popq	%r12	 #
	popq	%r13	 #
	popq	%r14	 #
	popq	%r15	 #
	ret	
.L127:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:176:     int n = (argc >= 2) ? atoi(argv[1]) : 512;
	movl	$512, %ebx	 #, n
.L102:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:177:     int threads = (argc >= 3) ? atoi(argv[2]) : omp_get_max_threads();
	call	omp_get_max_threads	 #
	movl	%eax, %edi	 # threads, threads
.L108:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:182:     if (n <= 0 || threads <= 0 || warmup_runs < 0 || measured_runs <= 0) {
	testl	%edi, %edi	 # threads
	jle	.L110	 #,
	testl	%ebx, %ebx	 # n
	jle	.L110	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:189:     omp_set_dynamic(0);
	xorl	%ecx, %ecx	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:197:     generate_random_matrix(A, n, DEFAULT_SEED + (uint64_t)n);
	movl	%ebx, %esi	 # n, _98
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:189:     omp_set_dynamic(0);
	call	omp_set_dynamic	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:190:     omp_set_num_threads(threads);
	movl	%edi, %ecx	 # threads,
	call	omp_set_num_threads	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:193:     double *A = alloc_matrix(n);
	movl	%ebx, %ecx	 # n,
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:194:     double *B = alloc_matrix(n);
	movl	%ebx, %ecx	 # n,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:193:     double *A = alloc_matrix(n);
	movq	%rax, %r14	 # A, A
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:194:     double *B = alloc_matrix(n);
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:195:     double *C = alloc_matrix(n);
	movl	%ebx, %ecx	 # n,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:194:     double *B = alloc_matrix(n);
	movq	%rax, %r13	 # B, B
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:195:     double *C = alloc_matrix(n);
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:197:     generate_random_matrix(A, n, DEFAULT_SEED + (uint64_t)n);
	leaq	42(%rsi), %r8	 #,
	movl	%ebx, %edx	 # n,
	movq	%r14, %rcx	 # A,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:195:     double *C = alloc_matrix(n);
	movq	%rax, %r12	 # C, C
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:197:     generate_random_matrix(A, n, DEFAULT_SEED + (uint64_t)n);
	call	generate_random_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:198:     generate_random_matrix(B, n, DEFAULT_SEED + (uint64_t)n + 1000ULL);
	leaq	1042(%rsi), %r8	 #,
	movl	%ebx, %edx	 # n,
	movq	%r13, %rcx	 # B,
	call	generate_random_matrix	 #
	movl	$5, 88(%rsp)	 #, %sfp
	movl	$2, %r9d	 #, warmup_runs
	leaq	.LC0(%rip), %rsi	 #, impl_name
.L126:
	leaq	.LC12(%rip), %rax	 #, tmp281
	movl	%edi, 96(%rsp)	 # threads, %sfp
	xorl	%ebp, %ebp	 # w
	leaq	192(%rsp), %r15	 #, tmp276
	movq	%rax, 80(%rsp)	 # tmp281, %sfp
	movl	%r9d, %edi	 # warmup_runs, warmup_runs
	jmp	.L117	 #
	.p2align 4,,10
	.p2align 3
.L145:
	leaq	matmul_parallel_omp_avx2_ikj._omp_fn.0(%rip), %rcx	 #,
	call	GOMP_parallel	 #
.L115:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:201:     for (int w = 0; w < warmup_runs; w++) {
	addl	$1, %ebp	 #, w
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:201:     for (int w = 0; w < warmup_runs; w++) {
	cmpl	%edi, %ebp	 # warmup_runs, w
	je	.L143	 #,
.L117:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:202:         if (strcmp(impl_name, "omp_scalar") == 0) {
	movq	80(%rsp), %rdx	 # %sfp,
	movq	%rsi, %rcx	 # impl_name,
	call	strcmp	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:202:         if (strcmp(impl_name, "omp_scalar") == 0) {
	testl	%eax, %eax	 # _18
	je	.L144	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:204:         } else if (strcmp(impl_name, "omp_avx2") == 0) {
	leaq	.LC13(%rip), %rdx	 #,
	movq	%rsi, %rcx	 # impl_name,
	call	strcmp	 #
	xorl	%r9d, %r9d	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:65: #pragma omp parallel for schedule(static) num_threads(num_threads)
	movl	%ebx, 216(%rsp)	 # n,
	movl	96(%rsp), %r8d	 # %sfp,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:204:         } else if (strcmp(impl_name, "omp_avx2") == 0) {
	testl	%eax, %eax	 # _19
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:65: #pragma omp parallel for schedule(static) num_threads(num_threads)
	movq	%r12, 208(%rsp)	 # C,
	movq	%r15, %rdx	 # tmp276,
	movq	%r13, 200(%rsp)	 # B,
	movq	%r14, 192(%rsp)	 # A,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:204:         } else if (strcmp(impl_name, "omp_avx2") == 0) {
	je	.L145	 #,
	leaq	matmul_parallel_omp_ikj._omp_fn.0(%rip), %rcx	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:201:     for (int w = 0; w < warmup_runs; w++) {
	addl	$1, %ebp	 #, w
	call	GOMP_parallel	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:201:     for (int w = 0; w < warmup_runs; w++) {
	cmpl	%edi, %ebp	 # warmup_runs, w
	jne	.L117	 #,
.L143:
	movl	96(%rsp), %edi	 # %sfp, threads
.L113:
	vmovsd	.LC5(%rip), %xmm6	 #, tmp275
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:212:     for (int r = 1; r <= measured_runs; r++) {
	movl	$1, %ebp	 #, r
	jmp	.L125	 #
	.p2align 4,,10
	.p2align 3
.L148:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:228:         double cpu_time_sec = cpu_t1 - cpu_t0;
	vsubsd	%xmm9, %xmm0, %xmm0	 # cpu_t0, cpu_t1, cpu_time_sec_80
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:234:         double chk = compute_checksum(C, n);
	movl	%ebx, %edx	 # n,
	movq	%r12, %rcx	 # C,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:230:                                   ? ((cpu_time_sec / kernel_time_sec) * 100.0)
	vdivsd	%xmm7, %xmm0, %xmm0	 # kernel_time_sec, cpu_time_sec_80, _22
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:229:         double cpu_util_pct = (kernel_time_sec > 1e-9)
	vmulsd	.LC14(%rip), %xmm0, %xmm8	 #, _22, cpu_util_pct
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:234:         double chk = compute_checksum(C, n);
	call	compute_checksum	 #
	vmovapd	%xmm0, %xmm9	 #, chk
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:235:         long peak_rss_kb = get_peak_rss_kb();
	call	get_peak_rss_kb	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:238:         printf("CSV,%d,%s,float64,%d,%d,%.9f,%ld,%.2f,%.6f\n",
	vmovsd	%xmm9, 64(%rsp)	 # chk,
	vmovsd	%xmm8, 56(%rsp)	 # cpu_util_pct,
.L140:
	movl	%ebp, 32(%rsp)	 # r,
	movl	%edi, %r9d	 # threads,
	movq	%rsi, %r8	 # impl_name,
	movl	%ebx, %edx	 # n,
	movl	%eax, 48(%rsp)	 # peak_rss_kb,
	leaq	.LC15(%rip), %rcx	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:212:     for (int r = 1; r <= measured_runs; r++) {
	addl	$1, %ebp	 #, r
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:238:         printf("CSV,%d,%s,float64,%d,%d,%.9f,%ld,%.2f,%.6f\n",
	vmovsd	%xmm7, 40(%rsp)	 # kernel_time_sec,
	call	__mingw_printf	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:240:         fflush(stdout);
	movl	$1, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:240:         fflush(stdout);
	movq	%rax, %rcx	 # _23,
	call	fflush	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:212:     for (int r = 1; r <= measured_runs; r++) {
	cmpl	88(%rsp), %ebp	 # %sfp, r
	jg	.L146	 #,
.L125:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:213:         double cpu_t0 = get_cpu_time_sec();
	call	get_cpu_time_sec	 #
	vmovapd	%xmm0, %xmm9	 #, cpu_t0
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:214:         double wall_t0 = get_wall_time_sec();
	call	get_wall_time_sec	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:216:         if (strcmp(impl_name, "omp_scalar") == 0) {
	movq	80(%rsp), %rdx	 # %sfp,
	movq	%rsi, %rcx	 # impl_name,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:214:         double wall_t0 = get_wall_time_sec();
	vmovapd	%xmm0, %xmm8	 #, wall_t0
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:216:         if (strcmp(impl_name, "omp_scalar") == 0) {
	call	strcmp	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:216:         if (strcmp(impl_name, "omp_scalar") == 0) {
	testl	%eax, %eax	 # _20
	je	.L147	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:218:         } else if (strcmp(impl_name, "omp_avx2") == 0) {
	leaq	.LC13(%rip), %rdx	 #,
	movq	%rsi, %rcx	 # impl_name,
	call	strcmp	 #
	xorl	%r9d, %r9d	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:65: #pragma omp parallel for schedule(static) num_threads(num_threads)
	movl	%ebx, 216(%rsp)	 # n,
	movl	%edi, %r8d	 # threads,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:218:         } else if (strcmp(impl_name, "omp_avx2") == 0) {
	testl	%eax, %eax	 # _21
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:65: #pragma omp parallel for schedule(static) num_threads(num_threads)
	movq	%r12, 208(%rsp)	 # C,
	movq	%r15, %rdx	 # tmp276,
	movq	%r13, 200(%rsp)	 # B,
	movq	%r14, 192(%rsp)	 # A,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:218:         } else if (strcmp(impl_name, "omp_avx2") == 0) {
	jne	.L120	 #,
	leaq	matmul_parallel_omp_avx2_ikj._omp_fn.0(%rip), %rcx	 #,
	call	GOMP_parallel	 #
.L119:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:224:         double wall_t1 = get_wall_time_sec();
	call	get_wall_time_sec	 #
	vmovapd	%xmm0, %xmm7	 #, wall_t1
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:225:         double cpu_t1 = get_cpu_time_sec();
	call	get_cpu_time_sec	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:227:         double kernel_time_sec = wall_t1 - wall_t0;
	vsubsd	%xmm8, %xmm7, %xmm7	 # wall_t0, wall_t1, kernel_time_sec
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:231:                                   : NAN; /* not measurable: reported as missing, never imputed */
	vcomisd	%xmm6, %xmm7	 # tmp275, kernel_time_sec
	ja	.L148	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:234:         double chk = compute_checksum(C, n);
	movl	%ebx, %edx	 # n,
	movq	%r12, %rcx	 # C,
	call	compute_checksum	 #
	vmovapd	%xmm0, %xmm8	 #, chk
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:235:         long peak_rss_kb = get_peak_rss_kb();
	call	get_peak_rss_kb	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:238:         printf("CSV,%d,%s,float64,%d,%d,%.9f,%ld,%.2f,%.6f\n",
	movq	.LC16(%rip), %rdx	 #, tmp383
	vmovsd	%xmm8, 64(%rsp)	 # chk,
	movq	%rdx, 56(%rsp)	 # tmp383,
	jmp	.L140	 #
	.p2align 4,,10
	.p2align 3
.L144:
	movl	96(%rsp), %r8d	 # %sfp,
	xorl	%r9d, %r9d	 #
	movq	%r15, %rdx	 # tmp276,
	leaq	matmul_parallel_omp_scalar_ikj._omp_fn.0(%rip), %rcx	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:41: #pragma omp parallel for schedule(static) num_threads(num_threads)
	movl	%ebx, 216(%rsp)	 # n, MEM[(struct .omp_data_s.8 *)_168].n
	movq	%r12, 208(%rsp)	 # C, MEM[(struct .omp_data_s.8 *)_168].C
	movq	%r13, 200(%rsp)	 # B, MEM[(struct .omp_data_s.8 *)_168].B
	movq	%r14, 192(%rsp)	 # A, MEM[(struct .omp_data_s.8 *)_168].A
	call	GOMP_parallel	 #
	jmp	.L115	 #
	.p2align 4,,10
	.p2align 3
.L120:
	leaq	matmul_parallel_omp_ikj._omp_fn.0(%rip), %rcx	 #,
	call	GOMP_parallel	 #
	jmp	.L119	 #
	.p2align 4,,10
	.p2align 3
.L147:
	xorl	%r9d, %r9d	 #
	movl	%edi, %r8d	 # threads,
	movq	%r15, %rdx	 # tmp276,
	movl	%ebx, 216(%rsp)	 # n, MEM[(struct .omp_data_s.8 *)_168].n
	leaq	matmul_parallel_omp_scalar_ikj._omp_fn.0(%rip), %rcx	 #,
	movq	%r12, 208(%rsp)	 # C, MEM[(struct .omp_data_s.8 *)_168].C
	movq	%r13, 200(%rsp)	 # B, MEM[(struct .omp_data_s.8 *)_168].B
	movq	%r14, 192(%rsp)	 # A, MEM[(struct .omp_data_s.8 *)_168].A
	call	GOMP_parallel	 #
	jmp	.L119	 #
.L146:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:243:     free_matrix(A);
	movq	%r14, %rcx	 # A,
	call	free_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:244:     free_matrix(B);
	movq	%r13, %rcx	 # B,
	call	free_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:245:     free_matrix(C);
	movq	%r12, %rcx	 # C,
	call	free_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:246:     return EXIT_SUCCESS;
	xorl	%eax, %eax	 # <retval>
	jmp	.L101	 #
.L142:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:179:     int measured_runs = (argc >= 5) ? atoi(argv[4]) : 5;
	movq	32(%rbp), %rcx	 # MEM[(char * *)argv_39(D) + 32B], MEM[(char * *)argv_39(D) + 32B]
	movl	%eax, 80(%rsp)	 # warmup_runs, %sfp
	call	atoi	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:180:     const char *impl_name = (argc >= 6) ? argv[5] : "parallel_omp";
	cmpl	$5, %esi	 #, argc
	movl	80(%rsp), %r9d	 # %sfp, warmup_runs
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:179:     int measured_runs = (argc >= 5) ? atoi(argv[4]) : 5;
	movl	%eax, 88(%rsp)	 # measured_runs, %sfp
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:180:     const char *impl_name = (argc >= 6) ? argv[5] : "parallel_omp";
	je	.L129	 #,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:180:     const char *impl_name = (argc >= 6) ? argv[5] : "parallel_omp";
	movq	40(%rbp), %rsi	 # MEM[(char * *)argv_39(D) + 40B], impl_name
	jmp	.L109	 #
.L129:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:180:     const char *impl_name = (argc >= 6) ? argv[5] : "parallel_omp";
	leaq	.LC0(%rip), %rsi	 #, impl_name
	jmp	.L109	 #
.L111:
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:189:     omp_set_dynamic(0);
	xorl	%ecx, %ecx	 #
	movl	%r9d, 80(%rsp)	 # warmup_runs, %sfp
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:197:     generate_random_matrix(A, n, DEFAULT_SEED + (uint64_t)n);
	movl	%ebx, %ebp	 # n, _15
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:189:     omp_set_dynamic(0);
	call	omp_set_dynamic	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:190:     omp_set_num_threads(threads);
	movl	%edi, %ecx	 # threads,
	call	omp_set_num_threads	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:193:     double *A = alloc_matrix(n);
	movl	%ebx, %ecx	 # n,
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:194:     double *B = alloc_matrix(n);
	movl	%ebx, %ecx	 # n,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:193:     double *A = alloc_matrix(n);
	movq	%rax, %r14	 # A, A
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:194:     double *B = alloc_matrix(n);
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:195:     double *C = alloc_matrix(n);
	movl	%ebx, %ecx	 # n,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:194:     double *B = alloc_matrix(n);
	movq	%rax, %r13	 # B, B
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:195:     double *C = alloc_matrix(n);
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:197:     generate_random_matrix(A, n, DEFAULT_SEED + (uint64_t)n);
	leaq	42(%rbp), %r8	 #,
	movl	%ebx, %edx	 # n,
	movq	%r14, %rcx	 # A,
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:195:     double *C = alloc_matrix(n);
	movq	%rax, %r12	 # C, C
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:197:     generate_random_matrix(A, n, DEFAULT_SEED + (uint64_t)n);
	call	generate_random_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:198:     generate_random_matrix(B, n, DEFAULT_SEED + (uint64_t)n + 1000ULL);
	leaq	1042(%rbp), %r8	 #,
	movl	%ebx, %edx	 # n,
	movq	%r13, %rcx	 # B,
	call	generate_random_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\parallel_omp.c:201:     for (int w = 0; w < warmup_runs; w++) {
	movl	80(%rsp), %r9d	 # %sfp, warmup_runs
	testl	%r9d, %r9d	 # warmup_runs
	jne	.L126	 #,
	leaq	.LC12(%rip), %rax	 #, tmp281
	leaq	192(%rsp), %r15	 #, tmp276
	movq	%rax, 80(%rsp)	 # tmp281, %sfp
	jmp	.L113	 #
	.seh_endproc
	.section .rdata,"dr"
	.align 16
.LC3:
	.long	1
	.long	2
	.long	4
	.long	8
	.align 8
.LC5:
	.long	-400107883
	.long	1041313291
	.align 8
.LC14:
	.long	0
	.long	1079574528
	.align 8
.LC16:
	.long	0
	.long	2146959360
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (GNU) 16.2.0"
	.def	omp_get_num_threads;	.scl	2;	.type	32;	.endef
	.def	omp_get_thread_num;	.scl	2;	.type	32;	.endef
	.def	memset;	.scl	2;	.type	32;	.endef
	.def	GOMP_parallel;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	atoi;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	alloc_matrix;	.scl	2;	.type	32;	.endef
	.def	generate_random_matrix;	.scl	2;	.type	32;	.endef
	.def	generate_identity_matrix;	.scl	2;	.type	32;	.endef
	.def	generate_zero_matrix;	.scl	2;	.type	32;	.endef
	.def	reference_matmul_ikj;	.scl	2;	.type	32;	.endef
	.def	verify_matrix_tolerance;	.scl	2;	.type	32;	.endef
	.def	free_matrix;	.scl	2;	.type	32;	.endef
	.def	omp_get_max_threads;	.scl	2;	.type	32;	.endef
	.def	omp_set_dynamic;	.scl	2;	.type	32;	.endef
	.def	omp_set_num_threads;	.scl	2;	.type	32;	.endef
	.def	compute_checksum;	.scl	2;	.type	32;	.endef
	.def	get_peak_rss_kb;	.scl	2;	.type	32;	.endef
	.def	fflush;	.scl	2;	.type	32;	.endef
	.def	get_cpu_time_sec;	.scl	2;	.type	32;	.endef
	.def	get_wall_time_sec;	.scl	2;	.type	32;	.endef
