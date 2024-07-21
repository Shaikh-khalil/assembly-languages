section .text
	global main
	extern factorial

main:
	mov eax,5
	
	push eax
	call factorial
	add esp,4

	ret
