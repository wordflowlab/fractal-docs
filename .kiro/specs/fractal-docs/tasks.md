# 实施计划: Fractal Docs 初始化

## 概述

本 spec 用于在新项目中初始化 Fractal Docs 文档系统。执行此 spec 后，AI 将根据项目实际情况生成适配的 steering 规则、文档模板和目录索引。

## 前置条件

在执行任务前，请确认：
1. 你想使用哪个 AI 编辑器？（Kiro/Cursor/Claude Code/Windsurf/Copilot/Cline/全部）
2. 你想使用中文还是英文版本？
3. 你的项目核心目录有哪些？（如 src/components、src/services 等）

## 任务

- [ ] 1. 分析项目结构
  - [ ] 1.1 扫描项目目录结构
    - 识别前端/后端目录
    - 识别核心业务目录
    - 识别技术栈（TypeScript/Go/Rust/Python 等）
    - _需求: 4.1, 4.2_

  - [ ] 1.2 确定需要索引的核心目录
    - 列出建议索引的目录
    - 与用户确认目录列表
    - _需求: 4.2, 4.3_

- [ ] 2. 创建 Steering 规则文件（Kiro）
  - [ ] 2.1 创建 `.kiro/steering/doc-maintenance.md`
    - 设置 `inclusion: always`
    - 定义文档维护强制规则
    - 使用 `#[[file:path]]` 引用模板文件
    - _需求: 3.1, 3.2, 3.3, 3.4, 3.5, 6.1, 6.2_

  - [ ] 2.2 创建 `.kiro/steering/project-structure.md`
    - 设置 `inclusion: always`
    - 使用 `#[[file:path]]` 引用核心目录的 README.md
    - _需求: 4.1, 4.2_

- [ ] 3. 创建文档模板库
  - [ ] 3.1 创建 `.kiro/templates/folder-readme.md`
    - 包含架构说明占位符
    - 包含文件索引占位符
    - 包含自指更新提醒
    - _需求: 5.1_

  - [ ] 3.2 创建文件头部注释模板
    - 根据项目技术栈选择需要的模板
    - TypeScript: `.kiro/templates/file-header-ts.txt`
    - Go: `.kiro/templates/file-header-go.txt`
    - Rust: `.kiro/templates/file-header-rs.txt`
    - Python: `.kiro/templates/file-header-py.txt`
    - _需求: 5.1_

- [ ] 4. 创建核心目录索引
  - [ ] 4.1 为每个核心目录创建 README.md
    - 使用 folder-readme.md 模板
    - 填写架构说明（3行以内）
    - 列出文件索引
    - _需求: 4.3, 5.2, 5.3_

- [ ] 5. 创建其他编辑器配置（可选）
  - [ ] 5.1 Cursor 配置
    - 创建 `.cursor/rules/doc-maintenance.mdc`
    - 创建 `.cursor/rules/project-structure.mdc`
    - _需求: 1.2_

  - [ ] 5.2 Claude Code 配置
    - 创建 `CLAUDE.md`
    - 创建 `.claude/rules/doc-maintenance.md`
    - 创建 `.claude/rules/project-structure.md`
    - _需求: 1.3_

  - [ ] 5.3 Windsurf 配置
    - 创建 `.windsurfrules`
    - _需求: 1.4_

  - [ ] 5.4 GitHub Copilot 配置
    - 创建 `.github/copilot-instructions.md`
    - _需求: 1.5_

  - [ ] 5.5 Cline 配置
    - 创建 `.clinerules`
    - _需求: 1.6_

  - [ ] 5.6 通用 AGENTS.md
    - 创建 `AGENTS.md`
    - _需求: 1.7_

- [ ] 6. 验证系统效果
  - [ ] 6.1 验证规则加载
    - 修改一个代码文件
    - 检查 AI 是否自动执行文档维护
    - 检查文档维护报告是否正确输出
    - _需求: 3.5_

  - [ ] 6.2 验证增量更新
    - 修改已有 README.md 的目录中的文件
    - 检查 AI 是否先读取再更新
    - _需求: 6.1, 6.2, 6.3, 6.4_

## 注意事项

- **先分析再创建**: 任务 1 必须先完成，了解项目结构后再创建配置
- **用户确认**: 核心目录列表需要与用户确认
- **技术栈适配**: 根据项目实际使用的语言选择模板
- **增量更新**: 如果项目已有 README.md，先读取再更新
- **避免重复**: 不要在多个配置文件中重复定义相同规则

## 执行指南

### 如果你是 Kiro 用户

只需执行任务 1-4 和 6，跳过任务 5。

### 如果你使用多个编辑器

执行所有任务，为每个编辑器生成配置。

### 如果你只使用 Cursor/Claude Code 等

执行任务 1、3、4、对应的 5.x 子任务和 6。
