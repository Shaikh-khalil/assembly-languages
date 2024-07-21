section .data
	msg2 db "Enter the count of numbers:",10,0
	msg3 db "Enter the numbers:",10,0
	msg db "Addition is %d",10,0
	msg1 db "%d",0
section .bss
	sum resd 1
	number resd 100
	n resd 1
section .text
	global main
	extern printf,scanf
main:	
	push msg2
	call printf
	add esp,4	

	push n
	push msg1
	call scanf
	add esp,8
	
	push msg3
	call printf
	add esp,4
	
	xor ecx,ecx
lp:	mov esi,number
	mov eax,4
	mul ecx
	add esi,eax
	pusha
	push esi
	push msg1
	call scanf
	add esp,8
	popa
	inc ecx
	cmp ecx,dword[n]
	jz p
	jmp lp

p:	
	mov dword[sum],0
	xor ecx,ecx
lp1:	mov esi,number
	mov eax,4
	xor edx,edx
	mul ecx
	add esi,eax
	cmp ecx,dword[n]
	jz end1
	mov ebx,dword[esi]
	add dword[sum],ebx
	inc ecx
	jmp lp1
	
end1:	pusha
	push dword[sum]
	push msg
	call printf
	add esp,8
	popa
	ret	
