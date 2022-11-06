	section .bss
	num resb 1
	section .text
	global _start
	
_start:
	
	mov ecx, 9
    mov eax, '1'
    mov [num], eax
l1:
	mov eax, 4
	mov ebx, 1
	push ecx
	mov ecx, num
	mov edx, 1
	int 80h
	mov eax, [num]
    inc eax
    mov [num], eax
	pop ecx
	loop l1
	
	mov ebx, 0
	mov eax, 1
	int 80h
