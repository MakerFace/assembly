segment     .data
arr:    times   10  db  '0'

section     .text
global      _start

_start:
mov         ebx,arr
mov         [ebx], byte 65h
add         ebx,2
mov         [ebx], byte 35h

mov         edx,1
mov         ecx,arr
mov         ebx,1
mov         eax,4
int         80h

mov         edx,1
mov         ecx,arr
add         ecx,1
mov         eax,4
int         80h

mov         ebx,0
mov         eax,1
int         80h