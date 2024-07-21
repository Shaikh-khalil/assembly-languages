section .data
	string db "Low level programming",0
	msg db "Length of the string is %d",10,0
section .text
	global main
	extern printf,scanf
main:
	mov eax,string
	xor ecx,ecx
lp:	cmp byte[eax],0
	jz lp1
	inc eax       
	inc ecx
	jmp lp
lp1:	push ecx
	push msg
	call printf
	add esp,8
	ret
