section .data
	msg db "Number of arguments are %d ",10,0
	arg db "argument %d is %s",10,0
	msg1 db "Addition is %d",10,0
section .text
	global main
	extern atoi,printf
main:	enter 0,0
	mov ecx,dword[ebp+8]    ;argc
	
	push ecx
	push msg
	call printf
	add esp,8
	
	mov esi,dword[ebp+12]   ;*argv
	mov ecx,dword[esi+4]		;**argv
	push ecx
	call atoi
	add esp,4

	mov ebx,eax
	mov ecx,dword[esi+8]
	push ecx
	call atoi
	add esp,4

	add ebx,eax
	push ebx
	push msg1
	call printf
	add esp,8
	
	leave 
	ret
