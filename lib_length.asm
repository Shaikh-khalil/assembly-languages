section .data
	msg db "Length of the String is %d",10,0
section .text
	global length
	extern printf,reverse
length:
	enter 4,0

	mov eax,dword[ebp+8]
	mov dword[ebp-4],0
	
lp:	cmp byte[eax],0
	je lp1
	inc dword[ebp-4]
	inc eax
	jmp lp

lp1:	pusha
	push dword[ebp-4]
	push msg
	call printf
	add esp,8
	popa

	push dword[ebp+8]
	push dword[ebp-4]
	call reverse
	add esp,8

	leave
	ret
