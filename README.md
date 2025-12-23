# Fractal Docs

<p align="center">
  <strong>🌀 让 AI 编程助手自动理解你的项目结构</strong><br>
  <strong>🌀 Let AI coding assistants automatically understand your project structure</strong>
</p>

---

## 这是什么？

Fractal Docs 是一个 **Kiro Spec**，用于在你的项目中初始化自维护文档系统。

**不是静态模板**，而是让 AI 分析你的项目后，自动生成适配的配置。

设计灵感来自《哥德尔、埃舍尔、巴赫》中的自指和递归概念。

## 解决什么问题

| 问题 | 解决方案 |
|------|----------|
| AI 不了解项目结构 | 自动加载目录索引到上下文 |
| 文档维护被遗忘 | AI 修改代码时自动更新文档 |
| AI 覆盖已有文档 | "先读取再更新"规则防止内容丢失 |
| 项目知识分散 | 分形结构保持一切井然有序 |

## 快速开始

### 1. 复制 Spec 到你的项目

```bash
git clone https://github.com/wordflowlab/fractal-docs.git
cp -r fractal-docs/.kiro/specs/fractal-docs your-project/.kiro/specs/
```

### 2. 在 Kiro 中执行 Spec

1. 用 Kiro 打开你的项目
2. 打开 `.kiro/specs/fractal-docs/tasks.md`
3. 告诉 AI 执行这个 spec
4. AI 会：
   - 分析你的项目结构
   - 询问你使用哪个编辑器、哪种语言
   - 自动生成适配的配置

### 3. 完成

AI 执行完 spec 后，你的项目会有：

```
your-project/
├── .kiro/
│   ├── steering/
│   │   ├── doc-maintenance.md    # 文档维护规则
│   │   └── project-structure.md  # 项目结构导航
│   └── templates/
│       ├── folder-readme.md      # 文件夹 README 模板
│       └── file-header-*.txt     # 文件头部注释模板
├── src/*/README.md               # 核心目录索引
└── [其他编辑器配置]              # 如果你选择了多编辑器
```

之后，每次 AI 修改代码时，都会自动维护文档。

## 支持的编辑器

| 编辑器 | 配置位置 |
|--------|----------|
| **Kiro** | `.kiro/steering/` |
| **Cursor** | `.cursor/rules/` |
| **Claude Code** | `CLAUDE.md` + `.claude/rules/` |
| **Windsurf** | `.windsurfrules` |
| **GitHub Copilot** | `.github/copilot-instructions.md` |
| **Cline** | `.clinerules` |

## 核心特性

- **🔄 自我维护** - 文档包含自指提醒，触发 AI 自动更新相关文档
- **📁 分形结构** - 每个目录遵循相同模式：架构说明 + 文件索引
- **🛡️ 增量更新** - "先读后写"规则防止意外覆盖
- **🤖 多编辑器** - 支持主流 AI 编辑器
- **🌍 双语** - 支持中文和英文

## Spec 文件说明

```
.kiro/specs/fractal-docs/
├── requirements.md   # 需求文档 - 系统要满足的需求
├── design.md         # 设计文档 - 架构和实现方案
└── tasks.md          # 任务列表 - AI 执行的任务（核心）
```

## 工作原理

```
┌─────────────────┐
│  复制 Spec      │
└────────┬────────┘
         │
         ▼
┌─────────────────────────────────┐
│ AI 执行 tasks.md                │
│ - 分析项目结构                  │
│ - 识别技术栈                    │
│ - 确认核心目录                  │
└────────┬────────────────────────┘
         │
         ▼
┌─────────────────────────────────┐
│ AI 生成适配的配置               │
│ - steering 规则                 │
│ - 文档模板                      │
│ - 目录索引                      │
└────────┬────────────────────────┘
         │
         ▼
┌─────────────────────────────────┐
│ 系统开始工作                    │
│ AI 修改代码时自动维护文档       │
└─────────────────────────────────┘
```

## 为什么用 Spec 而不是静态模板？

| 方面 | 静态模板 | Spec 方式 |
|------|----------|-----------|
| 安装 | 复制文件，手动修改 | 复制 spec，AI 自动执行 |
| 定制 | 手动填写目录引用 | AI 分析后自动生成 |
| 技术栈 | 手动选择模板 | AI 识别后选择 |
| 灵活性 | 低 | 高 |

## License

MIT

---

<p align="center">
  <sub>Inspired by <em>"Gödel, Escher, Bach: An Eternal Golden Braid"</em></sub>
</p>
