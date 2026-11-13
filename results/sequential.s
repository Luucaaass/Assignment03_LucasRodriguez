	.file	"sequential.c"
 # GNU C11 (GCC) version 16.2.0 (x86_64-w64-mingw32)
 #	compiled by GNU C version 16.2.0, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.4.1, isl version none
 # GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 # options passed: -march=arrowlake -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -mno-sse4a -mno-fma4 -mno-xop -mfma -mno-avx512f -mbmi -mbmi2 -maes -mpclmul -mno-avx512vl -mno-avx512bw -mno-avx512dq -mno-avx512cd -mno-avx512vbmi -mno-avx512ifma -mno-avx512vpopcntdq -mno-avx512vbmi2 -mgfni -mvpclmulqdq -mno-avx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mclwb -mno-clzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mno-hle -msahf -mno-lwp -mlzcnt -mmovbe -mmovdir64b -mmovdiri -mno-mwaitx -mno-pconfig -mno-pku -mprfchw -mptwrite -mrdpid -mrdrnd -mrdseed -mno-rtm -mserialize -mno-sgx -msha -mshstk -mno-tbm -mno-tsxldtrk -mvaes -mwaitpkg -mno-wbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -mno-uintr -mhreset -mno-kl -mno-widekl -mavxvnni -mno-avx512fp16 -mavxifma -mavxvnniint8 -mavxneconvert -mcmpccxadd -mno-amx-fp16 -mno-prefetchi -mno-raoint -mno-amx-complex -mno-avxvnniint16 -mno-sm3 -mno-sha512 -mno-sm4 -mno-apxf -mno-usermsr -mno-avx10.1 -mno-avx10.2 -mno-amx-avx512 -mno-amx-tf32 -mno-amx-fp8 -mno-movrs -mno-amx-movrs -mno-avx512bmm --param=l1-cache-size=48 --param=l1-cache-line-size=64 --param=l2-cache-size=24576 -mtune=arrowlake -O3 -std=c11
	.text
	.p2align 4
	.globl	matmul_sequential_ikj
	.def	matmul_sequential_ikj;	.scl	2;	.type	32;	.endef
	.seh_proc	matmul_sequential_ikj
matmul_sequential_ikj:
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
	subq	$152, %rsp	 #,
	.seh_stackalloc	152
	vmovaps	%xmm6, 112(%rsp)	 #,
	.seh_savexmm	%xmm6, 112
	vmovaps	%xmm7, 128(%rsp)	 #,
	.seh_savexmm	%xmm7, 128
	.seh_endprologue
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	testl	%r9d, %r9d	 # n
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:13:                            int n) {
	movq	%rcx, 224(%rsp)	 # A, A
	movq	%rdx, %rbx	 # B, B
	movl	%r9d, %r13d	 # n, n
	movq	%r8, 240(%rsp)	 # C, C
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	jle	.L34	 #,
	movl	%r9d, %eax	 # n, _155
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:17:             c_row[j] = 0.0;
	movq	$0, 48(%rsp)	 #, %sfp
	movq	%rcx, %r15	 # A, ivtmp.142
	movq	%r8, %rcx	 # C, ivtmp.139
	leaq	0(,%rax,8), %rbp	 #, _129
	movq	%rax, 40(%rsp)	 # _155, %sfp
	leal	-1(%r9), %eax	 #, _64
	movl	%eax, 80(%rsp)	 # _64, %sfp
	leal	(%r9,%r9), %eax	 #, _82
	cltq
	movl	$0, 104(%rsp)	 #, %sfp
	movq	%rax, 64(%rsp)	 # _79, %sfp
	salq	$3, %rax	 #, _87
	movq	%rax, 72(%rsp)	 # _87, %sfp
	leaq	0(%rbp,%rdx), %rax	 #, ivtmp.132
	movq	%rax, 96(%rsp)	 # ivtmp.132, %sfp
	leal	-3(%r9), %eax	 #, _326
	shrl	%eax	 # _302
	addl	$2, %eax	 #, _236
	movl	%eax, 108(%rsp)	 # _236, %sfp
	.p2align 4,,10
	.p2align 3
.L17:
	xorl	%edx, %edx	 #
	movq	%rbp, %r8	 # _129,
	call	memset	 #
	cmpl	$2, %r13d	 #, n
	movq	%rax, %rcx	 #, ivtmp.139
	jle	.L18	 #,
	movl	%r13d, %edi	 # n, bnd.46
	movl	108(%rsp), %eax	 # %sfp, _284
	movl	%r13d, %esi	 # n, niters.66
	movq	%rbp, 88(%rsp)	 # _129, %sfp
	shrl	$2, %edi	 #, bnd.46
	xorl	%r10d, %r10d	 # ivtmp.129
	movl	$2, %r9d	 #, ivtmp.125
	movl	%edi, %edx	 # bnd.46, _16
	sall	$2, %edi	 #, niters_vector_mult_vf.47
	addq	%rax, %rax	 # _269
	subl	%edi, %esi	 # niters_vector_mult_vf.47, niters.66
	movq	%rax, 56(%rsp)	 # _269, %sfp
	movq	96(%rsp), %rax	 # %sfp, ivtmp.132
	salq	$5, %rdx	 #, _15
	movl	%esi, 84(%rsp)	 # niters.66, %sfp
	.p2align 4,,10
	.p2align 3
.L8:
	movq	40(%rsp), %rsi	 # %sfp, _155
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	vmovsd	-16(%r15,%r9,8), %xmm4	 # MEM[(const double *)_362 + -16B + ivtmp.125_14 * 8], a_ik
	vmovsd	-8(%r15,%r9,8), %xmm6	 # MEM[(const double *)_362 + -8B + ivtmp.125_14 * 8], a_ik
	addq	%r10, %rsi	 # ivtmp.129, _156
	cmpl	$2, 80(%rsp)	 #, %sfp
	vbroadcastsd	%xmm4, %ymm1	 # a_ik, tmp328
	vbroadcastsd	%xmm6, %ymm5	 # a_ik, tmp329
	je	.L19	 #,
	leaq	(%rbx,%r10,8), %r11	 #, vectp.53
	vmovapd	%ymm1, %ymm3	 # tmp328, _274
	vmovapd	%ymm5, %ymm2	 # tmp329, _289
	xorl	%r8d, %r8d	 # ivtmp.113
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L5:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%r11,%r8), %ymm3, %ymm0	 # MEM <const vector(4) double> [(const double *)vectp.53_268 + ivtmp.113_33 * 1], _274, vect__19.55_275
	vmulpd	(%rax,%r8), %ymm2, %ymm7	 # MEM <const vector(4) double> [(const double *)vectp.60_283 + ivtmp.113_33 * 1], _289, vect__46.62_290
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddpd	(%rcx,%r8), %ymm0, %ymm0	 # MEM <vector(4) double> [(double *)c_row_32 + ivtmp.113_33 * 1], vect__19.55_275, vect__20.56_276
	vaddpd	%ymm7, %ymm0, %ymm0	 # vect__46.62_290, vect__20.56_276, vect__45.63_291
	vmovupd	%ymm0, (%rcx,%r8)	 # vect__45.63_291, MEM <vector(4) double> [(double *)c_row_32 + ivtmp.113_33 * 1]
	addq	$32, %r8	 #, ivtmp.113
	cmpq	%r8, %rdx	 # ivtmp.113, _15
	jne	.L5	 #,
	cmpl	%edi, %r13d	 # niters_vector_mult_vf.47, n
	movl	%edi, %r8d	 # niters_vector_mult_vf.47,
	je	.L6	 #,
	movl	84(%rsp), %r14d	 # %sfp, niters.66
	movl	%edi, %r11d	 # niters_vector_mult_vf.47, tmp.69
	cmpl	$1, %r14d	 #, niters.66
	movl	%r14d, %ebp	 # niters.66, niters.66
	je	.L7	 #,
.L4:
	movq	48(%rsp), %r14	 # %sfp, ivtmp.140
	leaq	(%r14,%r8), %r12	 #, _337
	movq	240(%rsp), %r14	 # C, tmp414
	leaq	(%r14,%r12,8), %r12	 #, vectp.71
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	leaq	(%r10,%r8), %r14	 #, tmp270
	addq	%rsi, %r8	 # _156, tmp276
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%rbx,%r14,8), %xmm1, %xmm0	 # MEM <const vector(2) double> [(const double *)vectp.74_342], _350, vect__240.76_351
	vmulpd	(%rbx,%r8,8), %xmm5, %xmm5	 # MEM <const vector(2) double> [(const double *)vectp.81_361], _369, vect__247.83_370
	movl	%ebp, %r8d	 # niters.66, niters_vector_mult_vf.68
	andl	$-2, %r8d	 #, niters_vector_mult_vf.68
	andl	$1, %ebp	 #, niters.66
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddpd	(%r12), %xmm0, %xmm0	 # MEM <vector(2) double> [(double *)vectp.71_334], vect__240.76_351, vect__241.77_352
	vaddpd	%xmm5, %xmm0, %xmm0	 # vect__247.83_370, vect__241.77_352, vect__248.84_371
	vmovupd	%xmm0, (%r12)	 # vect__248.84_371, MEM <vector(2) double> [(double *)vectp.71_334]
	je	.L6	 #,
	addl	%r8d, %r11d	 # niters_vector_mult_vf.68, tmp.69
.L7:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	movslq	%r11d, %r11	 # tmp.69, _305
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	leaq	(%r10,%r11), %rbp	 #, tmp283
	addq	%r11, %rsi	 # _305, tmp286
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulsd	(%rbx,%rbp,8), %xmm4, %xmm4	 # *_311, a_ik, _313
	vmulsd	(%rbx,%rsi,8), %xmm6, %xmm6	 # *_318, a_ik, _320
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddsd	(%rcx,%r11,8), %xmm4, %xmm4	 # *_307, _313, _314
	vaddsd	%xmm6, %xmm4, %xmm4	 # _320, _314, _321
	vmovsd	%xmm4, (%rcx,%r11,8)	 # _321, *_307
.L6:
	leaq	2(%r9), %r8	 #, ivtmp.125
	addq	64(%rsp), %r10	 # %sfp, ivtmp.129
	addq	72(%rsp), %rax	 # %sfp, ivtmp.132
	cmpq	56(%rsp), %r8	 # %sfp, ivtmp.125
	je	.L36	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:17:             c_row[j] = 0.0;
	movq	%r8, %r9	 # ivtmp.125, ivtmp.125
	jmp	.L8	 #
	.p2align 4,,10
	.p2align 3
.L36:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:19:         for (int k = 0; k < n; k++) {
	movq	88(%rsp), %rbp	 # %sfp, _129
.L3:
	movq	48(%rsp), %rax	 # %sfp, ivtmp.140
	movl	%r13d, %esi	 # n, bnd.18
	movq	224(%rsp), %r12	 # A, _50
	movl	%r9d, %r11d	 # k, ivtmp.105
	shrl	$2, %esi	 #, bnd.18
	imull	%r13d, %r9d	 # n, ivtmp.108
	salq	$3, %rax	 #, _233
	movl	%esi, %edx	 # bnd.18, _113
	sall	$2, %esi	 #, niters_vector_mult_vf.19
	addq	%rax, %r12	 # _233, _50
	salq	$5, %rdx	 #, _112
	addq	240(%rsp), %rax	 # C, vectp.22
.L16:
	cmpl	$2, 80(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	vmovsd	(%r12,%r11,8), %xmm2	 # MEM[(const double *)_50 + ivtmp.105_111 * 8], a_ik
	jbe	.L21	 #,
	movl	%esi, %r8d	 # niters_vector_mult_vf.19, niters_vector_mult_vf.19
.L13:
	leaq	(%rbx,%r9,8), %rdi	 #, vectp.25
	vbroadcastsd	%xmm2, %ymm1	 # a_ik, _142
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:17:             c_row[j] = 0.0;
	xorl	%r10d, %r10d	 # ivtmp.96
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L10:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%rdi,%r10), %ymm1, %ymm0	 # MEM <const vector(4) double> [(const double *)vectp.25_136 + ivtmp.96_115 * 1], _142, vect__82.27_143
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddpd	(%rax,%r10), %ymm0, %ymm0	 # MEM <vector(4) double> [(double *)vectp.22_130 + ivtmp.96_115 * 1], vect__82.27_143, vect__81.28_144
	vmovupd	%ymm0, (%rax,%r10)	 # vect__81.28_144, MEM <vector(4) double> [(double *)vectp.22_130 + ivtmp.96_115 * 1]
	addq	$32, %r10	 #, ivtmp.96
	cmpq	%r10, %rdx	 # ivtmp.96, _112
	jne	.L10	 #,
	cmpl	%esi, %r13d	 # niters_vector_mult_vf.19, n
	je	.L11	 #,
	movl	%esi, 56(%rsp)	 # niters_vector_mult_vf.19, %sfp
.L9:
	movl	%r13d, %edi	 # n, niters.31
	subl	%r8d, %edi	 # niters_vector_mult_vf.19, niters.31
	cmpl	$1, %edi	 #, niters.31
	je	.L14	 #,
	movq	48(%rsp), %r14	 # %sfp, ivtmp.140
	movl	%r8d, %r8d	 # niters_vector_mult_vf.19, _182
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmovddup	%xmm2, %xmm0	 # a_ik, _196
	movq	240(%rsp), %r10	 # C, tmp426
	addq	%r8, %r14	 # _182, _183
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	addq	%r9, %r8	 # ivtmp.108, tmp300
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%rbx,%r8,8), %xmm0, %xmm0	 # MEM <const vector(2) double> [(const double *)vectp.39_188], _196, vect__115.41_197
	movl	%edi, %r8d	 # niters.31, niters_vector_mult_vf.33
	andl	$-2, %r8d	 #, niters_vector_mult_vf.33
	andl	$1, %edi	 #, niters.31
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddpd	(%r10,%r14,8), %xmm0, %xmm0	 # MEM <vector(2) double> [(double *)vectp.36_180], vect__115.41_197, vect__116.42_198
	vmovupd	%xmm0, (%r10,%r14,8)	 # vect__116.42_198, MEM <vector(2) double> [(double *)vectp.36_180]
	je	.L15	 #,
	addl	%r8d, 56(%rsp)	 # niters_vector_mult_vf.33, %sfp
.L14:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	movslq	56(%rsp), %r10	 # %sfp, _158
	leaq	(%rcx,%r10,8), %r8	 #, _160
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	addq	%r9, %r10	 # ivtmp.108, tmp308
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulsd	(%rbx,%r10,8), %xmm2, %xmm2	 # *_164, a_ik, _166
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddsd	(%r8), %xmm2, %xmm2	 # *_160, _166, _167
	vmovsd	%xmm2, (%r8)	 # _167, *_160
