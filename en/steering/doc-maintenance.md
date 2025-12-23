---
inclusion: always
---

# Documentation Maintenance Rules

When you modify or create code files, you **must** follow these documentation maintenance steps:

## 0. Read Existing Docs First (Critical!)

Before modifying, **must check and read**:
- Does the folder have README.md? **If yes, read it first with readFile**
- Does the file have header comments? **If yes, preserve and update them**

⚠️ **Never overwrite without reading first!** This prevents content loss.

## 1. File Header Comments

Every code file must have standard 3-line comments (choose template based on file type):

**Go file template**: #[[file:.kiro/templates/file-header-go.txt]]
**TypeScript file template**: #[[file:.kiro/templates/file-header-ts.txt]]
**Rust file template**: #[[file:.kiro/templates/file-header-rs.txt]]
**Python file template**: #[[file:.kiro/templates/file-header-py.txt]]

**Check**: Does the current file have these 3-line comments? If not or needs update, add/update immediately.

## 2. Folder README.md

After modifying files, update the folder's README.md:

**Folder README template**: #[[file:.kiro/templates/folder-readme.md]]

- **If README.md exists**: Read first, then incrementally update file index section
- **If README.md doesn't exist**: Create using the template above

**Check**: Does the folder have README.md? Does file index include current file?

## 3. Parent Directory Propagation

If folder structure changes, check if parent directory's README.md needs updating.

## 4. Documentation Report

After completing code changes, output in this format:

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
