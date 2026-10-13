# claude-config

Claude Code の共通指示ファイルを複数の PC で共有するためのリポジトリ（public）。

| ファイル | リンク先 | 内容 |
|---|---|---|
| `CLAUDE.md` | `~/.claude/CLAUDE.md` | 全プロジェクト共通のグローバル指示 |
| `AGENTS.md` | `~/AGENTS.md` | ホームディレクトリで起動したときの作業スタンス |

## 導入

```bash
git clone https://github.com/withfox-fox1/claude-config.git ~/claude-config
~/claude-config/install.sh
```

既存のファイルは `<ファイル名>.bak-<日時>` に退避される。

## 更新

- 編集した PC: `cd ~/claude-config && git commit -am "..." && git push`
- 他の PC: `cd ~/claude-config && git pull --ff-only`

リンク先を直接編集してもリポジトリ内のファイルが変更される。

## 注意

- メモリ（`~/.claude/projects/*/memory/`）は顧客情報を含むため、このリポジトリでは共有しない。
- 秘密情報（API キー・パスワード等）を指示ファイルに書かない。
