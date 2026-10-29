# Claude Code の共通指示ファイルを、このリポジトリからコピーして配置する（Windows 用）。
# Windows ではシンボリックリンクに管理者権限/開発者モードが必要なため、コピー方式を採る。
# 既存ファイルがあり内容が異なる場合は <ファイル名>.bak-<日時> に退避してから置き換える。
# 内容が同一なら何もしない（冪等）。
# 更新時は `git pull --ff-only` の後にこのスクリプトを再実行すれば反映される。
# Windows PowerShell 5.1 / PowerShell 7 の両方で動作する。
$ErrorActionPreference = 'Stop'

$RepoDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$Stamp = Get-Date -Format 'yyyyMMdd-HHmmss'

function Copy-Config {
    param([string]$Src, [string]$Dest)

    $destDir = Split-Path -Parent $Dest
    if (-not (Test-Path -LiteralPath $destDir)) {
        New-Item -ItemType Directory -Path $destDir -Force | Out-Null
    }

    if (Test-Path -LiteralPath $Dest) {
        $srcHash = (Get-FileHash -LiteralPath $Src -Algorithm SHA256).Hash
        $destHash = (Get-FileHash -LiteralPath $Dest -Algorithm SHA256).Hash
        if ($srcHash -eq $destHash) {
            Write-Host "OK (最新): $Dest"
            return
        }
        $backup = "$Dest.bak-$Stamp"
        Move-Item -LiteralPath $Dest -Destination $backup
        Write-Host "退避: $Dest -> $backup"
    }

    Copy-Item -LiteralPath $Src -Destination $Dest
    Write-Host "コピー作成: $Dest <- $Src"
}

Copy-Config (Join-Path $RepoDir 'CLAUDE.md') (Join-Path $HOME '.claude\CLAUDE.md')
Copy-Config (Join-Path $RepoDir 'AGENTS.md') (Join-Path $HOME 'AGENTS.md')
