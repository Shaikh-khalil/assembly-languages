section .data
	msg1 db "Enter the number : ",10,0
	msg2  db "%d",0
	msg db " %d * %d = %d ",10,0 
section .bss
	n resd 1
section .text
	global main
	extern printf,scanf
main:
	pusha
	push msg1
	call printf
	add esp,4
	popa

	pusha
	push n 
	push msg2
	call scanf
	add esp,8
	popa

	mov ecx,1
lp:	mov eax,dword[n]
	xor edx,edx
	mul ecx
	pusha
	push eax
	push dword[n]
	push ecx
	push msg
	call printf
	add esp,16
	popa
	inc ecx
	cmp ecx,10
	jle lp
	ret
