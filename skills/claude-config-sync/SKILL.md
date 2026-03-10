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

**Apply config to Claude (Compare & Merge)**:
After pulling latest config, compare differences and ask user how to handle:

1. **Show diff**: Use `diff -rq` or `diff -u` to compare each category:
   - Skills: `diff -rq ~/claude-config/skills ~/.claude/skills 2>/dev/null | head -50`
   - Memory: `diff -rq ~/claude-config/memory ~/.claude/memory 2>/dev/null | head -50`
   - Plugins: `diff -rq ~/claude-config/plugins ~/.claude/plugins 2>/dev/null | head -50`
   - Settings: `diff ~/claude-config/settings.json ~/.claude/settings.json 2>/dev/null | head -50`
   - Plans: `diff -rq ~/claude-config/plans ~/.claude/plans 2>/dev/null | head -50`

2. **Ask user** how to merge (use AskUserQuestion):
   - "如何处理配置差异？"
   - Options:
     - "直接覆盖" - Replace: `cp -r ~/claude-config/skills/* ~/.claude/skills/` (and similar for other dirs)
     - "合并 (保留本地)" - Merge keep local: Use `rsync -av --exclude='.git' ~/claude-config/skills/ ~/.claude/skills/`
     - "合并 (保留远程)" - Merge keep remote: Copy remote only for new/modified files (custom script)
     - "手动处理" - Manual: Show exact copy commands for user to run

3. **Execute** based on user's choice

## Related
- 仓库地址: git@github.com:jalon-dg/claude-config.git
- 同步内容: skills/, memory/, plans/, plugins/, settings.json