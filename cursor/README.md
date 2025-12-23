# Cursor 初始化指南

## 核心概念

- **INIT_PROMPT.md** = 一次性初始化指令（复制到 chat 执行后就不需要了）
- **生成的规则** = 持久配置（每次 AI 交互都会加载）

## 使用方法

1. 将 `INIT_PROMPT.md` 的内容复制到 Cursor 的 chat 中
2. AI 会分析你的项目并生成 `.cursor/rules/` 配置文件
3. 初始化完成后，`INIT_PROMPT.md` 就不再需要了

## 初始化后会生成

```
your-project/
├── .cursor/
│   └── rules/
│       ├── doc-maintenance.mdc         # 文档维护规则（持久）
│       └── project-structure.mdc       # 项目结构导航（持久）
└── [核心目录]/README.md                # 目录索引（持久）
```

## 生成的规则说明

| 文件 | 作用 | 加载时机 |
|------|------|----------|
| `doc-maintenance.mdc` | 文档维护规则 | 修改代码文件时（globs 匹配） |
| `project-structure.mdc` | 项目结构导航 | 每次对话（alwaysApply: true） |

## Cursor Rules 特性

- 使用 `.mdc` 扩展名
- 支持 `globs` 条件加载
- 支持 `@filename` 文件引用
