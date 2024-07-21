section .data 
	msg db "Enter number",10,0
	acc db "%d",0

section .bss
	n resd 1

section .text
	global main 
	extern table,printf,scanf

main:
	push msg
	call printf
	add esp,4
	
	push n
	push acc
	call scanf
	add esp,8

	mov eax,dword[n]
	
	push eax
	call table
	add esp,4
	
	ret
