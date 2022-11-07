	section .data
	file_name db 'myfile.txt', 0
	msg db 'hello world', 0xA
	len equ $ - msg
	msg_done db 'written to file', 0xA
	len_done equ $ - msg_done
	section .bss
	fd_out resb 1
	fd_in resb 1
	info resb 26
	num resb 1
	
	section .text
	global _start
	
_start:
	mov eax, 8                   ; sys_creat
	mov ebx, file_name
	mov ecx, 0777
	int 80h
	
	mov [fd_out], eax            ; 结果(fd)存储在eax中
	
	; 输出文件描述符
	mov eax, [fd_out]
	add eax, '0'
	mov [num], eax
	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 1
	int 80h
	
	; write msg to file
	mov eax, 4
	mov ebx, [fd_out] ;! 应该使用[]取fd_out中存储的值，而不是使用fd_out的地址！
	mov ecx, msg
	mov edx, len
	int 80h
	
	; close file
	mov eax, 6
	mov ebx, [fd_out]
	int 80h
	
	; print hint
	mov eax, 4
	mov ebx, 1
	mov ecx, msg_done
	mov edx, len_done
	int 80h
	
	; open file
	mov eax, 5
	mov ebx, file_name
	mov ecx, 0                   ; read only
	mov edx, 0644                ;? why is 0777, why need file mode
	int 80h
	mov [fd_in], eax
	
	; read from file
	mov eax, 3
	mov ebx, [fd_in]
	mov ecx, info
	mov edx, 26
	int 80h
	
	; close file
	mov eax, 6
	mov ebx, [fd_in]
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, info
	mov edx, 26
	int 80h
	
	mov eax, 1
	mov ebx, 0
	int 80h
