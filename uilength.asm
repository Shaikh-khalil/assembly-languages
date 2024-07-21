section .data
	msg db "Enter the string : ",10,0
	msg1 db "Length of the String is %d ",10,0
	msg2 db "%s",10,0
section .bss
	string resb 100
section .text
	global main
	extern printf
main:
	push msg
	call printf
	add esp,4

	mov eax,3
	mov ebx,0
	mov ecx,string
	mov edx,100
	int 0x80

	push string
	push msg2
	call printf
	add esp,8

	xor ecx,ecx
	mov esi,string
lp:	cmp byte[esi],0
	je lp2
	inc ecx
	inc esi
	jmp lp

lp2:	push ecx
	push msg1
	call printf
	add esp,8

	ret
