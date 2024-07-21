section .data
	string db "A is A a is a a is different than A ",10,0
	msg db "Count is : %d",10,0

section .text
	global main
	extern printf
main:
	xor ecx,ecx
	mov esi,string
lp:	cmp byte[esi],0
	je endl
	cmp byte[esi]," "
	je skip2
	cmp byte[esi],"A"
	jne skip1
lp2:	inc esi
	cmp byte[esi]," "
	je skip
	cmp byte[esi],10
	jmp skip2  
	
skip1:	cmp byte[esi],"a"
	je lp2
	jmp skip2
	
skip:   inc ecx
        
skip2:  inc esi
	jmp lp

endl:	pusha
	push ecx
	push msg
	call printf
	add esp,8
	popa
	ret
