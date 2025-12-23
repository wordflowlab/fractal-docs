# 实施计划: Fractal Docs 文档系统初始化

## 概述

基于 Kiro Steering 机制实现分形文档管理系统。通过创建 Steering 规则文件、文档模板和目录索引，让 AI 在每次交互时自动获取项目结构并执行文档维护。

## 前置确认

在执行任务前，请与用户确认：
1. 使用中文还是英文版本？
2. 项目的核心目录有哪些？（如 src/components、src/services 等）
3. 项目使用的技术栈？（TypeScript/Go/Rust/Python 等）

## 任务

- [ ] 1. 分析项目结构
  - [ ] 1.1 扫描项目目录结构
    - 使用 listDirectory 扫描项目根目录
    - 识别前端/后端目录
    - 识别核心业务目录
    - 识别技术栈
    - _需求: 3.1, 3.2_

  - [ ] 1.2 确定需要索引的核心目录
    - 列出建议索引的目录
    - 与用户确认目录列表
    - _需求: 3.2, 3.3_

- [ ] 2. 创建 Steering 规则文件
  - [ ] 2.1 创建 `.kiro/steering/doc-maintenance.md`
    - 设置 `inclusion: always` 确保每次加载
    - 定义文档维护强制规则（包含"先读取再更新"）
    - 使用 `#[[file:path]]` 引用模板文件
    - _需求: 1.1, 1.2, 1.3, 1.4, 5.1, 5.2_

  - [ ] 2.2 创建 `.kiro/steering/project-structure.md`
    - 设置 `inclusion: always` 确保每次加载
    - 使用 `#[[file:path]]` 引用核心目录的 README.md
    - _需求: 3.1, 3.2_

- [ ] 3. 创建文档模板库
  - [ ] 3.1 创建 `.kiro/templates/folder-readme.md`
    - 包含架构说明占位符
    - 包含文件索引占位符
    - 包含自指更新提醒
    - _需求: 2.1, 4.1_

  - [ ] 3.2 创建文件头部注释模板（根据项目技术栈选择）
    - TypeScript: `.kiro/templates/file-header-ts.txt`
    - Go: `.kiro/templates/file-header-go.txt`
    - Rust: `.kiro/templates/file-header-rs.txt`
    - Python: `.kiro/templates/file-header-py.txt`
    - _需求: 2.2, 2.4_

- [ ] 4. 创建核心目录索引
  - [ ] 4.1 为每个核心目录创建 README.md
    - 使用 folder-readme.md 模板
    - 填写架构说明（3行以内）
    - 列出文件索引
    - _需求: 3.1, 3.2, 3.3, 4.2, 4.3_

- [ ] 5. 验证系统效果
  - [ ] 5.1 验证 Steering 规则加载
    - 修改代码文件，观察 AI 是否自动执行文档维护
    - 检查文档维护报告是否正确输出
    - _需求: 1.4, 6.1, 6.2_

  - [ ] 5.2 验证增量更新
    - 修改已有 README.md 的目录中的文件
    - 检查 AI 是否先读取再更新
    - _需求: 5.1, 5.2, 5.3, 5.4_

## 模板参考

### doc-maintenance.md 模板

```markdown
---
inclusion: always
---

# 文档维护自动提醒

当你修改或创建代码文件时，**必须**执行以下文档维护步骤：

## 0. 先读取现有文档（重要！）

修改文件前，**必须先检查并读取**：
- 所属文件夹是否已有 README.md？**如果有，先用 readFile 读取它**
- 文件是否已有头部注释？**如果有，保留并更新**

⚠️ **禁止直接覆盖创建**：不要在不读取的情况下直接创建 README.md！

## 1. 文件头部注释

#[[file:.kiro/templates/file-header-ts.txt]]

## 2. 文件夹 README.md

#[[file:.kiro/templates/folder-readme.md]]

- **如果 README.md 已存在**：先读取，然后增量更新文件索引部分
- **如果 README.md 不存在**：使用上述模板创建新文件

## 3. 上级目录传播

检查上级目录的 README.md 是否需要更新。

## 4. 文档维护报告

完成代码修改后，输出报告。
```

### project-structure.md 模板

```markdown
---
inclusion: always
---

# 项目结构导航

{项目简介}

## 核心目录索引

### {目录1名称}
#[[file:{path/to/dir1}/README.md]]

### {目录2名称}
#[[file:{path/to/dir2}/README.md]]
```

### folder-readme.md 模板

```markdown
# {FOLDER_NAME}

<!-- 一旦我所属的文件夹有所变化，请更新我 -->

## 架构说明

{ARCHITECTURE_DESCRIPTION}

## 文件索引

{FILE_INDEX}

## 更新提醒

任何文件变更后，请更新此文档和相关的上级文档。
```

### file-header-ts.txt 模板

```
// input: {输入描述}
// output: {输出描述}
// pos: {架构位置描述}
// 一旦我被更新，务必更新我的开头注释，以及所属的文件夹的 README.md
```

## 注意事项

- **Kiro Steering 驱动**: 核心机制依赖 Kiro 的 Steering 功能
- **inclusion: always**: 确保规则每次都加载，不遗漏
- **文件引用语法**: 使用 `#[[file:path]]` 自动拉取内容
- **自指提醒**: 文档中包含更新提醒，触发 AI 自动维护
- **分形一致性**: 所有目录 README.md 遵循相同模板结构
- **技术栈适配**: 根据项目实际使用的语言选择模板
- **增量更新**: 如果项目已有 README.md，先读取再更新
