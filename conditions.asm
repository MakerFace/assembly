	section .data
msg db "the largest digit is: ", 0xA
	len equ $ - msg
	line db 0xA
	num1 dd '47'
	num2 dd '22'
	num3 dd '31'
	
	section .bss
	largest resb 2
	
	section .text
	global _start
	
_start:
	mov eax, [num1]              ;!!!!!!间接寻址，把num1的值放入eax中
	mov ebx, [num2]              ;!!!! mov ebx, num2是把num2的地址放入ebx中
	cmp eax, ebx
	jg label1
	; * num1 <= num2
	mov eax, ebx                 ; * let eax = num2
	jmp label1
	
	; * num1 >= num2
label1:
	mov ebx, [num3]
	cmp eax, ebx
	jg label2
	; * num3 >= largest
	mov eax, ebx
	jmp label2
	
	; * num1 > num3
label2:
	mov [largest], eax
	; * print hint
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 80h
	
	; * print num1
	mov eax, 4
	mov ebx, 1
	mov ecx, largest
	mov edx, 2
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, line
	mov edx, 1
	int 80h
	
	mov eax, 1
	mov ebx, 0
	int 80h
