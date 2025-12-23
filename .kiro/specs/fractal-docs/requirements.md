# 需求文档

## 介绍

Fractal Docs 是一套面向 AI 编程助手的自维护文档系统。它通过 Kiro Steering 机制（或其他 AI 编辑器的规则系统）自动加载文档维护规则，让 AI 在每次交互时都能理解项目结构并自动维护文档。

设计灵感来自《哥德尔、埃舍尔、巴赫》中的自指和递归概念。

## 术语表

- **Steering**: Kiro 的规则加载机制，通过 `.kiro/steering/*.md` 文件自动注入上下文
- **文件引用**: Kiro 的 `#[[file:path]]` 语法，自动拉取指定文件内容到上下文
- **分形结构**: 每个层级都遵循相同文档模式的递归结构
- **自指提醒**: 文档中包含的更新提醒文本，触发 AI 自动维护相关文档
- **三行注释**: 每个文件开头的 input/output/pos 标准注释格式
- **inclusion 模式**: Steering 文件的加载方式（always/fileMatch/manual）

## 需求

### 需求 1: 多编辑器支持

**用户故事:** 作为开发者，我希望 Fractal Docs 能支持多种 AI 编辑器，这样无论我使用哪个编辑器都能享受自动文档维护。

#### 验收标准

1. WHEN 用户使用 Kiro 时，THE 系统 SHALL 通过 `.kiro/steering/` 提供规则配置
2. WHEN 用户使用 Cursor 时，THE 系统 SHALL 通过 `.cursor/rules/` 提供规则配置
3. WHEN 用户使用 Claude Code 时，THE 系统 SHALL 通过 `CLAUDE.md` 和 `.claude/rules/` 提供规则配置
4. WHEN 用户使用 Windsurf 时，THE 系统 SHALL 通过 `.windsurfrules` 提供规则配置
5. WHEN 用户使用 GitHub Copilot 时，THE 系统 SHALL 通过 `.github/copilot-instructions.md` 提供规则配置
6. WHEN 用户使用 Cline 时，THE 系统 SHALL 通过 `.clinerules` 提供规则配置
7. WHEN 用户使用其他编辑器时，THE 系统 SHALL 通过 `AGENTS.md` 提供通用规则配置

### 需求 2: 双语支持

**用户故事:** 作为开发者，我希望能选择中文或英文版本的文档模板，这样可以匹配我的项目语言偏好。

#### 验收标准

1. WHEN 用户选择中文版本时，THE 系统 SHALL 生成中文的规则文件和模板
2. WHEN 用户选择英文版本时，THE 系统 SHALL 生成英文的规则文件和模板
3. WHEN 生成自指提醒时，THE 系统 SHALL 使用对应语言的提醒文本

### 需求 3: 文档维护规则

**用户故事:** 作为开发者，我希望 AI 在修改代码时自动执行文档维护，这样文档能与代码保持同步。

#### 验收标准

1. WHEN AI 修改代码文件时，THE AI SHALL 先读取现有文档再进行更新
2. WHEN AI 修改代码文件时，THE AI SHALL 更新文件头部的 input/output/pos 注释
3. WHEN AI 修改代码文件时，THE AI SHALL 更新所属文件夹的 README.md
4. WHEN 文件夹结构变化时，THE AI SHALL 检查并更新上级目录的 README.md
5. WHEN AI 完成修改时，THE AI SHALL 输出文档维护报告

### 需求 4: 项目结构导航

**用户故事:** 作为开发者，我希望 AI 能快速了解我的项目结构，这样就不用每次都重复解释目录职责。

#### 验收标准

1. WHEN AI 需要了解项目结构时，THE Steering 系统 SHALL 通过文件引用自动加载核心目录的 README.md
2. WHEN 用户配置项目结构时，THE 系统 SHALL 提供模板让用户填写自己的目录引用
3. WHEN 查找文件位置时，THE 目录索引 SHALL 提供文件名和功能描述的对应关系

### 需求 5: 分形结构自维护

**用户故事:** 作为开发者，我希望文档系统能够通过自指机制实现自我维护，体验局部影响整体、整体影响局部的效果。

#### 验收标准

1. WHEN 任何文档被更新时，THE 文档 SHALL 包含更新相关文档的自指提醒
2. WHEN 文件夹结构发生变化时，THE AI SHALL 自动更新当前目录和上级目录的 README.md
3. WHEN 新增文件时，THE AI SHALL 自动更新所属文件夹的文件索引

### 需求 6: 增量更新保护

**用户故事:** 作为开发者，我希望 AI 在更新文档时先读取现有内容再增量更新，这样不会丢失已有的文档内容。

#### 验收标准

1. WHEN AI 需要更新 README.md 时，THE AI SHALL 先检查文件是否存在
2. WHEN README.md 已存在时，THE AI SHALL 先读取现有内容再进行增量更新
3. WHEN README.md 不存在时，THE AI SHALL 使用模板创建新文件
4. WHEN AI 更新文件头部注释时，THE AI SHALL 保留现有注释并更新，而非完全覆盖

### 需求 7: 安装便捷性

**用户故事:** 作为开发者，我希望能通过简单的命令安装 Fractal Docs，这样可以快速在新项目中启用。

#### 验收标准

1. WHEN 用户运行安装脚本时，THE 脚本 SHALL 支持选择目标编辑器
2. WHEN 用户运行安装脚本时，THE 脚本 SHALL 支持选择语言版本
3. WHEN 安装完成时，THE 脚本 SHALL 输出下一步操作指引
