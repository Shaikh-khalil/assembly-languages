section .data

section .bss

section .text
	global abc
	;extern printf

abc:	push ebp
	mov ebp,esp
	
	mov eax,dword[ebp+8]
	mov ebx,dword[ebp+12]

	add eax,ebx
	
	mov esp,ebp
	pop ebp
	ret
