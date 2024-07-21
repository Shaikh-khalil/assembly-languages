	section .text
	global main
	extern p
main:
	mov eax ,0
	push eax
	call p
	add esp,4 
