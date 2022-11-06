	section .data
	msg db "num=", 0xA
	len equ $ - msg
	nums1 db '99999'
	nums2 db '99999'
	section .bss
	res resb 1
	sum resb 5
	
	section .text
	global _start
	
_start:
	; ascii码表示法
	; xor ah, ah
	; mov al, '9'
	; sub al, '3'
	
	; or al, 30h ; '6' is 0x36h, equal to add al, '0'
	; mov [res], ax ; why not al?
	
	; mov eax, 4
	; mov ebx, 1
	; mov ecx, msg
	; mov edx, len
	; int 80h
	
	; mov eax, 4
	; mov ebx, 1
	; mov ecx, res
	; mov edx, 1
	; int 80h
	
	; ASCII表示法
	mov esi, 4
	mov ecx, 5
add_loop:
	mov al, [nums1 + esi]
	adc al, [nums2 + esi]        ;? 怎么处理进位？
	aaa                          ; * 加完后变为ascii二进制，进位？
	pushf                        ;! 保存进位标志，f=flag
	or al, 30h                   ; + '0'
	popf                         ;! 恢复进位标志到标志寄存器中
	mov [sum + esi], al
	dec esi
	loop add_loop
	
	;! 最高位无法进位
	
	mov eax, 4
	mov ebx, 1
	mov ecx, sum
	mov edx, 5
	int 80h
	
	mov ebx, 0
	mov eax, 1
	int 80h
