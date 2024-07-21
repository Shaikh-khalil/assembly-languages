section .data
	string1 db "'23111046',khalil shaikh,m,msc,2023",10
		db "'23111040',piyush tiwari,m,msc,2023",10
		db "'23324600',priya kadam,f,msc,2023",10
		db "'23111020',pratik gaikwad,m,msc,2023",0
	len equ $-string1

section .text
	global main
	extern puts,printf

main:
	mov ecx,len
	mov edi,string1

	mov al,','
lp:	repne scasb
	mov edx,edi
	mov esi,edi		;;;esi ==== address of first name

	mov al,' '
	repne scasb
	mov ebx,edi
	sub ebx,edx 		;;;edx ===== length of first name

	mov al,','
	repne scasb

	cmp byte[edi],'m'		;;campare gender as m
	jnz failure

	pusha
	mov edx,ebx
	mov eax,4
	mov ebx,1
	mov ecx,esi
	int 0x80		;;print name

	mov eax,4
	mov ebx,1
	mov byte[ecx],10
	mov edx,1
	int 0x80
	popa

failure:	
	mov al,','
	repne scasb
	repne scasb

	cmp byte[edi],0
	jnz lp
	ret


