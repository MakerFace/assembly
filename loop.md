# 循环

jmp 可以实现循环。

jmp：

```assembly
mov cl, 10
L1:
...
dec cl
jmp l1
```

但是使用 loop 可以实现：
`loop label`

> *label*是标识目标指令的目标标签，`loop`指令检查 ECX 寄存器保存循环计数器。执行`loop`指令时，ECX 寄存器递减，控制跳转到*label*，直到 ECX 寄存达到零值。

例如：

```assembly
mov ecx, 10
l1:
...
loop l1
```