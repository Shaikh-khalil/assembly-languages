section .data
	source_string db "Low level programming",10,0
	len equ $-source_string
	msg db "Length of the string is %d",10,0
section .bss
	dest_string resd len
section .text
	global main
	extern printf,puts
main:
	mov eax ,source_string
	mov edx,dest_string
	mov ecx,len
	add eax,len
	sub eax,1

lp2:	mov bl,byte[eax]
	mov byte[edx],bl
	dec eax
	inc edx
	loop lp2

	mov edx,len
	mov eax,4
	mov ebx,1
	mov ecx,dest_string
	int 0x80
	ret
