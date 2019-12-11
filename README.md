# DOCKER-NODECLUB

[Git Link](https://github.com/liz-x/docker-nodeclub.git)

## 说明

**docker-install.sh**

- 安装 Docker
- 安装 Docker-Compos

**nodeclub-install.sh**

- 安装 NodeClub

**目录**

```sh
/nodeclub/conf      # 配置
/nodeclub/data      # 数据
/nodeclub/script    # 脚本
/nodeclub/log       # 日志
```

## 搭建

### 初始化

```sh
# 拉取项目
git clone https://github.com/liz-x/docker-nodeclub.git nodeclub

cd nodeclub

# 安装 Docker（如未安装）
sudo sh docker-install.sh.sh

# 拉取 NodeClub
sudo sh nodeclub-init.sh

# 启动
docker-compose up -d

# 查看容器状态
docker-compose ps
```

## Mongo 设置

```sh
# 创建 admin 账号和数据库

# Step 1
docker exec -it mongo mongo admin
# Step 2
db.createUser({ user: 'admin', pwd: '123456', roles: [ { role: 'userAdminAnyDatabase', db: 'admin' } ] }); # 创建账号
exit # 退出

# 创建 nodeclub 账号和数据库

# Step 1
docker exec -it mongo mongo admin
# Step 2
db.auth('admin', '123456');
# Step 3
use nodeclub # 不存在会自动创建
db.createUser({ user: 'nodeclub', pwd: '123456', roles: [ { role: 'readWrite', db: 'nodeclub' } ] }); # 创建账号
```

### 其他

```sh
db.grantRolesToUser( 'userName' , [ { role: '<role>', db: '<database>' } ])             # 授予角色
db.grantRolesToUser( 'userName' , [ { role: '<role>', db: '<database>' } ])             # 取消角色
db.system.users.remove({user:'userName'})                                               # 删除用户
db.changeUserPassword('userName', 'new password')                                       # 修改密码
```