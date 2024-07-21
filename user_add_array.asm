
section .data
	msg db "How many elements you want to enter",10,0
	acc db "%d",0
	show db "%d",10,0
	msg2 db "Enter element :",10,0
	msg3 db "addition is : ",0
section .bss 
	n resd 1
	number resd 100
	ad resd 1

section .text
	global main
	extern scanf,printf

main:
	push msg
	call printf
	add esp,4

	push n
	push acc
	call scanf
	add esp,8

	push msg2
	call printf
	add esp,4
	
	mov ecx,dword[n]
	mov esi,number
lp:
	pusha
	push esi
	push acc
	call scanf
	add esp,8
	popa

	add esi,4
	loop lp
	;;;;;

	push msg3
	call printf
	add esp,4

	xor edx,edx
	mov ecx,dword[n]
	mov esi,number

lp1:
	add edx,dword[esi]

	add esi,4
	loop lp1
		
	mov dword[ad],edx
	
	push dword[ad]
	push show
	call printf
	add esp,8

	ret
