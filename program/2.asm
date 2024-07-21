section .data
	a dd 170
	b dd 285
	msg db "addition  is %d",10,0
	msg1 db "Subtraction  is %d",10,0
section .bss
	sum resd 1
section .text
	global main
	extern printf
main:
	mov ecx,dword[a]
	add ecx,dword[b]
	mov dword[sum],ecx
	pusha

	push dword[sum]
	push msg
	call printf
	add esp,8

	popa
	mov eax,dword[a]
	sub  eax,dword[b]
	mov dword[sum],eax
	pusha
	push dword[sum]
	push msg1
	call printf
	add esp,8
	popa
	add ecx,eax

	push ecx 
	push msg1
	call printf
	add esp,8

	ret
