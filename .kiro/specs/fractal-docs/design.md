# 设计文档

## 概述

Fractal Docs 是一套跨编辑器的自维护文档系统。核心思想是通过各 AI 编辑器的规则加载机制，让 AI 在每次交互时自动获取项目结构上下文，并执行文档维护任务。

## 架构

### 多编辑器支持架构

```
Fractal Docs
├── zh/                          # 中文版本
│   ├── steering/                # Kiro 配置
│   │   ├── doc-maintenance.md   # 文档维护规则
│   │   └── project-structure.md # 项目结构导航
│   ├── templates/               # 文档模板
│   │   ├── folder-readme.md     # 文件夹 README 模板
│   │   ├── file-header-ts.txt   # TypeScript 注释模板
│   │   ├── file-header-go.txt   # Go 注释模板
│   │   ├── file-header-rs.txt   # Rust 注释模板
│   │   └── file-header-py.txt   # Python 注释模板
│   ├── cursor/rules/            # Cursor 配置
│   ├── claude/                  # Claude Code 配置
│   ├── windsurf/                # Windsurf 配置
│   ├── copilot/.github/         # GitHub Copilot 配置
│   ├── cline/                   # Cline 配置
│   └── AGENTS.md                # 通用配置
├── en/                          # 英文版本（结构同上）
└── install.sh                   # 安装脚本
```

### 编辑器规则机制对比

| 编辑器 | 配置位置 | 文件引用语法 | 条件加载 |
|--------|----------|--------------|----------|
| Kiro | `.kiro/steering/` | `#[[file:path]]` | `inclusion: fileMatch` |
| Cursor | `.cursor/rules/` | `@filename` | `globs: ["*.ts"]` |
| Claude Code | `CLAUDE.md` + `.claude/rules/` | `@path/to/file` | `paths` 字段 |
| Windsurf | `.windsurfrules` | 不支持 | 不支持 |
| Copilot | `.github/copilot-instructions.md` | 不支持 | 不支持 |
| Cline | `.clinerules` | 不支持 | 不支持 |

### 工作流程

```
┌─────────────────┐
│   编辑器启动    │
└────────┬────────┘
         │
         ▼
┌─────────────────────────────────┐
│ 加载规则文件                    │
│ (steering/rules/CLAUDE.md等)    │
└────────┬────────────────────────┘
         │
         ▼
┌─────────────────────────────────┐
│ 解析文件引用（如支持）          │
│ 拉取 README.md 内容到上下文     │
└────────┬────────────────────────┘
         │
         ▼
┌─────────────────────────────────┐
│ AI 获得项目结构 + 维护规则      │
└────────┬────────────────────────┘
         │
         ▼
┌─────────────────────────────────┐
│ 修改代码时自动执行文档维护      │
│ 输出文档维护报告                │
└─────────────────────────────────┘
```

## 组件和接口

### 1. 文档维护规则 (doc-maintenance)

核心规则，定义 AI 修改代码时必须执行的文档维护步骤：

```markdown
## 0. 先读取现有文档（重要！）
修改文件前，**必须先检查并读取**：
- 所属文件夹是否已有 README.md？**如果有，先读取它**
- 文件是否已有头部注释？**如果有，保留并更新**

⚠️ **禁止直接覆盖创建**！

## 1. 文件头部注释
每个代码文件必须有标准三行注释：input/output/pos

## 2. 文件夹 README.md
修改文件后，必须更新所属文件夹的 README.md

## 3. 上级目录传播
检查上级目录的 README.md 是否需要更新

## 4. 文档维护报告
完成代码修改后，输出文档维护报告
```

### 2. 项目结构导航 (project-structure)

用户需要自定义的部分，引用项目的核心目录：

```markdown
# 项目结构导航

## 核心目录索引

### 前端
#[[file:src/components/README.md]]
#[[file:src/pages/README.md]]

### 后端
#[[file:src/services/README.md]]
#[[file:src/models/README.md]]
```

### 3. 文档模板

#### folder-readme.md
```markdown
# {FOLDER_NAME}

<!-- 一旦我所属的文件夹有所变化，请更新我 -->

## 架构说明

{3行以内的架构描述}

## 文件索引

- `file1.ts` - 功能描述

## 更新提醒

任何文件变更后，请更新此文档和相关的上级文档。
```

#### file-header-*.txt
```
// input: {输入描述}
// output: {输出描述}
// pos: {架构位置描述}
// 一旦我被更新，务必更新我的开头注释，以及所属的文件夹的 README.md
```

## 安装流程

### 方式 1: 使用安装脚本

```bash
./install.sh /path/to/project kiro zh
./install.sh /path/to/project cursor en
./install.sh /path/to/project all zh
```

### 方式 2: 手动复制

```bash
# Kiro
cp -r zh/steering/ your-project/.kiro/steering/
cp -r zh/templates/ your-project/.kiro/templates/

# Cursor
cp -r zh/cursor/rules/ your-project/.cursor/rules/
```

### 方式 3: 使用 Kiro Spec（推荐）

1. 复制 `.kiro/specs/fractal-docs/` 到你的项目
2. 在 Kiro 中打开 spec
3. 让 AI 执行 tasks.md 中的任务
4. AI 会根据你的项目自动生成适配的配置

## 自定义指南

### 用户需要做的

1. **编辑 project-structure.md**: 添加自己项目的目录引用
2. **创建核心目录的 README.md**: 为每个引用的目录创建索引文件
3. **选择语言版本**: 中文或英文

### 用户不需要做的

1. 不需要修改 doc-maintenance.md（除非有特殊需求）
2. 不需要修改模板文件（除非有特殊格式要求）

## 已知问题与解决方案

### 问题 1: AI 不读取现有文档直接覆盖

**解决方案**: 在规则中明确添加"步骤 0: 先读取现有文档"，强调禁止直接覆盖。

### 问题 2: 自指提醒是注释，不是执行指令

**解决方案**: 自指提醒配合强制规则使用。关键是确保所有需要维护的目录都被引用到 project-structure.md 中。

### 问题 3: 不同编辑器语法不同

**解决方案**: 为每个编辑器提供独立的配置文件，使用各自的语法格式。

## 测试策略

1. **规则加载验证**: 修改代码文件，观察 AI 是否自动执行文档维护
2. **增量更新验证**: 检查 AI 是否先读取再更新，而非直接覆盖
3. **分形结构验证**: 检查生成的 README.md 是否符合模板格式
4. **多编辑器验证**: 在不同编辑器中测试规则是否正确加载
