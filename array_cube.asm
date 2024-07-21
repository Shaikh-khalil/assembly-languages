section .data
	msg db "Enter the count of numbers in array :",10,0
	msg1 db "Enter the elements in array :",10,0
	msg2 db "The cube of elements are  :",10,0
	msg3 db "%d",0
	msg4 db "%d",10,0
section .bss
	n resd 1
	arr resd 100
section .text
	global main
	extern printf,scanf
main:
	push msg
	call printf
	add esp,4

	push n
	push msg3
	call scanf
	add esp,8

	push msg1
	call printf
	add esp,4

	xor ecx,ecx
	mov esi,arr

lp:	mov eax,4
	mul ecx
	add esi,eax
	cmp ecx,dword[n]
	je lp1
	pusha
	push esi
	push msg3
	call scanf
	add esp,8
	popa
	inc ecx
	jmp lp
	
lp1:	push msg2
	call printf
	add esp,4

	mov esi,arr
	xor ecx,ecx

lp2:	mov eax,4
	mul ecx
	add esi,eax
	cmp ecx,dword[n]
	je end

	mov eax,dword[esi]
	mov ebx,eax
	mul eax
	mul ebx	
	inc ecx

	pusha
	push eax
	push msg4
	call printf
	add esp,8
	popa
	
	jmp lp2

end: 	ret	
