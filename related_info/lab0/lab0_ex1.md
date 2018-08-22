#README
Try below command

```
$gcc -S -m32 lab0_ex1.c
```

Then you will get lab_ex1.S. Try to understand the content & relation of C file  and S file. 

## My Understandings

lab0_ex1.c code:

```
int count=1;
int value=1;
int buf[10];
void main()			
{				
   asm(	
	"cld \n\t"
        "rep \n\t"					     
        "stosl"
	:
	: "c" (count), "a" (value) , "D" (buf[0])
	:
      );
}
// count: %ecx, value: %eax, buf[0]: %edi
```

The assmebly code in lab_ex1.S

```
	movl	L_buf$non_lazy_ptr-L0$pb(%eax), %ecx
	movl	_count-L0$pb(%eax), %edx
	movl	_value-L0$pb(%eax), %eax
	movl	(%ecx), %edi
	movl	%edx, %ecx
	## InlineAsm Start
	cld    ; increase %edi by 4
	rep    ; Repeat %ecx times
	stosl	%eax, %es:(%edi) 
		   ; store %eax (4 bytes of 0) at address %es:(%edi)
	## InlineAsm End
```

