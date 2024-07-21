section .data
	msg db "Reverse of the string is ",0
section .bss
	string resb 100
section .text
	global reverse
	extern puts
reverse:	
	enter 0,0
	mov esi,dword[ebp+12]
	mov ecx,dword[ebp+8]
	dec ecx
	add esi,ecx
	sub esi,1
	mov edi,string

lp:	std
	lodsb
	cld 
	stosb
	loop lp

	sub edi,dword[ebp+12]

	push msg
	call puts
	add esp,4
	
	push string
	call puts
	add esp,4
	
 	leave
	ret
	
