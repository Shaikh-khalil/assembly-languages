section .data
	a dd 2
	b dd 5
	c dd 10
	d dd 4
section .text
	global main
main: 
	fild dword[a]
	fild dword[d]
	fmul st0,st1

	fild dword[c]
	fmul st0,st1
	fchs

        fild dword[b]
        fild dword[b]
        fmul st0,st1
	fadd st0,st3
	ret	
