section .data
	msg db "How many elements you want to enter",10,0
	acc db "%d",0
	show db "%d",10,0
	msg2 db "Enter elements",10,0
	msg3 db "Third maximum is",10,0
section .bss
	n resd 1
	number resd 100

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

	push msg2
	call printf
	add esp,4

	mov ecx,dword[n]
	mov esi,number
accept:
	pusha
	push esi
	push acc
	call scanf
	add esp,8
	popa
	
	add esi,4
	loop accept
	

	mov edi,number
	mov edx,dword[n]
lp1:
	mov ecx,edx
	dec ecx
	mov esi,edi
	mov ebx,dword[esi]
	add esi,4
lp2:
	cmp ebx,dword[esi]
	jle skip

	xchg ebx,dword[esi]

skip:
	add esi,4
	loop lp2

	mov dword[edi],ebx
	add edi,4
	dec edx
	cmp edx,1
	jnz lp1

	push msg3
	call printf
	add esp,4
	
	mov ecx,dword[n]
	mov esi,number
display:
	cmp ecx,3
	jz dis2

	add esi,4
	dec ecx
	jmp display

dis2:	
	pusha
	push dword[esi]
	push show
	call printf
	add esp,8
	popa
	
	ret
