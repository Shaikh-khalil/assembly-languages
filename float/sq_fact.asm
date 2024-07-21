section .data
	msg db "Enter the number",10,0
	msg1 db "%d",0
	msg2 db "Sum is %f",10,0
section .bss
	n resd 1
	sum resq 1
	fact resd 1
	sq resd 1
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

	mov ebx,dword[n]
	fldz
	fstp qword[sum]
		
lp1:	mov ecx,ebx
	mov eax,ecx
	cmp ebx,0
	je lp
	mul ecx
	mov dword[sq],eax

	mov eax,1
	
lp2:	mul ecx
	loop lp2

	mov dword[fact],eax
	fild dword[fact]	
	fild dword[sq]
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
