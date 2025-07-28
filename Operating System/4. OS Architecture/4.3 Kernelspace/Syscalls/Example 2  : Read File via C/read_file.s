	.file	"read_file.c"
	.text
	.section	.rodata
.LC0:
	.string	"hello_world.txt"
.LC1:
	.string	"%s"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$2, %edx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	syscall@PLT
	movq	%rax, -128(%rbp)
	leaq	-112(%rbp), %rdx
	movq	-128(%rbp), %rax
	movl	$100, %ecx
	movq	%rax, %rsi
	movl	$0, %edi
	movl	$0, %eax
	call	syscall@PLT
	movq	%rax, -120(%rbp)
	leaq	-112(%rbp), %rdx
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	leaq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-128(%rbp), %rax
	movq	%rax, %rsi
	movl	$3, %edi
	movl	$0, %eax
	call	syscall@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L3
	call	__stack_chk_fail@PLT
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
