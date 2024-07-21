section .data
	msg2 db "Enter the count of numbers:",10,0
	msg3 db "Enter the numbers:",10,0
	msg db "Maximum is %d",10,0
	msg1 db "%d",0
section .bss
	number resd 100
	n resd 1
section .text
	global main
	extern printf,scanf
main:	pusha
	push msg2
	call printf
	add esp,4	
	popa

	pusha
	push n
	push msg1
	call scanf
	add esp,8
	popa

	pusha
	push msg3
	call printf
	add esp,4
	popa

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

p:	xor edi,edi
	xor ecx,ecx

lp2:	mov esi,number
	mov eax,4
	mul ecx
	add esi,eax
	cmp edi,dword[esi]
	jg xyz
	mov edi ,dword[esi]

xyz:	inc ecx
	cmp ecx,dword[n]
	jz end2
	jmp lp2	

end2:	pusha
	push edi
	push msg
	call printf
	add esp,8
	popa
	ret	
