section .data
	msg db "%d",10,0
section .text
	global main
	extern printf
main:
	mov ecx,1
lp:
	mov eax,7
	xor edx,edx
	mul ecx
	pusha
	push eax
	push msg
	call printf
	add esp,8
	popa
	inc ecx
	cmp ecx,10
	jle lp
	ret

