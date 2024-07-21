section .data
	source db "String",0
	len equ $-source
section .bss
	dest resb 100
section .text
	global main
	extern puts
main:
	mov ecx,len
	sub ecx,1
	mov esi,source
	add esi,len
	sub esi,2
	mov edi,dest
	
lp:	std
	lodsb
	cld
	stosb
	loop lp

	push dest
	call puts
	add esp,4
	ret
