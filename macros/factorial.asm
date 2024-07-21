%macro factorial 1
	mov eax,1
	mov ecx,%1
%%lp:	
	mul ecx
	loop %%lp
%endmacro

section .data
	msg db "enter element",10,0
	show db "factorial is %d",10,0
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

	factorial dword[n]

	push eax
	push show
	call printf
	add esp,8
	ret
