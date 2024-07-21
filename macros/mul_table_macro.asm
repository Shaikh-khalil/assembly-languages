
%macro table 1
	mov ecx,1
%%lp:	
	mov eax,%1
	mul ecx

	pusha
	push eax
	push ecx
	push %1
	push show
	call printf
	add esp,16
	popa

	inc ecx
	cmp ecx,10
	jle %%lp
%endmacro

section .data
	msg db "enter element",10,0
	show db "%d x %d = %d",10,0
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

	table dword[n]
	
	ret
