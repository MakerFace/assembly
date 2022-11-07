# 文件

1. 文件描述符fd

2. 文件指针

> 文件指针以字节为单位指令文件指针读写操作的位置。每个文件被视为一个字节序列。每个打开的文件都关联有一个文件指针，指定相对于文件开头的字节偏移量。初始设置为零。

与文件相关的系统调用：`sys_fork`(2), `sys_read`, `sys_write`, `sys_open`, `sys_close`(6), `sys_creat`(8), `sys_lseek`(19)

# 创建并打开文件

sys_creat

# 打开现有文件

sys_open

# 读取

sys_read

# 写入

sys_write

# 关闭

sys_close

# 更新

sys_lseek