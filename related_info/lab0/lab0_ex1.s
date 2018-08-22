	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushl	%ebp
Lcfi0:
	.cfi_def_cfa_offset 8
Lcfi1:
	.cfi_offset %ebp, -8
	movl	%esp, %ebp
Lcfi2:
	.cfi_def_cfa_register %ebp
	pushl	%edi
Lcfi3:
	.cfi_offset %edi, -12
	calll	L0$pb
L0$pb:
	popl	%eax
	movl	L_buf$non_lazy_ptr-L0$pb(%eax), %ecx
	movl	_count-L0$pb(%eax), %edx
	movl	_value-L0$pb(%eax), %eax
	movl	(%ecx), %edi
	movl	%edx, %ecx
	## InlineAsm Start
	cld
	rep
	stosl	%eax, %es:(%edi)
	## InlineAsm End
	popl	%edi
	popl	%ebp
	retl
	.cfi_endproc
                                        ## -- End function
	.section	__DATA,__data
	.globl	_count                  ## @count
	.p2align	2
_count:
	.long	1                       ## 0x1

	.globl	_value                  ## @value
	.p2align	2
_value:
	.long	1                       ## 0x1

	.comm	_buf,40,2               ## @buf

	.section	__IMPORT,__pointers,non_lazy_symbol_pointers
L_buf$non_lazy_ptr:
	.indirect_symbol	_buf
	.long	0

.subsections_via_symbols
