%macro mult 1
	xor ecx,ecx
	mov ecx,1
%%lp:	mov eax,%1
	xor edx,edx
	mul ecx
	pusha 
	push eax
	push msg2
	call printf
	add esp,8
	popa
	inc ecx
	cmp ecx,10
	jle %%lp
%endmacro 

section .data
	msg db "Enter the number:",0
	msg1 db "%d",0
	msg2 db "%d",10,0
section .bss
	n resd 100
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

	mult dword[n]

	ret
	
	
