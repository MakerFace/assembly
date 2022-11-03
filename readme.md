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

3. 调试
   
   `-m32`对应elf，elf64不知道对应啥。。。
   要把代码中_start改为main，不然找不到对应该执行入口。
   此外，每一个函数结束后都要`ret`，不然就core dump
   ```bash
   gcc -g -m32 -o bin/main obj/main.o
   ```

# 寄存器

[registers](registers.md)

# 系统调用

[system call](system_call.md)

# 寻址模式

[addressing modes](addressing_modes.md)
