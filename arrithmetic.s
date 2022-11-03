section .data
arr times 10 db 0

section .text
global _start

_start:

mov eax,1
mov ebx,0
int 80h