.L15:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:19:         for (int k = 0; k < n; k++) {
	addq	$1, %r11	 #, ivtmp.105
	addq	40(%rsp), %r9	 # %sfp, ivtmp.108
	cmpl	%r11d, %r13d	 # ivtmp.105, n
	jg	.L16	 #,
.L12:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	addl	$1, 104(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	movq	40(%rsp), %rdx	 # %sfp, _155
	addq	%rbp, %rcx	 # _129, ivtmp.139
	addq	%rbp, %r15	 # _129, ivtmp.142
	addq	%rdx, 48(%rsp)	 # _155, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	movl	104(%rsp), %eax	 # %sfp, i
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	cmpl	%eax, %r13d	 # i, n
	je	.L37	 #,
	vzeroupper
	jmp	.L17	 #
.L19:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	movl	$3, %ebp	 #, niters.66
	xorl	%r8d, %r8d	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:22:             for (int j = 0; j < n; j++) {
	xorl	%r11d, %r11d	 # tmp.69
	jmp	.L4	 #
.L11:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:19:         for (int k = 0; k < n; k++) {
	addq	$1, %r11	 #, ivtmp.105
	cmpl	%r11d, %r13d	 # ivtmp.105, n
	jle	.L12	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	vmovsd	(%r12,%r11,8), %xmm2	 # MEM[(const double *)_50 + ivtmp.105_380 * 8], a_ik
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:19:         for (int k = 0; k < n; k++) {
	addq	40(%rsp), %r9	 # %sfp, ivtmp.108
	jmp	.L13	 #
.L21:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:22:             for (int j = 0; j < n; j++) {
	movl	$0, 56(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	xorl	%r8d, %r8d	 # niters_vector_mult_vf.19
	jmp	.L9	 #
.L37:
	vzeroupper
.L34:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:27: }
	vmovaps	112(%rsp), %xmm6	 #,
	vmovaps	128(%rsp), %xmm7	 #,
	addq	$152, %rsp	 #,
	popq	%rbx	 #
	popq	%rsi	 #
	popq	%rdi	 #
	popq	%rbp	 #
	popq	%r12	 #
	popq	%r13	 #
	popq	%r14	 #
	popq	%r15	 #
	ret	
.L18:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:17:             c_row[j] = 0.0;
	xorl	%r9d, %r9d	 # k
	jmp	.L3	 #
	.seh_endproc
	.p2align 4
	.globl	matmul_sequential_scalar_ikj
	.def	matmul_sequential_scalar_ikj;	.scl	2;	.type	32;	.endef
	.seh_proc	matmul_sequential_scalar_ikj
matmul_sequential_scalar_ikj:
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
	subq	$56, %rsp	 #,
	.seh_stackalloc	56
	.seh_endprologue
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:34:     for (int i = 0; i < n; i++) {
	testl	%r9d, %r9d	 # n
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:33:                                   int n) {
	movq	%rdx, %rbp	 # B, B
	movl	%r9d, %r12d	 # n, n
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:34:     for (int i = 0; i < n; i++) {
	jle	.L52	 #,
	leal	-3(%r12), %edx	 #, _166
	movl	%r9d, %eax	 # n, _178
	movq	%rcx, %rsi	 # A, ivtmp.194
	movq	%r8, %r9	 # C, ivtmp.192
	shrl	%edx	 # _167
	movq	%rax, 40(%rsp)	 # _178, %sfp
	leaq	0(,%rax,8), %r14	 #, _179
	leal	(%r12,%r12), %edi	 #, _149
	leal	2(%rdx), %ecx	 #, _192
	leaq	(%r8,%r14), %rbx	 #, ivtmp.195
	movslq	%edi, %rdi	 # _149, _147
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:34:     for (int i = 0; i < n; i++) {
	xorl	%r13d, %r13d	 # i
	movl	%ecx, 36(%rsp)	 # _192, %sfp
	.p2align 4,,10
	.p2align 3
.L45:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:38:             c_row[j] = 0.0;
	xorl	%edx, %edx	 #
	movq	%r9, %rcx	 # ivtmp.192,
	movq	%r14, %r8	 # _179,
	call	memset	 #
	cmpl	$2, %r12d	 #, n
	movq	%rax, %r9	 #, ivtmp.192
	jle	.L46	 #,
	movl	36(%rsp), %r15d	 # %sfp, _169
	movq	40(%rsp), %r8	 # %sfp, ivtmp.186
	xorl	%r11d, %r11d	 # ivtmp.185
	movl	$2, %r10d	 #, ivtmp.180
	addq	%r15, %r15	 # _170
	.p2align 4,,10
	.p2align 3
.L42:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:45:                 c_row[j] += a_ik * b_row[j];
	movq	%r11, %rcx	 # ivtmp.185, _138
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:41:             double a_ik = A[(long)i * n + k];
	vmovsd	-16(%rsi,%r10,8), %xmm3	 # MEM[(const double *)_163 + -16B + ivtmp.180_144 * 8], a_ik
	vmovsd	-8(%rsi,%r10,8), %xmm2	 # MEM[(const double *)_163 + -8B + ivtmp.180_144 * 8], a_ik
	leaq	0(%rbp,%r8,8), %rdx	 #, ivtmp.172
	movq	%r9, %rax	 # ivtmp.192, ivtmp.170
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:45:                 c_row[j] += a_ik * b_row[j];
	subq	%r8, %rcx	 # ivtmp.186, _138
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L41:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:45:                 c_row[j] += a_ik * b_row[j];
	vmulsd	(%rdx,%rcx,8), %xmm3, %xmm0	 # MEM[(const double *)_135 + _138 * 8], a_ik, _19
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:44:             for (int j = 0; j < n; j++) {
	addq	$8, %rax	 #, ivtmp.170
	addq	$8, %rdx	 #, ivtmp.172
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:45:                 c_row[j] += a_ik * b_row[j];
	vmulsd	-8(%rdx), %xmm2, %xmm1	 # MEM[(const double *)_135], a_ik, _46
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:45:                 c_row[j] += a_ik * b_row[j];
	vaddsd	-8(%rax), %xmm0, %xmm0	 # MEM[(double *)_132], _19, _20
	vaddsd	%xmm1, %xmm0, %xmm0	 # _46, _20, _45
	vmovsd	%xmm0, -8(%rax)	 # _45, MEM[(double *)_132]
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:44:             for (int j = 0; j < n; j++) {
	cmpq	%rbx, %rax	 # ivtmp.195, ivtmp.170
	jne	.L41	 #,
	leaq	2(%r10), %rax	 #, ivtmp.180
	addq	%rdi, %r11	 # _147, ivtmp.185
	addq	%rdi, %r8	 # _147, ivtmp.186
	cmpq	%r15, %rax	 # _170, ivtmp.180
	je	.L40	 #,
	movq	%rax, %r10	 # ivtmp.180, ivtmp.180
	jmp	.L42	 #
.L46:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:38:             c_row[j] = 0.0;
	xorl	%r10d, %r10d	 # k
	.p2align 4,,10
	.p2align 3
.L40:
	movl	%r10d, %edx	 # k, ivtmp.162
	imull	%r12d, %r10d	 # n, ivtmp.165_61
	leaq	0(%rbp,%r10,8), %rcx	 #, ivtmp.166
.L44:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:41:             double a_ik = A[(long)i * n + k];
	vmovsd	(%rsi,%rdx,8), %xmm1	 # MEM[(const double *)_121 + ivtmp.162_113 * 8], a_ik
	xorl	%eax, %eax	 # ivtmp.158
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L43:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:45:                 c_row[j] += a_ik * b_row[j];
	vmulsd	(%rcx,%rax), %xmm1, %xmm0	 # MEM[(const double *)_110 + ivtmp.158_23 * 1], a_ik, _82
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:45:                 c_row[j] += a_ik * b_row[j];
	vaddsd	(%r9,%rax), %xmm0, %xmm0	 # MEM[(double *)c_row_32 + ivtmp.158_23 * 1], _82, _81
	vmovsd	%xmm0, (%r9,%rax)	 # _81, MEM[(double *)c_row_32 + ivtmp.158_23 * 1]
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:44:             for (int j = 0; j < n; j++) {
	addq	$8, %rax	 #, ivtmp.158
	cmpq	%r14, %rax	 # _179, ivtmp.158
	jne	.L43	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:40:         for (int k = 0; k < n; k++) {
	addq	$1, %rdx	 #, ivtmp.162
	addq	%r14, %rcx	 # _179, ivtmp.166
	cmpl	%edx, %r12d	 # ivtmp.162, n
	jg	.L44	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:34:     for (int i = 0; i < n; i++) {
	addl	$1, %r13d	 #, i
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:34:     for (int i = 0; i < n; i++) {
	addq	%r14, %r9	 # _179, ivtmp.192
	addq	%r14, %rsi	 # _179, ivtmp.194
	addq	%r14, %rbx	 # _179, ivtmp.195
	cmpl	%r13d, %r12d	 # i, n
	jne	.L45	 #,
.L52:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:49: }
	addq	$56, %rsp	 #,
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
	.globl	matmul_sequential_avx2_ikj
	.def	matmul_sequential_avx2_ikj;	.scl	2;	.type	32;	.endef
	.seh_proc	matmul_sequential_avx2_ikj
matmul_sequential_avx2_ikj:
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
	vmovaps	%xmm6, 160(%rsp)	 #,
	.seh_savexmm	%xmm6, 160
	.seh_endprologue
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:56:     for (int i = 0; i < n; i++) {
	testl	%r9d, %r9d	 # n
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:55:                                 int n) {
	movq	%r8, 272(%rsp)	 # C, C
	movq	%rcx, %r11	 # A, A
	movq	%rdx, %r14	 # B, B
	movl	%r9d, %ebx	 # n, n
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:56:     for (int i = 0; i < n; i++) {
	jle	.L75	 #,
	movl	%r9d, %eax	 # n, _141
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:60:         for (; j <= n - 4; j += 4) {
	leal	-3(%r9), %esi	 #, _118
	leal	-4(%r9), %r9d	 #, _236
	movq	%r8, %rdi	 # C, ivtmp.245
	leaq	0(,%rax,8), %rdx	 #, _144
	movq	%rax, 48(%rsp)	 # _141, %sfp
	movl	%r9d, %eax	 # _236, _235
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:64:             c_row[j] = 0.0;
	leal	-1(%rbx), %r8d	 #, _21
	andl	$-4, %eax	 #, _235
	leaq	(%rcx,%rdx), %r15	 #, ivtmp.243
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:87:                 __m256d vc = _mm256_loadu_pd(&c_row[jj]);
	movq	$0, 56(%rsp)	 #, %sfp
	leal	4(%rax), %ecx	 #,
	xorl	%eax, %eax	 #
	testl	%esi, %esi	 # _118
	movq	%rdx, 128(%rsp)	 # _144, %sfp
	movl	%ecx, 136(%rsp)	 # j, %sfp
	cmovle	%rax, %rcx	 #,,,
	movl	%r9d, 140(%rsp)	 # _236, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:64:             c_row[j] = 0.0;
	subl	%ecx, %r8d	 # j_48, _224
	cmpl	%ebx, %ecx	 # n, j_48
	movq	%r11, 256(%rsp)	 # A, A
	leaq	8(,%r8,8), %r10	 #, _222
	movl	$8, %r8d	 #, tmp236
	cmovl	%r10, %r8	 # _222,, tmp236
	salq	$3, %rcx	 #, _219
	movq	%rcx, 144(%rsp)	 # _219, %sfp
	leal	-16(%rbx), %ecx	 #, _241
	movl	%ecx, %ebp	 # _241, _240
	movq	%r8, 152(%rsp)	 # tmp236, %sfp
	andl	$-16, %ebp	 #, _240
	addl	$16, %ebp	 #, jj
	cmpl	$15, %ebx	 #, n
	cmovle	%eax, %ebp	 # jj,, tmp230, jj
	shrl	$4, %ecx	 #, _50
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:56:     for (int i = 0; i < n; i++) {
	xorl	%r12d, %r12d	 # i
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:87:                 __m256d vc = _mm256_loadu_pd(&c_row[jj]);
	movl	%ebp, %eax	 # jj, _41
	salq	$3, %rax	 #, _42
	movq	%rax, 64(%rsp)	 # _42, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:86:             for (; jj <= n - 4; jj += 4) {
	leal	4(%rbp), %eax	 #,
	movq	%rax, %r10	 #,
	movl	%eax, 76(%rsp)	 # _2, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:87:                 __m256d vc = _mm256_loadu_pd(&c_row[jj]);
	salq	$3, %rax	 #, _170
	movq	%rax, 80(%rsp)	 # _170, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:86:             for (; jj <= n - 4; jj += 4) {
	leal	8(%rbp), %eax	 #,
	movl	%eax, 100(%rsp)	 # _13, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:87:                 __m256d vc = _mm256_loadu_pd(&c_row[jj]);
	salq	$3, %rax	 #, _37
	movq	%rax, 104(%rsp)	 # _37, %sfp
	movl	%r9d, %eax	 # _236, _249
	subl	%ebp, %eax	 # jj, _249
	andl	$-4, %eax	 #, _248
	addl	%r10d, %eax	 # _2, jj
	movl	%eax, 96(%rsp)	 # jj, %sfp
	leal	1(%rcx), %eax	 #, _136
	movl	%eax, 124(%rsp)	 # _136, %sfp
	.p2align 4,,10
	.p2align 3
.L64:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:60:         for (; j <= n - 4; j += 4) {
	testl	%esi, %esi	 # _118
	jle	.L55	 #,
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/avxintrin.h:843:   *(__m256d_u *)__P = __A;
	movl	140(%rsp), %eax	 # %sfp, _255
	xorl	%edx, %edx	 #
	movq	%rdi, %rcx	 # ivtmp.245,
	shrl	$2, %eax	 #, _255
	leal	1(%rax), %r8d	 #, _231
	salq	$5, %r8	 #,
	call	memset	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:63:         for (; j < n; j++) {
	cmpl	136(%rsp), %ebx	 # %sfp, n
	jle	.L56	 #,
.L55:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:64:             c_row[j] = 0.0;
	movq	144(%rsp), %rax	 # %sfp, _219
	movq	152(%rsp), %r8	 # %sfp,
	xorl	%edx, %edx	 #
	leaq	(%rdi,%rax), %rcx	 #, _218
	call	memset	 #
.L56:
	movq	256(%rsp), %rax	 # A, tmp375
	movq	56(%rsp), %rcx	 # %sfp, ivtmp.244
	movl	%r12d, 120(%rsp)	 # i, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:87:                 __m256d vc = _mm256_loadu_pd(&c_row[jj]);
	xorl	%r8d, %r8d	 # ivtmp.237
	leaq	(%rax,%rcx,8), %rcx	 #, ivtmp.235
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:87:                 __m256d vc = _mm256_loadu_pd(&c_row[jj]);
	movq	64(%rsp), %rax	 # %sfp, _42
	leaq	(%rax,%rdi), %r13	 #, _43
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:87:                 __m256d vc = _mm256_loadu_pd(&c_row[jj]);
	movq	80(%rsp), %rax	 # %sfp, _170
	addq	%rdi, %rax	 # ivtmp.245, _169
	movq	%rax, 88(%rsp)	 # _169, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:87:                 __m256d vc = _mm256_loadu_pd(&c_row[jj]);
	movq	104(%rsp), %rax	 # %sfp, _37
	addq	%rdi, %rax	 # ivtmp.245, _38
	movq	%rax, 112(%rsp)	 # _38, %sfp
	movl	124(%rsp), %eax	 # %sfp, _180
	salq	$7, %rax	 #, _22
	addq	%rdi, %rax	 # ivtmp.245, _55
	movq	%rax, 40(%rsp)	 # _55, %sfp
	.p2align 4,,10
	.p2align 3
.L63:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:67:             __m256d va = _mm256_set1_pd(A[(long)i * n + k]);
	vmovsd	(%rcx), %xmm5	 # MEM[(const double *)_108], _15
	leaq	(%r14,%r8,8), %r9	 #, ivtmp.229
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:70:             for (; jj <= n - 16; jj += 16) {
	cmpl	$15, %ebx	 #, n
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:68:             const double * __restrict__ b_row = &B[(long)k * n];
	movq	%r9, %r10	 # ivtmp.229, b_row
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:67:             __m256d va = _mm256_set1_pd(A[(long)i * n + k]);
	vbroadcastsd	%xmm5, %ymm2	 # _15, tmp316
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/avxintrin.h:1266:   return __extension__ (__m256d){ __A, __A, __A, __A };
	vmovapd	%ymm2, %ymm0	 # tmp316, _76
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:70:             for (; jj <= n - 16; jj += 16) {
	jle	.L57	 #,
	movq	40(%rsp), %rax	 # %sfp, _55
	movq	%rdi, %rdx	 # ivtmp.245, ivtmp.228
	.p2align 4,,10
	.p2align 3
.L58:
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/fmaintrin.h:49:   return (__m256d)__builtin_ia32_vfmaddpd256 ((__v4df)__A, (__v4df)__B,
	vmovupd	64(%r9), %ymm1	 # MEM[(__m256d_u * {ref-all})_203 + 64B], tmp278
	vmovupd	(%r9), %ymm4	 # MEM[(__m256d_u * {ref-all})_203], tmp272
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:70:             for (; jj <= n - 16; jj += 16) {
	subq	$-128, %rdx	 #, ivtmp.228
	subq	$-128, %r9	 #, ivtmp.229
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/fmaintrin.h:49:   return (__m256d)__builtin_ia32_vfmaddpd256 ((__v4df)__A, (__v4df)__B,
	vmovupd	-96(%r9), %ymm3	 # MEM[(__m256d_u * {ref-all})_203 + 32B], tmp275
	vfmadd213pd	-64(%rdx), %ymm0, %ymm1	 # MEM[(__m256d_u * {ref-all})_261 + 64B], _76, tmp278
	vfmadd213pd	-128(%rdx), %ymm0, %ymm4	 # MEM[(__m256d_u * {ref-all})_261], _76, tmp272
	vfmadd213pd	-96(%rdx), %ymm0, %ymm3	 # MEM[(__m256d_u * {ref-all})_261 + 32B], _76, tmp275
	vmovapd	%ymm1, %ymm6	 # tmp278, tmp278
	vmovupd	-32(%r9), %ymm1	 # MEM[(__m256d_u * {ref-all})_203 + 96B], tmp281
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/avxintrin.h:843:   *(__m256d_u *)__P = __A;
	vmovupd	%ymm4, -128(%rdx)	 # tmp272, MEM[(__m256d_u * {ref-all})_261]
	vmovupd	%ymm3, -96(%rdx)	 # tmp275, MEM[(__m256d_u * {ref-all})_261 + 32B]
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/fmaintrin.h:49:   return (__m256d)__builtin_ia32_vfmaddpd256 ((__v4df)__A, (__v4df)__B,
	vfmadd213pd	-32(%rdx), %ymm0, %ymm1	 # MEM[(__m256d_u * {ref-all})_261 + 96B], _76, tmp281
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/avxintrin.h:843:   *(__m256d_u *)__P = __A;
	vmovupd	%ymm6, -64(%rdx)	 # tmp278, MEM[(__m256d_u * {ref-all})_261 + 64B]
	vmovupd	%ymm1, -32(%rdx)	 # tmp281, MEM[(__m256d_u * {ref-all})_261 + 96B]
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:70:             for (; jj <= n - 16; jj += 16) {
	cmpq	%rdx, %rax	 # ivtmp.228, _55
	jne	.L58	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:86:             for (; jj <= n - 4; jj += 4) {
	cmpl	%ebp, %esi	 # jj, _118
	movq	%rax, 40(%rsp)	 # _55, %sfp
	movl	%ebp, %edx	 # jj, tmp.210
	jle	.L59	 #,
.L65:
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/fmaintrin.h:49:   return (__m256d)__builtin_ia32_vfmaddpd256 ((__v4df)__A, (__v4df)__B,
	movq	64(%rsp), %rdx	 # %sfp, _42
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:86:             for (; jj <= n - 4; jj += 4) {
	cmpl	76(%rsp), %esi	 # %sfp, _118
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/fmaintrin.h:49:   return (__m256d)__builtin_ia32_vfmaddpd256 ((__v4df)__A, (__v4df)__B,
	vmovupd	(%r10,%rdx), %ymm1	 # MEM[(__m256d_u * {ref-all})_45], tmp284
	vfmadd213pd	0(%r13), %ymm0, %ymm1	 # MEM[(__m256d_u * {ref-all})_43], _76, tmp284
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/avxintrin.h:843:   *(__m256d_u *)__P = __A;
	vmovupd	%ymm1, 0(%r13)	 # tmp284, MEM[(__m256d_u * {ref-all})_43]
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:86:             for (; jj <= n - 4; jj += 4) {
	jle	.L60	 #,
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/fmaintrin.h:49:   return (__m256d)__builtin_ia32_vfmaddpd256 ((__v4df)__A, (__v4df)__B,
	movq	80(%rsp), %rax	 # %sfp, _170
	movq	88(%rsp), %rdx	 # %sfp, _169
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:86:             for (; jj <= n - 4; jj += 4) {
	cmpl	100(%rsp), %esi	 # %sfp, _118
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/fmaintrin.h:49:   return (__m256d)__builtin_ia32_vfmaddpd256 ((__v4df)__A, (__v4df)__B,
	vmovupd	(%r10,%rax), %ymm1	 # MEM[(__m256d_u * {ref-all})_172], tmp287
	vfmadd213pd	(%rdx), %ymm0, %ymm1	 # MEM[(__m256d_u * {ref-all})_169], _76, tmp287
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/avxintrin.h:843:   *(__m256d_u *)__P = __A;
	vmovupd	%ymm1, (%rdx)	 # tmp287, MEM[(__m256d_u * {ref-all})_169]
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:86:             for (; jj <= n - 4; jj += 4) {
	jle	.L60	 #,
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/fmaintrin.h:49:   return (__m256d)__builtin_ia32_vfmaddpd256 ((__v4df)__A, (__v4df)__B,
	movq	112(%rsp), %rax	 # %sfp, _38
	movq	104(%rsp), %rdx	 # %sfp, _37
	vmovupd	(%rax), %ymm3	 # MEM[(__m256d_u * {ref-all})_38], tmp397
	vfmadd132pd	(%r10,%rdx), %ymm3, %ymm0	 # MEM[(__m256d_u * {ref-all})_39], tmp397, tmp290
 # C:/Users/User/w64devkit/lib/gcc/x86_64-w64-mingw32/16.2.0/include/avxintrin.h:843:   *(__m256d_u *)__P = __A;
	vmovupd	%ymm0, (%rax)	 # tmp290, MEM[(__m256d_u * {ref-all})_38]
.L60:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:70:             for (; jj <= n - 16; jj += 16) {
	movl	96(%rsp), %edx	 # %sfp, tmp.210
.L59:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:93:             for (; jj < n; jj++) {
	cmpl	%edx, %ebx	 # tmp.210, n
	jle	.L61	 #,
.L66:
	movl	%ebx, %r11d	 # n, niters.207
	subl	%edx, %r11d	 # tmp.210, niters.207
	cmpl	$1, %r11d	 #, niters.207
	je	.L62	 #,
	movq	56(%rsp), %r12	 # %sfp, ivtmp.244
	movl	%edx, %r9d	 # tmp.210, _189
	movq	272(%rsp), %rax	 # C, tmp401
	addq	%r9, %r12	 # _189, _188
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:94:                 c_row[jj] += a_ik * b_row[jj];
	addq	%r8, %r9	 # ivtmp.237, tmp295
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:94:                 c_row[jj] += a_ik * b_row[jj];
	vmulpd	(%r14,%r9,8), %xmm2, %xmm2	 # MEM <const vector(2) double> [(const double *)vectp.215_182], _183, vect__46.217_174
	movl	%r11d, %r9d	 # niters.207, niters_vector_mult_vf.209
	andl	$-2, %r9d	 #, niters_vector_mult_vf.209
	andl	$1, %r11d	 #, niters.207
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:94:                 c_row[jj] += a_ik * b_row[jj];
	vaddpd	(%rax,%r12,8), %xmm2, %xmm2	 # MEM <vector(2) double> [(double *)vectp.212_191], vect__46.217_174, vect__47.218_173
	vmovupd	%xmm2, (%rax,%r12,8)	 # vect__47.218_173, MEM <vector(2) double> [(double *)vectp.212_191]
	je	.L61	 #,
	addl	%r9d, %edx	 # niters_vector_mult_vf.209, tmp.210
.L62:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:94:                 c_row[jj] += a_ik * b_row[jj];
	movslq	%edx, %rdx	 # tmp.210, _4
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:94:                 c_row[jj] += a_ik * b_row[jj];
	vmulsd	(%r10,%rdx,8), %xmm5, %xmm5	 # *_93, _15, _214
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:94:                 c_row[jj] += a_ik * b_row[jj];
	vaddsd	(%rdi,%rdx,8), %xmm5, %xmm5	 # *_6, _214, _213
	vmovsd	%xmm5, (%rdi,%rdx,8)	 # _213, *_6
.L61:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:66:         for (int k = 0; k < n; k++) {
	movq	48(%rsp), %rdx	 # %sfp, _141
	addq	$8, %rcx	 #, ivtmp.235
	addq	%rdx, %r8	 # _141, ivtmp.237
	cmpq	%r15, %rcx	 # ivtmp.243, ivtmp.235
	jne	.L63	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:56:     for (int i = 0; i < n; i++) {
	movl	120(%rsp), %r12d	 # %sfp, i
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:56:     for (int i = 0; i < n; i++) {
	movq	128(%rsp), %rax	 # %sfp, _144
	addq	%rdx, 56(%rsp)	 # _141, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:56:     for (int i = 0; i < n; i++) {
	addl	$1, %r12d	 #, i
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:56:     for (int i = 0; i < n; i++) {
	addq	%rax, %r15	 # _144, ivtmp.243
	addq	%rax, %rdi	 # _144, ivtmp.245
	cmpl	%r12d, %ebx	 # i, n
	je	.L76	 #,
	vzeroupper
	jmp	.L64	 #
	.p2align 4,,10
	.p2align 3
.L57:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:86:             for (; jj <= n - 4; jj += 4) {
	cmpl	%ebp, %esi	 # jj, _118
	movl	%ebp, %edx	 # jj, tmp.210
	jg	.L65	 #,
	jmp	.L66	 #
.L76:
	vzeroupper
.L75:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:98: }
	vmovaps	160(%rsp), %xmm6	 #,
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
	.section .rdata,"dr"
.LC0:
	.ascii "sequential\0"
.LC1:
	.ascii "--check\0"
	.align 8
.LC2:
	.ascii "=== Sequential Baseline Correctness Verification ===\0"
	.align 8
.LC4:
	.ascii "Sequential Identity (A * I == A)\0"
.LC5:
	.ascii "Sequential Zero (A * 0 == 0)\0"
	.align 8
.LC6:
	.ascii "Sequential ikj vs Reference ijk\0"
	.align 8
.LC7:
	.ascii "Sequential scalar ikj vs Reference ijk\0"
	.align 8
.LC8:
	.ascii "Sequential AVX2 ikj vs Reference ijk\0"
	.align 8
.LC9:
	.ascii "Usage: %s <n> [warmup_runs=2] [measured_runs=5] [impl_name=sequential]\12\0"
.LC10:
	.ascii "seq_scalar\0"
.LC11:
	.ascii "seq_avx2\0"
	.align 8
.LC13:
	.ascii "CSV,%d,%s,float64,1,%d,%.9f,%ld,%.2f,%.6f\12\0"
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
	subq	$360, %rsp	 #,
	.seh_stackalloc	360
	vmovaps	%xmm6, 272(%rsp)	 #,
	.seh_savexmm	%xmm6, 272
	vmovaps	%xmm7, 288(%rsp)	 #,
	.seh_savexmm	%xmm7, 288
	vmovaps	%xmm8, 304(%rsp)	 #,
	.seh_savexmm	%xmm8, 304
	vmovaps	%xmm9, 320(%rsp)	 #,
	.seh_savexmm	%xmm9, 320
	vmovaps	%xmm10, 336(%rsp)	 #,
	.seh_savexmm	%xmm10, 336
	.seh_endprologue
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:155: int main(int argc, char **argv) {
	movl	%ecx, %esi	 # argc, argc
	movq	%rdx, %rbx	 # argv, argv
	call	__main	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:156:     if (argc >= 2 && strcmp(argv[1], "--check") == 0) {
	cmpl	$1, %esi	 #, argc
	jle	.L188	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:156:     if (argc >= 2 && strcmp(argv[1], "--check") == 0) {
	movq	8(%rbx), %rdi	 # MEM[(char * *)argv_33(D) + 8B], _1
	leaq	.LC1(%rip), %rdx	 #,
	movq	%rdi, %rcx	 # _1,
	call	strcmp	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:156:     if (argc >= 2 && strcmp(argv[1], "--check") == 0) {
	testl	%eax, %eax	 # _2
	je	.L288	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:160:     int n = (argc >= 2) ? atoi(argv[1]) : 512;
	movq	%rdi, %rcx	 # _1,
	call	atoi	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:161:     int warmup_runs = (argc >= 3) ? atoi(argv[2]) : 2;
	cmpl	$2, %esi	 #, argc
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:160:     int n = (argc >= 2) ? atoi(argv[1]) : 512;
	movl	%eax, %r14d	 # n, n
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:161:     int warmup_runs = (argc >= 3) ? atoi(argv[2]) : 2;
	je	.L289	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:161:     int warmup_runs = (argc >= 3) ? atoi(argv[2]) : 2;
	movq	16(%rbx), %rcx	 # MEM[(char * *)argv_33(D) + 16B], MEM[(char * *)argv_33(D) + 16B]
	call	atoi	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:165:     if (n <= 0 || warmup_runs < 0 || measured_runs <= 0) {
	testl	%r14d, %r14d	 # n
	setle	%dil	 #, _907
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:161:     int warmup_runs = (argc >= 3) ? atoi(argv[2]) : 2;
	movl	%eax, %r12d	 # warmup_runs, warmup_runs
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:165:     if (n <= 0 || warmup_runs < 0 || measured_runs <= 0) {
	shrl	$31, %eax	 #, tmp1075
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:165:     if (n <= 0 || warmup_runs < 0 || measured_runs <= 0) {
	orl	%eax, %edi	 # tmp1075, _909
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:162:     int measured_runs = (argc >= 4) ? atoi(argv[3]) : 5;
	cmpl	$3, %esi	 #, argc
	jne	.L127	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:165:     if (n <= 0 || warmup_runs < 0 || measured_runs <= 0) {
	testb	%dil, %dil	 # _909
	jne	.L126	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:163:     const char *impl_name = (argc >= 5) ? argv[4] : "sequential";
	leaq	.LC0(%rip), %rax	 #, impl_name
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:162:     int measured_runs = (argc >= 4) ? atoi(argv[3]) : 5;
	movl	$5, 216(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:163:     const char *impl_name = (argc >= 5) ? argv[4] : "sequential";
	movq	%rax, 176(%rsp)	 # impl_name, %sfp
.L128:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:171:     double *A = alloc_matrix(n);
	movl	%r14d, %ecx	 # n,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:175:     generate_random_matrix(A, n, DEFAULT_SEED + (uint64_t)n);
	movslq	%r14d, %rdi	 # n, _11
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:171:     double *A = alloc_matrix(n);
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:172:     double *B = alloc_matrix(n);
	movl	%r14d, %ecx	 # n,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:171:     double *A = alloc_matrix(n);
	movq	%rax, %rsi	 # A, A
	movq	%rax, 144(%rsp)	 # A, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:172:     double *B = alloc_matrix(n);
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:173:     double *C = alloc_matrix(n);
	movl	%r14d, %ecx	 # n,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:172:     double *B = alloc_matrix(n);
	movq	%rax, %r15	 # B, B
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:173:     double *C = alloc_matrix(n);
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:175:     generate_random_matrix(A, n, DEFAULT_SEED + (uint64_t)n);
	leaq	42(%rdi), %r8	 #,
	movl	%r14d, %edx	 # n,
	movq	%rsi, %rcx	 # A,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:173:     double *C = alloc_matrix(n);
	movq	%rax, 88(%rsp)	 # C, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:175:     generate_random_matrix(A, n, DEFAULT_SEED + (uint64_t)n);
	movq	%rdi, 72(%rsp)	 # _11, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:175:     generate_random_matrix(A, n, DEFAULT_SEED + (uint64_t)n);
	call	generate_random_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:176:     generate_random_matrix(B, n, DEFAULT_SEED + (uint64_t)n + 1000ULL);
	leaq	1042(%rdi), %r8	 #,
	movl	%r14d, %edx	 # n,
	movq	%r15, %rcx	 # B,
	call	generate_random_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:179:     for (int w = 0; w < warmup_runs; w++) {
	testl	%r12d, %r12d	 # warmup_runs
	jne	.L276	 #,
	leal	-1(%r14), %eax	 #, _681
	leaq	0(,%rdi,8), %rbp	 #, _1855
	movl	%r14d, %ebx	 # n, _670
	movl	%eax, 80(%rsp)	 # _681, %sfp
	leaq	.LC10(%rip), %rax	 #, tmp1304
	leal	(%r14,%r14), %esi	 #, _1022
	movq	%rax, 208(%rsp)	 # tmp1304, %sfp
	jmp	.L131	 #
.L288:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:101:     printf("=== Sequential Baseline Correctness Verification ===\n");
	leaq	.LC2(%rip), %rcx	 #,
	call	puts	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:102:     const int test_sizes[] = {16, 64, 67, 128};
	movabsq	$274877906960, %rax	 #, tmp1918
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:104:     int all_ok = 1;
	movl	$1, 184(%rsp)	 #, %sfp
	vmovsd	.LC3(%rip), %xmm6	 #, tmp1298
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:102:     const int test_sizes[] = {16, 64, 67, 128};
	movq	%rax, 256(%rsp)	 # tmp1918, MEM <unsigned long long> [(int *)&test_sizes]
	movabsq	$549755813955, %rax	 #, tmp1919
	movq	%rax, 264(%rsp)	 # tmp1919, MEM <unsigned long long> [(int *)&test_sizes + 8B]
	leaq	256(%rsp), %rax	 #, ivtmp.780
	movq	%rax, 192(%rsp)	 # ivtmp.780, %sfp
.L123:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:107:         int n = test_sizes[s];
	movq	192(%rsp), %rax	 # %sfp, ivtmp.780
	movslq	(%rax), %rdi	 # MEM[(int *)_1396],
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:108:         double *A = alloc_matrix(n);
	movl	%edi, %ecx	 # n,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:107:         int n = test_sizes[s];
	movq	%rdi, %r15	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:108:         double *A = alloc_matrix(n);
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:109:         double *B = alloc_matrix(n);
	movl	%edi, %ecx	 # n,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:108:         double *A = alloc_matrix(n);
	movq	%rax, %r13	 #, A
	movq	%rax, 136(%rsp)	 # A, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:109:         double *B = alloc_matrix(n);
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:110:         double *I = alloc_matrix(n);
	movl	%edi, %ecx	 # n,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:109:         double *B = alloc_matrix(n);
	movq	%rax, %r14	 #, B
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:110:         double *I = alloc_matrix(n);
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:111:         double *Z = alloc_matrix(n);
	movl	%edi, %ecx	 # n,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:110:         double *I = alloc_matrix(n);
	movq	%rax, %rsi	 #, I
	movq	%rax, 216(%rsp)	 # I, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:111:         double *Z = alloc_matrix(n);
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:112:         double *C_ref = alloc_matrix(n);
	movl	%edi, %ecx	 # n,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:111:         double *Z = alloc_matrix(n);
	movq	%rax, %rbp	 #, Z
	movq	%rax, 200(%rsp)	 # Z, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:112:         double *C_ref = alloc_matrix(n);
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:113:         double *C_test = alloc_matrix(n);
	movl	%edi, %ecx	 # n,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:112:         double *C_ref = alloc_matrix(n);
	movq	%rax, 208(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:113:         double *C_test = alloc_matrix(n);
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:115:         generate_random_matrix(A, n, DEFAULT_SEED + (uint64_t)n);
	leaq	42(%rdi), %r8	 #,
	movl	%edi, %edx	 # n,
	movq	%r13, %rcx	 # A,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:113:         double *C_test = alloc_matrix(n);
	movq	%rax, 88(%rsp)	 # C_test, %sfp
	movq	%rax, %rbx	 #, C_test
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:115:         generate_random_matrix(A, n, DEFAULT_SEED + (uint64_t)n);
	movq	%rdi, 80(%rsp)	 # _95, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:115:         generate_random_matrix(A, n, DEFAULT_SEED + (uint64_t)n);
	call	generate_random_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:116:         generate_random_matrix(B, n, DEFAULT_SEED + (uint64_t)n + 1000ULL);
	leaq	1042(%rdi), %r8	 #,
	movl	%edi, %edx	 # n,
	movq	%r14, %rcx	 # B,
	call	generate_random_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:117:         generate_identity_matrix(I, n);
	movl	%edi, %edx	 # n,
	movq	%rsi, %rcx	 # I,
	call	generate_identity_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:118:         generate_zero_matrix(Z, n);
	movl	%edi, %edx	 # n,
	movq	%rbp, %rcx	 # Z,
	call	generate_zero_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	testl	%edi, %edi	 # n
	jle	.L80	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:17:             c_row[j] = 0.0;
	leal	-1(%rdi), %eax	 #, _888
	leaq	0(,%rdi,8), %rbp	 #, _1127
	movq	$0, 112(%rsp)	 #, %sfp
	movq	%rbx, %rcx	 # C_test, C_test
	movl	%eax, 72(%rsp)	 # _888, %sfp
	movl	%edi, %eax	 # n, _878
	movq	%rbp, %r15	 # _1127, _1127
	salq	$3, %rax	 #, _882
	movl	$0, 152(%rsp)	 #, %sfp
	movq	%rax, 144(%rsp)	 # _882, %sfp
	leal	(%rdi,%rdi), %eax	 #, _229
	cltq
	movq	%rbx, 224(%rsp)	 # ivtmp.645, %sfp
	movq	%rsi, %rbx	 # I, I
	movq	%rax, 96(%rsp)	 # _231, %sfp
	salq	$3, %rax	 #, _543
	movq	%rax, 104(%rsp)	 # _543, %sfp
	leaq	(%rsi,%rbp), %rax	 #, ivtmp.762
	movq	%rax, 168(%rsp)	 # ivtmp.762, %sfp
	leal	-3(%rdi), %eax	 #, _280
	shrl	%eax	 # _368
	movq	%r14, 232(%rsp)	 # B, %sfp
	movl	%edi, %r14d	 # n, n
	addl	$2, %eax	 #, _1744
	movl	%eax, 176(%rsp)	 # _1744, %sfp
	.p2align 4,,10
	.p2align 3
.L95:
	movq	144(%rsp), %r8	 # %sfp,
	xorl	%edx, %edx	 #
	call	memset	 #
	cmpl	$2, %r14d	 #, n
	movq	%rax, %rcx	 #, ivtmp.769
	jle	.L189	 #,
	movl	%r14d, %edi	 # n, bnd.420
	movl	176(%rsp), %eax	 # %sfp, _372
	movl	%r14d, %esi	 # n, niters.440
	movq	%r15, 160(%rsp)	 # _1127, %sfp
	shrl	$2, %edi	 #, bnd.420
	xorl	%r10d, %r10d	 # ivtmp.759
	movl	$2, %r9d	 #, ivtmp.756
	movl	%edi, %edx	 # bnd.420, _775
	sall	$2, %edi	 #, niters_vector_mult_vf.421
	addq	%rax, %rax	 # _389
	subl	%edi, %esi	 # niters_vector_mult_vf.421, niters.440
	movq	%rax, 120(%rsp)	 # _389, %sfp
	movq	168(%rsp), %rax	 # %sfp, ivtmp.762
	salq	$5, %rdx	 #, _776
	movl	%esi, 128(%rsp)	 # niters.440, %sfp
	.p2align 4,,10
	.p2align 3
.L86:
	movq	80(%rsp), %rsi	 # %sfp, _95
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	vmovsd	-16(%r13,%r9,8), %xmm4	 # MEM[(const double *)_833 + -16B + ivtmp.756_234 * 8], a_ik
	vmovsd	-8(%r13,%r9,8), %xmm5	 # MEM[(const double *)_833 + -8B + ivtmp.756_234 * 8], a_ik
	addq	%r10, %rsi	 # ivtmp.759, _834
	cmpl	$2, 72(%rsp)	 #, %sfp
	vbroadcastsd	%xmm4, %ymm1	 # a_ik, tmp1420
	vbroadcastsd	%xmm5, %ymm7	 # a_ik, tmp1421
	je	.L190	 #,
	vmovapd	%ymm1, %ymm3	 # tmp1420, _1338
	leaq	(%rbx,%r10,8), %r11	 #, vectp.427
	vmovapd	%ymm7, %ymm2	 # tmp1421, _1353
	xorl	%r8d, %r8d	 # ivtmp.743
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L83:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%r11,%r8), %ymm3, %ymm0	 # MEM <const vector(4) double> [(const double *)vectp.427_1339 + ivtmp.743_773 * 1], _1338, vect__233.429_1345
	vmulpd	(%rax,%r8), %ymm2, %ymm9	 # MEM <const vector(4) double> [(const double *)vectp.434_1354 + ivtmp.743_773 * 1], _1353, vect__772.436_1360
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddpd	(%rcx,%r8), %ymm0, %ymm0	 # MEM <vector(4) double> [(double *)c_row_210 + ivtmp.743_773 * 1], vect__233.429_1345, vect__234.430_1346
	vaddpd	%ymm9, %ymm0, %ymm0	 # vect__772.436_1360, vect__234.430_1346, vect__771.437_1361
	vmovupd	%ymm0, (%rcx,%r8)	 # vect__771.437_1361, MEM <vector(4) double> [(double *)c_row_210 + ivtmp.743_773 * 1]
	addq	$32, %r8	 #, ivtmp.743
	cmpq	%rdx, %r8	 # _776, ivtmp.743
	jne	.L83	 #,
	cmpl	%edi, %r14d	 # niters_vector_mult_vf.421, n
	movl	%edi, %r8d	 # niters_vector_mult_vf.421,
	je	.L84	 #,
	movl	128(%rsp), %r15d	 # %sfp, niters.440
	movl	%edi, %r11d	 # niters_vector_mult_vf.421, tmp.443
	cmpl	$1, %r15d	 #, niters.440
	movl	%r15d, %ebp	 # niters.440, niters.440
	je	.L85	 #,
.L82:
	movq	112(%rsp), %r15	 # %sfp, ivtmp.770
	leaq	(%r15,%r8), %r12	 #, _1407
	movq	88(%rsp), %r15	 # %sfp, C_test
	leaq	(%r15,%r12,8), %r12	 #, vectp.445
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	leaq	(%r10,%r8), %r15	 #, tmp915
	addq	%rsi, %r8	 # _834, tmp921
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%rbx,%r15,8), %xmm1, %xmm0	 # MEM <const vector(2) double> [(const double *)vectp.448_1413], _1412, vect__1310.450_1421
	vmulpd	(%rbx,%r8,8), %xmm7, %xmm7	 # MEM <const vector(2) double> [(const double *)vectp.455_1432], _1431, vect__1317.457_1440
	movl	%ebp, %r8d	 # niters.440, niters_vector_mult_vf.442
	andl	$-2, %r8d	 #, niters_vector_mult_vf.442
	andl	$1, %ebp	 #, niters.440
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddpd	(%r12), %xmm0, %xmm0	 # MEM <vector(2) double> [(double *)vectp.445_1404], vect__1310.450_1421, vect__1311.451_1422
	vaddpd	%xmm7, %xmm0, %xmm0	 # vect__1317.457_1440, vect__1311.451_1422, vect__1318.458_1441
	vmovupd	%xmm0, (%r12)	 # vect__1318.458_1441, MEM <vector(2) double> [(double *)vectp.445_1404]
	je	.L84	 #,
	addl	%r8d, %r11d	 # niters_vector_mult_vf.442, tmp.443
.L85:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	movslq	%r11d, %r11	 # tmp.443, _1375
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	leaq	(%r10,%r11), %rbp	 #, tmp928
	addq	%r11, %rsi	 # _1375, tmp931
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulsd	(%rbx,%rbp,8), %xmm4, %xmm4	 # *_1381, a_ik, _1383
	vmulsd	(%rbx,%rsi,8), %xmm5, %xmm5	 # *_1388, a_ik, _1390
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddsd	(%rcx,%r11,8), %xmm4, %xmm4	 # *_1377, _1383, _1384
	vaddsd	%xmm5, %xmm4, %xmm4	 # _1390, _1384, _1391
	vmovsd	%xmm4, (%rcx,%r11,8)	 # _1391, *_1377
.L84:
	leaq	2(%r9), %r8	 #, ivtmp.756
	addq	96(%rsp), %r10	 # %sfp, ivtmp.759
	addq	104(%rsp), %rax	 # %sfp, ivtmp.762
	cmpq	120(%rsp), %r8	 # %sfp, ivtmp.756
	je	.L290	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:17:             c_row[j] = 0.0;
	movq	%r8, %r9	 # ivtmp.756, ivtmp.756
	jmp	.L86	 #
.L290:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:19:         for (int k = 0; k < n; k++) {
	movq	160(%rsp), %r15	 # %sfp, _1127
.L81:
	movq	112(%rsp), %rax	 # %sfp, ivtmp.770
	movl	%r14d, %esi	 # n, bnd.392
	movq	136(%rsp), %rdi	 # %sfp, A
	movl	%r9d, %r11d	 # k, ivtmp.735
	shrl	$2, %esi	 #, bnd.392
	imull	%r14d, %r9d	 # n, ivtmp.738
	salq	$3, %rax	 #, _1447
	movl	%esi, %edx	 # bnd.392, _355
	sall	$2, %esi	 #, niters_vector_mult_vf.393
	leaq	(%rdi,%rax), %r12	 #, _506
	salq	$5, %rdx	 #, _354
	addq	88(%rsp), %rax	 # %sfp, vectp.396
.L94:
	cmpl	$2, 72(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	vmovsd	(%r12,%r11,8), %xmm2	 # MEM[(const double *)_506 + ivtmp.735_353 * 8], a_ik
	jbe	.L192	 #,
	movl	%esi, %r8d	 # niters_vector_mult_vf.393, niters_vector_mult_vf.393
.L91:
	vbroadcastsd	%xmm2, %ymm1	 # a_ik, _1206
	leaq	(%rbx,%r9,8), %rdi	 #, vectp.399
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:17:             c_row[j] = 0.0;
	xorl	%r10d, %r10d	 # ivtmp.727
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L88:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%rdi,%r10), %ymm1, %ymm0	 # MEM <const vector(4) double> [(const double *)vectp.399_1207 + ivtmp.727_357 * 1], _1206, vect__799.401_1213
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddpd	(%rax,%r10), %ymm0, %ymm0	 # MEM <vector(4) double> [(double *)vectp.396_1200 + ivtmp.727_357 * 1], vect__799.401_1213, vect__798.402_1214
	vmovupd	%ymm0, (%rax,%r10)	 # vect__798.402_1214, MEM <vector(4) double> [(double *)vectp.396_1200 + ivtmp.727_357 * 1]
	addq	$32, %r10	 #, ivtmp.727
	cmpq	%r10, %rdx	 # ivtmp.727, _354
	jne	.L88	 #,
	cmpl	%esi, %r14d	 # niters_vector_mult_vf.393, n
	je	.L89	 #,
	movl	%esi, 120(%rsp)	 # niters_vector_mult_vf.393, %sfp
.L87:
	movl	%r14d, %edi	 # n, niters.405
	subl	%r8d, %edi	 # niters_vector_mult_vf.393, niters.405
	cmpl	$1, %edi	 #, niters.405
	je	.L92	 #,
	movq	112(%rsp), %rbp	 # %sfp, ivtmp.770
	movl	%r8d, %r8d	 # niters_vector_mult_vf.393, _1252
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmovddup	%xmm2, %xmm0	 # a_ik, _1258
	movq	88(%rsp), %r10	 # %sfp, C_test
	addq	%r8, %rbp	 # _1252, _1253
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	addq	%r9, %r8	 # ivtmp.738, tmp945
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%rbx,%r8,8), %xmm0, %xmm0	 # MEM <const vector(2) double> [(const double *)vectp.413_1259], _1258, vect__1185.415_1267
	leaq	(%r10,%rbp,8), %rbp	 #, vectp.410
	movl	%edi, %r8d	 # niters.405, niters_vector_mult_vf.407
	andl	$-2, %r8d	 #, niters_vector_mult_vf.407
	andl	$1, %edi	 #, niters.405
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddpd	0(%rbp), %xmm0, %xmm0	 # MEM <vector(2) double> [(double *)vectp.410_1250], vect__1185.415_1267, vect__1186.416_1268
	vmovupd	%xmm0, 0(%rbp)	 # vect__1186.416_1268, MEM <vector(2) double> [(double *)vectp.410_1250]
	je	.L93	 #,
	addl	%r8d, 120(%rsp)	 # niters_vector_mult_vf.407, %sfp
.L92:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	movslq	120(%rsp), %r10	 # %sfp, _1228
	leaq	(%rcx,%r10,8), %r8	 #, _1230
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	addq	%r9, %r10	 # ivtmp.738, tmp953
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulsd	(%rbx,%r10,8), %xmm2, %xmm2	 # *_1234, a_ik, _1236
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddsd	(%r8), %xmm2, %xmm2	 # *_1230, _1236, _1237
	vmovsd	%xmm2, (%r8)	 # _1237, *_1230
.L93:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:19:         for (int k = 0; k < n; k++) {
	addq	$1, %r11	 #, ivtmp.735
	addq	80(%rsp), %r9	 # %sfp, ivtmp.738
	cmpl	%r11d, %r14d	 # ivtmp.735, n
	jg	.L94	 #,
.L90:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	addl	$1, 152(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	movq	80(%rsp), %rsi	 # %sfp, _95
	addq	%r15, %rcx	 # _1127, ivtmp.769
	addq	%r15, %r13	 # _1127, ivtmp.772
	addq	%rsi, 112(%rsp)	 # _95, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	movl	152(%rsp), %eax	 # %sfp, i
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	cmpl	%eax, %r14d	 # i, n
	je	.L291	 #,
	vzeroupper
	jmp	.L95	 #
.L190:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:22:             for (int j = 0; j < n; j++) {
	xorl	%r11d, %r11d	 # tmp.443
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	movl	$3, %ebp	 #, niters.440
	xorl	%r8d, %r8d	 #
	jmp	.L82	 #
.L89:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:19:         for (int k = 0; k < n; k++) {
	addq	$1, %r11	 #, ivtmp.735
	cmpl	%r11d, %r14d	 # ivtmp.735, n
	jle	.L90	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	vmovsd	(%r12,%r11,8), %xmm2	 # MEM[(const double *)_506 + ivtmp.735_978 * 8], a_ik
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:19:         for (int k = 0; k < n; k++) {
	addq	80(%rsp), %r9	 # %sfp, ivtmp.738
	jmp	.L91	 #
.L192:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:22:             for (int j = 0; j < n; j++) {
	movl	$0, 120(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	xorl	%r8d, %r8d	 # niters_vector_mult_vf.393
	jmp	.L87	 #
.L291:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:122:         all_ok &= verify_matrix_tolerance(A, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	leaq	.LC4(%rip), %rax	 #, tmp1962
	movq	88(%rsp), %r12	 # %sfp, C_test
	movq	136(%rsp), %r13	 # %sfp, A
	movq	%r15, %rbp	 # _1127, _1127
	movq	%rax, 40(%rsp)	 # tmp1962,
	movl	%r14d, %r15d	 # n, n
	vmovapd	%xmm6, %xmm3	 # tmp1298,
	movq	224(%rsp), %rbx	 # %sfp, ivtmp.645
	vmovsd	%xmm6, 32(%rsp)	 # tmp1298,
	movl	%r15d, %r8d	 # n,
	movq	%r13, %rcx	 # A,
	movq	%r12, %rdx	 # C_test,
	movq	232(%rsp), %r14	 # %sfp, B
	vzeroupper
	call	verify_matrix_tolerance	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:122:         all_ok &= verify_matrix_tolerance(A, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	movl	184(%rsp), %esi	 # %sfp, all_ok
	movq	200(%rsp), %rdi	 # %sfp, Z
	movq	$0, 112(%rsp)	 #, %sfp
	movl	$0, 152(%rsp)	 #, %sfp
	movq	%r12, %rcx	 # C_test, ivtmp.719
	andl	%eax, %esi	 # _98, all_ok
	leaq	(%rdi,%rbp), %rax	 #, ivtmp.712
	movq	%rbx, 224(%rsp)	 # ivtmp.645, %sfp
	movq	%rdi, %rbx	 # Z, Z
	movq	%rax, 168(%rsp)	 # ivtmp.712, %sfp
	leal	-3(%r15), %eax	 #, _298
	shrl	%eax	 # _297
	movl	%esi, 184(%rsp)	 # all_ok, %sfp
	addl	$2, %eax	 #, _1749
	movq	%r14, 232(%rsp)	 # B, %sfp
	movl	%r15d, %r14d	 # n, n
	movq	%rbp, %r15	 # _1127, _1127
	movl	%eax, 176(%rsp)	 # _1749, %sfp
	.p2align 4,,10
	.p2align 3
.L110:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:17:             c_row[j] = 0.0;
	movq	144(%rsp), %r8	 # %sfp,
	xorl	%edx, %edx	 #
	call	memset	 #
	cmpl	$2, %r14d	 #, n
	movq	%rax, %rcx	 #, ivtmp.719
	jle	.L193	 #,
	movl	%r14d, %edi	 # n, bnd.350
	movl	176(%rsp), %eax	 # %sfp, _295
	movl	%r14d, %esi	 # n, niters.370
	movq	%r15, 160(%rsp)	 # _1127, %sfp
	shrl	$2, %edi	 #, bnd.350
	xorl	%r10d, %r10d	 # ivtmp.709
	movl	$2, %r9d	 #, ivtmp.706
	movl	%edi, %edx	 # bnd.350, _1308
	sall	$2, %edi	 #, niters_vector_mult_vf.351
	addq	%rax, %rax	 # _294
	subl	%edi, %esi	 # niters_vector_mult_vf.351, niters.370
	movq	%rax, 120(%rsp)	 # _294, %sfp
	movq	168(%rsp), %rax	 # %sfp, ivtmp.712
	salq	$5, %rdx	 #, _1307
	movl	%esi, 128(%rsp)	 # niters.370, %sfp
	.p2align 4,,10
	.p2align 3
.L101:
	movq	80(%rsp), %rsi	 # %sfp, _95
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	vmovsd	-16(%r13,%r9,8), %xmm4	 # MEM[(const double *)_664 + -16B + ivtmp.706_1306 * 8], a_ik
	vmovsd	-8(%r13,%r9,8), %xmm5	 # MEM[(const double *)_664 + -8B + ivtmp.706_1306 * 8], a_ik
	addq	%r10, %rsi	 # ivtmp.709, _292
	cmpl	$2, 72(%rsp)	 #, %sfp
	vbroadcastsd	%xmm4, %ymm1	 # a_ik, tmp1422
	vbroadcastsd	%xmm5, %ymm7	 # a_ik, tmp1423
	je	.L194	 #,
	vmovapd	%ymm1, %ymm3	 # tmp1422, _1047
	leaq	(%rbx,%r10,8), %r11	 #, vectp.357
	vmovapd	%ymm7, %ymm2	 # tmp1423, _1062
	xorl	%r8d, %r8d	 # ivtmp.693
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L98:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%r11,%r8), %ymm3, %ymm0	 # MEM <const vector(4) double> [(const double *)vectp.357_1048 + ivtmp.693_1310 * 1], _1047, vect__201.359_1054
	vmulpd	(%rax,%r8), %ymm2, %ymm8	 # MEM <const vector(4) double> [(const double *)vectp.364_1063 + ivtmp.693_1310 * 1], _1062, vect__827.366_1069
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddpd	(%rcx,%r8), %ymm0, %ymm0	 # MEM <vector(4) double> [(double *)c_row_178 + ivtmp.693_1310 * 1], vect__201.359_1054, vect__202.360_1055
	vaddpd	%ymm8, %ymm0, %ymm0	 # vect__827.366_1069, vect__202.360_1055, vect__826.367_1070
	vmovupd	%ymm0, (%rcx,%r8)	 # vect__826.367_1070, MEM <vector(4) double> [(double *)c_row_178 + ivtmp.693_1310 * 1]
	addq	$32, %r8	 #, ivtmp.693
	cmpq	%r8, %rdx	 # ivtmp.693, _1307
	jne	.L98	 #,
	cmpl	%edi, %r14d	 # niters_vector_mult_vf.351, n
	movl	%edi, %r8d	 # niters_vector_mult_vf.351,
	je	.L99	 #,
	movl	128(%rsp), %r15d	 # %sfp, niters.370
	movl	%edi, %r11d	 # niters_vector_mult_vf.351, tmp.373
	cmpl	$1, %r15d	 #, niters.370
	movl	%r15d, %ebp	 # niters.370, niters.370
	je	.L100	 #,
.L97:
	movq	112(%rsp), %r15	 # %sfp, ivtmp.720
	leaq	(%r15,%r8), %r12	 #, _1116
	movq	88(%rsp), %r15	 # %sfp, C_test
	leaq	(%r15,%r12,8), %r12	 #, vectp.375
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	leaq	(%r8,%r10), %r15	 #, tmp983
	addq	%rsi, %r8	 # _292, tmp989
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%rbx,%r15,8), %xmm1, %xmm0	 # MEM <const vector(2) double> [(const double *)vectp.378_1122], _1121, vect__1019.380_1130
	vmulpd	(%rbx,%r8,8), %xmm7, %xmm7	 # MEM <const vector(2) double> [(const double *)vectp.385_1141], _1140, vect__1026.387_1149
	movl	%ebp, %r8d	 # niters.370, niters_vector_mult_vf.372
	andl	$-2, %r8d	 #, niters_vector_mult_vf.372
	andl	$1, %ebp	 #, niters.370
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddpd	(%r12), %xmm0, %xmm0	 # MEM <vector(2) double> [(double *)vectp.375_1113], vect__1019.380_1130, vect__1020.381_1131
	vaddpd	%xmm7, %xmm0, %xmm0	 # vect__1026.387_1149, vect__1020.381_1131, vect__1027.388_1150
	vmovupd	%xmm0, (%r12)	 # vect__1027.388_1150, MEM <vector(2) double> [(double *)vectp.375_1113]
	je	.L99	 #,
	addl	%r8d, %r11d	 # niters_vector_mult_vf.372, tmp.373
.L100:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	movslq	%r11d, %r11	 # tmp.373, _1084
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	leaq	(%r11,%r10), %rbp	 #, tmp996
	addq	%r11, %rsi	 # _1084, tmp999
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulsd	(%rbx,%rbp,8), %xmm4, %xmm4	 # *_1090, a_ik, _1092
	vmulsd	(%rbx,%rsi,8), %xmm5, %xmm5	 # *_1097, a_ik, _1099
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddsd	(%rcx,%r11,8), %xmm4, %xmm4	 # *_1086, _1092, _1093
	vaddsd	%xmm5, %xmm4, %xmm4	 # _1099, _1093, _1100
	vmovsd	%xmm4, (%rcx,%r11,8)	 # _1100, *_1086
.L99:
	leaq	2(%r9), %r8	 #, ivtmp.706
	addq	96(%rsp), %r10	 # %sfp, ivtmp.709
	addq	104(%rsp), %rax	 # %sfp, ivtmp.712
	cmpq	%r8, 120(%rsp)	 # ivtmp.706, %sfp
	je	.L292	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:17:             c_row[j] = 0.0;
	movq	%r8, %r9	 # ivtmp.706, ivtmp.706
	jmp	.L101	 #
.L292:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:19:         for (int k = 0; k < n; k++) {
	movq	160(%rsp), %r15	 # %sfp, _1127
.L96:
	movq	112(%rsp), %rax	 # %sfp, ivtmp.720
	movl	%r14d, %r11d	 # n, bnd.322
	movq	136(%rsp), %rdi	 # %sfp, A
	movl	%r9d, %esi	 # k, ivtmp.685
	shrl	$2, %r11d	 #, bnd.322
	imull	%r14d, %r9d	 # n, ivtmp.688
	salq	$3, %rax	 #, _362
	movl	%r11d, %edx	 # bnd.322, _1501
	sall	$2, %r11d	 #, niters_vector_mult_vf.323
	leaq	(%rdi,%rax), %r12	 #, _1316
	salq	$5, %rdx	 #, _1500
	addq	88(%rsp), %rax	 # %sfp, vectp.326
.L109:
	cmpl	$2, 72(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	vmovsd	(%r12,%rsi,8), %xmm2	 # MEM[(const double *)_1316 + ivtmp.685_1499 * 8], a_ik
	jbe	.L196	 #,
	movl	%r11d, %r8d	 # niters_vector_mult_vf.323, niters_vector_mult_vf.323
.L106:
	vbroadcastsd	%xmm2, %ymm1	 # a_ik, _915
	leaq	(%rbx,%r9,8), %rdi	 #, vectp.329
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:17:             c_row[j] = 0.0;
	xorl	%r10d, %r10d	 # ivtmp.677
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L103:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%rdi,%r10), %ymm1, %ymm0	 # MEM <const vector(4) double> [(const double *)vectp.329_916 + ivtmp.677_1504 * 1], _915, vect__854.331_922
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddpd	(%rax,%r10), %ymm0, %ymm0	 # MEM <vector(4) double> [(double *)vectp.326_451 + ivtmp.677_1504 * 1], vect__854.331_922, vect__853.332_923
	vmovupd	%ymm0, (%rax,%r10)	 # vect__853.332_923, MEM <vector(4) double> [(double *)vectp.326_451 + ivtmp.677_1504 * 1]
	addq	$32, %r10	 #, ivtmp.677
	cmpq	%r10, %rdx	 # ivtmp.677, _1500
	jne	.L103	 #,
	cmpl	%r14d, %r11d	 # n, niters_vector_mult_vf.323
	je	.L104	 #,
	movl	%r11d, 120(%rsp)	 # niters_vector_mult_vf.323, %sfp
.L102:
	movl	%r14d, %edi	 # n, niters.335
	subl	%r8d, %edi	 # niters_vector_mult_vf.323, niters.335
	cmpl	$1, %edi	 #, niters.335
	je	.L107	 #,
	movq	112(%rsp), %rbp	 # %sfp, ivtmp.720
	movl	%r8d, %r8d	 # niters_vector_mult_vf.323, _961
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmovddup	%xmm2, %xmm0	 # a_ik, _967
	movq	88(%rsp), %r10	 # %sfp, C_test
	addq	%r8, %rbp	 # _961, _962
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	addq	%r9, %r8	 # ivtmp.688, tmp1013
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%rbx,%r8,8), %xmm0, %xmm0	 # MEM <const vector(2) double> [(const double *)vectp.343_968], _967, vect__40.345_976
	leaq	(%r10,%rbp,8), %rbp	 #, vectp.340
	movl	%edi, %r8d	 # niters.335, niters_vector_mult_vf.337
	andl	$-2, %r8d	 #, niters_vector_mult_vf.337
	andl	$1, %edi	 #, niters.335
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddpd	0(%rbp), %xmm0, %xmm0	 # MEM <vector(2) double> [(double *)vectp.340_959], vect__40.345_976, vect__37.346_977
	vmovupd	%xmm0, 0(%rbp)	 # vect__37.346_977, MEM <vector(2) double> [(double *)vectp.340_959]
	je	.L108	 #,
	addl	%r8d, 120(%rsp)	 # niters_vector_mult_vf.337, %sfp
.L107:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	movslq	120(%rsp), %r10	 # %sfp, _937
	leaq	(%rcx,%r10,8), %r8	 #, _939
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	addq	%r9, %r10	 # ivtmp.688, tmp1021
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulsd	(%rbx,%r10,8), %xmm2, %xmm2	 # *_943, a_ik, _945
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddsd	(%r8), %xmm2, %xmm2	 # *_939, _945, _946
	vmovsd	%xmm2, (%r8)	 # _946, *_939
.L108:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:19:         for (int k = 0; k < n; k++) {
	addq	$1, %rsi	 #, ivtmp.685
	addq	80(%rsp), %r9	 # %sfp, ivtmp.688
	cmpl	%esi, %r14d	 # ivtmp.685, n
	jg	.L109	 #,
.L105:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	addl	$1, 152(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	movq	80(%rsp), %rsi	 # %sfp, _95
	addq	%r15, %rcx	 # _1127, ivtmp.719
	addq	%r15, %r13	 # _1127, ivtmp.722
	addq	%rsi, 112(%rsp)	 # _95, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	movl	152(%rsp), %eax	 # %sfp, i
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	cmpl	%eax, %r14d	 # i, n
	je	.L293	 #,
	vzeroupper
	jmp	.L110	 #
.L194:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:22:             for (int j = 0; j < n; j++) {
	xorl	%r11d, %r11d	 # tmp.373
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	movl	$3, %ebp	 #, niters.370
	xorl	%r8d, %r8d	 #
	jmp	.L97	 #
.L104:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:19:         for (int k = 0; k < n; k++) {
	addq	$1, %rsi	 #, ivtmp.685
	cmpl	%esi, %r11d	 # ivtmp.685, niters_vector_mult_vf.323
	jle	.L105	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	vmovsd	(%r12,%rsi,8), %xmm2	 # MEM[(const double *)_1316 + ivtmp.685_1640 * 8], a_ik
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:19:         for (int k = 0; k < n; k++) {
	addq	80(%rsp), %r9	 # %sfp, ivtmp.688
	jmp	.L106	 #
.L196:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:22:             for (int j = 0; j < n; j++) {
	movl	$0, 120(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	xorl	%r8d, %r8d	 # niters_vector_mult_vf.323
	jmp	.L102	 #
.L293:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:127:         all_ok &= verify_matrix_tolerance(Z, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	leaq	.LC5(%rip), %rax	 #, tmp1995
	movq	88(%rsp), %r12	 # %sfp, C_test
	movq	%r15, %rbp	 # _1127, _1127
	movq	200(%rsp), %rcx	 # %sfp,
	movq	%rax, 40(%rsp)	 # tmp1995,
	movl	%r14d, %r15d	 # n, n
	vmovapd	%xmm6, %xmm3	 # tmp1298,
	movl	184(%rsp), %esi	 # %sfp, all_ok
	vmovsd	%xmm6, 32(%rsp)	 # tmp1298,
	movq	%r12, %rdx	 # C_test,
	movl	%r15d, %r8d	 # n,
	movq	224(%rsp), %rbx	 # %sfp, ivtmp.645
	movq	232(%rsp), %r14	 # %sfp, B
	vzeroupper
	call	verify_matrix_tolerance	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:131:         reference_matmul_ijk(A, B, C_ref, n);
	movq	136(%rsp), %rdi	 # %sfp, A
	movq	208(%rsp), %r8	 # %sfp,
	movl	%r15d, %r9d	 # n,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:127:         all_ok &= verify_matrix_tolerance(Z, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	andl	%eax, %esi	 # _101, all_ok
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:131:         reference_matmul_ijk(A, B, C_ref, n);
	movq	%r14, %rdx	 # B,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:127:         all_ok &= verify_matrix_tolerance(Z, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	movl	%esi, 112(%rsp)	 # all_ok, %sfp
	movl	%r15d, %esi	 # n, bnd.294
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:131:         reference_matmul_ijk(A, B, C_ref, n);
	movq	%rdi, %rcx	 # A,
	leaq	(%rdi,%rbp), %r13	 #, ivtmp.646
	call	reference_matmul_ijk	 #
	shrl	$2, %esi	 #, bnd.294
	movq	%r12, %rax	 # C_test, C_test
	movq	%rbx, 128(%rsp)	 # ivtmp.645, %sfp
	movl	%esi, 104(%rsp)	 # bnd.294, %sfp
	movq	80(%rsp), %rbx	 # %sfp, _95
	movl	%r15d, %esi	 # n, niters_vector_mult_vf.295
	movq	%r13, %rdi	 # ivtmp.646, ivtmp.669
	movq	%rbp, 96(%rsp)	 # _1127, %sfp
	movq	%r12, %rcx	 # C_test, ivtmp.668
	andl	$-4, %esi	 #, niters_vector_mult_vf.295
	xorl	%r12d, %r12d	 # ivtmp.670
	movq	%r13, 120(%rsp)	 # ivtmp.646, %sfp
	movq	%rax, %rbp	 # C_test, C_test
	xorl	%r13d, %r13d	 # i
	.p2align 4,,10
	.p2align 3
.L119:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:17:             c_row[j] = 0.0;
	movq	144(%rsp), %r8	 # %sfp,
	xorl	%edx, %edx	 #
	call	memset	 #
	movl	%r13d, 80(%rsp)	 # i, %sfp
	xorl	%r9d, %r9d	 # ivtmp.663
	movq	%rax, %rcx	 #, ivtmp.668
	movq	136(%rsp), %rax	 # %sfp, A
	leaq	(%rax,%r12,8), %r10	 #, ivtmp.661
	movl	104(%rsp), %eax	 # %sfp, _1939
	salq	$5, %rax	 #, _1938
	.p2align 4,,10
	.p2align 3
.L118:
	cmpl	$2, 72(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	vmovsd	(%r10), %xmm2	 # MEM[(const double *)_1816], a_ik
	jbe	.L197	 #,
	movl	%esi, %edx	 # niters_vector_mult_vf.295,
.L115:
	vbroadcastsd	%xmm2, %ymm1	 # a_ik, _150
	leaq	(%r14,%r9,8), %r11	 #, vectp.301
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:17:             c_row[j] = 0.0;
	xorl	%r8d, %r8d	 # ivtmp.653
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L112:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%r11,%r8), %ymm1, %ymm0	 # MEM <const vector(4) double> [(const double *)vectp.301_421 + ivtmp.653_1941 * 1], _150, vect__169.303_118
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddpd	(%rcx,%r8), %ymm0, %ymm0	 # MEM <vector(4) double> [(double *)c_row_146 + ivtmp.653_1941 * 1], vect__169.303_118, vect__170.304_424
	vmovupd	%ymm0, (%rcx,%r8)	 # vect__170.304_424, MEM <vector(4) double> [(double *)c_row_146 + ivtmp.653_1941 * 1]
	addq	$32, %r8	 #, ivtmp.653
	cmpq	%r8, %rax	 # ivtmp.653, _1938
	jne	.L112	 #,
	cmpl	%r15d, %esi	 # n, niters_vector_mult_vf.295
	je	.L113	 #,
	movl	%esi, %r8d	 # niters_vector_mult_vf.295, j
.L111:
	movl	%r15d, %r11d	 # n, niters.307
	subl	%edx, %r11d	 # niters_vector_mult_vf.295, niters.307
	cmpl	$1, %r11d	 #, niters.307
	je	.L116	 #,
	leaq	(%rdx,%r12), %r13	 #, _379
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmovddup	%xmm2, %xmm0	 # a_ik, _374
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	addq	%r9, %rdx	 # ivtmp.663, tmp1043
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%r14,%rdx,8), %xmm0, %xmm0	 # MEM <const vector(2) double> [(const double *)vectp.315_373], _374, vect__246.317_352
	movl	%r11d, %edx	 # niters.307, niters_vector_mult_vf.309
	andl	$-2, %edx	 #, niters_vector_mult_vf.309
	andl	$1, %r11d	 #, niters.307
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddpd	0(%rbp,%r13,8), %xmm0, %xmm0	 # MEM <vector(2) double> [(double *)vectp.312_382], vect__246.317_352, vect__437.318_344
	vmovupd	%xmm0, 0(%rbp,%r13,8)	 # vect__437.318_344, MEM <vector(2) double> [(double *)vectp.312_382]
	je	.L117	 #,
	addl	%edx, %r8d	 # niters_vector_mult_vf.309, j
.L116:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	movslq	%r8d, %r8	 # j, _463
	leaq	(%rcx,%r8,8), %rdx	 #, _461
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	addq	%r9, %r8	 # ivtmp.663, tmp1051
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulsd	(%r14,%r8,8), %xmm2, %xmm2	 # *_448, a_ik, _436
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddsd	(%rdx), %xmm2, %xmm2	 # *_461, _436, _397
	vmovsd	%xmm2, (%rdx)	 # _397, *_461
.L117:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:19:         for (int k = 0; k < n; k++) {
	addq	$8, %r10	 #, ivtmp.661
	addq	%rbx, %r9	 # _95, ivtmp.663
	cmpq	%r10, %rdi	 # ivtmp.661, ivtmp.669
	jne	.L118	 #,
.L280:
	movl	80(%rsp), %r13d	 # %sfp, i
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	movq	96(%rsp), %rax	 # %sfp, _1127
	addq	%rbx, %r12	 # _95, ivtmp.670
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	addl	$1, %r13d	 #, i
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	addq	%rax, %rcx	 # _1127, ivtmp.668
	addq	%rax, %rdi	 # _1127, ivtmp.669
	cmpl	%r13d, %r15d	 # i, n
	je	.L294	 #,
	vzeroupper
	jmp	.L119	 #
	.p2align 4,,10
	.p2align 3
.L113:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:19:         for (int k = 0; k < n; k++) {
	addq	$8, %r10	 #, ivtmp.661
	cmpq	%rdi, %r10	 # ivtmp.669, ivtmp.661
	je	.L280	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	vmovsd	(%r10), %xmm2	 # MEM[(const double *)_161], a_ik
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:19:         for (int k = 0; k < n; k++) {
	addq	%rbx, %r9	 # _95, ivtmp.663
	jmp	.L115	 #
.L197:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:22:             for (int j = 0; j < n; j++) {
	xorl	%r8d, %r8d	 # j
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	xorl	%edx, %edx	 #
	jmp	.L111	 #
.L294:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:133:         all_ok &= verify_matrix_tolerance(C_ref, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	movq	%rax, %rbp	 # _1127, _1127
	leaq	.LC6(%rip), %rax	 #, tmp2007
	movq	88(%rsp), %rdx	 # %sfp,
	movq	208(%rsp), %rcx	 # %sfp,
	movq	%rax, 40(%rsp)	 # tmp2007,
	vmovapd	%xmm6, %xmm3	 # tmp1298,
	movl	%r15d, %r8d	 # n,
	movq	120(%rsp), %r13	 # %sfp, ivtmp.646
	vmovsd	%xmm6, 32(%rsp)	 # tmp1298,
	movq	128(%rsp), %rbx	 # %sfp, ivtmp.645
	vzeroupper
	call	verify_matrix_tolerance	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:133:         all_ok &= verify_matrix_tolerance(C_ref, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	movl	112(%rsp), %edi	 # %sfp, all_ok
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:34:     for (int i = 0; i < n; i++) {
	movq	144(%rsp), %r12	 # %sfp, _882
	xorl	%esi, %esi	 # i
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:133:         all_ok &= verify_matrix_tolerance(C_ref, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	andl	%eax, %edi	 # _103, all_ok
	.p2align 4,,10
	.p2align 3
.L122:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:38:             c_row[j] = 0.0;
	xorl	%edx, %edx	 #
	movq	%rbx, %rcx	 # ivtmp.645,
	movq	%r12, %r8	 # _882,
	call	memset	 #
	movq	%r13, %rcx	 # ivtmp.646, ivtmp.638
	movq	%r14, %rdx	 # B, ivtmp.641
	subq	%rbp, %rcx	 # _1127, ivtmp.638
	.p2align 4,,10
	.p2align 3
.L121:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:41:             double a_ik = A[(long)i * n + k];
	vmovsd	(%rcx), %xmm1	 # MEM[(const double *)_855], a_ik
	xorl	%eax, %eax	 # ivtmp.634
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L120:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:45:                 c_row[j] += a_ik * b_row[j];
	vmulsd	(%rdx,%rax), %xmm1, %xmm0	 # MEM[(const double *)_829 + ivtmp.634_115 * 1], a_ik, _137
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:45:                 c_row[j] += a_ik * b_row[j];
	vaddsd	(%rbx,%rax), %xmm0, %xmm0	 # MEM[(double *)c_row_114 + ivtmp.634_115 * 1], _137, _138
	vmovsd	%xmm0, (%rbx,%rax)	 # _138, MEM[(double *)c_row_114 + ivtmp.634_115 * 1]
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:44:             for (int j = 0; j < n; j++) {
	addq	$8, %rax	 #, ivtmp.634
	cmpq	%rbp, %rax	 # _1127, ivtmp.634
	jne	.L120	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:40:         for (int k = 0; k < n; k++) {
	addq	$8, %rcx	 #, ivtmp.638
	addq	%rbp, %rdx	 # _1127, ivtmp.641
	cmpq	%r13, %rcx	 # ivtmp.646, ivtmp.638
	jne	.L121	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:34:     for (int i = 0; i < n; i++) {
	addl	$1, %esi	 #, i
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:34:     for (int i = 0; i < n; i++) {
	addq	%rbp, %rbx	 # _1127, ivtmp.645
	addq	%rbp, %r13	 # _1127, ivtmp.646
	cmpl	%esi, %r15d	 # i, n
	jne	.L122	 #,
.L186:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:138:         all_ok &= verify_matrix_tolerance(C_ref, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	leaq	.LC7(%rip), %rax	 #, tmp2010
	movq	88(%rsp), %rsi	 # %sfp, C_test
	movq	208(%rsp), %rbx	 # %sfp, C_ref
	vmovapd	%xmm6, %xmm3	 # tmp1298,
	movq	%rax, 40(%rsp)	 # tmp2010,
	movl	%r15d, %r8d	 # n,
	vmovsd	%xmm6, 32(%rsp)	 # tmp1298,
	movq	%rsi, %rdx	 # C_test,
	movq	%rbx, %rcx	 # C_ref,
	call	verify_matrix_tolerance	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:141:         matmul_sequential_avx2_ikj(A, B, C_test, n);
	movq	136(%rsp), %rbp	 # %sfp, A
	movl	%r15d, %r9d	 # n,
	movq	%rsi, %r8	 # C_test,
	movq	%r14, %rdx	 # B,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:138:         all_ok &= verify_matrix_tolerance(C_ref, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	andl	%eax, %edi	 # _105, all_ok
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:141:         matmul_sequential_avx2_ikj(A, B, C_test, n);
	movq	%rbp, %rcx	 # A,
	call	matmul_sequential_avx2_ikj	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:142:         all_ok &= verify_matrix_tolerance(C_ref, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	leaq	.LC8(%rip), %rax	 #, tmp2011
	movl	%r15d, %r8d	 # n,
	movq	%rsi, %rdx	 # C_test,
	movq	%rax, 40(%rsp)	 # tmp2011,
	vmovapd	%xmm6, %xmm3	 # tmp1298,
	movq	%rbx, %rcx	 # C_ref,
	vmovsd	%xmm6, 32(%rsp)	 # tmp1298,
	call	verify_matrix_tolerance	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:145:         free_matrix(A);
	movq	%rbp, %rcx	 # A,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:142:         all_ok &= verify_matrix_tolerance(C_ref, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	andl	%eax, %edi	 # _107, all_ok
	movl	%edi, 184(%rsp)	 # all_ok, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:106:     for (int s = 0; s < num_sizes; s++) {
	leaq	272(%rsp), %rdi	 #, tmp2014
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:145:         free_matrix(A);
	call	free_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:146:         free_matrix(B);
	movq	%r14, %rcx	 # B,
	call	free_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:147:         free_matrix(I);
	movq	216(%rsp), %rcx	 # %sfp,
	call	free_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:148:         free_matrix(Z);
	movq	200(%rsp), %rcx	 # %sfp,
	call	free_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:149:         free_matrix(C_ref);
	movq	%rbx, %rcx	 # C_ref,
	call	free_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:150:         free_matrix(C_test);
	movq	%rsi, %rcx	 # C_test,
	call	free_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:106:     for (int s = 0; s < num_sizes; s++) {
	addq	$4, 192(%rsp)	 #, %sfp
	cmpq	192(%rsp), %rdi	 # %sfp, tmp2014
	jne	.L123	 #,
	movl	184(%rsp), %eax	 # %sfp, all_ok
	xorl	$1, %eax	 #, all_ok
.L77:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:225: }
	vmovaps	272(%rsp), %xmm6	 #,
	vmovaps	288(%rsp), %xmm7	 #,
	vmovaps	304(%rsp), %xmm8	 #,
	vmovaps	320(%rsp), %xmm9	 #,
	vmovaps	336(%rsp), %xmm10	 #,
	addq	$360, %rsp	 #,
	popq	%rbx	 #
	popq	%rsi	 #
	popq	%rdi	 #
	popq	%rbp	 #
	popq	%r12	 #
	popq	%r13	 #
	popq	%r14	 #
	popq	%r15	 #
	ret	
.L193:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:17:             c_row[j] = 0.0;
	xorl	%r9d, %r9d	 # k
	jmp	.L96	 #
.L189:
	xorl	%r9d, %r9d	 # k
	jmp	.L81	 #
.L188:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:160:     int n = (argc >= 2) ? atoi(argv[1]) : 512;
	movl	$512, %r14d	 #, n
.L78:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:171:     double *A = alloc_matrix(n);
	movl	%r14d, %ecx	 # n,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:175:     generate_random_matrix(A, n, DEFAULT_SEED + (uint64_t)n);
	movl	%r14d, %ebx	 # n, _670
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:176:     generate_random_matrix(B, n, DEFAULT_SEED + (uint64_t)n + 1000ULL);
	movl	$2, %r12d	 #, warmup_runs
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:171:     double *A = alloc_matrix(n);
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:172:     double *B = alloc_matrix(n);
	movl	%r14d, %ecx	 # n,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:171:     double *A = alloc_matrix(n);
	movq	%rax, %rdi	 # A, A
	movq	%rax, 144(%rsp)	 # A, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:172:     double *B = alloc_matrix(n);
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:173:     double *C = alloc_matrix(n);
	movl	%r14d, %ecx	 # n,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:172:     double *B = alloc_matrix(n);
	movq	%rax, %r15	 # B, B
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:173:     double *C = alloc_matrix(n);
	call	alloc_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:175:     generate_random_matrix(A, n, DEFAULT_SEED + (uint64_t)n);
	leaq	42(%rbx), %r8	 #,
	movl	%r14d, %edx	 # n,
	movq	%rdi, %rcx	 # A,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:173:     double *C = alloc_matrix(n);
	movq	%rax, 88(%rsp)	 # C, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:175:     generate_random_matrix(A, n, DEFAULT_SEED + (uint64_t)n);
	movq	%rbx, 72(%rsp)	 # _670, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:175:     generate_random_matrix(A, n, DEFAULT_SEED + (uint64_t)n);
	call	generate_random_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:176:     generate_random_matrix(B, n, DEFAULT_SEED + (uint64_t)n + 1000ULL);
	leaq	1042(%rbx), %r8	 #,
	movl	%r14d, %edx	 # n,
	movq	%r15, %rcx	 # B,
	call	generate_random_matrix	 #
	leaq	.LC0(%rip), %rax	 #, impl_name
	movl	$5, 216(%rsp)	 #, %sfp
	movq	%rax, 176(%rsp)	 # impl_name, %sfp
.L187:
	movq	72(%rsp), %rax	 # %sfp, _11
	leal	(%r14,%r14), %esi	 #, _1022
	movl	%r14d, %r13d	 # n, niters_vector_mult_vf.533
	movl	%r12d, 224(%rsp)	 # warmup_runs, %sfp
	movslq	%esi, %rdi	 # _1022, _1004
	andl	$-4, %r13d	 #, niters_vector_mult_vf.533
	movl	%esi, 244(%rsp)	 # _1022, %sfp
	leaq	0(,%rax,8), %rbp	 #, _1855
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:17:             c_row[j] = 0.0;
	leal	-1(%r14), %eax	 #, _681
	movl	%r13d, %r12d	 # niters_vector_mult_vf.533, niters_vector_mult_vf.533
	movq	%rbx, 248(%rsp)	 # _670, %sfp
	movl	%eax, 80(%rsp)	 # _681, %sfp
	leaq	0(,%rbx,8), %rax	 #, _476
	movq	%rdi, %r13	 # _1004, _1004
	movq	%rax, 152(%rsp)	 # _476, %sfp
	leaq	0(,%rdi,8), %rax	 #, _1944
	movq	%rax, 120(%rsp)	 # _1944, %sfp
	leaq	(%r15,%rbp), %rax	 #, ivtmp.963
	movq	%rax, 200(%rsp)	 # ivtmp.963, %sfp
	movq	88(%rsp), %rax	 # %sfp, C
	addq	%rbp, %rax	 # _1855, ivtmp.923
	movq	%rax, 232(%rsp)	 # ivtmp.923, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:179:     for (int w = 0; w < warmup_runs; w++) {
	xorl	%eax, %eax	 #
	movl	%eax, 192(%rsp)	 #, %sfp
	leaq	.LC10(%rip), %rax	 #, tmp1304
	movq	%rax, 208(%rsp)	 # tmp1304, %sfp
	leal	-3(%r14), %eax	 #, _1913
	shrl	%eax	 # _1912
	addl	$2, %eax	 #, _2083
	movl	%eax, 168(%rsp)	 # _2083, %sfp
	movl	%r14d, %eax	 # n, bnd.532
	shrl	$2, %eax	 #, bnd.532
	movl	%eax, 160(%rsp)	 # bnd.532, %sfp
	jmp	.L156	 #
.L297:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:183:             matmul_sequential_avx2_ikj(A, B, C, n);
	movq	88(%rsp), %r8	 # %sfp,
	movq	144(%rsp), %rcx	 # %sfp,
	movl	%r14d, %r9d	 # n,
	movq	%r15, %rdx	 # B,
	call	matmul_sequential_avx2_ikj	 #
.L139:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:179:     for (int w = 0; w < warmup_runs; w++) {
	addl	$1, 192(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:179:     for (int w = 0; w < warmup_runs; w++) {
	movl	224(%rsp), %edi	 # %sfp, warmup_runs
	cmpl	%edi, 192(%rsp)	 # warmup_runs, %sfp
	je	.L295	 #,
.L156:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:180:         if (strcmp(impl_name, "seq_scalar") == 0) {
	movq	208(%rsp), %rdx	 # %sfp,
	movq	176(%rsp), %rcx	 # %sfp,
	call	strcmp	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:180:         if (strcmp(impl_name, "seq_scalar") == 0) {
	testl	%eax, %eax	 # _14
	je	.L296	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:182:         } else if (strcmp(impl_name, "seq_avx2") == 0) {
	movq	176(%rsp), %rcx	 # %sfp,
	leaq	.LC11(%rip), %rdx	 #,
	call	strcmp	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:182:         } else if (strcmp(impl_name, "seq_avx2") == 0) {
	testl	%eax, %eax	 # _15
	je	.L297	 #,
	movq	144(%rsp), %rsi	 # %sfp, ivtmp.973
	movq	88(%rsp), %rcx	 # %sfp, ivtmp.970
	movq	$0, 96(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	movl	$0, 136(%rsp)	 #, %sfp
	movq	%r13, 112(%rsp)	 # _1004, %sfp
	movl	%r14d, %r13d	 # n, n
	movq	%rbp, %r14	 # _1855, _1855
	.p2align 4,,10
	.p2align 3
.L155:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:17:             c_row[j] = 0.0;
	movq	152(%rsp), %r8	 # %sfp,
	xorl	%edx, %edx	 #
	call	memset	 #
	cmpl	$2, %r13d	 #, n
	movq	%rax, %rcx	 #, ivtmp.970
	jle	.L201	 #,
	movl	168(%rsp), %eax	 # %sfp, _1819
	movl	%r13d, %edi	 # n, niters.580
	movl	160(%rsp), %edx	 # %sfp, _1056
	movq	%r14, 184(%rsp)	 # _1855, %sfp
	subl	%r12d, %edi	 # niters_vector_mult_vf.533, niters.580
	xorl	%r10d, %r10d	 # ivtmp.960
	movl	$2, %r9d	 #, ivtmp.957
	addq	%rax, %rax	 # _687
	movl	%edi, 128(%rsp)	 # niters.580, %sfp
	salq	$5, %rdx	 #, _1072
	movq	%rax, 104(%rsp)	 # _687, %sfp
	movq	200(%rsp), %rax	 # %sfp, ivtmp.963
	.p2align 4,,10
	.p2align 3
.L146:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	vmovsd	-16(%rsi,%r9,8), %xmm4	 # MEM[(const double *)_1916 + -16B + ivtmp.957_1073 * 8], a_ik
	vmovsd	-8(%rsi,%r9,8), %xmm6	 # MEM[(const double *)_1916 + -8B + ivtmp.957_1073 * 8], a_ik
	movq	72(%rsp), %rdi	 # %sfp, _11
	cmpl	$2, 80(%rsp)	 #, %sfp
	vbroadcastsd	%xmm4, %ymm1	 # a_ik, tmp1424
	vbroadcastsd	%xmm6, %ymm5	 # a_ik, tmp1425
	leaq	(%r10,%rdi), %rbx	 #, _1800
	je	.L202	 #,
	vmovapd	%ymm1, %ymm3	 # tmp1424, _1970
	leaq	(%r15,%r10,8), %r11	 #, vectp.567
	vmovapd	%ymm5, %ymm2	 # tmp1425, _1985
	xorl	%r8d, %r8d	 # ivtmp.944
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L143:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%r11,%r8), %ymm3, %ymm0	 # MEM <const vector(4) double> [(const double *)vectp.567_1971 + ivtmp.944_1057 * 1], _1970, vect__297.569_1977
	vmulpd	(%rax,%r8), %ymm2, %ymm7	 # MEM <const vector(4) double> [(const double *)vectp.574_1986 + ivtmp.944_1057 * 1], _1985, vect__662.576_1992
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddpd	(%rcx,%r8), %ymm0, %ymm0	 # MEM <vector(4) double> [(double *)c_row_274 + ivtmp.944_1057 * 1], vect__297.569_1977, vect__298.570_1978
	vaddpd	%ymm7, %ymm0, %ymm0	 # vect__662.576_1992, vect__298.570_1978, vect__661.577_1993
	vmovupd	%ymm0, (%rcx,%r8)	 # vect__661.577_1993, MEM <vector(4) double> [(double *)c_row_274 + ivtmp.944_1057 * 1]
	addq	$32, %r8	 #, ivtmp.944
	cmpq	%rdx, %r8	 # _1072, ivtmp.944
	jne	.L143	 #,
	cmpl	%r12d, %r13d	 # niters_vector_mult_vf.533, n
	movl	%r12d, %r8d	 # niters_vector_mult_vf.533,
	je	.L144	 #,
	movl	128(%rsp), %r14d	 # %sfp, niters.580
	movl	%r12d, %r11d	 # niters_vector_mult_vf.533, tmp.583
	cmpl	$1, %r14d	 #, niters.580
	movl	%r14d, %edi	 # niters.580, niters.580
	je	.L145	 #,
.L142:
	movq	96(%rsp), %r14	 # %sfp, ivtmp.971
	leaq	(%r14,%r8), %rbp	 #, _2039
	movq	88(%rsp), %r14	 # %sfp, C
	leaq	(%r14,%rbp,8), %rbp	 #, vectp.585
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	leaq	(%r10,%r8), %r14	 #, tmp1135
	addq	%rbx, %r8	 # _1800, tmp1141
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%r15,%r14,8), %xmm1, %xmm0	 # MEM <const vector(2) double> [(const double *)vectp.588_2045], _2044, vect__1942.590_2053
	vmulpd	(%r15,%r8,8), %xmm5, %xmm5	 # MEM <const vector(2) double> [(const double *)vectp.595_2064], _2063, vect__1949.597_2072
	movl	%edi, %r8d	 # niters.580, niters_vector_mult_vf.582
	andl	$-2, %r8d	 #, niters_vector_mult_vf.582
	andl	$1, %edi	 #, niters.580
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddpd	0(%rbp), %xmm0, %xmm0	 # MEM <vector(2) double> [(double *)vectp.585_2036], vect__1942.590_2053, vect__1943.591_2054
	vaddpd	%xmm5, %xmm0, %xmm0	 # vect__1949.597_2072, vect__1943.591_2054, vect__1950.598_2073
	vmovupd	%xmm0, 0(%rbp)	 # vect__1950.598_2073, MEM <vector(2) double> [(double *)vectp.585_2036]
	je	.L144	 #,
	addl	%r8d, %r11d	 # niters_vector_mult_vf.582, tmp.583
.L145:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	movslq	%r11d, %r11	 # tmp.583, _2007
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	leaq	(%r10,%r11), %rdi	 #, tmp1148
	addq	%r11, %rbx	 # _2007, tmp1151
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulsd	(%r15,%rdi,8), %xmm4, %xmm4	 # *_2013, a_ik, _2015
	vmulsd	(%r15,%rbx,8), %xmm6, %xmm6	 # *_2020, a_ik, _2022
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddsd	(%rcx,%r11,8), %xmm4, %xmm4	 # *_2009, _2015, _2016
	vaddsd	%xmm6, %xmm4, %xmm4	 # _2022, _2016, _2023
	vmovsd	%xmm4, (%rcx,%r11,8)	 # _2023, *_2009
.L144:
	leaq	2(%r9), %r8	 #, ivtmp.957
	addq	112(%rsp), %r10	 # %sfp, ivtmp.960
	addq	120(%rsp), %rax	 # %sfp, ivtmp.963
	cmpq	%r8, 104(%rsp)	 # ivtmp.957, %sfp
	je	.L298	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:17:             c_row[j] = 0.0;
	movq	%r8, %r9	 # ivtmp.957, ivtmp.957
	jmp	.L146	 #
	.p2align 4,,10
	.p2align 3
.L298:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:19:         for (int k = 0; k < n; k++) {
	movq	184(%rsp), %r14	 # %sfp, _1855
.L141:
	movq	96(%rsp), %rax	 # %sfp, ivtmp.971
	movq	144(%rsp), %rdi	 # %sfp, A
	movl	%r9d, %r11d	 # k, ivtmp.936
	imull	%r13d, %r9d	 # n, ivtmp.939
	movl	160(%rsp), %edx	 # %sfp, _1678
	salq	$3, %rax	 #, _1776
	leaq	(%rdi,%rax), %rbp	 #, _1363
	salq	$5, %rdx	 #, _1612
	addq	88(%rsp), %rax	 # %sfp, vectp.536
.L154:
	cmpl	$2, 80(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	vmovsd	0(%rbp,%r11,8), %xmm2	 # MEM[(const double *)_1363 + ivtmp.936_1611 * 8], a_ik
	jbe	.L204	 #,
	movl	%r12d, %r8d	 # niters_vector_mult_vf.533, niters_vector_mult_vf.533
.L151:
	vbroadcastsd	%xmm2, %ymm1	 # a_ik, _1838
	leaq	(%r15,%r9,8), %rbx	 #, vectp.539
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:17:             c_row[j] = 0.0;
	xorl	%r10d, %r10d	 # ivtmp.928
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L148:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%rbx,%r10), %ymm1, %ymm0	 # MEM <const vector(4) double> [(const double *)vectp.539_1839 + ivtmp.928_1679 * 1], _1838, vect__689.541_1845
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddpd	(%rax,%r10), %ymm0, %ymm0	 # MEM <vector(4) double> [(double *)vectp.536_1832 + ivtmp.928_1679 * 1], vect__689.541_1845, vect__688.542_1846
	vmovupd	%ymm0, (%rax,%r10)	 # vect__688.542_1846, MEM <vector(4) double> [(double *)vectp.536_1832 + ivtmp.928_1679 * 1]
	addq	$32, %r10	 #, ivtmp.928
	cmpq	%r10, %rdx	 # ivtmp.928, _1612
	jne	.L148	 #,
	cmpl	%r12d, %r13d	 # niters_vector_mult_vf.533, n
	je	.L149	 #,
	movl	%r12d, 104(%rsp)	 # niters_vector_mult_vf.533, %sfp
.L147:
	movl	%r13d, %ebx	 # n, niters.545
	subl	%r8d, %ebx	 # niters_vector_mult_vf.533, niters.545
	cmpl	$1, %ebx	 #, niters.545
	je	.L152	 #,
	movq	96(%rsp), %rdi	 # %sfp, ivtmp.971
	movl	%r8d, %r8d	 # niters_vector_mult_vf.533, _1884
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmovddup	%xmm2, %xmm0	 # a_ik, _1890
	movq	88(%rsp), %r10	 # %sfp, C
	addq	%r8, %rdi	 # _1884, _1885
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	addq	%r9, %r8	 # ivtmp.939, tmp1165
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%r15,%r8,8), %xmm0, %xmm0	 # MEM <const vector(2) double> [(const double *)vectp.553_1891], _1890, vect__1817.555_1899
	movl	%ebx, %r8d	 # niters.545, niters_vector_mult_vf.547
	andl	$-2, %r8d	 #, niters_vector_mult_vf.547
	andl	$1, %ebx	 #, niters.545
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddpd	(%r10,%rdi,8), %xmm0, %xmm0	 # MEM <vector(2) double> [(double *)vectp.550_1882], vect__1817.555_1899, vect__1818.556_1900
	vmovupd	%xmm0, (%r10,%rdi,8)	 # vect__1818.556_1900, MEM <vector(2) double> [(double *)vectp.550_1882]
	je	.L153	 #,
	addl	%r8d, 104(%rsp)	 # niters_vector_mult_vf.547, %sfp
.L152:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	movslq	104(%rsp), %r10	 # %sfp, _1860
	leaq	(%rcx,%r10,8), %r8	 #, _1862
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	addq	%r9, %r10	 # ivtmp.939, tmp1173
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulsd	(%r15,%r10,8), %xmm2, %xmm2	 # *_1866, a_ik, _1868
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddsd	(%r8), %xmm2, %xmm2	 # *_1862, _1868, _1869
	vmovsd	%xmm2, (%r8)	 # _1869, *_1862
.L153:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:19:         for (int k = 0; k < n; k++) {
	addq	$1, %r11	 #, ivtmp.936
	addq	72(%rsp), %r9	 # %sfp, ivtmp.939
	cmpl	%r11d, %r13d	 # ivtmp.936, n
	jg	.L154	 #,
.L150:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	addl	$1, 136(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	movq	72(%rsp), %rbx	 # %sfp, _11
	addq	%r14, %rcx	 # _1855, ivtmp.970
	addq	%r14, %rsi	 # _1855, ivtmp.973
	addq	%rbx, 96(%rsp)	 # _11, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	movl	136(%rsp), %eax	 # %sfp, i
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	cmpl	%r13d, %eax	 # n, i
	je	.L299	 #,
	vzeroupper
	jmp	.L155	 #
.L202:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	movl	$3, %edi	 #, niters.580
	xorl	%r8d, %r8d	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:22:             for (int j = 0; j < n; j++) {
	xorl	%r11d, %r11d	 # tmp.583
	jmp	.L142	 #
.L149:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:19:         for (int k = 0; k < n; k++) {
	addq	$1, %r11	 #, ivtmp.936
	cmpl	%r11d, %r13d	 # ivtmp.936, n
	jle	.L150	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	vmovsd	0(%rbp,%r11,8), %xmm2	 # MEM[(const double *)_1363 + ivtmp.936_1614 * 8], a_ik
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:19:         for (int k = 0; k < n; k++) {
	addq	72(%rsp), %r9	 # %sfp, ivtmp.939
	jmp	.L151	 #
.L204:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:22:             for (int j = 0; j < n; j++) {
	movl	$0, 104(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	xorl	%r8d, %r8d	 # niters_vector_mult_vf.533
	jmp	.L147	 #
.L296:
	movq	144(%rsp), %rsi	 # %sfp, ivtmp.922
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:180:         if (strcmp(impl_name, "seq_scalar") == 0) {
	movq	232(%rsp), %rbx	 # %sfp, ivtmp.923
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:34:     for (int i = 0; i < n; i++) {
	movl	%r12d, 96(%rsp)	 # niters_vector_mult_vf.533, %sfp
	xorl	%edi, %edi	 # i
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:180:         if (strcmp(impl_name, "seq_scalar") == 0) {
	movq	88(%rsp), %r9	 # %sfp, ivtmp.920
	.p2align 4,,10
	.p2align 3
.L138:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:38:             c_row[j] = 0.0;
	movq	152(%rsp), %r8	 # %sfp,
	xorl	%edx, %edx	 #
	movq	%r9, %rcx	 # ivtmp.920,
	call	memset	 #
	cmpl	$2, %r14d	 #, n
	movq	%rax, %r9	 #, ivtmp.920
	jle	.L199	 #,
	movl	168(%rsp), %r12d	 # %sfp, _320
	movq	72(%rsp), %r10	 # %sfp, ivtmp.914
	xorl	%r11d, %r11d	 # ivtmp.913
	movl	$2, %r8d	 #, ivtmp.909
	addq	%r12, %r12	 # _307
	.p2align 4,,10
	.p2align 3
.L135:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:45:                 c_row[j] += a_ik * b_row[j];
	movq	%r11, %rcx	 # ivtmp.913, _1261
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:41:             double a_ik = A[(long)i * n + k];
	vmovsd	-16(%rsi,%r8,8), %xmm3	 # MEM[(const double *)_981 + -16B + ivtmp.909_1173 * 8], a_ik
	vmovsd	-8(%rsi,%r8,8), %xmm2	 # MEM[(const double *)_981 + -8B + ivtmp.909_1173 * 8], a_ik
	leaq	(%r15,%r10,8), %rdx	 #, ivtmp.900
	movq	%r9, %rax	 # ivtmp.920, ivtmp.898
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:45:                 c_row[j] += a_ik * b_row[j];
	subq	%r10, %rcx	 # ivtmp.914, _1261
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L134:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:45:                 c_row[j] += a_ik * b_row[j];
	vmulsd	(%rdx,%rcx,8), %xmm3, %xmm0	 # MEM[(const double *)_1442 + _1261 * 8], a_ik, _265
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:44:             for (int j = 0; j < n; j++) {
	addq	$8, %rax	 #, ivtmp.898
	addq	$8, %rdx	 #, ivtmp.900
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:45:                 c_row[j] += a_ik * b_row[j];
	vmulsd	-8(%rdx), %xmm2, %xmm1	 # MEM[(const double *)_1442], a_ik, _717
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:45:                 c_row[j] += a_ik * b_row[j];
	vaddsd	-8(%rax), %xmm0, %xmm0	 # MEM[(double *)_1444], _265, _266
	vaddsd	%xmm1, %xmm0, %xmm0	 # _717, _266, _716
	vmovsd	%xmm0, -8(%rax)	 # _716, MEM[(double *)_1444]
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:44:             for (int j = 0; j < n; j++) {
	cmpq	%rax, %rbx	 # ivtmp.898, ivtmp.923
	jne	.L134	 #,
	leaq	2(%r8), %rax	 #, ivtmp.909
	addq	%r13, %r11	 # _1004, ivtmp.913
	addq	%r13, %r10	 # _1004, ivtmp.914
	cmpq	%rax, %r12	 # ivtmp.909, _307
	je	.L133	 #,
	movq	%rax, %r8	 # ivtmp.909, ivtmp.909
	jmp	.L135	 #
.L199:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:38:             c_row[j] = 0.0;
	xorl	%r8d, %r8d	 # k
	.p2align 4,,10
	.p2align 3
.L133:
	movl	%r8d, %ecx	 # k, ivtmp.890
	imull	%r14d, %r8d	 # n, ivtmp.893_1743
	leaq	(%r15,%r8,8), %rdx	 #, ivtmp.894
.L137:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:41:             double a_ik = A[(long)i * n + k];
	vmovsd	(%rsi,%rcx,8), %xmm1	 # MEM[(const double *)_1585 + ivtmp.890_1805 * 8], a_ik
	xorl	%eax, %eax	 # ivtmp.886
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L136:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:45:                 c_row[j] += a_ik * b_row[j];
	vmulsd	(%rdx,%rax), %xmm1, %xmm0	 # MEM[(const double *)_1904 + ivtmp.886_2074 * 1], a_ik, _744
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:45:                 c_row[j] += a_ik * b_row[j];
	vaddsd	(%r9,%rax), %xmm0, %xmm0	 # MEM[(double *)c_row_242 + ivtmp.886_2074 * 1], _744, _743
	vmovsd	%xmm0, (%r9,%rax)	 # _743, MEM[(double *)c_row_242 + ivtmp.886_2074 * 1]
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:44:             for (int j = 0; j < n; j++) {
	addq	$8, %rax	 #, ivtmp.886
	cmpq	%rax, %rbp	 # ivtmp.886, _1855
	jne	.L136	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:40:         for (int k = 0; k < n; k++) {
	addq	$1, %rcx	 #, ivtmp.890
	addq	%rbp, %rdx	 # _1855, ivtmp.894
	cmpl	%ecx, %r14d	 # ivtmp.890, n
	jg	.L137	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:34:     for (int i = 0; i < n; i++) {
	addl	$1, %edi	 #, i
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:34:     for (int i = 0; i < n; i++) {
	addq	%rbp, %r9	 # _1855, ivtmp.920
	addq	%rbp, %rsi	 # _1855, ivtmp.922
	addq	%rbp, %rbx	 # _1855, ivtmp.923
	cmpl	%r14d, %edi	 # n, i
	jne	.L138	 #,
	movl	96(%rsp), %r12d	 # %sfp, niters_vector_mult_vf.533
	jmp	.L139	 #
.L299:
	movq	%r14, %rbp	 # _1855, _1855
	movl	%r13d, %r14d	 # n, n
	movq	112(%rsp), %r13	 # %sfp, _1004
	vzeroupper
	jmp	.L139	 #
.L201:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:17:             c_row[j] = 0.0;
	xorl	%r9d, %r9d	 # k
	jmp	.L141	 #
.L295:
	movl	244(%rsp), %esi	 # %sfp, _1022
	movq	248(%rsp), %rbx	 # %sfp, _670
.L131:
	leaq	0(,%rbx,8), %rax	 #, _669
	movslq	%esi, %r12	 # _1022, _1019
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:207:         double cpu_util_pct = (kernel_time_sec > 1e-9)
	movl	$1, 192(%rsp)	 #, %sfp
	vmovsd	.LC3(%rip), %xmm9	 #, tmp1298
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:17:             c_row[j] = 0.0;
	movq	%rax, 152(%rsp)	 # _669, %sfp
	leaq	0(,%r12,8), %rax	 #, _1027
	movq	%rax, 120(%rsp)	 # _1027, %sfp
	leaq	(%r15,%rbp), %rax	 #, ivtmp.864
	movq	%rax, 184(%rsp)	 # ivtmp.864, %sfp
	movq	88(%rsp), %rax	 # %sfp, C
	addq	%rbp, %rax	 # _1855, ivtmp.824
	movq	%rax, 200(%rsp)	 # ivtmp.824, %sfp
	leal	-3(%r14), %eax	 #, _171
	shrl	%eax	 # _549
	addl	$2, %eax	 #, _1137
	movl	%eax, 160(%rsp)	 # _1137, %sfp
.L185:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:191:         double cpu_t0 = get_cpu_time_sec();
	call	get_cpu_time_sec	 #
	vmovapd	%xmm0, %xmm8	 #, cpu_t0
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:192:         double wall_t0 = get_wall_time_sec();
	call	get_wall_time_sec	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:194:         if (strcmp(impl_name, "seq_scalar") == 0) {
	movq	208(%rsp), %rdx	 # %sfp,
	movq	176(%rsp), %rcx	 # %sfp,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:192:         double wall_t0 = get_wall_time_sec();
	vmovapd	%xmm0, %xmm7	 #, wall_t0
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:194:         if (strcmp(impl_name, "seq_scalar") == 0) {
	call	strcmp	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:194:         if (strcmp(impl_name, "seq_scalar") == 0) {
	testl	%eax, %eax	 # _16
	je	.L300	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:196:         } else if (strcmp(impl_name, "seq_avx2") == 0) {
	movq	176(%rsp), %rcx	 # %sfp,
	leaq	.LC11(%rip), %rdx	 #,
	call	strcmp	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:196:         } else if (strcmp(impl_name, "seq_avx2") == 0) {
	testl	%eax, %eax	 # _17
	jne	.L165	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:197:             matmul_sequential_avx2_ikj(A, B, C, n);
	movq	88(%rsp), %r8	 # %sfp,
	movq	144(%rsp), %rcx	 # %sfp,
	movl	%r14d, %r9d	 # n,
	movq	%r15, %rdx	 # B,
	call	matmul_sequential_avx2_ikj	 #
.L164:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:202:         double wall_t1 = get_wall_time_sec();
	call	get_wall_time_sec	 #
	vmovapd	%xmm0, %xmm6	 #, wall_t1
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:203:         double cpu_t1 = get_cpu_time_sec();
	call	get_cpu_time_sec	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:205:         double kernel_time_sec = wall_t1 - wall_t0;
	vsubsd	%xmm7, %xmm6, %xmm7	 # wall_t0, wall_t1, kernel_time_sec
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:209:                                   : NAN; /* not measurable: reported as missing, never imputed */
	vcomisd	%xmm9, %xmm7	 # tmp1298, kernel_time_sec
	jbe	.L277	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:206:         double cpu_time_sec = cpu_t1 - cpu_t0;
	vsubsd	%xmm8, %xmm0, %xmm0	 # cpu_t0, cpu_t1, cpu_time_sec_70
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:212:         double chk = compute_checksum(C, n);
	movq	88(%rsp), %rcx	 # %sfp,
	movl	%r14d, %edx	 # n,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:208:                                   ? ((cpu_time_sec / kernel_time_sec) * 100.0)
	vdivsd	%xmm7, %xmm0, %xmm0	 # kernel_time_sec, cpu_time_sec_70, _18
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:207:         double cpu_util_pct = (kernel_time_sec > 1e-9)
	vmulsd	.LC12(%rip), %xmm0, %xmm6	 #, _18, cpu_util_pct
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:212:         double chk = compute_checksum(C, n);
	call	compute_checksum	 #
	vmovapd	%xmm0, %xmm8	 #, chk
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:213:         long peak_rss_kb = get_peak_rss_kb();
	call	get_peak_rss_kb	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:216:         printf("CSV,%d,%s,float64,1,%d,%.9f,%ld,%.2f,%.6f\n",
	movl	192(%rsp), %edi	 # %sfp, r
	movq	176(%rsp), %r8	 # %sfp,
	movl	%r14d, %edx	 # n,
	movl	%eax, 40(%rsp)	 # peak_rss_kb,
	leaq	.LC13(%rip), %rcx	 #,
	vmovsd	%xmm8, 56(%rsp)	 # chk,
	movl	%edi, %r9d	 # r,
	vmovsd	%xmm6, 48(%rsp)	 # cpu_util_pct,
	vmovsd	%xmm7, 32(%rsp)	 # kernel_time_sec,
	call	__mingw_printf	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:218:         fflush(stdout);
	movl	$1, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:218:         fflush(stdout);
	movq	%rax, %rcx	 # _1505,
	call	fflush	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:190:     for (int r = 1; r <= measured_runs; r++) {
	leal	1(%rdi), %eax	 #, r
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:190:     for (int r = 1; r <= measured_runs; r++) {
	cmpl	%eax, 216(%rsp)	 # r, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:190:     for (int r = 1; r <= measured_runs; r++) {
	movl	%eax, 192(%rsp)	 # r, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:190:     for (int r = 1; r <= measured_runs; r++) {
	jge	.L185	 #,
.L184:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:221:     free_matrix(A);
	movq	144(%rsp), %rcx	 # %sfp,
	call	free_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:222:     free_matrix(B);
	movq	%r15, %rcx	 # B,
	call	free_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:223:     free_matrix(C);
	movq	88(%rsp), %rcx	 # %sfp,
	call	free_matrix	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:224:     return EXIT_SUCCESS;
	xorl	%eax, %eax	 # <retval>
	jmp	.L77	 #
.L277:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:212:         double chk = compute_checksum(C, n);
	movq	88(%rsp), %rcx	 # %sfp,
	movl	%r14d, %edx	 # n,
	call	compute_checksum	 #
	vmovapd	%xmm0, %xmm6	 #, chk
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:213:         long peak_rss_kb = get_peak_rss_kb();
	call	get_peak_rss_kb	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:216:         printf("CSV,%d,%s,float64,1,%d,%.9f,%ld,%.2f,%.6f\n",
	movq	.LC14(%rip), %rdi	 #, tmp2112
	movq	176(%rsp), %r8	 # %sfp,
	movl	%r14d, %edx	 # n,
	movl	%eax, 40(%rsp)	 # peak_rss_kb,
	leaq	.LC13(%rip), %rcx	 #,
	movq	%rdi, 48(%rsp)	 # tmp2112,
	movl	192(%rsp), %edi	 # %sfp, r
	vmovsd	%xmm6, 56(%rsp)	 # chk,
	vmovsd	%xmm7, 32(%rsp)	 # kernel_time_sec,
	movl	%edi, %r9d	 # r,
	call	__mingw_printf	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:218:         fflush(stdout);
	movl	$1, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:218:         fflush(stdout);
	movq	%rax, %rcx	 # _19,
	call	fflush	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:190:     for (int r = 1; r <= measured_runs; r++) {
	leal	1(%rdi), %eax	 #, r
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:190:     for (int r = 1; r <= measured_runs; r++) {
	cmpl	216(%rsp), %eax	 # %sfp, r
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:190:     for (int r = 1; r <= measured_runs; r++) {
	movl	%eax, 192(%rsp)	 # r, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:190:     for (int r = 1; r <= measured_runs; r++) {
	jle	.L185	 #,
	jmp	.L184	 #
.L165:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:196:         } else if (strcmp(impl_name, "seq_avx2") == 0) {
	movq	144(%rsp), %rax	 # %sfp, A
	movq	88(%rsp), %rcx	 # %sfp, ivtmp.871
	movq	$0, 96(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	movl	%r14d, %r13d	 # n, n
	movl	$0, 136(%rsp)	 #, %sfp
	movq	%rbp, %r14	 # _1855, _1855
	movq	%r12, 112(%rsp)	 # _1019, %sfp
	movq	%rax, %rdi	 # ivtmp.874, ivtmp.874
	.p2align 4,,10
	.p2align 3
.L180:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:17:             c_row[j] = 0.0;
	movq	152(%rsp), %r8	 # %sfp,
	xorl	%edx, %edx	 #
	call	memset	 #
	cmpl	$2, %r13d	 #, n
	movq	%rax, %rcx	 #, ivtmp.871
	jle	.L207	 #,
	movl	%r13d, %esi	 # n, bnd.490
	movl	160(%rsp), %eax	 # %sfp, _278
	movl	%r13d, %ebx	 # n, niters.510
	movq	%r14, 168(%rsp)	 # _1855, %sfp
	shrl	$2, %esi	 #, bnd.490
	xorl	%r10d, %r10d	 # ivtmp.861
	movl	$2, %r9d	 #, ivtmp.857
	movl	%esi, %edx	 # bnd.490, _1014
	sall	$2, %esi	 #, niters_vector_mult_vf.491
	addq	%rax, %rax	 # _439
	subl	%esi, %ebx	 # niters_vector_mult_vf.491, niters.510
	movq	%rax, 104(%rsp)	 # _439, %sfp
	movq	184(%rsp), %rax	 # %sfp, ivtmp.864
	salq	$5, %rdx	 #, _1015
	movl	%ebx, 128(%rsp)	 # niters.510, %sfp
	.p2align 4,,10
	.p2align 3
.L171:
	movq	72(%rsp), %rbx	 # %sfp, _11
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	vmovsd	-16(%rdi,%r9,8), %xmm2	 # MEM[(const double *)_168 + -16B + ivtmp.857_1016 * 8], a_ik
	vmovsd	-8(%rdi,%r9,8), %xmm3	 # MEM[(const double *)_168 + -8B + ivtmp.857_1016 * 8], a_ik
	addq	%r10, %rbx	 # ivtmp.861, _594
	cmpl	$2, 80(%rsp)	 #, %sfp
	vbroadcastsd	%xmm2, %ymm1	 # a_ik, tmp1426
	vbroadcastsd	%xmm3, %ymm4	 # a_ik, tmp1427
	je	.L208	 #,
	vmovapd	%ymm1, %ymm6	 # tmp1426, _1654
	leaq	(%r15,%r10,8), %r11	 #, vectp.497
	vmovapd	%ymm4, %ymm5	 # tmp1427, _1669
	xorl	%r8d, %r8d	 # ivtmp.845
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L168:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%r11,%r8), %ymm6, %ymm0	 # MEM <const vector(4) double> [(const double *)vectp.497_1655 + ivtmp.845_1012 * 1], _1654, vect__361.499_1661
	vmulpd	(%rax,%r8), %ymm5, %ymm10	 # MEM <const vector(4) double> [(const double *)vectp.504_1670 + ivtmp.845_1012 * 1], _1669, vect__471.506_1676
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddpd	(%rcx,%r8), %ymm0, %ymm0	 # MEM <vector(4) double> [(double *)c_row_338 + ivtmp.845_1012 * 1], vect__361.499_1661, vect__362.500_1662
	vaddpd	%ymm10, %ymm0, %ymm0	 # vect__471.506_1676, vect__362.500_1662, vect__470.507_1677
	vmovupd	%ymm0, (%rcx,%r8)	 # vect__470.507_1677, MEM <vector(4) double> [(double *)c_row_338 + ivtmp.845_1012 * 1]
	addq	$32, %r8	 #, ivtmp.845
	cmpq	%rdx, %r8	 # _1015, ivtmp.845
	jne	.L168	 #,
	cmpl	%esi, %r13d	 # niters_vector_mult_vf.491, n
	movl	%esi, %r8d	 # niters_vector_mult_vf.491,
	je	.L169	 #,
	movl	128(%rsp), %r14d	 # %sfp, niters.510
	movl	%esi, %r11d	 # niters_vector_mult_vf.491, tmp.513
	cmpl	$1, %r14d	 #, niters.510
	movl	%r14d, %ebp	 # niters.510, niters.510
	je	.L170	 #,
.L167:
	movq	96(%rsp), %r14	 # %sfp, ivtmp.872
	leaq	(%r14,%r8), %r12	 #, _1723
	movq	88(%rsp), %r14	 # %sfp, C
	leaq	(%r14,%r12,8), %r12	 #, vectp.515
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	leaq	(%r10,%r8), %r14	 #, tmp1229
	addq	%rbx, %r8	 # _594, tmp1235
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%r15,%r14,8), %xmm1, %xmm0	 # MEM <const vector(2) double> [(const double *)vectp.518_1729], _1728, vect__1626.520_1737
	vmulpd	(%r15,%r8,8), %xmm4, %xmm4	 # MEM <const vector(2) double> [(const double *)vectp.525_1748], _1747, vect__1633.527_1756
	movl	%ebp, %r8d	 # niters.510, niters_vector_mult_vf.512
	andl	$-2, %r8d	 #, niters_vector_mult_vf.512
	andl	$1, %ebp	 #, niters.510
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddpd	(%r12), %xmm0, %xmm0	 # MEM <vector(2) double> [(double *)vectp.515_1720], vect__1626.520_1737, vect__1627.521_1738
	vaddpd	%xmm4, %xmm0, %xmm0	 # vect__1633.527_1756, vect__1627.521_1738, vect__1634.528_1757
	vmovupd	%xmm0, (%r12)	 # vect__1634.528_1757, MEM <vector(2) double> [(double *)vectp.515_1720]
	je	.L169	 #,
	addl	%r8d, %r11d	 # niters_vector_mult_vf.512, tmp.513
.L170:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	movslq	%r11d, %r11	 # tmp.513, _1691
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	leaq	(%r10,%r11), %rbp	 #, tmp1242
	addq	%r11, %rbx	 # _1691, tmp1245
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulsd	(%r15,%rbp,8), %xmm2, %xmm2	 # *_1697, a_ik, _1699
	vmulsd	(%r15,%rbx,8), %xmm3, %xmm3	 # *_1704, a_ik, _1706
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddsd	(%rcx,%r11,8), %xmm2, %xmm2	 # *_1693, _1699, _1700
	vaddsd	%xmm3, %xmm2, %xmm2	 # _1706, _1700, _1707
	vmovsd	%xmm2, (%rcx,%r11,8)	 # _1707, *_1693
.L169:
	leaq	2(%r9), %r8	 #, ivtmp.857
	addq	112(%rsp), %r10	 # %sfp, ivtmp.861
	addq	120(%rsp), %rax	 # %sfp, ivtmp.864
	cmpq	%r8, 104(%rsp)	 # ivtmp.857, %sfp
	je	.L301	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:17:             c_row[j] = 0.0;
	movq	%r8, %r9	 # ivtmp.857, ivtmp.857
	jmp	.L171	 #
	.p2align 4,,10
	.p2align 3
.L301:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:19:         for (int k = 0; k < n; k++) {
	movq	168(%rsp), %r14	 # %sfp, _1855
.L166:
	movq	96(%rsp), %rax	 # %sfp, ivtmp.872
	movl	%r13d, %ebx	 # n, bnd.462
	movq	144(%rsp), %rsi	 # %sfp, A
	movl	%r9d, %r11d	 # k, ivtmp.837
	shrl	$2, %ebx	 #, bnd.462
	imull	%r13d, %r9d	 # n, ivtmp.840
	salq	$3, %rax	 #, _2066
	movl	%ebx, %edx	 # bnd.462, _1240
	sall	$2, %ebx	 #, niters_vector_mult_vf.463
	leaq	(%rsi,%rax), %r12	 #, _37
	salq	$5, %rdx	 #, _1394
	addq	88(%rsp), %rax	 # %sfp, vectp.466
.L179:
	cmpl	$2, 80(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	vmovsd	(%r12,%r11,8), %xmm2	 # MEM[(const double *)_37 + ivtmp.837_1556 * 8], a_ik
	jbe	.L210	 #,
	movl	%ebx, %r8d	 # niters_vector_mult_vf.463, niters_vector_mult_vf.463
.L176:
	vbroadcastsd	%xmm2, %ymm1	 # a_ik, _1522
	leaq	(%r15,%r9,8), %rsi	 #, vectp.469
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:17:             c_row[j] = 0.0;
	xorl	%r10d, %r10d	 # ivtmp.829
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L173:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%rsi,%r10), %ymm1, %ymm0	 # MEM <const vector(4) double> [(const double *)vectp.469_1523 + ivtmp.829_949 * 1], _1522, vect__498.471_1529
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddpd	(%rax,%r10), %ymm0, %ymm0	 # MEM <vector(4) double> [(double *)vectp.466_1516 + ivtmp.829_949 * 1], vect__498.471_1529, vect__497.472_1530
	vmovupd	%ymm0, (%rax,%r10)	 # vect__497.472_1530, MEM <vector(4) double> [(double *)vectp.466_1516 + ivtmp.829_949 * 1]
	addq	$32, %r10	 #, ivtmp.829
	cmpq	%rdx, %r10	 # _1394, ivtmp.829
	jne	.L173	 #,
	cmpl	%ebx, %r13d	 # niters_vector_mult_vf.463, n
	je	.L174	 #,
	movl	%ebx, 104(%rsp)	 # niters_vector_mult_vf.463, %sfp
.L172:
	movl	%r13d, %esi	 # n, niters.475
	subl	%r8d, %esi	 # niters_vector_mult_vf.463, niters.475
	cmpl	$1, %esi	 #, niters.475
	je	.L177	 #,
	movq	96(%rsp), %rbp	 # %sfp, ivtmp.872
	movl	%r8d, %r8d	 # niters_vector_mult_vf.463, _1568
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmovddup	%xmm2, %xmm0	 # a_ik, _1574
	movq	88(%rsp), %r10	 # %sfp, C
	addq	%r8, %rbp	 # _1568, _1569
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	addq	%r9, %r8	 # ivtmp.840, tmp1259
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulpd	(%r15,%r8,8), %xmm0, %xmm0	 # MEM <const vector(2) double> [(const double *)vectp.483_1575], _1574, vect__1501.485_1583
	leaq	(%r10,%rbp,8), %rbp	 #, vectp.480
	movl	%esi, %r8d	 # niters.475, niters_vector_mult_vf.477
	andl	$-2, %r8d	 #, niters_vector_mult_vf.477
	andl	$1, %esi	 #, niters.475
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddpd	0(%rbp), %xmm0, %xmm0	 # MEM <vector(2) double> [(double *)vectp.480_1566], vect__1501.485_1583, vect__1502.486_1584
	vmovupd	%xmm0, 0(%rbp)	 # vect__1502.486_1584, MEM <vector(2) double> [(double *)vectp.480_1566]
	je	.L178	 #,
	addl	%r8d, 104(%rsp)	 # niters_vector_mult_vf.477, %sfp
.L177:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	movslq	104(%rsp), %r10	 # %sfp, _1544
	leaq	(%rcx,%r10,8), %r8	 #, _1546
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	addq	%r9, %r10	 # ivtmp.840, tmp1267
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vmulsd	(%r15,%r10,8), %xmm2, %xmm2	 # *_1550, a_ik, _1552
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:23:                 c_row[j] += a_ik * b_row[j];
	vaddsd	(%r8), %xmm2, %xmm2	 # *_1546, _1552, _1553
	vmovsd	%xmm2, (%r8)	 # _1553, *_1546
.L178:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:19:         for (int k = 0; k < n; k++) {
	addq	$1, %r11	 #, ivtmp.837
	addq	72(%rsp), %r9	 # %sfp, ivtmp.840
	cmpl	%r11d, %r13d	 # ivtmp.837, n
	jg	.L179	 #,
.L175:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	addl	$1, 136(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	movq	72(%rsp), %rbx	 # %sfp, _11
	addq	%r14, %rcx	 # _1855, ivtmp.871
	addq	%r14, %rdi	 # _1855, ivtmp.874
	addq	%rbx, 96(%rsp)	 # _11, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	movl	136(%rsp), %eax	 # %sfp, i
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:14:     for (int i = 0; i < n; i++) {
	cmpl	%r13d, %eax	 # n, i
	je	.L302	 #,
	vzeroupper
	jmp	.L180	 #
.L208:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	movl	$3, %ebp	 #, niters.510
	xorl	%r8d, %r8d	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:22:             for (int j = 0; j < n; j++) {
	xorl	%r11d, %r11d	 # tmp.513
	jmp	.L167	 #
.L174:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:19:         for (int k = 0; k < n; k++) {
	addq	$1, %r11	 #, ivtmp.837
	cmpl	%r11d, %r13d	 # ivtmp.837, n
	jle	.L175	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	vmovsd	(%r12,%r11,8), %xmm2	 # MEM[(const double *)_37 + ivtmp.837_302 * 8], a_ik
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:19:         for (int k = 0; k < n; k++) {
	addq	72(%rsp), %r9	 # %sfp, ivtmp.840
	jmp	.L176	 #
.L210:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:22:             for (int j = 0; j < n; j++) {
	movl	$0, 104(%rsp)	 #, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:20:             double a_ik = A[(long)i * n + k];
	xorl	%r8d, %r8d	 # niters_vector_mult_vf.463
	jmp	.L172	 #
.L302:
	movq	%r14, %rbp	 # _1855, _1855
	movq	112(%rsp), %r12	 # %sfp, _1019
	movl	%r13d, %r14d	 # n, n
	vzeroupper
	jmp	.L164	 #
.L300:
	movq	144(%rsp), %rsi	 # %sfp, ivtmp.823
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:194:         if (strcmp(impl_name, "seq_scalar") == 0) {
	movq	200(%rsp), %rbx	 # %sfp, ivtmp.824
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:34:     for (int i = 0; i < n; i++) {
	xorl	%r13d, %r13d	 # i
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:194:         if (strcmp(impl_name, "seq_scalar") == 0) {
	movq	88(%rsp), %r9	 # %sfp, ivtmp.821
	.p2align 4,,10
	.p2align 3
.L163:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:38:             c_row[j] = 0.0;
	movq	152(%rsp), %r8	 # %sfp,
	xorl	%edx, %edx	 #
	movq	%r9, %rcx	 # ivtmp.821,
	call	memset	 #
	cmpl	$2, %r14d	 #, n
	movq	%rax, %r9	 #, ivtmp.821
	jle	.L205	 #,
	movl	160(%rsp), %edi	 # %sfp, _1593
	movq	72(%rsp), %r10	 # %sfp, ivtmp.815
	xorl	%r11d, %r11d	 # ivtmp.814
	movl	$2, %r8d	 #, ivtmp.810
	addq	%rdi, %rdi	 # _1590
	.p2align 4,,10
	.p2align 3
.L160:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:45:                 c_row[j] += a_ik * b_row[j];
	movq	%r11, %rcx	 # ivtmp.814, _450
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:41:             double a_ik = A[(long)i * n + k];
	vmovsd	-16(%rsi,%r8,8), %xmm3	 # MEM[(const double *)_1857 + -16B + ivtmp.810_1274 * 8], a_ik
	vmovsd	-8(%rsi,%r8,8), %xmm2	 # MEM[(const double *)_1857 + -8B + ivtmp.810_1274 * 8], a_ik
	leaq	(%r15,%r10,8), %rdx	 #, ivtmp.801
	movq	%r9, %rax	 # ivtmp.821, ivtmp.799
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:45:                 c_row[j] += a_ik * b_row[j];
	subq	%r10, %rcx	 # ivtmp.815, _450
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L159:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:45:                 c_row[j] += a_ik * b_row[j];
	vmulsd	(%rdx,%rcx,8), %xmm3, %xmm0	 # MEM[(const double *)_952 + _450 * 8], a_ik, _329
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:44:             for (int j = 0; j < n; j++) {
	addq	$8, %rax	 #, ivtmp.799
	addq	$8, %rdx	 #, ivtmp.801
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:45:                 c_row[j] += a_ik * b_row[j];
	vmulsd	-8(%rdx), %xmm2, %xmm1	 # MEM[(const double *)_952], a_ik, _577
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:45:                 c_row[j] += a_ik * b_row[j];
	vaddsd	-8(%rax), %xmm0, %xmm0	 # MEM[(double *)_973], _329, _330
	vaddsd	%xmm1, %xmm0, %xmm0	 # _577, _330, _575
	vmovsd	%xmm0, -8(%rax)	 # _575, MEM[(double *)_973]
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:44:             for (int j = 0; j < n; j++) {
	cmpq	%rbx, %rax	 # ivtmp.824, ivtmp.799
	jne	.L159	 #,
	leaq	2(%r8), %rax	 #, ivtmp.810
	addq	%r12, %r11	 # _1019, ivtmp.814
	addq	%r12, %r10	 # _1019, ivtmp.815
	cmpq	%rdi, %rax	 # _1590, ivtmp.810
	je	.L158	 #,
	movq	%rax, %r8	 # ivtmp.810, ivtmp.810
	jmp	.L160	 #
.L205:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:38:             c_row[j] = 0.0;
	xorl	%r8d, %r8d	 # k
	.p2align 4,,10
	.p2align 3
.L158:
	movl	%r8d, %ecx	 # k, ivtmp.791
	imull	%r14d, %r8d	 # n, ivtmp.794_2004
	leaq	(%r15,%r8,8), %rdx	 #, ivtmp.795
.L162:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:41:             double a_ik = A[(long)i * n + k];
	vmovsd	(%rsi,%rcx,8), %xmm1	 # MEM[(const double *)_1713 + ivtmp.791_2050 * 8], a_ik
	xorl	%eax, %eax	 # ivtmp.787
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L161:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:45:                 c_row[j] += a_ik * b_row[j];
	vmulsd	(%rdx,%rax), %xmm1, %xmm0	 # MEM[(const double *)_2079 + ivtmp.787_1355 * 1], a_ik, _634
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:45:                 c_row[j] += a_ik * b_row[j];
	vaddsd	(%r9,%rax), %xmm0, %xmm0	 # MEM[(double *)c_row_306 + ivtmp.787_1355 * 1], _634, _633
	vmovsd	%xmm0, (%r9,%rax)	 # _633, MEM[(double *)c_row_306 + ivtmp.787_1355 * 1]
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:44:             for (int j = 0; j < n; j++) {
	addq	$8, %rax	 #, ivtmp.787
	cmpq	%rbp, %rax	 # _1855, ivtmp.787
	jne	.L161	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:40:         for (int k = 0; k < n; k++) {
	addq	$1, %rcx	 #, ivtmp.791
	addq	%rbp, %rdx	 # _1855, ivtmp.795
	cmpl	%ecx, %r14d	 # ivtmp.791, n
	jg	.L162	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:34:     for (int i = 0; i < n; i++) {
	addl	$1, %r13d	 #, i
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:34:     for (int i = 0; i < n; i++) {
	addq	%rbp, %r9	 # _1855, ivtmp.821
	addq	%rbp, %rsi	 # _1855, ivtmp.823
	addq	%rbp, %rbx	 # _1855, ivtmp.824
	cmpl	%r14d, %r13d	 # n, i
	jne	.L163	 #,
	jmp	.L164	 #
.L207:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:17:             c_row[j] = 0.0;
	xorl	%r9d, %r9d	 # k
	jmp	.L166	 #
.L127:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:162:     int measured_runs = (argc >= 4) ? atoi(argv[3]) : 5;
	movq	24(%rbx), %rcx	 # MEM[(char * *)argv_33(D) + 24B], MEM[(char * *)argv_33(D) + 24B]
	call	atoi	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:163:     const char *impl_name = (argc >= 5) ? argv[4] : "sequential";
	cmpl	$4, %esi	 #, argc
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:162:     int measured_runs = (argc >= 4) ? atoi(argv[3]) : 5;
	movl	%eax, 216(%rsp)	 # measured_runs, %sfp
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:163:     const char *impl_name = (argc >= 5) ? argv[4] : "sequential";
	je	.L198	 #,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:163:     const char *impl_name = (argc >= 5) ? argv[4] : "sequential";
	movq	32(%rbx), %rax	 # MEM[(char * *)argv_33(D) + 32B], impl_name
	movq	%rax, 176(%rsp)	 # impl_name, %sfp
.L129:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:165:     if (n <= 0 || warmup_runs < 0 || measured_runs <= 0) {
	cmpl	$0, 216(%rsp)	 #, %sfp
	jle	.L126	 #,
	testb	%dil, %dil	 # _909
	je	.L128	 #,
.L126:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:166:         fprintf(stderr, "Usage: %s <n> [warmup_runs=2] [measured_runs=5] [impl_name=sequential]\n", argv[0]);
	movq	(%rbx), %rbx	 # *argv_33(D), _9
	movl	$2, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:166:         fprintf(stderr, "Usage: %s <n> [warmup_runs=2] [measured_runs=5] [impl_name=sequential]\n", argv[0]);
	leaq	.LC9(%rip), %rdx	 #,
	movq	%rbx, %r8	 # _9,
	movq	%rax, %rcx	 # _10,
	call	__mingw_fprintf	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:167:         return EXIT_FAILURE;
	movl	$1, %eax	 #, <retval>
	jmp	.L77	 #
.L289:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:165:     if (n <= 0 || warmup_runs < 0 || measured_runs <= 0) {
	testl	%eax, %eax	 # n
	jg	.L78	 #,
	jmp	.L126	 #
.L80:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:122:         all_ok &= verify_matrix_tolerance(A, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	leaq	.LC4(%rip), %rax	 #, tmp2116
	movq	88(%rsp), %rsi	 # %sfp, C_test
	movq	136(%rsp), %rbp	 # %sfp, A
	vmovapd	%xmm6, %xmm3	 # tmp1298,
	movq	%rax, 40(%rsp)	 # tmp2116,
	movl	%edi, %r8d	 # n,
	vmovsd	%xmm6, 32(%rsp)	 # tmp1298,
	movq	%rsi, %rdx	 # C_test,
	movq	%rbp, %rcx	 # A,
	call	verify_matrix_tolerance	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:127:         all_ok &= verify_matrix_tolerance(Z, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	movq	200(%rsp), %rcx	 # %sfp,
	movl	%edi, %r8d	 # n,
	movq	%rsi, %rdx	 # C_test,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:122:         all_ok &= verify_matrix_tolerance(A, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	movl	%eax, %ebx	 #, _398
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:127:         all_ok &= verify_matrix_tolerance(Z, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	leaq	.LC5(%rip), %rax	 #, tmp2117
	vmovapd	%xmm6, %xmm3	 # tmp1298,
	vmovsd	%xmm6, 32(%rsp)	 # tmp1298,
	movq	%rax, 40(%rsp)	 # tmp2117,
	call	verify_matrix_tolerance	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:127:         all_ok &= verify_matrix_tolerance(Z, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	movl	184(%rsp), %edi	 # %sfp, all_ok
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:131:         reference_matmul_ijk(A, B, C_ref, n);
	movl	%r15d, %r9d	 # n,
	movq	%r14, %rdx	 # B,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:127:         all_ok &= verify_matrix_tolerance(Z, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	andl	%eax, %ebx	 # _579, _1953
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:131:         reference_matmul_ijk(A, B, C_ref, n);
	movq	%rbp, %rcx	 # A,
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:127:         all_ok &= verify_matrix_tolerance(Z, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	andl	%ebx, %edi	 # _1953, all_ok
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:131:         reference_matmul_ijk(A, B, C_ref, n);
	movq	208(%rsp), %rbx	 # %sfp, C_ref
	movq	%rbx, %r8	 # C_ref,
	call	reference_matmul_ijk	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:133:         all_ok &= verify_matrix_tolerance(C_ref, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	leaq	.LC6(%rip), %rax	 #, tmp2119
	movl	%r15d, %r8d	 # n,
	movq	%rsi, %rdx	 # C_test,
	movq	%rax, 40(%rsp)	 # tmp2119,
	vmovapd	%xmm6, %xmm3	 # tmp1298,
	movq	%rbx, %rcx	 # C_ref,
	vmovsd	%xmm6, 32(%rsp)	 # tmp1298,
	call	verify_matrix_tolerance	 #
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:133:         all_ok &= verify_matrix_tolerance(C_ref, C_test, n, DEFAULT_ATOL, DEFAULT_RTOL,
	andl	%eax, %edi	 # _616, all_ok
	jmp	.L186	 #
.L198:
 # C:\Universidad\03 BD\assignment_03\src\sequential.c:163:     const char *impl_name = (argc >= 5) ? argv[4] : "sequential";
	leaq	.LC0(%rip), %rax	 #, impl_name
	movq	%rax, 176(%rsp)	 # impl_name, %sfp
	jmp	.L129	 #
.L276:
	movl	%r14d, %ebx	 # n, _670
	jmp	.L187	 #
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC3:
	.long	-400107883
	.long	1041313291
	.align 8
.LC12:
	.long	0
	.long	1079574528
	.align 8
.LC14:
	.long	0
	.long	2146959360
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (GNU) 16.2.0"
	.def	memset;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	atoi;	.scl	2;	.type	32;	.endef
	.def	alloc_matrix;	.scl	2;	.type	32;	.endef
	.def	generate_random_matrix;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	generate_identity_matrix;	.scl	2;	.type	32;	.endef
	.def	generate_zero_matrix;	.scl	2;	.type	32;	.endef
	.def	verify_matrix_tolerance;	.scl	2;	.type	32;	.endef
	.def	reference_matmul_ijk;	.scl	2;	.type	32;	.endef
	.def	free_matrix;	.scl	2;	.type	32;	.endef
	.def	get_cpu_time_sec;	.scl	2;	.type	32;	.endef
	.def	get_wall_time_sec;	.scl	2;	.type	32;	.endef
	.def	compute_checksum;	.scl	2;	.type	32;	.endef
	.def	get_peak_rss_kb;	.scl	2;	.type	32;	.endef
	.def	fflush;	.scl	2;	.type	32;	.endef
