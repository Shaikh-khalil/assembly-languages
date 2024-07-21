
section .text
	global fact
fact:
	push ebp
	mov ebp,esp
	mov eax,1
	mov ecx,dword[ebp+8]
lp:	mul ecx
	dec ecx
	cmp ecx,1
	jne lp
	mov esp,ebp
	pop ebp
	ret
	
