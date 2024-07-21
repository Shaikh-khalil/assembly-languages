section .data
	msg db "Fibonacci Series is :  ",10,0
	msg1 db "%d",10,0
section .text
	global fibo_02
	extern printf
fibo_02:
	enter 12,0
	
	mov dword[ebp-4],0
	mov dword[ebp-8],1
	mov edx,dword[ebp+8]
	mov dword[ebp-12],edx

	push msg
	call printf
	add esp,4 

lp1:	pusha
	push dword[ebp-4]
	push msg1
	call printf
	add esp,8
	popa

	dec dword[ebp-12]
	mov ecx,dword[ebp-4]
	mov eax,dword[ebp-8]
	mov dword[ebp-4],eax
	add dword[ebp-8],ecx

	cmp dword[ebp-12],0
	jne lp1

	leave
	ret		
