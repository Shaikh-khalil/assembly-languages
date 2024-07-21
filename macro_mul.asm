%macro mult 2
	mov eax,%1
	mov ebx,%2
	mul ebx
%endmacro

section .data
	msg db "Enter the two numbers:",10,0
	msg1 db "%d",0
	msg2 db "Multiplication is %d",10,0
section .bss
	m resd 1
	n resd 1
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

	push m
	push msg1 
	call scanf
	add esp,8

	mult dword[m],dword[n]
	push eax
	push msg2
	call printf
	add esp,8

	ret
