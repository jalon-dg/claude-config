# Error Fixer

## Description
分析 Claude Code 会话日志，找出失败命令并自动修复常见问题。

## Common Errors Fixed

### 1. Node.js OpenSSL Error
- **症状**: `error:0308010C:digital envelope routines::unsupported`
- **修复**: 添加 `export NODE_OPTIONS=--openssl-legacy-provider` 到 `.bashrc`

### 2. Git SSH Permission Denied
- **症状**: `git@hgit.haier.net: Permission denied (publickey)`
- **原因**: ssh-agent 未启动，SSH key 未加载
- **修复**: 在 `.bashrc` 中添加自动启动 ssh-agent 的配置

### 3. Command Not Found (Exit code 127)
- **症状**: `command not found`
- **修复**: 检查 PATH 环境变量

### 4. File/Directory Not Found
- **症状**: `No such file or directory`
- **修复**: 检查文件路径是否正确

## Usage

When user says:
- "检查失败的命令"
- "修复错误"
- "分析错误日志"
- "看看有什么错误需要修复"

Run the analysis:
1. Find recent JSONL log files in `~/.claude/projects/`
2. Extract failed commands and error messages
3. Categorize errors by type
4. Auto-fix common issues (OpenSSL, SSH)
5. Report findings and fixes

## Related
- Log location: `~/.claude/projects/`
- Config files: `~/.bashrc`, `~/.ssh/config`