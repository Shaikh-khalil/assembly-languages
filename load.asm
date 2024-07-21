section .data
	string db "Tomorrow is sunday",0
	len equ $-string
section .bss
	string1 resd 1000
section .text
	global main
	extern puts
main:
	mov ecx,len
	dec ecx
	mov edi,string1
	mov esi,string
	add esi,len
	sub esi,2
lp:	std
	lodsb
	cld
	stosb
	loop lp
	push string1
	call puts
	add esp,4
	ret
