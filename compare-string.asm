section .data
	string1 db "Low Level Programming",10,0
	string2 db "Low Level Programming",10,0
	len equ $-string2
	msg db "not same",10,0
	msg1 db "same",10,0
section .text
	global main
	extern puts
main:
	mov esi,string1
	mov edi,string2
	mov ecx,len
	
	repe cmpsb
	
	cmp ecx,0
	jz success

	push msg
	call puts
	add esp,4
	jmp end	
success:
	push msg1
	call puts
	add esp,4

end:	ret
