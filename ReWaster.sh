#!/bin/bash

# 创建脚本文件
echo "#!/bin/bash" > _ins.sh
echo "" >> _ins.sh
echo "REFERER=${REFERER}" >> _ins.sh
echo "URL=${URL}" >> _ins.sh
echo "while true" >> _ins.sh
echo "do" >> _ins.sh
echo "    curl -s -o /dev/null -H \"Referer: \$REFERER\" \"\$URL\"" >> _ins.sh
echo "done" >> _ins.sh

# 设置脚本可执行权限
chmod +x _ins.sh

# 运行多个实例
for i in $(seq 1 ${THREAD:-20})
do
    nohup ./_ins.sh > /dev/null 2>&1 &
    echo "线程 $i 开始工作，执行服务器重启指令reboot以关闭脚本!"
done