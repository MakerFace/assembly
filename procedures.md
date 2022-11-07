# 程序（函数）

程序由名称标识，程序结束由return结束：
```assembly
proc_name:
  proc_body
  ret
```

使用`call`调用程序：
```assembly
call proc_name
```

# 调用堆栈

> 堆栈是存储器中类似于阵列的数据结构，其中数据可以被存储并从称为堆栈的“顶部”的位置移除。 需要存储的数据被“推送”到堆栈中，要检索的数据从堆栈中“弹出”。 Stack是LIFO数据结构，即最后检索的数据是最后检索的。

汇编提供两个指令操作堆栈：
```assembly
push operand
pop  mem/reg
```

> 堆栈段中保留的内存空间用于实现堆栈。 寄存器SS和ESP（或SP）用于实现堆栈。 堆栈的顶部指向插入堆栈的最后一个数据项，由SS:ESP寄存器指向，其中SS寄存器指向堆栈段的开头，SP（或ESP）将偏移量指向堆栈段。

堆栈特征：
- 只有字、双字可以被压到栈中，字节不可以
- 堆栈反向增长，即朝低地址方向增长
- 堆栈顶部执行堆栈最后插入的项，指向插入的最后一个字的低位字节？
