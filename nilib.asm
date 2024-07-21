section .data
	msg db "Length of the String is %d",10,0
section .bss 
	string resb 10 
section .taxt
	global main ;length
	extern printf
;length:
main:	enter 4,0
	mov eax,3
	mov ebx,0
	mov ecx, string
	mov edx,10
	int 0x80

mov eax,string
	;mov eax,dword[ebp+8]
	mov dword[ebp-4],0
	
lp:	cmp byte[eax],0
	je lp1
	inc dword[ebp-4]
	inc eax
	jmp lp

lp1:	push dword[ebp-4]
	push msg
	call printf
	add esp,8

	leave
	ret
