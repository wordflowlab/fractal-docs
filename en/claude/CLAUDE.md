# AI Agent Guidelines

## About This Project

<!-- Customize this section to describe your project -->

## Basic Rules

1. **Always output in English**
2. **Read existing documentation before making changes**

## Documentation Maintenance

### 0. Read Existing Docs First (Critical!)

Before modifying, **must check and read**:
- Does the folder have README.md? **If yes, read it first with `cat` or file reading tools**
- Does the file have header comments? **If yes, preserve and update them**

⚠️ **Never overwrite without reading first!** This prevents content loss.

### 1. File Header Comments

Every code file must have standard 3-line comments:

**Go files:**
```go
// input: {INPUT_DESCRIPTION}
// output: {OUTPUT_DESCRIPTION}
// pos: {POSITION_DESCRIPTION}
// When updated, remember to update header comments and folder README.md
```

**TypeScript files:**
```typescript
// input: {INPUT_DESCRIPTION}
// output: {OUTPUT_DESCRIPTION}
// pos: {POSITION_DESCRIPTION}
// When updated, remember to update header comments and folder README.md
```

**Python files:**
```python
# input: {INPUT_DESCRIPTION}
# output: {OUTPUT_DESCRIPTION}
# pos: {POSITION_DESCRIPTION}
# When updated, remember to update header comments and folder README.md
```

**Rust files:**
```rust
//! input: {INPUT_DESCRIPTION}
//! output: {OUTPUT_DESCRIPTION}
//! pos: {POSITION_DESCRIPTION}
//! When updated, remember to update header comments and folder README.md
```

### 2. Folder README.md

After modifying files, update the folder's README.md:

- **If README.md exists**: Read first, then incrementally update file index section
- **If README.md doesn't exist**: Create using this template

```markdown
# {folder-name}

<!-- Update me when this folder changes -->

## Architecture

{Brief description - 3 lines max}

## File Index

- `file1.ts` - Description
- `file2.ts` - Description
```

### 3. Parent Directory Propagation

When folder structure changes, check if parent directory's README.md needs updating.

### 4. Documentation Report

After completing code changes, output:

```
📝 Documentation Report
- Modified files: [file list]
- README updated: [yes/no] [path]
- Parent check: [checked/needs update]
```

## Project Structure

<!-- Use @path/to/file syntax to reference files -->

Reference these files to understand project structure:

@src/components/README.md
@src/services/README.md

## Common Commands

```bash
# Add your build commands here
npm run build
npm run test
npm run lint
```
