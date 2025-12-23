# 设计文档

## 概述

Fractal Docs 基于 Kiro 的 Steering 机制实现，通过自动加载的规则文件和文件引用语法，让 AI 在每次交互时都能获取项目结构上下文，并自动执行文档维护任务。

## 架构

### Kiro Steering 驱动的设计

```
Fractal Docs 系统
├── Steering 规则 (.kiro/steering/)
│   ├── doc-maintenance.md      # 文档维护规则（always）
│   └── project-structure.md    # 项目结构导航（always）
├── 文档模板库 (.kiro/templates/)
│   ├── folder-readme.md        # 文件夹 README 模板
│   └── file-header-*.txt       # 文件头部注释模板
└── 目录索引 (各目录 README.md)
    └── 通过 #[[file:path]] 引用到 Steering 中
```

### Steering 机制工作流程

```
┌─────────────────┐
│   Kiro 启动     │
└────────┬────────┘
         │
         ▼
┌─────────────────────────────────┐
│ 加载 .kiro/steering/*.md       │
│ (inclusion: always 的文件)      │
└────────┬────────────────────────┘
         │
         ▼
┌─────────────────────────────────┐
│ 解析 #[[file:path]] 引用        │
│ 拉取 README.md 内容到上下文     │
└────────┬────────────────────────┘
         │
         ▼
┌─────────────────────────────────┐
│ AI 获得完整项目结构 + 维护规则  │
└────────┬────────────────────────┘
         │
         ▼
┌─────────────────────────────────┐
│ 修改代码时自动执行文档维护      │
│ 输出文档维护报告                │
└─────────────────────────────────┘
```

## 组件和接口

### 1. Steering 规则文件

#### doc-maintenance.md
强制文档维护规则，每次交互都加载。包含：
- 步骤 0: 先读取现有文档（防止覆盖）
- 步骤 1: 文件头部注释
- 步骤 2: 文件夹 README.md
- 步骤 3: 上级目录传播
- 步骤 4: 文档维护报告

#### project-structure.md
项目结构导航，通过 `#[[file:path]]` 引用核心目录的 README.md。

### 2. 文档模板库

#### folder-readme.md
```markdown
# {FOLDER_NAME}

<!-- 一旦我所属的文件夹有所变化，请更新我 -->

## 架构说明

{ARCHITECTURE_DESCRIPTION}

## 文件索引

{FILE_INDEX}
```

#### file-header-*.txt
```
// input: {INPUT_DESCRIPTION}
// output: {OUTPUT_DESCRIPTION}
// pos: {POSITION_DESCRIPTION}
// 一旦我被更新，务必更新我的开头注释，以及所属的文件夹的 README.md
```

### 3. 目录索引 README.md

每个核心目录都有 README.md，包含：
- 架构说明（3行以内）
- 文件索引（文件名 + 功能描述）
- 自指更新提醒

## 已知问题与解决方案

### 问题 1: AI 不读取现有文档直接覆盖

**解决方案**: 在 doc-maintenance.md 中添加"步骤 0: 先读取现有文档"，明确禁止直接覆盖。

### 问题 2: 自指提醒是注释，不是执行指令

**解决方案**: 自指提醒配合强制规则使用。关键是确保所有需要维护的目录都被引用到 project-structure.md 中。
