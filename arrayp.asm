section .data
	msg dd "Enter the count of elements in array :",10,0
	msg1 dd "Enter the elements in array :",10,0
	msg2 dd "%d",10,0
	msg3 dd "The count of %d is in array : %d ",10,0
section .bss
	number resd 100
	n resd 1
section .text
	global main
	extern printf,scanf
main:
	push msg
	call printf
	add esp,4
	
	push n
	push msg2
	call scanf	
	add esp,8
	
	push msg1
	call printf
	add esp,4

	xor ecx,ecx
lp:     mov esi,number
        mov eax,4
        mul ecx
        add esi,eax
        pusha
        push esi
        push msg2
        call scanf
        add esp,8
        popa
        inc ecx
        cmp ecx,dword[n]
        jz p
        jmp lp
	
p:	xor ecx,ecx
	xor esi,esi
	xor ebx,ebx
	mov esi,number
	sub esi,4
lp1:	add esi,4
	mov edi,esi
	cmp ecx,dword[n]
	je lp4
	inc ecx
	xor eax,eax

lp5:	mov ebx,ecx	
	add edi,4
	inc ebx
	cmp ebx,dword[n]
	je lp3
	mov edx,dword[edi]
	cmp dword[esi],edx
	je lp2
	jmp lp5

lp2:	inc eax
	jmp lp5	
	
lp3:	push eax
	push dword[esi]
	push msg3
	call printf
	add esp,12
	jmp lp1
	
lp4:	ret
