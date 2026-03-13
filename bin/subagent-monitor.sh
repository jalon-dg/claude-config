#!/bin/bash
# subagent-monitor - Query subagent activity in current session
# Usage: subagent-monitor

# This is a simple display script
# For full tracking, Claude Code hooks would need more integration

echo "=== Subagent 活动监控 ==="
echo ""
echo "当前会话中的 subagent 活动需要通过 Claude Code 的会话上下文获取。"
echo ""
echo "提示：可以通过查看 Claude Code 的输出来追踪 subagent 的启动和完成。"
echo ""
echo "要启用自动日志记录，需要配置 Claude Code hooks。"
echo ""
echo "查看日志目录:"
LOG_DIR="$HOME/.claude/subagent-logs"
if [ -d "$LOG_DIR" ]; then
    echo "  $LOG_DIR"
    ls -la "$LOG_DIR" 2>/dev/null || echo "  (暂无日志)"
else
    echo "  暂无日志目录"
fi