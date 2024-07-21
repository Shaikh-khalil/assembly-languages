section .text
	global fact
fact:
	push ebp
	mov ebp,esp

	mov eax,dword[ebp+8]
	
	mov ecx,eax
	dec ecx
lp:	cmp ecx,0
	jz lp1
	mul ecx
	dec ecx
	jmp lp

lp1:	mov esp,ebp
	pop ebp

	ret
