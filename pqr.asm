section .data
	msg db "%d + %d = %d",10,0

section .bss

section .text
	global main
	extern printf,abc	

main:
	mov ebx,5
	mov ecx,6
	push ebx
	push ecx
	call abc
	add esp,8
	push eax
	push ecx
	push ebx
	push msg
	call printf
	add esp,16
	ret
	
