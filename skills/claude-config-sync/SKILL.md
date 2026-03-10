# Claude Config Sync

## Description
同步 Claude Code 配置到 GitHub 仓库，自动判断是初始化还是更新

## Commands

### sync
同步配置（自动判断是克隆还是更新）

**Usage**: `/sync` or `同步 claude 配置`

**Steps**:
1. Check if `~/claude-config` exists
2. If not exists:
   - Clone: `git clone git@github.com:jalon-dg/claude-config.git ~/claude-config`
   - Tell user how to apply: copy files to ~/.claude
3. If exists:
   - `cd ~/claude-config`
   - `git pull` - 拉取最新
   - `git add .` - 添加所有更改
   - Check if there are changes
   - If changes exist, run `git commit -m "sync: $(date)"` and `git push`
   - Tell user how to apply: copy files to ~/.claude
4. Report sync result

**Apply config to Claude**:
- Copy skills: `cp -r ~/claude-config/skills/* ~/.claude/skills/`
- Copy memory: `cp -r ~/claude-config/memory ~/.claude/`
- Copy plugins: `cp -r ~/claude-config/plugins/* ~/.claude/plugins/`
- Copy settings: `cp ~/claude-config/settings.json ~/.claude/`
- Copy plans: `cp -r ~/claude-config/plans ~/.claude/`

## Related
- 仓库地址: git@github.com:jalon-dg/claude-config.git
- 同步内容: skills/, memory/, plans/, plugins/, settings.json