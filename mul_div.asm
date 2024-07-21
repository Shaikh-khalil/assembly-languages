section .data
	msg db "Enter the two numbers :",10,0
	msg1 db "%d",0
	msg2 db "Multiplication is %d",10,0
	msg3 db "Division is %d",10,0
section .bss
	x resd 1
	y resd 1
section .text
	global main
	extern printf,scanf
main:
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

	mov eax,dword[x]
	mul dword[y]
	push eax
	push msg2
	call printf
	add esp,8

	xor edx,edx
	mov eax,dword[x]
	div dword[y]
	push eax
	push msg3
	call printf
	add esp ,8
	ret
