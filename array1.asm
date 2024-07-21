section .data
	msg db "AAP",10,0
section .text
	global main
main:
	mov eax ,4	; system call number
	mov ebx,1	; first parameter of system call
	mov ecx,msg	; second parameter of system call
	mov edx,3	; third parameter of system call
	int 0x80	; call to system call number specifird in eax
	ret 
