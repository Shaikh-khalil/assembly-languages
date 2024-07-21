section .data
	msg db "Factorial is:%d",10,0
section .text
	global main
	extern fact,printf
main:
	mov ebx,5

	push ebx
	call fact
	add esp,4

	push eax
	push msg
	call printf
	add esp,8
	ret
	
