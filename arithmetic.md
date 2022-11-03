# 算术指令

1. inc/dec

   用于将操作数增/减 1，适用于单个操作数，可以在内存中也可以在寄存器中。

   `inc destination`
   `dec destination`

   操作数可以是 8 位，16 位或 32 位。

   例如：

   ```assembly
   inc ebx
   inc dl
   inc [count]
   dec [count]
   dec byte [esi]
   ```

2. add/sub

   用于以字节、字和双字执行二进制数的简单加减。操作数可以是 8 位，16 位或 32 位。

   `add des,src`
   `sub des,src`

   可以用于：

   - reg,reg
   - mem,reg
   - reg,mem
   - mem,const
   - mem,const

   例如：
   ```assembly
   num1: resb 2
   num2: resb 2
   res:  resb 1

   mov  eax,[num1]
   sub  eax,'0'

   mov  ebx,[num2]
   sub  eax,'0'

   add  eax,ebx
   add  eax,'0'
   
   mov  [res],eax
   ; print res
   ```

3. mul/imul
4. div/idiv
