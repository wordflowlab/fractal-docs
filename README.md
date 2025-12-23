# Fractal Docs

<p align="center">
  <strong>🌀 让 AI 编程助手自动理解你的项目结构</strong><br>
  <strong>🌀 Let AI coding assistants automatically understand your project structure</strong>
</p>

<p align="center">
  <a href="#english">English</a> •
  <a href="#中文">中文</a> •
  <a href="#quick-start">Quick Start</a> •
  <a href="#supported-editors">Supported Editors</a>
</p>

---

## English

### What is Fractal Docs?

Fractal Docs is a **self-maintaining documentation system** for AI-powered coding assistants. It uses a fractal structure where every level follows the same documentation pattern, enabling AI to automatically understand your project structure and maintain documentation.

Inspired by the concepts of self-reference and recursion from *"Gödel, Escher, Bach"*.

### 🎯 Problems It Solves

| Problem | Solution |
|---------|----------|
| AI doesn't understand project structure | Auto-loads directory indexes into context |
| Documentation gets outdated | AI automatically updates docs when code changes |
| AI overwrites existing docs | "Read-first" rule prevents content loss |
| Scattered project knowledge | Fractal structure keeps everything organized |

### ✨ Key Features

- **🔄 Self-Maintaining** - Documents contain self-reference reminders that trigger AI to update related docs
- **📁 Fractal Structure** - Every directory follows the same pattern: architecture + file index
- **🛡️ Incremental Updates** - "Read before write" rule prevents accidental overwrites
- **🤖 Multi-Editor Support** - Works with Kiro, Cursor, Claude Code, Windsurf, and more
- **🌍 Bilingual** - Full support for Chinese (zh) and English (en)

### 🏗️ How It Works

```
┌─────────────────┐
│  Editor Starts  │
└────────┬────────┘
         │
         ▼
┌─────────────────────────────────┐
│ Load steering rules             │
│ (doc-maintenance + structure)   │
└────────┬────────────────────────┘
         │
         ▼
┌─────────────────────────────────┐
│ Parse file references           │
│ Pull README.md into context     │
└────────┬────────────────────────┘
         │
         ▼
┌─────────────────────────────────┐
│ AI understands project +        │
│ Auto-maintains documentation    │
└─────────────────────────────────┘
```

---

## 中文

### 什么是 Fractal Docs？

Fractal Docs 是一套面向 AI 编程助手的**自维护文档系统**。它采用分形结构，让每个层级都遵循相同的文档模式，使 AI 能够自动理解项目结构并维护文档。

设计灵感来自《哥德尔、埃舍尔、巴赫》中的自指和递归概念。

### 🎯 解决什么问题

| 问题 | 解决方案 |
|------|----------|
| AI 不了解项目结构 | 自动加载目录索引到上下文 |
| 文档维护被遗忘 | AI 修改代码时自动更新文档 |
| AI 覆盖已有文档 | "先读取再更新"规则防止内容丢失 |
| 项目知识分散 | 分形结构保持一切井然有序 |

### ✨ 核心特性

- **🔄 自我维护** - 文档包含自指提醒，触发 AI 自动更新相关文档
- **📁 分形结构** - 每个目录遵循相同模式：架构说明 + 文件索引
- **🛡️ 增量更新** - "先读后写"规则防止意外覆盖
- **🤖 多编辑器支持** - 支持 Kiro、Cursor、Claude Code、Windsurf 等
- **🌍 双语支持** - 完整支持中文 (zh) 和英文 (en)

---

## 📦 Supported Editors | 支持的编辑器

| Editor | Config Location | Features |
|--------|-----------------|----------|
| **Kiro** | `.kiro/steering/` | Native file references `#[[file:path]]`, inclusion modes |
| **Cursor** | `.cursor/rules/` | Glob patterns, `alwaysApply`, `@filename` references |
| **Claude Code** | `CLAUDE.md` + `.claude/rules/` | `@path` references, conditional `paths` field |
| **Windsurf** | `.windsurfrules` | XML tags for organization |
| **GitHub Copilot** | `.github/copilot-instructions.md` | Standard markdown |
| **Cline** | `.clinerules` | Standard markdown |
| **Universal** | `AGENTS.md` | Works with any AI assistant |

---

## Quick Start | 快速开始

### Option 1: Use Kiro Spec (Recommended) | 使用 Kiro Spec（推荐）

This is the most powerful way - let AI automatically generate configurations tailored to your project!

这是最强大的方式 - 让 AI 自动生成适配你项目的配置！

```bash
# Clone the template
git clone https://github.com/wordflowlab/fractal-docs.git

# Copy the spec to your project
cp -r fractal-docs/.kiro/specs/fractal-docs your-project/.kiro/specs/

# Open your project in Kiro, then:
# 1. Open the spec (tasks.md)
# 2. Let AI execute the tasks
# 3. AI will analyze your project and generate tailored configurations
```

### Option 2: Use Install Script | 使用安装脚本

