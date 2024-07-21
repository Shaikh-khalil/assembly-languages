section .data
	msg db "factorial is %d",10,0
section .text
	global factorial
	extern printf

factorial:
	push ebp
	mov ebp,esp

	mov ecx,dword[ebp+8]
	
	mov eax,1
lp:
	mul ecx
	loop lp
	
	push eax
	push msg
	call printf
	add esp,8

	mov esp,ebp
	pop ebp
	
	ret
