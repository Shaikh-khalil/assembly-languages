section .data
	msg db "stdin"

section .bss
	s resb 100
section .text
	global main
	extern fgets,puts

main:	
	pusha
	push s
	push 100
	push msg
	call fgets
	add esp,12
	popa

	pusha
	push s
	call puts
	add esp,4
	popa
	ret

