# Claude Config Sync

## Description
同步 Claude Code 配置到 GitHub 仓库，或在新机器上初始化配置

## Commands

### sync
同步配置到 GitHub（适用于已有本地配置）

**Usage**: `/sync` or `同步 claude 配置`

**Steps**:
1. Check if `~/claude-config` exists
2. If not exists, clone from git@github.com:jalon-dg/claude-config.git
3. `cd ~/claude-config`
4. `git pull` - 拉取最新
5. `git add .` - 添加所有更改
6. 检查是否有新文件需要同步
7. 如果有更改，执行 `git commit -m "sync: $(date)"` 和 `git push`
8. 报告同步结果

### clone
在新机器上克隆配置仓库

**Usage**: `/clone` or `克隆 claude 配置`

**Steps**:
1. Check if `~/claude-config` already exists
2. If exists, confirm whether to overwrite
3. Clone: `git clone git@github.com:jalon-dg/claude-config.git ~/claude-config`
4. 提示用户如何应用配置到 ~/.claude 目录

## Related
- 仓库地址: git@github.com:jalon-dg/claude-config.git
- 同步内容: skills/, memory/, plans/, plugins/, settings.json