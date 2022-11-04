	extern printf
	
	section .bss
	addr resb 4
	
	section .data
	num db 0x63
    fmt db "0x%x", 10, 0
	
	section .text
	global _start
	
	
_start:
	mov eax, num
    mov [addr], dword eax
    
    push dword [addr]
    push dword fmt
    call printf
    add esp, 8
	
	mov edx, 1
	mov ecx, num
	
	mov ebx, 1
	mov eax, 4
	int 80h
	
	mov ebx, 0
	mov eax, 1
	int 80h
