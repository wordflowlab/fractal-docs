# AI Agent Guidelines

Universal configuration file for editors without specific steering mechanisms.

## Basic Rules

1. **Always output in English**
2. **Read existing documentation before making changes**

## Documentation Maintenance

### Fractal Structure Requirements
- Every folder must have README.md (3-line architecture description + file index)
- Every file must have 3-line header comments (input/output/pos)
- File changes must update header comments and folder index documents
- Maintain self-referential structure where local affects global and global affects local

### 0. Read Existing Docs First (Critical!)

Before modifying, **must check and read**:
- Does the folder have README.md? **If yes, read it first**
- Does the file have header comments? **If yes, preserve and update them**

⚠️ **Never overwrite without reading first!**

### File Header Comment Templates

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

Python files:
```python
# input: {INPUT_DESCRIPTION}
# output: {OUTPUT_DESCRIPTION}
# pos: {POSITION_DESCRIPTION}
# When updated, remember to update header comments and folder README.md
```

Rust files:
```rust
//! input: {INPUT_DESCRIPTION}
//! output: {OUTPUT_DESCRIPTION}
//! pos: {POSITION_DESCRIPTION}
//! When updated, remember to update header comments and folder README.md
```

### Folder README.md Template

```markdown
# {FOLDER_NAME}

<!-- Update me when this folder changes -->

## Architecture

{Brief description - 3 lines max}

## File Index

- `file1.go` - Description
- `file2.go` - Description

## Update Reminder

After any file changes, please update this document and related parent documents.
```

### Execution Checklist

After completing code changes, output documentation report in this format:

```
## Documentation Report

### Modified Files
- `path/to/file.go` - [new/modified]

### File Comment Status
- ✅ Has standard comments / ⚠️ Updated comments / 🆕 Added comments

### README.md Update
- `path/to/folder/README.md` - [updated/created/no change needed]

### Parent Directory Check
- `parent/folder/README.md` - [updated/no change needed]
```

## Project Structure Index

<!-- Customize this section to match your project -->

### Example Directories
- `src/components/README.md` - Components directory index
- `src/services/README.md` - Services layer index
- `src/models/README.md` - Data models index
