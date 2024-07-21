section .text
	global main
	extern pqr

main:
	mov eax,10
	mov ebx,20

	push eax
	push ebx
	call pqr
	add esp,8
	ret	
