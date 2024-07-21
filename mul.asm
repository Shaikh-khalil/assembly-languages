section .text
	global main
	;extern printf
;section .data
	;msg db " Multiplication = %d ",10,0
main:
	mov eax ,526
	mov edx,0
	mov ecx,25
	mov ebx,50
	mul ecx
	push eax
	;push msg
	;call printf
	add esp,4
	;div ecx
	ret
