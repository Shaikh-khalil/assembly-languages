section .data
	msg db "low level ",10,0
	msg1 db "The string is palindrome ",10,0
	msg2 db "The string is not palindrome",10,0
section .text
	global main
	extern printf
main:	
	push msg
	call printf
	add esp,4
	
	mov esi,msg
	mov edi,msg
	
	
	
