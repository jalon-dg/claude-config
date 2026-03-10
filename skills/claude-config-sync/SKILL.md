# Claude Config Sync

## Description
同步 Claude Code 配置到 GitHub 仓库

## Commands

### sync
拉取最新配置，添加更改，提交并推送到 GitHub

**Usage**: `/sync` or `sync claude config`

**Steps**:
1. `cd ~/claude-config`
2. `git pull` - 拉取最新
3. `git add .` - 添加所有更改
4. 检查是否有新文件需要同步
5. 如果有更改，执行 `git commit -m "sync: $(date)"` 和 `git push`
6. 报告同步结果

## Related
- 仓库地址: git@github.com:jalon-dg/claude-config.git
- 同步内容: skills/, memory/, plans/, plugins/, settings.json