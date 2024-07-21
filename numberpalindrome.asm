section .data
	number1 dd 32123
	msg db "palindrome",10,0
	msg2 db "not palindrome",10,0

section .bss
	number2 resd 1

section .text
	global main
	extern puts
	
main:
	mov eax,dword[number1]
	mov ecx,10
	mov dword[number2],0	

lp:
	xor edx,edx
	div ecx
	mov ebx,edx

	pusha
	mov eax,dword[number2]
	mul ecx
	mov dword[number2],eax
	add dword[number2],ebx
	popa

	cmp eax,0
	jnz lp	

	mov ebx,dword[number1]
	cmp ebx,dword[number2]
	jz success

	push msg2
	call puts
	add esp,4
	jmp end

success:
	push msg
	call puts
	add esp,4

end:
	ret
	  
