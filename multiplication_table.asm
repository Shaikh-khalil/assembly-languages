section .data
	table db "%d x %d = %d ",10,0
	msg db "which numbers multiplication table you want",10,0
	acc db "%d",0

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
	push acc
	call scanf
	add esp,8	

	mov ecx,1
lp:
	mov eax,dword[n]
	mul ecx
	
	pusha
	push eax
	push ecx
	push dword[n]
	push table
	call printf
	add esp,16
	popa
	
	inc ecx
	cmp ecx,10
	jle lp
	ret
