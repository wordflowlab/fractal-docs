---
inclusion: always
---

# 文档维护自动提醒

当你修改或创建代码文件时，**必须**执行以下文档维护步骤：

## 0. 先读取现有文档（重要！）

修改文件前，**必须先检查并读取**：
- 所属文件夹是否已有 README.md？**如果有，先用 readFile 读取它**
- 文件是否已有头部注释？**如果有，保留并更新**

⚠️ **禁止直接覆盖创建**：不要在不读取的情况下直接创建 README.md，这会丢失已有内容！

## 1. 文件头部注释

每个代码文件必须有标准三行注释（根据文件类型选择对应模板）：

**Go 文件模板**：#[[file:.kiro/templates/file-header-go.txt]]
**TypeScript 文件模板**：#[[file:.kiro/templates/file-header-ts.txt]]
**Rust 文件模板**：#[[file:.kiro/templates/file-header-rs.txt]]
**Python 文件模板**：#[[file:.kiro/templates/file-header-py.txt]]

**检查**：当前文件是否有这三行注释？如果没有或需要更新，立即添加/更新。

## 2. 文件夹 README.md

修改文件后，必须更新所属文件夹的 README.md：

**文件夹 README 模板**：#[[file:.kiro/templates/folder-readme.md]]

- **如果 README.md 已存在**：先读取，然后增量更新文件索引部分
- **如果 README.md 不存在**：使用上述模板创建新文件

**检查**：所属文件夹是否有 README.md？文件索引是否包含当前文件？

## 3. 上级目录传播

如果文件夹结构发生变化，检查上级目录的 README.md 是否需要更新。

## 4. 文档维护报告

完成代码修改后，按以下格式输出文档维护报告：

```
## 文档维护报告

### 修改的文件
- `path/to/file.go` - [新建/修改]

### 文件注释状态
- ✅ 已有标准注释 / ⚠️ 已更新注释 / 🆕 已添加注释

### README.md 更新
- `path/to/folder/README.md` - [已更新/已创建/无需更新]

### 上级目录检查
- `parent/folder/README.md` - [已更新/无需更新]
```
