section .data
userMsg db 'enter number:'
lenUserMsg equ $ - userMsg
dispMsg db 'entered number:'
lenDispMsg equ $ - dispMsg

section .bss
num resb 5              ; resb伪指令，reserve bytes申请5个字节并填充0

section .text
global _start

_start:
  mov   eax,4           ; system_write
  mov   ebx,1           ; stdout
  mov   ecx,userMsg     ; string to print
  mov   edx,lenUserMsg  ; len of string
  int   80h             ; call kernel

  ; read and store user input
  mov   eax,3           ; system_read
  mov   ebx,2           ; stdin? why not 0?
  mov   ecx,num         ; read to num(char*)
  mov   edx,5           ; size of number
  int   80h

  ; display hint
  mov   eax,4
  mov   ebx,1
  mov   ecx,dispMsg
  mov   edx,lenDispMsg
  int   80h

  ; display entered number
  mov   eax,4
  mov   ebx,1
  mov   ecx,num
  mov   edx,5
  int   80h

  ; exit
  mov   eax,1
  mov   ebx,0
  int   80h