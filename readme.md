# 编译汇编代码
1. 编译生成中间文件
   ```bash
   nasm -f elf main.S
   ```

2. 链接生成可执行文件

   ```bash
   ld -m elf_i386 -s -o main main.o
   ```