```bash
# Clone the template
git clone https://github.com/wordflowlab/fractal-docs.git
cd fractal-docs

# Install Chinese version for all editors
./install.sh /path/to/your/project all zh

# Install English version for specific editor
./install.sh /path/to/your/project kiro en
./install.sh /path/to/your/project cursor en
./install.sh /path/to/your/project claude zh
```

### Option 3: Manual Installation | 手动安装

```bash
# For Kiro (Chinese)
cp -r zh/steering/ your-project/.kiro/steering/
cp -r zh/templates/ your-project/.kiro/templates/

# For Cursor (English)
cp -r en/cursor/rules/ your-project/.cursor/rules/

# For Claude Code (Chinese)
cp zh/claude/CLAUDE.md your-project/
cp -r zh/claude/.claude/ your-project/.claude/
```

### 3. Customize project structure | 自定义项目结构

Edit the project structure file to match your directories:

```markdown
## Core Directories

### Your Directory 1
#[[file:src/your-folder/README.md]]

### Your Directory 2
#[[file:src/another-folder/README.md]]
```

### 4. Create directory READMEs | 创建目录 README

For each referenced directory, create a README.md:

```markdown
# folder-name

<!-- Update me when this folder changes -->

## Architecture

Brief description (3 lines max)

## File Index

- `file1.ts` - Description
- `file2.ts` - Description
```

---

## 📁 Template Structure | 模板结构

```
fractal-docs/
├── .kiro/
│   └── specs/
│       └── fractal-docs/            # Kiro Spec（推荐方式）
│           ├── requirements.md      # 需求文档
│           ├── design.md            # 设计文档
│           └── tasks.md             # 任务列表（AI 执行这个）
├── zh/                              # 中文版本（静态模板）
│   ├── steering/                    # Kiro 配置
│   │   ├── doc-maintenance.md
│   │   └── project-structure.md
│   ├── templates/                   # 文件模板
│   │   ├── folder-readme.md
│   │   ├── file-header-ts.txt
│   │   ├── file-header-go.txt
│   │   ├── file-header-rs.txt
│   │   └── file-header-py.txt
│   ├── cursor/rules/                # Cursor 配置
│   ├── claude/                      # Claude Code 配置
│   ├── windsurf/                    # Windsurf 配置
│   ├── copilot/.github/             # GitHub Copilot 配置
│   ├── cline/                       # Cline 配置
│   └── AGENTS.md                    # 通用配置
├── en/                              # English version（同上）
├── install.sh                       # 安装脚本
└── README.md
```

### 两种使用方式

**方式 1: Kiro Spec（推荐）**
- 复制 `.kiro/specs/fractal-docs/` 到你的项目
- 让 AI 执行 tasks.md，自动分析项目并生成适配的配置
- 优点：AI 会根据你的项目结构自动定制

**方式 2: 静态模板**
- 使用 `install.sh` 或手动复制 `zh/` 或 `en/` 目录
- 手动编辑 `project-structure.md` 添加你的目录引用
- 优点：简单快速，适合了解自己项目结构的用户

---

## 🎓 Design Philosophy | 设计理念

### Fractal Structure | 分形结构

Every level follows the same pattern:
- **Architecture description** (3 lines max)
- **File/folder index** with descriptions
- **Self-reference reminder** for updates

### Self-Reference Mechanism | 自指机制

Documents contain reminders that form a self-maintaining loop:

```markdown
<!-- Update me when this folder changes -->
<!-- 一旦我所属的文件夹有所变化，请更新我 -->
```

```typescript
// When updated, remember to update header comments and folder README.md
// 一旦我被更新，务必更新我的开头注释，以及所属的文件夹的md
```

### Read-Before-Write Rule | 先读后写规则

The most important rule to prevent content loss:

```markdown
## 0. Read existing docs first (Important!)

Before modifying, **must check and read**:
- Does the folder have README.md? **If yes, read it first**
- Does the file have header comments? **If yes, preserve and update**

⚠️ **Never overwrite without reading first!**
```

---

## Editor Feature Comparison | 编辑器特性对比

| Feature | Kiro | Claude Code | Cursor | Windsurf |
|---------|------|-------------|--------|----------|
| Config File | `.kiro/steering/*.md` | `CLAUDE.md` + `.claude/rules/*.md` | `.cursor/rules/*.mdc` | `.windsurfrules` |
| Global Config | `~/.kiro/steering/` | `~/.claude/CLAUDE.md` | `~/.cursor/rules/` | Global settings |
| Always Load | `inclusion: always` | Root CLAUDE.md | `alwaysApply: true` | Default |
| Conditional | `inclusion: fileMatch` | `paths` field in rules | `globs: ["*.ts"]` | Not supported |
| Manual Load | `inclusion: manual` | Not supported | `@rulename` | Not supported |
| File Reference | `#[[file:path]]` | `@path/to/file` | `@filename` | Not supported |
| Modular Rules | Multiple files | `.claude/rules/*.md` | Multiple files | Single file |

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

MIT License - Feel free to use and modify.

---

<p align="center">
  <sub>Inspired by <em>"Gödel, Escher, Bach: An Eternal Golden Braid"</em></sub>
</p>
