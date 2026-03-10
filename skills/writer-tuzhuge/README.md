# tuzhuge-writer

土著哥公众号文章创作助手 —— 一个基于 Claude Code 的 Skill，采用"采访式写作"工作流，帮你高效创作高质量公众号文章。

## 功能特点

- **采访式写作**：不是直接让 AI 写文章，而是先以记者身份向你提问，挖掘真实素材和独特观点
- **四轮灵魂拷问**：破冰定位 → 深挖具象化 → 灵魂拷问 → 验证补充，层层递进挖掘故事
- **5 种预制写作风格**：土著哥风格、认知升级风格、朋友聊天风格、半佛式风格、Dan Koe 风格
- **六维质量评分**：语言自然度、结构合理性、个人特色、句式规范、风格一致性、可读性
- **去 AI 味审核**：内置禁止词清单、长句检测、结构检查，确保文章像人写的
- **自我学习机制**：跨会话积累用户偏好、成功模式、常见修改，越用越懂你

## 工作流程

```
学习加载 → 主题调研 → 采访（四轮灵魂拷问） → 整理确认 → 定稿参数 → 撰写初稿 → 质量评分审核 → 优化调整 → 学习记录
```

## 安装方法

### 前置条件

- 已安装 [Claude Code](https://docs.anthropic.com/en/docs/claude-code)

### 安装步骤

1. 克隆本仓库到 Claude Code 的 skills 目录：

```bash
git clone https://github.com/007hawkeye/tuzhuge-writer-skill.git ~/.claude/skills/tuzhuge-writer
```

> Windows 用户路径为 `C:\Users\<你的用户名>\.claude\skills\tuzhuge-writer`

2. 安装完成。在 Claude Code 中输入 `/tuzhuge-writer` 即可启动。

## 使用方法

在 Claude Code 中直接调用：

```
/tuzhuge-writer
```

然后告诉它你想写的主题，按提示回答采访问题即可。

### 示例

```
> /tuzhuge-writer
> 我想写一篇关于 GPT-5 发布的公众号文章
```

技能会自动：
1. 全网搜索相关信息
2. 以记者身份向你提问（3-4 轮）
3. 整理采访结果让你确认
4. 让你选择写作风格、标题、篇幅
5. 撰写初稿并自动评分审核
6. 根据你的反馈优化调整

## 目录结构

```
tuzhuge-writer/
├── SKILL.md                           # 主技能文件（核心工作流）
├── LICENSE                            # MIT 开源协议
├── README.md                          # 说明文档
└── references/
    ├── interview-questions.md         # 采访问题库（四轮灵魂拷问 + 动态追问）
    ├── image-suggestions.md           # 配图建议模板
    ├── anti-ai-rules.md               # 去 AI 味审核规则
    ├── quality-scoring.md             # 质量评分系统
    ├── styles/                        # 写作风格库（可扩展）
    │   ├── tuzhuge.md                 # 土著哥风格（默认）
    │   ├── cognitive-upgrade.md       # 认知升级风格
    │   ├── friendly-chat.md           # 朋友聊天风格
    │   ├── banfo.md                   # 半佛式风格
    │   └── dankoe.md                  # Dan Koe 风格
    └── learning/                      # 学习知识库（自动积累）
        ├── execution-history.jsonl    # 执行历史记录
        ├── successful-patterns.md     # 成功模式库
        ├── common-revisions.md        # 常见修改类型
        ├── user-preferences.md        # 用户偏好档案
        └── style-evolution.md         # 风格进化记录
```

## 自定义风格

你可以添加自己的写作风格：

1. 在使用技能时，提供几篇你喜欢的参考文章
2. 技能会自动分析并生成风格模板
3. 新风格会保存到 `references/styles/` 目录

也可以手动参考现有风格文件（如 `tuzhuge.md`）创建自己的风格模板。

## 学习机制

技能会在 `references/learning/` 目录下自动积累使用数据：

- **用户偏好**：记录你的风格、篇幅、内容偏好，置信度越高越优先应用
- **成功模式**：提取高满意度文章的开头、结构、语言模式
- **常见修改**：记录修改类型和频率，下次自动预防
- **执行历史**：记录每次写作的元数据和反馈

这些数据完全存储在本地，不会上传到任何服务器。

## 许可证

[MIT License](LICENSE)

## 作者

**土著哥** — 微信公众号「土著哥聊AI」
