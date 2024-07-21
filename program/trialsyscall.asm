	;; 
	;; #include<stdio.h> main(){printf("AAP");}
	section .data
	msg db "AAP",0
	msg2 db "Low Level"
	section .text
	global main
	extern printf
main:
	mov eax,1		; system call number
	mov ebx,1		; first parameter of system call
	mov ecx,msg		;second parameter of system call
	mov edx,10		;third parameter of system call
	int 0x80 		; call to system call number specified in eax

	push msg
	call printf
	add esp,4
	
	ret
