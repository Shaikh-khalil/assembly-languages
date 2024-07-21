section .data
	msg db "Low Level Assembly Programming ",10,0
	msg1 db "Answer string is %s ",10,0
section .bss
	dest resd 100
section .text
	global main
	extern printf,scanf
main:
	push msg
	call printf
	add esp,4

	mov esi,msg
	mov edi,dest
	dec esi
lp:	inc esi
	cmp byte[esi],' '
	je lp1
	cmp byte[esi],0
	je lp2
	mov al,byte[esi]
	cmp al,96
	jl lp3
	sub al,32
	mov byte[edi],al
	inc edi
	jmp lp

lp3:	add al,32
	mov byte[edi],al
	inc edi
	jmp lp

lp1:	mov byte[edi],' '
	inc edi
	jmp lp

lp2:	push dest
	push msg1
	call printf
	add esp,8
	ret
