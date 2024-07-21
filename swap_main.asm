section .data
	msg db "Enter the Two numbers : ",10,0
	msg1 db "%d",0
	msg2 db "Before Swapping:",10,0
	msg3 db "%d",10,0
section .bss
	m resd 1
	n resd 1
section .text
	global main
	extern printf,scanf,swap
main:
	push msg
	call printf
	add esp,4

	push m	
	push msg1
	call scanf
	add esp,8

	push n
        push msg1
        call scanf
        add esp,8

	push msg2
        call printf
        add esp,4

	pusha
        push dword[m]
        push msg3
        call printf
        add esp,8
	popa

	pusha
        push dword[n]
        push msg3
        call printf
        add esp,8
	popa

	push m
	push n
	call swap
	add esp,8

	ret
