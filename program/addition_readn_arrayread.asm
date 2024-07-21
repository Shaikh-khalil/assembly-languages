section .data
	msg db "Addition is %d",10,0
	msg1 db "%d",0
	msg2 db "%d",10,0
section .bss
	sum resd 1
	number  resd 100
	n resd 1
section .text
	global main
	extern printf,scanf
main:
;;; read size of array
	push n
	push msg1
	call scanf
	add esp,8 		; scanf("%d",&n);

	xor ecx,ecx
lp:	mov esi,number
	mov eax,4
	mul ecx
	add esi,eax
	pusha
	push esi
	push msg1
	call scanf
	add esp,8
	popa
	inc ecx
	cmp ecx,dword[n]
	jz p
	jmp lp
p:	xor ecx,ecx
lp1:	mov esi,number
	mov eax,4
	mul ecx
	add esi,eax
	pusha
	push dword[esi]
	push msg2
	call printf
	add esp,8
	popa
	inc ecx
	cmp ecx,dword[n]
	jz end1	
	jmp lp1
end1:
	xor edi,edi
	xor ecx,ecx
lp3:	mov esi,number
	mov eax,4
	mul ecx
	add esi,eax
	add edi,dword[esi]
	inc ecx
	cmp ecx,dword[n]
	jz end2	
	jmp lp3
end2:	push edi
	push msg
	call printf
	add esp,8
	ret
