section .data
	msg db "Low Level Programming",10,0
	msg1 db "%d",0
section .bss
	a resd 10
section .text
	global main
	extern printf,scanf
main:	push msg
	call printf
	add esp, 4

	push a
	push msg1
        call scanf
	add esp,8

	push dword[a]
        push msg1
        call printf
        add esp,8

	ret
