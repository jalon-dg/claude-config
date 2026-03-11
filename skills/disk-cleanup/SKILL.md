---
name: disk-cleanup
description: Windows C盘清理工具 - 分析空间占用、清理缓存、迁移目录到D盘。用于用户说"清理C盘"、"C盘空间不足"、"磁盘满了"等场景。
---

# Windows C盘清理工具

本技能用于清理Windows C盘空间，释放磁盘容量。

## 执行步骤

### 1. 检查C盘当前状态

```bash
wmic logicaldisk where "DeviceID='C:'" get FreeSpace,Size /format:value
```

换算：FreeSpace bytes ÷ 1024³ = GB

### 2. 分析用户目录空间占用

```bash
# 查看用户目录下最大的文件夹
du -sh "C:/Users/20106341"/* 2>/dev/null | sort -rh | head -20

# 查看AppData目录
du -sh "C:/Users/20106341/AppData/Local"/* 2>/dev/null | sort -rh | head -15
du -sh "C:/Users/20106341/AppData/Roaming"/* 2>/dev/null | sort -rh | head -15
```

### 3. 常见大文件位置（按大小排序）

**用户目录 (AppData/Local)：**
| 目录 | 说明 |
|------|------|
| npm-cache | npm缓存 |
| Google/Chrome | Chrome缓存 |
| ms-playwright | Playwright浏览器 |
| Temp | 临时文件 |
| JetBrains | IDE缓存 |
| Postman | API工具缓存 |
| PowerToys | Windows工具 |
| StepFun/Razer | 硬件驱动 |

**用户目录 (AppData/Roaming)：**
| 目录 | 说明 |
|------|------|
| LarkShell | 飞书缓存 |
| JetBrains | IDE缓存 |
| Cursor | 编辑器缓存 |
| Code | VSCode缓存 |
| Tencent | 腾讯系(QQ/微信) |
| ai-client | 飞书客户端 |

**系统目录：**
| 目录 | 说明 |
|------|------|
| Windows/Temp | Windows临时文件 |

### 4. 清理命令

#### 4.1 直接删除缓存目录

```bash
# 清理Local缓存
rm -rf "C:/Users/20106341/AppData/Local/npm-cache"
rm -rf "C:/Users/20106341/AppData/Local/ms-playwright"
rm -rf "C:/Users/20106341/AppData/Local/Postman"
rm -rf "C:/Users/20106341/AppData/Local/Google/Chrome/User Data"
rm -rf "C:/Users/20106341/AppData/Local/Temp"

# 清理Roaming缓存
rm -rf "C:/Users/20106341/AppData/Roaming/LarkShell-ka-ihaier"
rm -rf "C:/Users/20106341/AppData/Roaming/Cursor"
rm -rf "C:/Users/20106341/AppData/Roaming/JetBrains"
rm -rf "C:/Users/20106341/AppData/Roaming/Code"
rm -rf "C:/Users/20106341/AppData/Roaming/Tencent"
rm -rf "C:/Users/20106341/AppData/Roaming/Postman"

# 清理Windows临时文件（需要管理员）
rm -rf "C:/Windows/Temp"/*
```

#### 4.2 处理被锁定的文件

如果遇到 "Device or resource busy" 错误，说明文件被进程占用。解决方案：

**方案A：强制结束进程后清理**

```bash
# 常见进程名
taskkill /F /IM "ima.copilot.exe" /T  # IMA智能助手
taskkill /F /IM "ima.exe" /T
taskkill /F /IM "Lark.exe" /T         # 飞书
taskkill /F /IM "cursor.exe" /T        # Cursor
taskkill /F /IM "code.exe" /T         # VSCode

# 然后重新执行删除命令
```

**方案B：生成批处理文件让用户手动执行**

创建 `clean-cache.bat`：

```batch
@echo off
echo 缓存清理工具

echo [1] 结束进程...
taskkill /F /IM "ima.copilot.exe" /T >nul 2>&1
taskkill /F /IM "Lark.exe" /T >nul 2>&1
taskkill /F /IM "cursor.exe" /T >nul 2>&1
echo     完成

echo [2] 清理缓存...
rmdir /S /Q "C:\Users\20106341\AppData\Local\npm-cache" >nul 2>&1
rmdir /S /Q "C:\Users\20106341\AppData\Local\ms-playwright" >nul 2>&1
rmdir /S /Q "C:\Users\20106341\AppData\Local\Temp" >nul 2>&1
rmdir /S /Q "C:\Users\20106341\AppData\Roaming\LarkShell-ka-ihaier" >nul 2>&1
rmdir /S /Q "C:\Users\20106341\AppData\Roaming\Cursor" >nul 2>&1
echo     完成

echo 清理完成！
pause
```

### 5. 迁移缓存目录到D盘

将缓存目录迁移到D盘，释放C盘空间。

#### 5.1 创建D盘目标目录

```bash
mkdir -p /d/cache/{m2,bun,cache,npm,gradle}
```

#### 5.2 删除原目录并创建符号链接

需要管理员权限运行：

```batch
cmd /c "mklink /D C:\Users\20106341\.m2 D:\cache\m2"
cmd /c "mklink /D C:\Users\20106341\.bun D:\cache\bun"
cmd /c "mklink /D C:\Users\20106341\.cache D:\cache\cache"
```

或者通过设置环境变量：

```bash
# 在 .bashrc 中添加
export M2_HOME=D:/cache/m2
export BUN_CONFIG_DIR=D:/cache/bun
export npm_config_cache=D:/cache/npm
export XDG_CACHE_HOME=D:/cache/cache
```

### 6. 清理完成后检查

```bash
wmic logicaldisk where "DeviceID='C:'" get FreeSpace /format:value
```

## 注意事项

1. **部分缓存需要关闭应用**：飞书、IMA、Cursor等需要先关闭，否则文件被锁定
2. **系统缓存慎动**：Windows/System32等系统目录不要动
3. **重要数据先备份**：清理前确认没有重要文件
4. **符号链接需要管理员权限**：迁移到D盘需要以管理员身份运行

## 常见场景

- **用户说"清理C盘"** → 执行步骤1-4
- **用户说"迁移缓存"** → 执行步骤5
- **用户说"还有什么是大文件"** → 执行步骤2并列出结果
- **清理时遇到文件被锁定** → 使用步骤4.2