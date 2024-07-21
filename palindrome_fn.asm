section .data
	string db "level",0
	len equ $-string
	msg db "The string is Palindrome",10,0
	msg1 db "The string is not Palindrome",10,0
section .bss
	string1 resb 100
section .text
	global main
	extern puts
main:
	mov ecx,len
	sub ecx,1
	mov esi,string
	add esi,len
	sub esi,2
	mov edi,string1

lp:	std
	lodsb
	cld
	stosb
	loop lp

	mov esi,string	
	mov ecx,len
	sub ecx,1
	sub edi,ecx
	repe cmpsb
	jne lp1
	push msg
	call puts
	add esp,4
	jmp lp2

lp1:	push msg1
	call puts
	add esp,4

lp2:	ret
