section     .data
msg1    db  'hello, programmers!', 0xA
len1    equ $ - msg1

msg2    db  'welcome to the world of,',0xA
len2    equ $ - msg2

msg3    db  'Linxu assembly programming!',0xA
len3    equ $ - msg3

SYS_EXIT    equ 1
SYS_WRITE   equ 4
STD_IN      equ 0
STD_OUT     equ 1

section     .text
  global    _start

_start:
  mov       eax,SYS_WRITE
  mov       ebx,STD_OUT
  mov       ecx,msg1
  mov       edx,len1
  int       80h

  mov       eax,SYS_WRITE
  mov       ebx,STD_OUT
  mov       ecx,msg2
  mov       edx,len2
  int       80h

  mov       eax,SYS_WRITE
  mov       ebx,STD_OUT
  mov       ecx,msg3
  mov       edx,len3
  int       80h

  mov       ebx,0
  mov       eax,SYS_EXIT
  int       80h