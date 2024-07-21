
section .data
	msg db "How many numbers you want to enter",10,0
	msg2 db "Enter numbers",10,0
	msg3 db "Sorted elements are",10,0
	show db "%d",10,0
	acc db "%d",0	

section .bss
	number resd 50
	n resd 1
section .text
	global main
	extern printf,scanf

main:
	push msg
	call printf
	add esp,4
;;
	push n
	push acc 
	call scanf
	add esp,8
;;
	push msg2
	call printf
	add esp,4
;;
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
	;;;

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
;;
	mov dword[edi],ebx
	add edi,4
	
	dec edx
	cmp edx,1
	jnz lp
;;

	push msg3
	call printf
	add esp,4
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
