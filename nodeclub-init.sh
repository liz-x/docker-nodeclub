#!/bin/bash

#### 克隆 ####
git clone https://github.com/cnodejs/nodeclub.git app
rm -rf app/.git

#### 镜像 ####
docker rmi nodeclub
docker build -t nodeclub .

#### 删除 ####
rm -rf app