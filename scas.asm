section .data
	string db "Tomorrow is sunday",0
section .bss
	string1 resd 1000
section .text
	global main
main:
	mov al,0
	mov ecx,10000
	mov edx,ecx
	mov edi,string
	repne scasb
	sub edx,ecx

	mov ecx,edx
	mov esi,string
	mov edi,string1
	repnz movsb

	mov eax,4
	mov ebx,1
	mov ecx,string1
	int 0x80
	ret
