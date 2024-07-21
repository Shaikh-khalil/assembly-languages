section .data
	source db "Low",0
	len equ $-source
	dest db "Low programming",0
	msg db "The string is equal",10,0
	msg1  db "The string is not equal",10,0
section .text
	global main
	extern printf
main:
	mov ecx,len
	mov esi,source
	mov edi,dest
	repe cmpsb
	je lp
	push msg1
	call printf
	add esp,4
	jmp lp1

lp:	push msg
	call printf
	add esp,4
lp1:	ret

