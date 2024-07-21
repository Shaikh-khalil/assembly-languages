	section .text
	global main
main:
	;; 	mov eax,10  lp:	dec eax  jmp lp
	mov eax,10
lp:	dec eax
	jz lp
	mov eax,10
	

	ret
