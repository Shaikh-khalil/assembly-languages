section .data
	msg db "Today is monday",10,0
	len equ $-msg
section .bss
	dest resb len

section .text
	global main
	extern puts
main: 
	mov ecx,len
	sub ecx,1
	mov esi,msg
	mov edi,dest
	add esi,len
	sub esi,2	
lp:	
	std
	lodsb 
	cld
	stosb 
	loop lp

	push dest
	call puts 
	add esp,4

	;mov eax,4
	;mov ebx,1
	;mov ecx,dest
	;mov edx,len
	;int 0*80
	ret
