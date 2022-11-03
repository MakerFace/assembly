	section .data
	arr times 2 db 0
	
hinta db "enter a:"
	len equ $ - hinta
hintb db "enter b:"
	
	hintsum db " sum is "
	slen equ $ - hintsum
	
	newline db "", 0xA
	nlen equ $ - newline
	
	split db ", "
	
	section .bss
	sum resb 1
	
	section .text
	global _start
	
_start:
	mov edx, len
	mov ecx, hinta
	call print_hint
	mov ecx, arr
	mov edx, 1
	call read_nums
	
	mov edx, len
	mov ecx, hintb
	call print_hint
	mov ecx, arr
	inc ecx
	mov edx, 1
	call read_nums
	
	;! mov ecx, arr ; 取arr第一个元素，此时inc ecx访问越界
	mov ecx, [arr]               ;! 取arr的首地址，而不取arr第一个元素
	mov eax, ecx
	inc ecx
	mov ebx, ecx
	sub eax, '0'                 ; * - '0' 变为十进制数
	sub ebx, '0'
	add eax, ebx
	add eax, '0'                 ; * + '0' 变为可见ascii码
	mov [sum], eax
	
	mov edx, 1
	mov ecx, arr
	call print_num
	
	mov edx, 1
	mov ecx, split
	call print_num
	
	mov ecx, arr
	inc ecx
	call print_num
	
	mov edx, slen
	mov ecx, hintsum
	call print_hint
	
	mov edx, 1
	mov ecx, sum
	mov ebx, 1
	mov eax, 4
	int 80h
	; add ecx, nlen
	; call print_num
	
	call println
	
	call exit
	
	
read_nums:
	mov ebx, 0                   ; * stdin
	mov eax, 3                   ; * sys_read
	int 80h                      ; * call kernal
	
	;! read enter
	mov eax, 54                  ; * sys_ioctl
	mov ebx, 0                   ; * stdin
	mov ecx, 0x540B              ; * tcflush
	xor edx, edx                 ; * edx=0 tciflush
	int 80h
	ret
	
print_num:
	mov ebx, 1                   ; * stdout
	mov eax, 4                   ; * sys_write
	int 80h                      ; * call kernel
	ret
	
print_hint:
	mov ebx, 1
	mov eax, 4
	int 80h
	ret
	
println:
	mov edx, nlen
	mov ecx, newline
	mov ebx, 1
	mov eax, 4
	int 80h
	ret
	
exit:
	mov ebx, 0
	mov eax, 1
	int 80h
