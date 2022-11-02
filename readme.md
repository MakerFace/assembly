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
