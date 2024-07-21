section .data
	string db "A compiler is a special program that translates a programming language's source code into machine code , bytecode or another programming language. The source code is typically written in a high-level, human-readable language such as Java or C++ . A programmer writes the source code in a code editor or an integrated development environment (IDE) that includes an editor, saving the source code to one or more text files. A compiler that supports the source programming language reads the files, analyzes the code , and translates it into a format suitable for the target platform.",10,0
	msg2 db "Count is %d",10,0
section .text
	global main
	extern printf,scanf
main:
	mov edi,string
	xor ecx,ecx
lp3:	mov eax,4
	cmp byte[edi],0
	je lp5
	cmp byte[edi]," "
	je lp
	jmp lp4
	
lp:	inc edi
	dec eax
	cmp eax,0
	je lp1
	jmp lp

lp1:	cmp byte[edi]," "
	je lp2
	jmp lp4

lp2:	inc ecx
	jmp lp4

lp4:	inc edi
	jmp lp3

lp5:	pusha
	push ecx
	push msg2
	call printf
	add esp,8
	popa
	ret
