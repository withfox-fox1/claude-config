# claude-config

Claude Code の共通指示ファイルを複数の PC で共有するためのリポジトリ（public）。

| ファイル | 配置先 | 内容 |
|---|---|---|
| `CLAUDE.md` | `~/.claude/CLAUDE.md` | 全プロジェクト共通のグローバル指示 |
| `AGENTS.md` | `~/AGENTS.md` | ホームディレクトリで起動したときの作業スタンス |

Mac はシンボリックリンク、Windows はコピーで配置する（Windows のリンク作成には管理者権限/開発者モードが必要なため）。

## 導入

Mac:

```bash
git clone https://github.com/withfox-fox1/claude-config.git ~/claude-config
~/claude-config/install.sh
```

Windows（PowerShell 5.1 / 7）:

```powershell
git clone https://github.com/withfox-fox1/claude-config.git $HOME\claude-config
powershell -ExecutionPolicy Bypass -File "$HOME\claude-config\install.ps1"
```

既存のファイルは `<ファイル名>.bak-<日時>` に退避される。新しい PC の Claude Code に任せる場合は `SETUP_PROMPT.md` の本文を貼る（OS 判定から導入・確認まで自動で行う）。

## 更新

- 編集した PC: `cd ~/claude-config && git commit -am "..." && git push`
- 他の PC（Mac）: `cd ~/claude-config && git pull --ff-only`（リンクなのでこれだけで反映）
- 他の PC（Windows）: `git pull --ff-only` の後に `install.ps1` を再実行（コピーなので再実行が必要。内容が同じなら何もしない）

Mac でリンク先を直接編集すると、リポジトリ内のファイルが変更される。Windows では配置先ではなくリポジトリ内のファイルを編集する。

## settings.json の調整

`SETUP_PROMPT.md` は、`~/.claude/settings.json` のトークン節約向け調整も依頼する。

- `modelSettings` 内の `autoCompactWindow` を削除（自動要約の上限を大きくすると、長い会話で 1 ターンあたりのトークン消費が増えるため）
- `"language": "japanese"` を設定
- その他の既存設定は変更しない。変更前に `settings.json.bak-<日時>` へバックアップする。

## 注意

- メモリ（`~/.claude/projects/*/memory/`）は顧客情報を含むため、このリポジトリでは共有しない。
- 秘密情報（API キー・パスワード等）を指示ファイルに書かない。
