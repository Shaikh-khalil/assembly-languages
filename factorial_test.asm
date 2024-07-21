section .data
	msg db "Enter the number : ",10,0
	msg1 db "Factorial is %d",10,0
	msg2 db "%d" ,0
section .bss
	n resd 1
section .text
	global main
	extern printf ,scanf
main:	
	push msg
	call printf
	add esp ,4

	push n
	push msg2
	call scanf
	add esp,8

	mov eax,1
	mov ecx,dword[n]
lp:	xor edx,edx
	mul ecx
	dec ecx
	jnz lp	
	
	pusha
	push eax
	push msg1
	call printf
	add esp,8
	popa
	
	ret
