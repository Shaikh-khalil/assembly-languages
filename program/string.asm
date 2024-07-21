section .data
	sourcestring db "Low 0Level Programming",0
	len equ $-sourcestring
	msg db "Length of String is %d",10,0
section .bss
	deststring resb len
section .text
	global main
	extern printf,puts
main:
	mov eax,sourcestring
	xor ecx,ecx
t:	cmp byte[eax],0
	jz lp
	inc ecx
	inc eax
	jmp t
lp:	mov eax,sourcestring
	mov edx,deststring
	mov ecx,len
	add eax,len
	sub eax,1
lp1:	mov bl, byte[eax]
	mov byte[edx],bl
	dec eax
	inc edx
	loop lp1

	mov edx,len
	
	mov  eax,4
	mov ebx,1
	mov ecx,deststring
	;; int 0x80

	push deststring
	call printf
	add esp,4

	push deststring
	call puts
	add esp,4

	
	ret
