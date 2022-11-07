# 内存管理

`sys_brk`系统调用由内核提供，用于分配内存。

```assembly
mov eax, 45 ;* sys_brk
xor ebx, ebx
int 80h
add eax, 16384 ;* 申请长度16KB
```
返回-1或负数则表示出错。

