#!/usr/bin/env bash
#
# Linux/macOS 版 VSIX 安装脚本 —— 对应 vsc_installPackages.bat
# 用法: ./vsc_installPackages.sh <path-to-vsix>
#
set -u

VSIX_PATH="${1:-}"

if [ -z "$VSIX_PATH" ]; then
    echo "[ERROR] VSIX path is required. Usage: $(basename "$0") <path-to-vsix>" 1>&2
    exit 1
fi

if [ ! -f "$VSIX_PATH" ]; then
    echo "[ERROR] File not found: $VSIX_PATH" 1>&2
    exit 1
fi

# Locate code CLI with full absolute path
CODE_CMD=""

# 1) PATH lookup
if command -v code >/dev/null 2>&1; then
    CODE_CMD="$(command -v code)"
fi

# 2) Common install locations (official .deb/.rpm/tar.gz, snap, VS Code Server)
if [ -z "$CODE_CMD" ]; then
    for candidate in \
        "/usr/bin/code" \
        "/usr/local/bin/code" \
        "/opt/visual-studio-code/bin/code" \
        "/snap/bin/code" \
        "$HOME/.vscode/bin/code" \
        "$HOME/.vscode-server/bin/"*/bin/code \
        "$HOME/.cursor-server/bin/"*/bin/code
    do
        [ -x "$candidate" ] && CODE_CMD="$candidate" && break
    done
fi

if [ -z "$CODE_CMD" ]; then
    echo "[ERROR] VS Code CLI 'code' not found in PATH or common install locations." 1>&2
    exit 1
fi

# Install the VSIX silently; on failure, re-run to show the error
if ! "$CODE_CMD" --install-extension "$VSIX_PATH" --force >/dev/null 2>&1; then
    "$CODE_CMD" --install-extension "$VSIX_PATH" --force 1>&2
    exit 1
fi

exit 0
