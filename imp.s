	.file	"imp.c"
	.text
	.globl	InitRandom
	.type	InitRandom, @function
InitRandom:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	time@PLT
	movq	-16(%rbp), %rax
	movl	%eax, %edi
	call	srand@PLT
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L2
	call	__stack_chk_fail@PLT
.L2:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	InitRandom, .-InitRandom
	.section	.rodata
.LC0:
	.string	"hw1given.h"
	.align 8
.LC1:
	.string	"(*val <= maxval) && (*val >= minval)"
	.text
	.globl	GetRandom
	.type	GetRandom, @function
GetRandom:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-12(%rbp), %rax
	movq	%rax, -24(%rbp)
	movl	$0, -28(%rbp)
	jmp	.L4
.L5:
	call	rand@PLT
	movl	%eax, %edx
	movl	-28(%rbp), %eax
	cltq
	movb	%dl, -12(%rbp,%rax)
	addl	$1, -28(%rbp)
.L4:
	movl	-28(%rbp), %eax
	cmpl	$3, %eax
	jbe	.L5
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	movl	-40(%rbp), %eax
	subl	-36(%rbp), %eax
	leal	1(%rax), %ecx
	movl	%edx, %eax
	movl	$0, %edx
	divl	%ecx
	movl	-36(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -40(%rbp)
	jb	.L6
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -36(%rbp)
	jbe	.L10
.L6:
	leaq	__PRETTY_FUNCTION__.3717(%rip), %rcx
	movl	$66, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	__assert_fail@PLT
.L10:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	GetRandom, .-GetRandom
	.section	.rodata
	.align 8
.LC2:
	.string	"How many times would you like to play?"
.LC3:
	.string	"%d"
.LC4:
	.string	"r"
.LC5:
	.string	"No pointer to access file"
.LC6:
	.string	"Columns: %d\n"
.LC7:
	.string	"Rows: %d\n"
.LC8:
	.string	"\nColumn we exited: "
.LC9:
	.string	"%d\n "
.LC10:
	.string	"\nGaussian Distribution: "
.LC11:
	.string	"%d) "
.LC12:
	.string	"%f) "
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -52(%rbp)
	movl	$0, -48(%rbp)
	movl	$0, -44(%rbp)
	movl	$0, -32(%rbp)
	movl	$0, -28(%rbp)
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	leaq	-52(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movq	-80(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L12
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L18
.L12:
	leaq	-48(%rbp), %rdx
	leaq	-44(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	getXy
	movl	-44(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-48(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-48(%rbp), %ecx
	movl	-44(%rbp), %edx
	movq	-16(%rbp), %rsi
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	makeBoard
	movl	-48(%rbp), %edx
	movq	-16(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	printBoard
	movl	-48(%rbp), %edx
	movl	-44(%rbp), %ecx
	movq	-16(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	traverseBoard
	movl	%eax, -28(%rbp)
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-28(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-44(%rbp), %edx
	movq	-16(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	makeProbabilityArray
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -40(%rbp)
	jmp	.L14
.L15:
	movl	-48(%rbp), %edx
	movl	-44(%rbp), %ecx
	movq	-16(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	traverseBoard
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %edx
	movq	-16(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	fillProbabilityArray
	addl	$1, -40(%rbp)
.L14:
	movl	-52(%rbp), %eax
	cmpl	%eax, -40(%rbp)
	jl	.L15
	movl	$0, -36(%rbp)
	jmp	.L16
.L17:
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movl	-52(%rbp), %eax
	cvtsi2ss	%eax, %xmm0
	divss	%xmm0, %xmm1
	movaps	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	.LC12(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	addl	$1, -36(%rbp)
.L16:
	movl	-44(%rbp), %eax
	cmpl	%eax, -36(%rbp)
	jl	.L17
	movl	-48(%rbp), %edx
	movl	-44(%rbp), %ecx
	movq	-16(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	freeBoard
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$1, %eax
.L18:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L19
	call	__stack_chk_fail@PLT
.L19:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.globl	makeProbabilityArray
	.type	makeProbabilityArray, @function
makeProbabilityArray:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	-28(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
	movl	$0, -4(%rbp)
	jmp	.L21
.L22:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movss	%xmm0, (%rax)
	addl	$1, -4(%rbp)
.L21:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L22
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	makeProbabilityArray, .-makeProbabilityArray
	.globl	printProbabilities
	.type	printProbabilities, @function
printProbabilities:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L24
.L25:
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	leaq	.LC12(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L24:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L25
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	printProbabilities, .-printProbabilities
	.globl	fillProbabilityArray
	.type	fillProbabilityArray, @function
fillProbabilityArray:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movss	.LC14(%rip), %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, (%rax)
	movl	$1, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	fillProbabilityArray, .-fillProbabilityArray
	.globl	traverseBoard
	.type	traverseBoard, @function
traverseBoard:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	call	InitRandom
	movl	$0, -12(%rbp)
	movl	-28(%rbp), %eax
	subl	$2, %eax
	movl	%eax, %esi
	movl	$1, %edi
	call	GetRandom
	movl	%eax, -8(%rbp)
	movl	$0, -4(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-8(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movb	$66, (%rax)
	jmp	.L29
.L35:
	movl	-28(%rbp), %eax
	subl	$2, %eax
	movl	%eax, %esi
	movl	$1, %edi
	call	GetRandom
	movl	%eax, -4(%rbp)
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-8(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$88, %al
	je	.L30
	addl	$1, -12(%rbp)
	jmp	.L29
.L30:
	movl	-4(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L31
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$88, %al
	je	.L32
	addl	$1, -8(%rbp)
	addl	$1, -12(%rbp)
	jmp	.L29
.L32:
	subl	$1, -8(%rbp)
	addl	$1, -12(%rbp)
	jmp	.L29
.L31:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	addq	$1, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	subq	$1, %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$88, %al
	je	.L34
	subl	$1, -8(%rbp)
	addl	$1, -12(%rbp)
	jmp	.L29
.L34:
	addl	$1, -8(%rbp)
	addl	$1, -12(%rbp)
.L29:
	movl	-32(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -12(%rbp)
	jl	.L35
	movl	-8(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	traverseBoard, .-traverseBoard
	.globl	getXy
	.type	getXy, @function
getXy:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$320, %rsp
	movq	%rdi, -296(%rbp)
	movq	%rsi, -304(%rbp)
	movq	%rdx, -312(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-296(%rbp), %rdx
	leaq	-272(%rbp), %rax
	movl	$250, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	je	.L40
	leaq	-280(%rbp), %rcx
	leaq	-272(%rbp), %rax
	movl	$10, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtol@PLT
	movl	%eax, %edx
	movq	-304(%rbp), %rax
	movl	%edx, (%rax)
	movq	-280(%rbp), %rax
	testq	%rax, %rax
	je	.L40
	movq	-280(%rbp), %rax
	addq	$1, %rax
	movl	$10, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtol@PLT
	movl	%eax, %edx
	movq	-312(%rbp), %rax
	movl	%edx, (%rax)
.L40:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L39
	call	__stack_chk_fail@PLT
.L39:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	getXy, .-getXy
	.globl	makeBoard
	.type	makeBoard, @function
makeBoard:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -52(%rbp)
	movl	%ecx, -56(%rbp)
	movl	-56(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, (%rax)
	movl	$0, -24(%rbp)
	jmp	.L42
.L43:
	movl	-52(%rbp), %eax
	cltq
	movq	-48(%rbp), %rdx
	movq	(%rdx), %rdx
	movl	-24(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	leaq	(%rdx,%rcx), %rbx
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, (%rbx)
	addl	$1, -24(%rbp)
.L42:
	movl	-24(%rbp), %eax
	cmpl	-56(%rbp), %eax
	jl	.L43
	movl	$0, -20(%rbp)
	jmp	.L44
.L45:
	movl	-52(%rbp), %eax
	leal	2(%rax), %ecx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	-40(%rbp), %rdx
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	addl	$1, -20(%rbp)
.L44:
	movl	-20(%rbp), %eax
	cmpl	-56(%rbp), %eax
	jl	.L45
	movl	$1, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	makeBoard, .-makeBoard
	.globl	freeBoard
	.type	freeBoard, @function
freeBoard:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L48
.L49:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	addl	$1, -4(%rbp)
.L48:
	movl	-4(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L49
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$1, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	freeBoard, .-freeBoard
	.section	.rodata
.LC15:
	.string	"HERE'S THE BOARD: "
	.text
	.globl	printBoard
	.type	printBoard, @function
printBoard:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	leaq	.LC15(%rip), %rdi
	call	puts@PLT
	movl	$0, -4(%rbp)
	jmp	.L52
.L53:
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	stdout(%rip), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fputs@PLT
	addl	$1, -4(%rbp)
.L52:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L53
	movl	$1, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	printBoard, .-printBoard
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.3717, @object
	.size	__PRETTY_FUNCTION__.3717, 10
__PRETTY_FUNCTION__.3717:
	.string	"GetRandom"
	.align 4
.LC14:
	.long	1065353216
	.ident	"GCC: (Ubuntu 7.4.0-1ubuntu1~18.04.1) 7.4.0"
	.section	.note.GNU-stack,"",@progbits
