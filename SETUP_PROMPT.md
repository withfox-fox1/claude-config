# Claude Code へ渡すセットアップ依頼文

以下をそのまま新しい PC（Mac / Windows）の Claude Code に貼り付ける。

---

GitHub の公開リポジトリ https://github.com/withfox-fox1/claude-config に、Claude Code の共通指示ファイル（CLAUDE.md と AGENTS.md）が入っています。この PC に導入し、あわせて Claude Code のユーザー設定をトークン節約向けに調整してください。

1. OS を判定する（Mac か Windows か）。以降は該当する方の手順に従う。
2. `git clone https://github.com/withfox-fox1/claude-config.git ~/claude-config` を実行する（ホーム直下の `claude-config`。既にあれば `cd ~/claude-config && git pull --ff-only`）。
3. 導入スクリプトを実行する。
   - Mac: `~/claude-config/install.sh`（シンボリックリンクを作成する）
   - Windows: `powershell.exe -NoProfile -ExecutionPolicy Bypass -File ~/claude-config/install.ps1`（ファイルをコピーする。Bash ツールが Git Bash でも PowerShell でも動く書き方。`~` が展開されない場合は `$HOME\claude-config\install.ps1` のフルパスを使う）
   - どちらも既存ファイルは `<ファイル名>.bak-<日時>` に自動で退避される。
4. ユーザー設定ファイル `~/.claude/settings.json`（Windows は `$HOME\.claude\settings.json`）を、あなた自身がファイル編集して次のとおり調整する。
   - 変更前に `settings.json.bak-<日時>` としてバックアップを取る。
   - `modelSettings` 内の各モデルにある `autoCompactWindow` を削除する。削除の結果 `modelSettings` が空になったら、`modelSettings` ごと削除する。（理由: 自動要約の上限を大きくすると、長い会話で 1 ターンあたりのトークン消費が増えるため）
   - `"language": "japanese"` を設定する。
   - 上記以外の既存設定は変更しない。
   - ファイルが存在しない場合は、`language` だけを持つ最小構成（`{"language": "japanese"}`）で新規作成する。
   - 編集後、JSON として正しいか確認する（パースできること）。
5. 結果を確認して報告する。
   - Mac: `ls -la ~/.claude/CLAUDE.md ~/AGENTS.md` でリンク 2 本を確認する。
   - Windows: コピー先 2 ファイル（`$HOME\.claude\CLAUDE.md`、`$HOME\AGENTS.md`）の存在と、リポジトリ版との内容一致を確認する。
   - 共通: `settings.json` の変更前後の差分（何を削除・設定したか）を報告する。
6. 次の 2 点をユーザーに伝える。
   - 新しい指示と設定は、Claude Code を再起動すると有効になる。
   - Windows はコピー方式のため、指示ファイルを更新するときは `git pull --ff-only` の後に `install.ps1` を再実行する必要がある（Mac はリンクなので pull だけで反映される）。
