# Fractal Docs

<p align="center">
  <img src="images/banner.jpeg" alt="Fractal Docs" width="600">
</p>

<p align="center">
  <strong>🌀 让 AI 编程助手自动理解你的项目结构</strong><br>
  <strong>🌀 Let AI coding assistants automatically understand your project structure</strong>
</p>

---

## 这是什么？

Fractal Docs 是一套**自维护文档系统**，让 AI 编程助手能够：
- 自动理解你的项目结构
- 修改代码时自动维护文档
- 防止覆盖已有文档内容

设计灵感来自《哥德尔、埃舍尔、巴赫》中的自指和递归概念。

## 支持的编辑器

| 编辑器 | 初始化方式 | 生成的持久配置 |
|--------|-----------|----------------|
| **Kiro** | 执行 Spec | `.kiro/steering/` + `.kiro/templates/` |
| **Claude Code** | 复制 INIT_PROMPT 到 chat | `CLAUDE.md` + `.claude/rules/` |
| **Cursor** | 复制 INIT_PROMPT 到 chat | `.cursor/rules/*.mdc` |
| **Windsurf** | 复制 INIT_PROMPT 到 chat | `.windsurf/rules/` |
| **Cline** | 复制 INIT_PROMPT 到 chat | `.clinerules/` |
| **GitHub Copilot** | 复制 INIT_PROMPT 到 chat | `.github/copilot-instructions.md` |

## 快速开始

### 1. 选择你的编辑器

```bash
git clone https://github.com/wordflowlab/fractal-docs.git
```

### 2. 按编辑器初始化

#### Kiro（推荐）

```bash
# 复制 Spec 到你的项目
cp -r fractal-docs/kiro/.kiro/specs/fractal-docs your-project/.kiro/specs/

# 在 Kiro 中打开 tasks.md，让 AI 执行
```

#### Claude Code

```bash
# 复制 INIT_PROMPT.md 的内容到 Claude Code chat
cat fractal-docs/claude-code/INIT_PROMPT.md
```

#### Cursor

```bash
# 复制 INIT_PROMPT.md 的内容到 Cursor chat
cat fractal-docs/cursor/INIT_PROMPT.md
```

#### Windsurf / Cline / Copilot

同上，复制对应目录下的 `INIT_PROMPT.md` 内容到 chat。

### 3. AI 执行初始化

AI 会：
1. 分析你的项目结构
2. 询问核心目录和语言偏好
3. 生成适配的配置文件
4. 创建核心目录的 README.md

### 4. 完成

之后每次 AI 修改代码时，都会自动维护文档。

## 项目结构

```
fractal-docs/
├── kiro/                    # Kiro 配置（Spec 方式）
│   └── .kiro/specs/fractal-docs/
├── claude-code/             # Claude Code 配置
│   ├── README.md
│   └── INIT_PROMPT.md
├── cursor/                  # Cursor 配置
│   ├── README.md
│   └── INIT_PROMPT.md
├── windsurf/                # Windsurf 配置
├── cline/                   # Cline 配置
├── copilot/                 # GitHub Copilot 配置
└── templates/               # 通用模板参考
    ├── zh/                  # 中文模板
    └── en/                  # 英文模板
```

## 核心特性

- **🔄 自我维护** - 文档包含自指提醒，触发 AI 自动更新相关文档
- **📁 分形结构** - 每个目录遵循相同模式：架构说明 + 文件索引
- **🛡️ 增量更新** - "先读后写"规则防止意外覆盖
- **🤖 多编辑器** - 支持主流 AI 编辑器
- **🌍 双语** - 支持中文和英文

## 初始化后会生成什么？

以 Kiro 为例：

```
your-project/
├── .kiro/
│   ├── steering/
│   │   ├── doc-maintenance.md    # 文档维护规则（持久）
│   │   └── project-structure.md  # 项目结构导航（持久）
│   └── templates/
│       ├── folder-readme.md      # 文件夹 README 模板
│       └── file-header-*.txt     # 文件头注释模板
└── [核心目录]/README.md          # 目录索引（持久）
```

## 各编辑器特性对比

| 特性 | Kiro | Claude Code | Cursor | Windsurf |
|------|------|-------------|--------|----------|
| 文件引用 | `#[[file:path]]` | `@path` | `@filename` | ❌ |
| 条件加载 | `inclusion: fileMatch` | `paths` 字段 | `globs` | Glob 模式 |
| 模块化规则 | `.kiro/steering/` | `.claude/rules/` | `.cursor/rules/` | `.windsurf/rules/` |
| Spec 系统 | ✅ | ❌ | ❌ | ❌ |

## License

MIT

---

<p align="center">
  <sub>Inspired by <em>"Gödel, Escher, Bach: An Eternal Golden Braid"</em></sub>
</p>
