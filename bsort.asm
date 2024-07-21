section .data
	msg db "sorting of elements :"10,0
	sort dd 10,11,9,13,7,-1
section .text
	global main
	extern printf
main: 
	mov edi,sort
	

lp:	mov eax,4	
	mul ecx
	add esi,eax
	cmp edx,0
	je lp2
	cmp dword[esi],-1
	je lp4
	mov ebx,dword[edi]
	cmp dword[esi],ebx
	jle lp3
 	jmp lp1
	
lp3:	xchg dword[esi],ebx	

lp1:	inc ecx
	dec edx
	jmp lp	

lp4:	add edi,4
	jmp lp

lp2:	push sortc
	push msg
	call printf
	add esp,8
	ret
