# 条件

1. 无条件跳转
   `jmp`指令，条件执行通常设计将控制转移到不遵循当前正在执行的指令 的指令地址上。控制转移可以是转发，执行一组新指令或反向转移，以重新执行相同的步骤。
2. 有条件跳转
   `j?`指令，根据条件执行。通过中断顺序流来传输控制，并通过更改 ip 中的偏移值来完成。

# cmp

> `cmp`比较两个操作数，用于条件执行。原理是从另一个操作数中减去一个操作数，以比较操作数是否相等。不会改变两个操作数。

```assembly
cmp des, src
```

目标操作数可以在寄存器中，也可以在内存中；源操作数可以是常量，立即数，寄存器或存储器。

例如：

```assembly
cmp dx, 00
je  L7     ;res is 0, jump to l7
```

`cmp`指令通常用于比较循环是否达到需要运行的次数。

```assembly
LP1:
...         ; others instrctions
inc ecx
cmp ecx, 10
jle LP1      ; ecx less or equal to 10, jump to LP1
```

# 无条件跳转

```assembly
jmp label
```

例如：

```assembly
mov ax, 00
mov bx, 00
mov cx, 01

L20:
add ax, 01
add bx, ax
shl cx, 1  ; shift left cx
jmp L20
```

# 有条件的跳转

满足特定的条件：

> e:equal, z:zero, n:not, g:greater, l:less
>
> f:寄存器某一标志位。

用于算术运算符的**带符号数据**的条件跳转：

- `je/jz`测试 zf：跳等于或者跳零
- `jne/jnz`测试 zf：跳不等或者跳不零
- `jg/jnle`测试 of,sf,zf：跳更大或者跳不少于 or 不等于
- `jge/jnl`测试 of,sf：跳大于 or 相等或者跳不少于
- `jl/jnge`测试 of,sf：跳小于或者跳不大于 or 不等于
- `jle/jng`测试 of,sf,zf：跳小于 or 等于或者跳不大于

用于逻辑运算的**无符号数据**的条件跳转：

- `je/jz`: zf
- `jne/jnz`: zf
- `ja/jnbe`测试 cf,zf：跳大于或跳不小于/不等于
- `jae/jnb`测试 cf：跳大于 or 等于或者跳不小于
- `jb/jnae`: cf
- `jbe/jna`: af, cf

有特殊用途的跳转指令并检查标志位的值：

- `jcxz` 如果cx为0则跳转；同理还有`jecxz`
- `jc` 如果cf为1（？）则跳转
- `jnc` 如果cf为0则跳转
- `jo` 如果of为1则跳转（溢出）
- `jno` 如果of为0则跳转
- `jp/jpe` 如果pf置1则跳转或者奇偶位**相等**则跳转（奇偶校验）
- `jnp/jpo` 如果pf置0则跳转或者奇偶位**不相等**则跳转

