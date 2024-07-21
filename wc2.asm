section .data
	string db "A compiler comp is a special program that translates a programming language's source code into machine code , bytecode or another programming language. The source code is typically written in a high-level, human-readable language such as Java or C++. A programmer writes the source code in a code editor or an integrated development environment (IDE) that includes an editor, saving the source code to one or more text files. A compiler that supports the source programming language reads the files, analyzes the code , and translates it into a format suitable for the target platform compiler .",10,0
	msg1 db "Enter the word for count :",10,0
	msg2 db "Count is %d",10,0
	msg3 db "%s",0
section .bss
	check_string resd 100
section .text
	global main
	extern printf,scanf
main:
	push msg1
	call printf
	add esp,4
	
	push check_string
	push msg3
	call scanf
	add esp,8
 
	mov edi,string
	xor ecx,ecx
lp3:	mov esi,check_string 
lp:	mov al,byte[esi]
	cmp byte[edi],al
	je lp1
	cmp byte[edi],0
	je lp4
	inc edi
	jmp lp3	
		
lp1:	inc edi
	inc esi
	cmp byte[esi],0
	jne lp
	cmp byte[edi]," "
	je lp2
	jmp lp

lp2:	inc ecx
	jmp lp3

lp4:	pusha
	push ecx
	push msg2
	call printf
	add esp,8
	popa
	ret
