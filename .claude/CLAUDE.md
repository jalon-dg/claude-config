# Claude Config 项目上下文

## 项目概述

Claude Code 的配置文件和自定义 Skills 仓库，包含大量官方和自定义技能（skills）。

## 目录结构

- **bin/** - 脚本工具
- **memory/** - 记忆配置
- **plans/** - 计划文件
- **plugins/** - 插件配置
- **skills/** - Claude Code 技能库

## 主要 Skills

- claude-api - Anthropic API 使用指南（Go, Python, TypeScript, Java, PHP, C#, Ruby）
- pdf - PDF 处理
- pptx - PPTX 制作
- xlsx - Excel 处理
- docx - Word 文档
- frontend-design - 前端设计
- mcp-builder - MCP 服务器构建
- skill-creator - 技能创建工具
- writer-* 系列 - 写作风格复现
- theme-factory - 主题工厂
- 等等

## 注意事项

- 修改 skills 前先阅读 SKILL.md 文件
- 项目使用 settings.json 存储配置