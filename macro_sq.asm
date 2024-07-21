%macro sq 1
	mov ecx,1
%%lp:	cmp ecx,%1
	jg %%lp1
	mov eax,ecx
	mul ecx
	pusha
	push eax
	push msg3
	call printf
	add esp,8
	popa
	inc ecx
	jmp %%lp
%%lp1:
%endmacro
section .data
	msg db "Enter the number:",10,0
	msg1 db "%d",0
	msg2 db "Square are:",10,0
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

	sq dword[n]
	ret	 
