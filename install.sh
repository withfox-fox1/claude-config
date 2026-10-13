#!/bin/bash
# Claude Code の共通指示ファイルを、このリポジトリへのシンボリックリンクとして配置する。
# 既存ファイルがある場合は <ファイル名>.bak-<日時> に退避してから置き換える。
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
STAMP="$(date +%Y%m%d-%H%M%S)"

link() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "OK (既にリンク済み): $dest"
    return
  fi
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    mv "$dest" "$dest.bak-$STAMP"
    echo "退避: $dest -> $dest.bak-$STAMP"
  fi
  ln -s "$src" "$dest"
  echo "リンク作成: $dest -> $src"
}

link "$REPO_DIR/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
link "$REPO_DIR/AGENTS.md" "$HOME/AGENTS.md"
