section .data
	msg db "The factorial is %d",10,0
section .text
	global main
	extern printf
main:
	mov eax,5
	
 
	push eax
	push msg
	call printf
	add esp,8
	ret
