# 逻辑指令

第一个操作数可以是寄存器，也可以内存；第二个操作数可以是寄存器/内存/立即数/常量。但是内存和内存是不行的。这些指令比较或匹配操作数的位，并设置：`CF`, `OF`, `PF`, `SF`, `ZF`标志。

# and

按位与：

```assmebly
and op1,op2
```

可用于清除一个或多个位。例如，BL 寄存器包含 `0011 1010`，如果要清除高位，则与`0x0F`进行`and`。
```assembly
and bl,0x0f
```

检查一个数是否是偶数，与`0x1`。
```assembly
and al,0x1
jz  even_number
```

# or

按位或：

```assembly
or op1,op2
```

可用于设置一个或多个位。例如设置四个低位：
```assembly
or bl, 0fh
```

# xor

按位异或：

```assembly
xor op1,op2
```

用于清除寄存器：
```assembly
xor eax,eax
```

# test

test指令与and指令操作作用相同，但是不改变第一个操作数。

# not
