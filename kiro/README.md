# Kiro 初始化指南

## 核心概念

- **Spec** = 一次性初始化任务（执行完成后 Spec 就不再需要了）
- **生成的 Steering** = 持久配置（每次 AI 交互都会加载）

## 使用方法

1. 复制 `.kiro/specs/fractal-docs/` 到你的项目
2. 在 Kiro 中打开 `tasks.md`
3. 让 AI 执行 Spec 中的任务
4. 初始化完成后，可以删除 `specs/fractal-docs/` 目录

## 初始化后会生成

```
your-project/
├── .kiro/
│   ├── steering/
│   │   ├── doc-maintenance.md          # 文档维护规则（持久）
│   │   └── project-structure.md        # 项目结构导航（持久）
│   └── templates/
│       ├── folder-readme.md            # 文件夹 README 模板
│       └── file-header-*.txt           # 文件头注释模板
└── [核心目录]/README.md                # 目录索引（持久）
```

## 生成的规则说明

| 文件 | 作用 | 加载时机 |
|------|------|----------|
| `doc-maintenance.md` | 文档维护规则 | 每次对话（inclusion: always） |
| `project-structure.md` | 项目结构导航 | 每次对话（inclusion: always） |
| `templates/` | 文档模板 | 通过 `#[[file:path]]` 引用 |

## Kiro 特性

- 支持 Spec 系统（结构化任务执行）
- 支持 `#[[file:path]]` 文件引用语法
- 支持 `inclusion: fileMatch` 条件加载
- Steering 文件自动加载到上下文
