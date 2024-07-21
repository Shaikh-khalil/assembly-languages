section .data
	msg db "Multiplication is %d ",10,0
section .text
	global main
	extern printf,atoi
main:
	enter 0,0
	
	mov esi,dword[ebp+12]
	mov ecx,dword[esi+4]
	push ecx
	call atoi
	add esp,4

	mov ebx,eax

	mov ecx,dword[esi+8]
	push ecx
	call atoi
	add esp,4

	mul ebx
	push eax
	push msg
	call printf
	add esp,8

	leave 
	ret
