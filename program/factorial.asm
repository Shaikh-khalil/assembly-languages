section .data
	msg db "Factorial is %d",10,0
section .text
	global main
	extern printf
main:
	mov eax,1
	mov ecx,5
lp:	xor edx,edx
	mul ecx
	dec ecx
	jnz lp
	
	push eax
	push msg
	call printf
	add esp,8
	ret
