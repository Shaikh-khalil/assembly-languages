section .data
	msg db "Enter the number",10,0
	msg1 db "%d",0
	msg2 db "Sum is %f",10,0
	a db 1
section .bss
	n resd 1
	sum resq 1
	fact resd 1
section .text
	global main
	extern printf,scanf
main:
	push msg
	call printf
	add esp,4
	
	push n
	push msg1
	call scanf
	add esp,8

	mov ecx,dword[n]
	mov ebx,dword[n]
	fldz
	fstp qword[sum]
		
lp1:	mov eax,1
	cmp ebx,0
	je lp
	mov ecx,ebx	
lp2:	mul ecx
	loop lp2

	mov dword[fact],eax
	fild dword[fact]	
	fild dword[a]
	fdiv st1
	fadd qword[sum]
	fstp qword[sum]
	dec ebx
	jmp lp1

lp:	fld qword[sum]
	sub esp,16
	fstp qword[esp]
	push msg2
	call printf
	add esp,20
	ret
