section .data
	input db "Low level",0
	len equ $-input
	msg db "Reverse of the string is ",0
section .bss
	string resb 100
section .text
	global reverse,main
	extern puts
;reverse:
main:	mov eax,3
	mov ebx,0
	mov edx,len
	mov ecx,input
	
	;enter 0,0
	mov esi,input;dword[ebp+8]
	mov ecx,len;dword[ebp+12]
	dec ecx
	add esi,ecx
	sub esi,1
	mov edi,string

lp:	std
	lodsb
	cld 
	stosb
	loop lp

	sub edi,len;dword[ebp+12]

	push msg
	call puts
	add esp,4
	
	push string
	call puts
	add esp,4
	;leave
	ret
	
