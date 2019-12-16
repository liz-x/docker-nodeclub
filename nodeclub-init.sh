#!/bin/bash

#### 镜像 ####
docker rmi nodeclub
docker build -t nodeclub .

#### 删除 ####
rm -rf app