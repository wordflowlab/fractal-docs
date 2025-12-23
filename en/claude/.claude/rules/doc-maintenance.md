---
paths:
  - "**/*.go"
  - "**/*.ts"
  - "**/*.tsx"
  - "**/*.js"
  - "**/*.jsx"
  - "**/*.rs"
  - "**/*.py"
---

# Documentation Maintenance Rules

When you modify or create code files, you must follow these steps:

## 0. Read Existing Docs First (Critical!)

Before modifying, **must check and read**:
- Does the folder have README.md? **If yes, read it first**
- Does the file have header comments? **If yes, preserve and update them**

⚠️ **Never overwrite without reading first!**

## 1. File Header Comments

Every code file must have standard 3-line comments:

Go files:
```go
// input: {INPUT_DESCRIPTION}
// output: {OUTPUT_DESCRIPTION}
// pos: {POSITION_DESCRIPTION}
// When updated, remember to update header comments and folder README.md
```

TypeScript files:
```typescript
// input: {INPUT_DESCRIPTION}
// output: {OUTPUT_DESCRIPTION}
// pos: {POSITION_DESCRIPTION}
// When updated, remember to update header comments and folder README.md
```

## 2. Folder README.md

After modifying files, update the folder's README.md:

- **If README.md exists**: Read first, then incrementally update file index section
- **If README.md doesn't exist**: Create using template

## 3. Parent Directory Propagation

Check if parent directory's README.md needs updating.

## 4. Documentation Report

After completing code changes, output:

```
📝 Documentation Report
- Modified files: [file list]
- README updated: [yes/no] [path]
- Parent check: [checked/needs update]
```
