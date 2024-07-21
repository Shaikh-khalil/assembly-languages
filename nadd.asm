section .data
	number dd 10,20,30,40,-1
	msg db "Addition is %d",10,0
section .bss
	sum resd 1
section .text
	global main
	extern printf
main:
	mov dword[sum],0     ;sum=0
	xor ecx,ecx	     ;ecx is index which is initially 0
lp:	mov eax,4
	mov esi,number
	xor edx,edx
	mul ecx
	add esi,eax
	cmp dword[esi],-1
	jz endp
	mov ebx,dword[esi]         ;esi=esi+ecx*eax
	add dword[sum],ebx
	inc ecx
	jmp lp
	
endp:	pusha
	push dword[sum]
	push msg
	call printf
	add esp,8
	popa
	ret
