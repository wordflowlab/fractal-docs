# GitHub Copilot 初始化指南

## 核心概念

- **INIT_PROMPT.md** = 一次性初始化指令（复制到 chat 执行后就不需要了）
- **生成的规则** = 持久配置（每次 AI 交互都会加载）

## 使用方法

1. 将 `INIT_PROMPT.md` 的内容复制到 GitHub Copilot Chat 中
2. AI 会分析你的项目并生成 `.github/copilot-instructions.md`
3. 初始化完成后，`INIT_PROMPT.md` 就不再需要了

## 初始化后会生成

```
your-project/
├── .github/
│   └── copilot-instructions.md         # 项目指令（持久）
└── [核心目录]/README.md                # 目录索引（持久）
```

## 生成的规则说明

| 文件 | 作用 | 加载时机 |
|------|------|----------|
| `copilot-instructions.md` | 项目指令（包含文档维护规则和项目结构） | 每次对话 |

## GitHub Copilot 特性

- 只支持单一配置文件 `.github/copilot-instructions.md`
- 不支持条件加载
- 不支持文件引用语法
