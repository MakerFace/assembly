[TOC]

# 系统调用

系统调用是用户态调用内核态函数的方式。

## Linux 系统调用

步骤：

- 将系统调用号放在 EAX 寄存器中
- 将参数存储在寄存器 EBX，ECX 等中的系统调用中
- 调用中断（0x80H)
- 读取 EAX 寄存器获取结果

> 有六个寄存器用于存储系统调用的参数：
>
> EBX，ECX，EDX，ESI，EDI，EBP
>
> 如果超过 6 个参数，则第一个参数的存储单元存储在 EBX 寄存器中

示例：

```assembly
mov     eax,1   ;
int     0x80    ; interrupt
```

所有系统调用都放在`/usr/include/ams/unistd.h`，以及他们的编号（在调用`int 0x80`之前放入 EAX 的值，即到底要内核执行哪个函数）。

基本的系统调用：
| EAX | name | EBX | ECX | EDX |
| ---- | ---- | ---- | ---- | ---- |
| 1 | sys_exit | int | - | - | - |
| 2 | sys_fork| struct <br> pt_regs| - | - | - |
| 3 | sys_read | unsigned<br>int | char* | size_t | - |
| 4 | sys_write| unsigned<br>int | const <br>char*| size_t| - |
| 5 | sys_open| const <br>char\*| int | int | - |
| 6 | sys_close| unsigned<br>int| - | - | - |

