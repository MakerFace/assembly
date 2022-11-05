	extern printf
	
	section .bss
	addr resb 4
	
	section .data
	num db 63h
	fmt db "addr=0x%x, value=%d", 10, 0
	even_msg db "Even Number!", 0xA
	even_len equ $ - even_msg
	odd_msg db "Odd Number!", 0xA
	odd_len equ $ - odd_msg
	
	section .text
	global _start
	
	
_start:
	; mov eax, num
	; mov [addr], dword eax
	
	; call printf, push args to stack
	; push dword num
	; push dword addr
	; push dword fmt
	; call printf
	; add esp, 8
	
	; and ins
	mov al, 9h                   ; getting 8 in the ax
	and al, 1                    ; and ax with 1
	jz evnn
	
	mov eax, 4
	mov ebx, 1
	mov ecx, odd_msg
	mov edx, odd_len
	int 80h
	jmp done
	
evnn:
	mov ah, 09h
	mov eax, 4
	mov ebx, 1
	mov ecx, even_msg
	mov edx, even_len
	int 80h
	
done:                         ; and ins done
	
	; mov edx, 1
	; mov ecx, num
	; mov ebx, 1
	; mov eax, 4
	; int 80h
	
	; or ins
	mov eax, 5
	mov ebx, 3
	or eax, ebx
	add eax, byte '0'            ; convert decimal to ascii
	mov [num], eax               ;! mov to num
	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 1
	int 80h
	; or ins done
	
	mov ebx, 0
	mov eax, 1
	int 80h
