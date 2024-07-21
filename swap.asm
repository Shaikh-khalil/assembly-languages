section .data
	msg db "After Swapping :",10,0
	msg1 db "%d",10,0
section .text
	global swap
	extern printf
swap:
	enter 0,0	
	mov eax,dword[ebp+8]
	mov ecx,dword[ebp+12]
	
	mov ebx,eax
	mov eax,ecx
	mov ecx,ebx

	pusha
	push msg
	call printf
	add esp,4
	popa
	
	pusha
	push dword[ecx]
	push msg1
	call printf
	add esp,8
	popa
	
	pusha
	push dword[eax]
	push msg1
	call printf
	add esp,8
	popa

	leave 
	ret
