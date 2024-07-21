section .data
	msg db " Menu ",10
	    db " 1) Addition ",10
	    db " 2) Substraction ",10
	    db " 3) Multiplication ",10
	    db " 4) Division ",10,0
	msg1 db "Enter the choice :",10,0
	msg2 db "Enter the numbers for operation :",10,0
	msg3 db "Addition is %d ",10,0
	msg4 db "Sustraction is %d ",10,0
	msg5 db "Multiplication is %d ",10,0
	msg6 db "Division is with quotient %d and remainder %d",10,0
	msg7 db "Invalid Choice ",10,0	
	msg8 db "%d",0
section .bss
	n resd 1
	a resd 10
	b resd 20
section .text
	global main
	extern printf,scanf
main:
	push msg
	call printf
	add esp,4
	
	push msg1
	call printf
	add esp,4
	
	push n
	push msg8
	call scanf
	add esp,8
	
	push msg2
	call printf
	add esp,4

	push a
	push msg8
	call scanf
	add esp,8
	
	push b
	push msg8
	call scanf
	add esp,8

	cmp dword[n],1
	je lp1
	cmp dword[n],2
	je lp2
	cmp dword[n],3
	je lp3
	cmp dword[n],4
	je lp4
	cmp dword[n],5
	jge lp5

lp1:	mov eax,dword[a]
	add eax,dword[b]
	push eax
	push msg3
	call printf
	add esp,8
	jmp lp6

lp2:    mov eax,dword[a]
        sub eax,dword[b]
        push eax
        push msg4
        call printf
        add esp,8
        jmp lp6

lp3:    mov eax,dword[a]
        mul dword[b]
        push eax
        push msg5
        call printf
        add esp,8
        jmp lp6

lp4:    mov eax,dword[a]
        div dword[b]
        push edx
	push eax
        push msg6
        call printf
        add esp,12
        jmp lp6

lp5:    push msg7
        call printf
        add esp,4
        jmp lp6

lp6:	ret
