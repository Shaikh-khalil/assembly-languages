section .data
	msg db "The %d Argument is %s",10,0
section .text
	global main
	extern printf
main:	enter 0,0

	mov ecx,dword[esp+8]
	mov esi,dword[ebp+12]
	mov ebx,1

lp:	cmp ecx,ebx
	je lp1
	mov edx,dword[esi+4*ebx]
	pusha
	push edx
	push ebx
	push msg
	call printf
	add esp,12
	popa
	inc ebx
	jmp lp

lp1:	leave 
	ret
	
