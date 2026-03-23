# 全局工作习惯

## 服务器信息

### my-server (阿里云服务器)
- IP: 39.97.232.242
- SSH: root@39.97.232.242 (密钥: ~/.ssh/id_ed25519)
- 项目目录: /www/wwwroot/zhang/
- 可用端口: 3000~4000

#### 已部署服务
| 服务 | 端口 | 路径 |
|------|------|------|
| image-bed (图床) | 3002 | /www/wwwroot/zhang/image-bed |
| wechat-server | 3000 | /www/wwwroot/zhang/.output/server |

#### 常用命令
```bash
# 连接服务器
ssh root@39.97.232.242

# PM2 管理
pm2 status
pm2 logs <服务名> --lines 50
pm2 restart <服务名>
```

---

## 启动项目

### 前后端一体项目
对于有前后端一体的项目，**必须**先启动后端，然后再来启动前端。

## 启动新项目或开始工作前

每次启动或开始在一个项目上工作时，**必须**先读取项目根目录下的：

1. **README.md** - 项目概述和使用说明
2. **docs/** 目录 - 需求说明、架构设计等技术文档
3. **项目已有的 memory 配置**（如果存在）

这样可以快速了解：
- 项目类型和技术栈
- 功能模块和业务逻辑
- 启动方式和配置要求

---

# Windows 办公电脑配置

## Java
- Java 8: `C:\Program Files\Eclipse Adoptium\jdk-8.0.472.8-hotspot`
- Java 17: `C:\Program Files\Eclipse Adoptium\jdk-17.0.17.10-hotspot`

## MySQL
- 安装方式: scoop
- 路径: `C:\Users\20106341\scoop\apps\mysql\current\bin\mysqld.exe`
- 启动命令: `mysqld --standalone`
- 端口: 3306

## Node.js
- 优先使用 bun（如果项目中有 bun.lockb）

## Python
- Python 3.12: `C:\Program Files\Python312\python`
- 调用方式: 脚本中需设置 `PYTHONIOENCODING=utf-8` 环境变量解决中文编码

---

# Mac 电脑配置

（待补充）