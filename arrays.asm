	section .data
	nums db 2, 3, 4
	section .bss
	sum resb 0
	
	section .text
	global _start
	
_start:
	mov ecx, 3
	mov edx, 0
	mov esi, 0
sum_label:
	add edx, [nums + esi]
	inc esi
	loop sum_label
	
	add edx, '0'
	mov [sum], edx
	
	mov eax, 4
	mov ebx, 1
	mov ecx, sum
	mov edx, 1
	int 80h
	
	mov ebx, 0
	mov eax, 1
	int 80h
