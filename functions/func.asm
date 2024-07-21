section .data
	msg db "value is %d",10,0

section .text
	global pqr
	extern printf

pqr:
	push ebp
	mov ebp,esp
	
	mov eax,dword[ebp+8]
	mov ebx,dword[ebp+12]

	mul ebx

	push eax
	push msg
	call printf
	add esp,8

	mov eax,0
	
	mov esp,ebp
	pop ebp
	
	ret
