section .data
	source db "Assembly",0
	len equ $-source
section .bss
	dest resd 100
section .text
	global main
	extern printf
main:
	mov ecx,len
	
	
