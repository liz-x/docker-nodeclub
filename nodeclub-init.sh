#!/bin/bash

#### 安装 nodeclub ####
git clone https://github.com/cnodejs/nodeclub.git nodeclub/service
rm -rf /nodeclub/.git /nodeclub/service/.git

cd /nodeclub/service
make install