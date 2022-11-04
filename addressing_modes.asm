section     .data
name:   db  'Zara Ali', 0xA
len:    equ $ - name
MY_TABLE TIMES 10 DW 0  ; Allocates 10 words (2 bytes) each initialized to 0

section     .text
global      _start

_start:
call        print_name

mov         [name], dword 'Nuha'
call        print_name

MOV EBX, [MY_TABLE] ; Effective Address of MY_TABLE in EBX
MOV [EBX], word 110  ; MY_TABLE[0] = 110
ADD EBX, 2  ; EBX = EBX +2
MOV [EBX], word 123  ; MY_TABLE[1] = 123

mov         ebx,0
mov         eax,1
int         80h

print_name:
mov         edx,len
mov         ecx,name
mov         ebx,1
mov         eax,4
int         80h
ret         ;! 要返回！
