---
name: subagent-monitor
description: 监控和查询当前 Claude Code 会话中的 subagent 活动状态
version: 1.0.0
author: zcr
tags: [subagent, monitor, debug]
---

# Subagent Monitor

监控和查询当前 Claude Code 会话中的 subagent 活动状态。

## 何时使用

- 需要查看当前会话启动了哪些 subagent
- 需要了解 subagent 的执行状态
- 需要追踪 subagent 的任务进度

## 如何使用

直接调用此 skill，它会分析当前会话上下文并显示 subagent 活动状态。

## 功能

1. **列出活跃的 subagent** - 显示当前会话中所有启动的 subagent
2. **显示 subagent 状态** - 显示每个 subagent 的任务状态（进行中/已完成）
3. **追踪任务进度** - 显示 subagent 已完成的工作

## 示例输出

```
=== Subagent 活动监控 ===

活跃 Subagent:
- explore: 文件探索 (状态: 已完成)
- planner: 计划制定 (状态: 进行中)
- code-reviewer: 代码审查 (状态: 已完成)

总计: 3 个 subagent
```