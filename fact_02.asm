section .data
	msg db "Factorial is %d",10,0
section .text
	global fact_02
	extern printf	
fact_02:enter 4,0
	
	mov eax,dword[ebp+8]

	mov dword[ebp-4],eax
	
lp:	dec dword[ebp-4]
	cmp dword[ebp-4],0
	je lp1
	mul dword[ebp-4]
	jmp lp
	
lp1:	push eax
	push msg
	call printf
	add esp,8

	leave
	ret 
