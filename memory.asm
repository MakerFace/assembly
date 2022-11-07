    section .data
    msg db "Allocated 16KB of memory!", 0xA, 0
    len equ $ - msg
	section .text
	global _start
	
_start:
	mov eax, 45                  ; sys_brk
	xor ebx, ebx                 ; 申请0B？
	int 80h
	
	add eax, 16384               ; 申请16KB内存
	mov ebx, eax
	mov eax, 45
	int 80h
	
	cmp eax, 0
	jl exit                      ; 错误代码在ebx中
	
	mov edi, eax                 ; 申请结果在eax中
	sub edi, 4                   ; 指向最低位的 dword（双字）
	mov ecx, 4096
	xor eax, eax
	std                          ;! ??
	rep stosd                    ;! ??
	cld                          ; 置位
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 80h

exit:
	mov eax, 1
	xor ebx, ebx
	int 80h
