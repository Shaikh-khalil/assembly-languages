section .data
	a dd 10
	b dd 28
	msg db "Addition is %d",10,0
	msg1 db "Substraction is %d",10,0
section .bss
	sum resd 1
section .text
	global main
	extern printf
main:
	mov ecx,dword[a]
	add ecx,dword[b]
	mov dword[sum],ecx
	pusha

        push dword[sum]
        push msg
        call printf
        add esp,8
	popa

	mov eax,dword[a]
        sub eax,dword[b]
	sub ecx,eax
        mov dword[sum],eax

	push dword[sum]
	push msg1
 	call printf
	add esp,8
	
	add ecx,eax
	
	ret
