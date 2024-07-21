section .data
	source db "10 Abhay M Msc B23",10
		db "27 Akshada F Msc B23",10
		db "34 Vaishnavi F Msc B21",10
		db "44 Shreyash M Mca B22",10
		db "50 Minal F Mca B23",10,
		db "54 Kunika F Mca B23",10
		db "78 Piyush M Msc B20",10,
		db "92 Sayali F Msc B22",10,0
	gender db "F",0
	course db "Msc",0
	len equ $-course
	batch db "B23",0
	len1 equ $-batch
section .bss
	dest resd 100
section .text
	global main
	extern puts
main:
	mov edi,source
lp:	cmp byte[edi],0
	je lp2
	mov ecx, 100
	mov al,' '
	repne scasb
	mov edx,edi
	repne scasb
	mov ebx,edi
	
	sub ebx,edx		;checks student is female or not
	mov esi,gender
	cmpsb
	jne lp1
	
	inc edi			;checks the msc
	mov ecx,len
	dec ecx
	mov esi,course
	repe cmpsb
	jne lp1
	
	inc edi			;checks the batch is 23
        mov ecx,len1
	dec ecx
        mov esi,batch
        repe cmpsb
        jne lp1

	inc edi
	mov ecx,edx
	mov eax,4
	mov edx,ebx
        mov ebx,1
        int 0x80
	
lp1:	mov al,10
	mov ecx, 100
	repne scasb
	inc edi
	jmp lp	

lp2:	ret
        	
