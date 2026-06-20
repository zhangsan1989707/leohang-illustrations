#!/usr/bin/env bash
set -euo pipefail

# Leohang Illustrations — One-click installer
# Detects your AI editor and installs the skill files.

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
INSTALLED=()

detect_and_install() {
  # Claude Code / Codex
  if [ -n "${CODEX_HOME:-}" ] || [ -d "$HOME/.codex" ]; then
    local target="${CODEX_HOME:-$HOME/.codex}/skills/leohang-illustrations"
    mkdir -p "$(dirname "$target")"
    rsync -a --exclude='.git' --exclude='.DS_Store' "$REPO_DIR/" "$target/"
    INSTALLED+=("Codex → $target")
  fi

  # QoderWork
  if [ -d "$HOME/.qoderworkcn/skills" ]; then
    local target="$HOME/.qoderworkcn/skills/leohang-illustrations"
    mkdir -p "$(dirname "$target")"
    rsync -a --exclude='.git' --exclude='.DS_Store' "$REPO_DIR/" "$target/"
    INSTALLED+=("QoderWork → $target")
  fi

  # Cursor (install to current project if .cursor exists)
  if [ -d ".cursor" ]; then
    mkdir -p .cursor/rules
    cp "$REPO_DIR/.cursor/rules/leohang-illustrations.mdc" .cursor/rules/
    INSTALLED+=("Cursor → .cursor/rules/leohang-illustrations.mdc")
  fi

  # VS Code + Copilot (install to current project if .github exists)
  if [ -d ".github" ]; then
    cp "$REPO_DIR/.github/copilot-instructions.md" .github/
    INSTALLED+=("Copilot → .github/copilot-instructions.md")
  fi

  # Windsurf (install to current project if .windsurfrules exists or user wants it)
  if [ -f ".windsurfrules" ] || [ -d ".windsurf" ]; then
    cp "$REPO_DIR/.windsurfrules" .
    INSTALLED+=("Windsurf → .windsurfrules")
  fi
}

# Run
echo ""
echo "  Leohang Illustrations — Skill Installer"
echo "  ========================================="
echo ""

detect_and_install

if [ ${#INSTALLED[@]} -eq 0 ]; then
  echo "  ⚠  No supported AI editor detected in this directory."
  echo ""
  echo "  Manual options:"
  echo "    Codex:     cp -R . \"\${CODEX_HOME:-\$HOME/.codex}/skills/leohang-illustrations\""
  echo "    QoderWork: cp -R . \"\$HOME/.qoderworkcn/skills/leohang-illustrations\""
  echo "    Cursor:    cp .cursor/rules/leohang-illustrations.mdc <project>/.cursor/rules/"
  echo "    Copilot:   cp .github/copilot-instructions.md <project>/.github/"
  echo "    Windsurf:  cp .windsurfrules <project>/"
  echo ""
else
  echo "  ✅ Installed to:"
  for item in "${INSTALLED[@]}"; do
    echo "     • $item"
  done
fi

echo ""
echo "  Done. Start a new conversation and ask your AI to generate illustrations."
echo ""
