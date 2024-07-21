section .data
	msg db "Multiplication table is :",10,0
	output db "%d",10,0
section .text
	global mult_02
	extern printf
mult_02:
	enter 8,0
	mov dword[ebp-4],1

	push msg
	call printf
	add esp,4

lp:	mov eax,dword[ebp+8]	
	mul dword[ebp-4]

	push eax
	push output
	call printf
	add esp,8

	inc dword[ebp-4]
	cmp dword[ebp-4],11
	je lp1
	jmp lp

lp1:	leave 
	ret
	
			
