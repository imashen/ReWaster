FROM debian:bookworm-slim

# 更新包列表并安装 curl
RUN apt-get update && apt-get install -y --no-install-recommends curl && rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /app

# 将脚本添加到镜像中
COPY ReWaster.sh ReWaster.sh

# 设置脚本为可执行
RUN chmod +x ReWaster.sh

# 指定容器启动后运行的命令
CMD ["./ReWaster.sh"]