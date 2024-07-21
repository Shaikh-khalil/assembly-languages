	section .text
	global main
main:
	mov eax,526
	mov edx,0
	mov ecx,25
	mov ebx,50
	;; mul ecx
	div ecx
	ret
