section .data
	msg db "Low Level Programming",0
	msg1 db "Operating System",10
	msg2 db	"%d",10,0
	msg3 db "%d"
section .bss
	a resd 1
section .text
	global main
	extern printf,scanf
main:	push msg
	call printf
	add esp,4

	push a
	push msg2
	call scanf
	add esp,8
	
	push dword[a]
	push msg2
	call printf
	add esp,8

	
	ret
