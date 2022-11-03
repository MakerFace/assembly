	segment .text
	global _start
	
_start:
	
	; sub ah, ah ;? why set 0
	; mov al, '9'
	; aas
	; mov [ebx], ax
	mov edx, llen
	mov ecx, loop_msg
	mov ebx, 1
	mov eax, 4
	int 80h
	
	mov ebx, my_table
	mov eax, 10
	mov ecx, 0
	mov edx, 'a'
top:
	mov [ebx], edx
	add ecx, 1
	add ebx, 1
	add edx, 2
	dec eax
	jnz top
done:
	
	call print_msg
	mov edx, 1                   ; len of print
	mov ecx, my_table            ; * 输出数组第一个元素
	mov ebx, 1                   ; stdout
	mov eax, 4                   ; sys_wirte
	int 80h
	call print_done
	
	call print_msg
	mov edx, 1                   ; len of print
	mov ecx, my_table            ;! 数组怎么输出？
	add ecx, 2
	mov ebx, 1                   ; stdout
	mov eax, 4                   ; sys_wirte
	int 80h
	call print_done
	
	
	; exit
	mov ebx, 0
	mov eax, 1
	int 80h
	
print_msg:
	mov edx, len
	mov ecx, msg
	mov ebx, 1
	mov eax, 4
	int 80h
	ret
	
print_done:
	mov edx, dlen
	mov ecx, done_msg
	mov ebx, 1
	mov eax, 4
	int 80h
	ret
	
	section .data
	my_table times 10 db 0
	loop_msg db 'loop for assign', 0xA
	llen equ $ - loop_msg
msg db "The number is:"
	len equ $ - msg
	done_msg db " Done", 0xA     ; 为什么不能把两个字符串定义在一起？连在一起
	dlen equ $ - done_msg
