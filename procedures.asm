	; sum two num
	section .data
	num1 db 3
	num2 db 5
	achar db '0'
	
	section .bss
	res resw 1
	
	section .text
	global _start
	
_start:
	
	; 通过参数压栈调用
	; 1. 操作数压栈
	mov ebx, ebp
	sub ebx, 8
	mov ecx, [num1]
	mov [ebx], ecx               ; 操作数1存储在ebp - 4
	add ebx, 4
	mov ecx, [num2]              ; 操作数2存储在ebp - 3
	mov [ebx], ecx
	; 2. 结果存储在ebp - 2
	; 3. ebp压栈，存储在ebp - 1
	push ebp
	; 4. 调用函数
	call sum_nums

	add esp, 1
	
	; mov ebx, ebp
	; sub ebx, 1
	; mov eax, [ebx]
	; add eax, '0'
	; mov [res], eax
	
	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 80h
	
	mov eax, 1
	mov ebx, 0
	int 80h
	
	; sum_nums:
	; add eax, ebx
	; ret
	
	
sum_nums:                     ; return num1 + num2
	mov ebx, ebp
	add ebx, 8                   ; 取操作数1
	mov eax, [ebx]
	sub ebx, 4                   ; 取操作数2
	mov ebx, [ebx]
	add eax, ebx

	sub ebx, 1
	mov [ebx], eax ; 存放结果
	ret

	; display charset
	; call display
	; mov eax, 1
	; mov ebx, 0
	; int 80h
	
	; display:
	; mov ecx, 79
	; next:
	; push ecx
	; mov eax, 4
	; mov ebx, 1
	; mov ecx, achar
	; mov edx, 1
	; int 80h
	; pop ecx
	; mov dx, [achar]
	; cmp byte [achar], 0dh
	; inc byte [achar]
	; loop next
	; ret
	; mov eax, [num1]
	; mov ebx, [num2]
	; call sum_nums
	; add eax, '0'
	; mov [res], eax
