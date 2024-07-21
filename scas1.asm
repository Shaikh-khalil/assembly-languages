section .data
	string db "Tomorrow is sunday monday",10,0
section .bss
	string1 resd 1000
section .text
	global main
	extern puts
main:
	mov al,' '
	mov ecx,10000
	mov edx,ecx
	mov edi,string
	repne scasb
	repne scasb
	mov esi,edi
	mov edx,edi
	repne scasb
	sub edi,esi
	
	mov eax,4
	mov ebx,1
	mov ecx,edx
	mov edx,edi
	int 0x80
	ret
