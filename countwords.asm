section .data
	msg db "today is sunday, tommorow is monday ",10,0
	len equ $-msg
	msg2 db "%d",10,0

section .text
	global main
	extern printf
main:
	mov edi,msg
	xor esi,esi
	mov ecx,len
lp:	
	mov al,' '
	repne scasb
	add esi,1
	;add edi,1
	cmp byte[edi],10
	jnz lp 

	;mov eax,4
	;mov ebx,1
	;mov ecx,esi
	;mov edx,1
	;int 0*80
	
	push esi
	push msg2
	call printf
	add esp,8
	ret
