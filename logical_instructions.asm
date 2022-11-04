	segment .data
	num dw 0x00111010
	
	section .text
	global _start
	
_start:
	
	mov cl, num
	and cl, 0fh

    mov edx, 1
    mov ecx, 'a'

    mov ebx, 1
    mov eax, 4
    int 80h

    mov ebx, 0
    mov eax, 1
    int 80h