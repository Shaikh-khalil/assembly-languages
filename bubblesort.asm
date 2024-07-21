section .data
	number dd 36,46,87,23,40
	n dd 5
	show db "%d",10,0
section .text
	global main
	extern printf,scanf

main:
	mov edi,number
	mov edx,dword[n]

lp:
	mov esi,edi

	mov ecx,edx
	sub ecx,1

	mov ebx,dword[esi]
	add esi,4
lp1:
	cmp ebx,dword[esi]
	jle skip
	xchg ebx,dword[esi]

skip:
	add esi,4
	loop lp1	

	mov dword[edi],ebx
	add edi,4
	
	dec edx
	cmp edx,1
	jnz lp

	;;
	mov ecx,dword[n]
	mov edi,number

display:
	pusha
	push dword[edi]
	push show
	call printf
	add esp,8
	popa
	
	add edi,4
	loop display
	
	ret
