section .data
	msg db "Enter the String: ",10,0
	msg1 db "%s",0
section .bss
	string resb 100
section .text
	global main
	extern puts,printf,scanf,length
main:
	push msg
	call printf
	add esp,4

	mov eax,3
        mov ebx,0
        mov ecx,string
        mov edx,10
        int 0x80
	
	push string
	call length
	add esp,4
	
	ret

