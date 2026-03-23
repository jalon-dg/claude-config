---
name: pj
description: pj - 快速项目跳转工具的安装和管理
allowed-tools:
  - Bash
  - Read
metadata:
  trigger: 安装 pj、安装项目跳转工具、快速切换项目目录
---

# pj 安装

当用户要求安装 pj 或项目跳转工具时，执行以下步骤：

## 1. 检测操作系统
```bash
uname -s
```

## 2. 执行安装脚本
```bash
curl -sL https://raw.githubusercontent.com/jalon-dg/pj/main/install.sh | bash
```

或者本地执行：
```bash
bash -c "$(curl -sL https://raw.githubusercontent.com/jalon-dg/pj/main/install.sh)"
```

## 3. 提示用户重载 shell
安装完成后告诉用户需要重新加载 shell 配置文件：
- bash/zsh: `source ~/.bashrc` 或 `source ~/.zshrc`
- PowerShell: `. $PROFILE`

## 功能说明

pj 支持：
- `pj list` / `pj l` - 列出所有项目
- `pj -p <关键词>` - 模糊搜索并跳转
- `pj <项目名>` - 精确/模糊匹配跳转
- `pj adddir <路径>` - 添加监控目录
- `pj refresh` - 刷新缓存
- `pj help` - 查看帮助