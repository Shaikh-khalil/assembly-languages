section .data
	msg db "Enter the Number :",10,0
	msg1 db "%d",0
	msg2 db "Fibonacci Series is :  ",10,0
	msg3 db "%d",10,0
section .bss
	n resd 1
section .text
	global main
	extern printf,scanf
main:
	push msg
	call printf
	add esp,4

	push n
	push msg1
	call scanf
	add esp,8

	push msg2
	call printf
	add esp,4 

	xor ecx,ecx
        mov eax,0
        mov ebx,1

lp1:	pusha
	push eax
	push msg3
	call printf
	add esp,8
	popa
	inc ecx
	mov edx,eax
	mov eax,ebx
	add ebx,edx
	cmp ecx,dword[n]
	jne lp1

	ret		
