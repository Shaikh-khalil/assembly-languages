section .data
	msg db "Enter number:",10,0
	input db "%d",0
section .bss
	n resd 1
section .text
	global main
	extern fact_02,fibo_02,mult_02,printf,scanf
main:
	push msg	
	call printf
	add esp,4
	push n
	push input
	call scanf
	add esp,8

	push dword[n]
	call fact_02
	call fibo_02
	call mult_02
	add esp,4

	ret
