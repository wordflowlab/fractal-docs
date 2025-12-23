#!/bin/bash

# Fractal Docs Installation Script
# Usage: ./install.sh [target_dir] [editor] [lang]
# Editors: kiro, cursor, claude, windsurf, copilot, cline, all
# Languages: zh (Chinese), en (English)

TARGET_DIR="${1:-.}"
EDITOR="${2:-all}"
LANG="${3:-en}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "🌀 Fractal Docs Installer"
echo "========================="
echo "Target: $TARGET_DIR"
echo "Editor: $EDITOR"
echo "Language: $LANG"
echo ""

# Validate language
if [[ "$LANG" != "zh" && "$LANG" != "en" ]]; then
    echo "❌ Invalid language: $LANG"
    echo "Available: zh (Chinese), en (English)"
    exit 1
fi

LANG_DIR="$SCRIPT_DIR/$LANG"

if [[ ! -d "$LANG_DIR" ]]; then
    echo "❌ Language directory not found: $LANG_DIR"
    exit 1
fi

# Create templates directory (shared across all editors)
mkdir -p "$TARGET_DIR/.fractal-docs/templates"

# Copy shared templates
cp "$LANG_DIR/templates/folder-readme.md" "$TARGET_DIR/.fractal-docs/templates/"
cp "$LANG_DIR/templates/file-header-ts.txt" "$TARGET_DIR/.fractal-docs/templates/"
cp "$LANG_DIR/templates/file-header-go.txt" "$TARGET_DIR/.fractal-docs/templates/"
cp "$LANG_DIR/templates/file-header-rs.txt" "$TARGET_DIR/.fractal-docs/templates/"
cp "$LANG_DIR/templates/file-header-py.txt" "$TARGET_DIR/.fractal-docs/templates/"

echo "✅ Shared templates installed"

install_kiro() {
    echo "📦 Installing Kiro configuration..."
    mkdir -p "$TARGET_DIR/.kiro/steering"
    mkdir -p "$TARGET_DIR/.kiro/templates"
    cp "$LANG_DIR/steering/doc-maintenance.md" "$TARGET_DIR/.kiro/steering/"
    cp "$LANG_DIR/steering/project-structure.md" "$TARGET_DIR/.kiro/steering/"
    cp "$LANG_DIR/templates/"* "$TARGET_DIR/.kiro/templates/"
    echo "   ✅ Kiro: .kiro/steering/"
}

install_cursor() {
    echo "📦 Installing Cursor configuration..."
    mkdir -p "$TARGET_DIR/.cursor/rules"
    cp "$LANG_DIR/cursor/rules/doc-maintenance.mdc" "$TARGET_DIR/.cursor/rules/"
    cp "$LANG_DIR/cursor/rules/project-structure.mdc" "$TARGET_DIR/.cursor/rules/"
    echo "   ✅ Cursor: .cursor/rules/"
}

install_claude() {
    echo "📦 Installing Claude Code configuration..."
    cp "$LANG_DIR/claude/CLAUDE.md" "$TARGET_DIR/"
    if [[ -d "$LANG_DIR/claude/.claude" ]]; then
        mkdir -p "$TARGET_DIR/.claude/rules"
        cp "$LANG_DIR/claude/.claude/rules/"* "$TARGET_DIR/.claude/rules/"
        echo "   ✅ Claude Code: CLAUDE.md + .claude/rules/"
    else
        echo "   ✅ Claude Code: CLAUDE.md"
    fi
}

install_windsurf() {
    echo "📦 Installing Windsurf configuration..."
    cp "$LANG_DIR/windsurf/.windsurfrules" "$TARGET_DIR/"
    echo "   ✅ Windsurf: .windsurfrules"
}

install_copilot() {
    echo "📦 Installing GitHub Copilot configuration..."
    mkdir -p "$TARGET_DIR/.github"
    cp "$LANG_DIR/copilot/.github/copilot-instructions.md" "$TARGET_DIR/.github/"
    echo "   ✅ Copilot: .github/copilot-instructions.md"
}

install_cline() {
    echo "📦 Installing Cline configuration..."
    cp "$LANG_DIR/cline/.clinerules" "$TARGET_DIR/"
    echo "   ✅ Cline: .clinerules"
}

install_agents() {
    echo "📦 Installing AGENTS.md (universal)..."
    cp "$LANG_DIR/AGENTS.md" "$TARGET_DIR/"
    echo "   ✅ AGENTS.md"
}

case $EDITOR in
    kiro)
        install_kiro
        ;;
    cursor)
        install_cursor
        ;;
    claude)
        install_claude
        ;;
    windsurf)
        install_windsurf
        ;;
    copilot)
        install_copilot
        ;;
    cline)
        install_cline
        ;;
    agents)
        install_agents
        ;;
    all)
        install_kiro
        install_cursor
        install_claude
        install_windsurf
        install_copilot
        install_cline
        install_agents
        ;;
    *)
        echo "❌ Unknown editor: $EDITOR"
        echo "Available: kiro, cursor, claude, windsurf, copilot, cline, agents, all"
        exit 1
        ;;
esac

echo ""
echo "🎉 Installation complete!"
echo ""
if [[ "$LANG" == "zh" ]]; then
    echo "📝 下一步:"
    echo "1. 编辑项目结构文件，添加你的目录引用"
    echo "2. 为核心目录创建 README.md"
    echo "3. 开始使用 AI 助手编写代码！"
else
    echo "📝 Next steps:"
    echo "1. Edit the project structure file to add your directory references"
    echo "2. Create README.md for your core directories"
    echo "3. Start coding with your AI assistant!"
fi
echo ""
echo "📁 Template location: .fractal-docs/templates/"
