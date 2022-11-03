[toc]

# 寻址模式

大多数指令需要操作数，可能需要一个，两个或者三个

> 当指令需要两个操作数时，第一个操作数一般作为目标，包含了寄存器或者存储单元的数据，第二个操作数是源。
> 
> 源包含要传递的数据（立即寻址）或数据
> 通常会源数据在操作后保持不变。

# 寄存器寻址

此模式中，寄存器包含操作数，根据指令，寄存器可以是第一个操作数，第二个操作数，或者两者都是。

由于寄存器处理数据不涉及存储器，因此速度最快。

例如：

```assembly
mov     dx, tax_rate    ; regs as first operand
mov     count, dx       ; regs as second operand
mov     eax,ebx
```

# 立即寻址

> 立即数操作数具有常量值或表达式。
>
> 当具有两个操作数的指令使用立即寻址时，第一个操作数可以是寄存器或存储器位置，第二个操作数是立即数
>
> 第一个操作数定义数据的长度。

例如：

```assembly
byte_value  db  150     ; ？
word_value  db  300     ; 
add     byte_value,65   ; 把byte_value加65(立即数,immediate operand)
mov     ax, 45H         ; 把ax置为46H(立即数)
```

# 直接内存寻址

> 在存储器寻址模式中指定操作数时，需要直接访问主存，通常是数据段。
> 这种方式慢于前两种方式。
> 
> 要在存储器中找到数据的位置，需要段起始地址（DS寄存器中），并且加上偏移值。
> 偏移值也称为effective address。

直接寻址模式中，偏移值直接指定为指令的一部分，通常使用变量名称表示。汇编程序计算偏移值并维护一个符号表，该表存储程序中使用的所有变量的偏移值。

直接存储器寻址中，其中一个操作数指的是存储器位置，另一个操作数指的是寄存器。

例如：

```assembly
add     byte_value, dl      ; 把dl中的数据加到byte_value中
mov     bx,word_value       ; 把word_value放入bx寄存器中
```

# 直接偏移寻址

使用算术运算符来修改地址，例如查看定义数据表的以下定义：

```assembly
section     .data
byte_table  db  14, 15, 22, 45          ; table of bytes
word_table  dw  134,345,564,123         ; table of words

section     .text
mov         cl,byte_table[2]            ; 3rd element
mov         cl,byte_table+2             ; 3rd element
mov         cx,word_table[3]            ; 4th element
mov         cx,word_table+3             ; 4th element
```

# 间接内存寻址

> 间接寻址利用计算机的segment:offset寻址能力。
> 通常EBX，EBP存放段基地址；
> DI，SI存放偏移值（方括号内的索引寄存器DI，SI）

间接寻址包含多个元素（如数组）的变量，数组起始地址存储在EBX寄存器中。

例如：

```assembly
section     .data
my_table    times   10  dw  0   ; 10 words(2bytes) with 0

section     .text
mov         ebx,[my_table]      ; 把my_table首地址放入ebx寄存器
mov         [ebx], 110          ;!!ERROR, 不能改数组首地址 my_table[0]=110
mov         ebx,my_table        ; 数组首地址
mov         [ebx], 110          ; 指向内存的值改为110
add         ebx,2               ; my_table[2]
mov         [ebx], 123          ; my_table[2]=123
```
失败，不能给数组赋值，不能打印数组
```assembly
segment     .text
global _start

_start:
mov         ebx,[my_table]

; sub         ah,ah ;? why set 0
; mov         al, '9'
; aas
; mov         [ebx],ax
mov         eax,10
mov         ecx,1
top:
    mov    [ebx],ecx
    add     ecx,1
    add     ebx,1
    dec     eax
    jnz     top
done:

add         ebx,2
sub         ah,ah
mov         al, '2'
aas
mov         [ebx],ax

call        print_msg
mov         edx,1       ; len of print
mov         ebx,1       ; stdout
mov         ecx,[my_table]
mov         eax,4       ; sys_wirte
int         80h
call        print_done

call        print_msg
mov         edx,1       ; len of print
mov         ecx,my_table ;! 数组怎么输出？
sub         ecx,1
mov         ecx,[ecx]   ;? 不需要[ecx]间址访问
mov         ebx,1       ; stdout
mov         eax,4       ; sys_wirte
int         80h
call        print_done


; exit
mov         ebx,0
mov         eax,1
int         80h

print_msg:
mov         edx,len
mov         ecx,msg
mov         ebx,1
mov         eax,4
int         80h
ret

print_done:
mov         edx,dlen
mov         ecx,done_msg
mov         ebx,1
mov         eax,4
int         80h
ret

section     .data
my_table    times   10   db  0
msg         db      "The number is:"
len         equ     $ - msg
done_msg        db      " Done", 0xA ; 为什么不能把两个字符串定义在一起？连在一起
dlen        equ     $ - done_msg
```