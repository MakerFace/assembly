[toc]

# 编译汇编代码

1. 编译生成中间文件

   ```bash
   nasm --help # 查看支持的输出格式
   nasm -f elf64 -o obj/main.o main.s
   ```

2. 链接生成可执行文件

   ```bash
   ld -m # 查看支持的仿真平台
   ld -m elf_x86_64 -s -o bin/main obj/main.o
   ```

   链接`printf`失败：

   > undefined reference to `printf'

   [可以使用`ld`链接，也可以使用 gcc 链接](https://stackoverflow.com/a/34375048/15955867)：

   1. 使用 `ld`

      第一个问题是：在 64 位架构上，试图生成 32 位的可执行文件，`nasm -f elf` 可以生成 32 位的 elf(`-f elf64`可以生成 64 位的中间文件)。`ld`默认生成 64 位可执行文件，因此报错。可以指定`-f elf_i386`生成 32 位中间文件。

      此外，还可以指定入口点，`ld`默认寻找`_start`，可以通过添加`-e main`改变入口点（兼容 gcc）。

      第二个问题是：想用 C 的库函数`printf`，但是未定义的引用。通过在`ld`中添加参数`-lc`来指示它链接 c 语言库，并且还需要告诉 ld 使用动态链接库（~~貌似没用到，删除后还能用~~，删去后不能执行：cannot execute binary file）。

      ```bash
      ld -melf_i386 -o bin/main obj/main.o -lc
      ```

   2. 使用 `gcc`

      ```bash
      gcc -m32 obj/main.o -o bin/main
      ```

      没成功，报了`_start`重定义的错。

3. 调试

   `-m32`对应 elf，elf64 不知道对应啥。。。
   要把代码中\_start 改为 main，不然找不到对应该执行入口。
   此外，每一个函数结束后都要`ret`，不然就 core dump

   ```bash
   gcc -g -m32 -o bin/main obj/main.o
   ```

# 寄存器

[registers](registers.md)

# 系统调用

[system call](system_call.md)

# 寻址模式

[addressing modes](addressing_modes.md)

# 变量和常量

[variables&constant](variables%26constant.md)

# 算术指令

[arithmetic](arithmetic.md)

# 逻辑指令

[logical instructions](logical_instructions.md)

# 条件

[conditions](conditions.md)

# 循环

[loop](loop.md)

# 数字

[numbers](numbers.md)

# 字符串

[string](string.md)

# 数组

[array](arrays.md)

# 程序

[Procedures](procedures.md)

# 文件管理

[file](file.md)

# 内存管理

[memory](memory.md)


# 一些代码

[x86汇编代码](https://cs.lmu.edu/~ray/notes/x86assembly/)

# 教程

[汇编指南](https://www.tutorialspoint.com/assembly_programming/assembly_quick_guide.htm)