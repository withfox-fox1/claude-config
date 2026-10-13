# Claude Code へ渡すセットアップ依頼文

以下をそのまま新しい PC の Claude Code に貼り付ける。

---

GitHub の private リポジトリ withfox-fox1/claude-config に、Claude Code の共通指示ファイル（CLAUDE.md と AGENTS.md）が入っています。この PC に導入してください。

1. `gh auth status` で withfox-fox1 にログイン済みか確認する（未ログインなら `gh auth login` を私に案内する）
2. `gh repo clone withfox-fox1/claude-config ~/claude-config`（既にあれば `git pull --ff-only`）
3. `~/claude-config/install.sh` を実行する（既存ファイルは自動で退避される）
4. `ls -la ~/.claude/CLAUDE.md ~/AGENTS.md` でリンクを確認し、結果を報告する
5. 新しい指示は次回の Claude Code 起動から有効になることを伝える
