#!/bin/bash

#### 安装 Docker ####

# 安装 Docker
# 官方文档：https://docs.docker.com/install/linux/docker-ce/centos/
# 阿里文档：https://yq.aliyun.com/articles/110806/

cd /tmp/

curl -fsSL https://get.docker.com | sh -s docker --mirror Aliyun

# 重要，否则容器 VOLUME 中 www-data 用户无写权限
sudo usermod -aG docker www-data

sudo systemctl start docker
sudo systemctl enable docker

# 配置镜像加速器(七牛)
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://reg-mirror.qiniu.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

# 安装 docker-compose
# 官方文档：https://docs.docker.com/compose/install/

sudo curl -L "https://get.daocloud.io/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
