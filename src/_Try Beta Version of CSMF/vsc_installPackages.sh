#!/usr/bin/env bash
#
# Linux/macOS 版 VSIX 安装脚本 —— 对应 vsc_installPackages.bat
# 用法: ./vsc_installPackages.sh <path-to-vsix>
#
# ---- CRLF 兼容性保护（自愈）----
# 若本文件被以 Windows 行尾（CRLF，\r\n）保存，bash 会把每行末尾的 \r 当作普通
# 字符，导致 set -u、then/fi 等关键字及行尾续行符（\）解析出错。因此这里必须在
# set -u 之前、且以 # 结尾（保证 \r 落入注释被忽略）的单行内完成检测与自愈：
# 检测到 CRLF 时，自动去除所有 \r 生成临时副本并重新执行本脚本。
# 这样无论文件是 LF 还是 CRLF 行尾，脚本都能正常运行。
if LC_ALL=C grep -q $'\r' "$0" 2>/dev/null; then _t="${TMPDIR:-/tmp}/vsc_install_$$.sh"; tr -d '\r' <"$0" >"$_t"; chmod +x "$_t"; bash "$_t" "$@"; _rc=$?; rm -f "$_t"; exit $_rc; fi #
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
