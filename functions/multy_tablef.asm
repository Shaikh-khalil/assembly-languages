section .data
	show db "%d * %d = %d",10,0

section .text
	global table
	extern printf

table:
	push ebp
	mov ebp,esp

	mov ecx,1
	mov ebx,dword[ebp+8]
lp:
	mov eax,ebx
	mul ecx
	
	pusha
	push eax
	push ecx
	push ebx
	push show
	call printf
	add esp,16
	popa

	inc ecx
	cmp ecx,10
	jle lp

	mov esp,ebp
	pop ebp
	ret	
