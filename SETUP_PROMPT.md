# Claude Code へ渡すセットアップ依頼文

以下をそのまま新しい PC の Claude Code に貼り付ける。

---

GitHub の公開リポジトリ https://github.com/withfox-fox1/claude-config に、Claude Code の共通指示ファイル（CLAUDE.md と AGENTS.md）が入っています。この PC に導入してください。

1. `git clone https://github.com/withfox-fox1/claude-config.git ~/claude-config`（既にあれば `cd ~/claude-config && git pull --ff-only`）
2. `~/claude-config/install.sh` を実行する（既存ファイルは自動で退避される）
3. `ls -la ~/.claude/CLAUDE.md ~/AGENTS.md` でリンクを確認し、結果を報告する
4. 新しい指示は次回の Claude Code 起動から有効になることを伝える
