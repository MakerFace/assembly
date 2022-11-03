# 变量

1. 分配空间

   `[variable-name] define-directive initial-value [,initial-value]...`

   define 有五种形式：

   - db: byte 1byte
   - dw: word 2bytes
   - dd: 2word 4bytes
   - dq: 4word 8bytes
   - dt: 10byte 10bytes

   注意：

   - 字符的每个字节以十六进制的 ASCII 码存储
   - 每个十进制值自动转为十六进制等效值存储
   - 处理器使用小端序排列
   - 负数转换为补码存储
   - 短和长浮点数分别使用 32/64 位表示

2. 分配未初始化存储空间

   保留指令用于未初始化数据保留空间。

   - resb: 1byte
   - resw: 1word
   - resd: doubleword
   - resq: quadword
   - rest: 10bytes

3. 多次初始化

   `times` 指令用于多次初始化相同的值

   `name times 10 db 0`

# 常量

1. equ指令

   equ指令用于定义常量

   `constant-name equ expression`

   表达式可以是一个数，也可以是常量表达式

   ```assembly
   len equ 20
   wid equ 10
   area equ len*wid
   ```

   例如：
   ```assembly
   len  equ  50
   mov  ecx, len
   cmp  eax, ecx
   ```

2. %assign

   可以重新定义equ指令定义的数字常量：

   `%assign len 10`

   指令区分大小写。

3. %define

   %define指令允许定义数字和字符串常量：

   ```assembly
   %define ptr [ebp+4]
   ```

   使用到ptr的地方就替换位[ebp+4]

   允许重新定义，区分大小写。