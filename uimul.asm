section .data
	msg db "Enter the two numbers : ",10,0
	msg1 db "%d",0
	msg2 db "Multiplication is %d",10,0
	msg3 db "Division is with quotient is %d and remainder is %d",10,0
section .bss
	x resd 1
	y resd 1
section .text
	global main
	extern printf,scanf
main:	
	mov edx,0
	push msg
	call printf
	add esp,4
	
	push x
	push msg1
	call scanf	
	add esp,8
	
	push y
	push msg1
	call scanf
	add esp,8
	pusha

	mov eax,dword[x]
	mul dword[y]
	push eax
	push msg2
	call printf
	add esp,8

	popa
	mov eax,dword[x]
	div dword[y]
	push edx
	push eax
	push msg3
	call printf
	add esp ,12
	ret
