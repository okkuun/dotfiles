# セットアップ手順

## 前提
- macOS専用
- 秘密情報はリポジトリ外で管理（例: `~/.gitconfig.local`）

## 1) Brewの準備
- Homebrewが未導入の場合は公式の手順で導入してください
- 共通/私用/社用のBrewfileを用途に応じて適用します

```
brew bundle --file brew/Brewfile.common
brew bundle --file brew/Brewfile.personal
```

## 2) dotfilesのリンク

```
PROFILE=personal scripts/apply.sh
```

## 3) ローカル専用ファイルの用意（任意）
- `~/.gitconfig.local`
- `~/.zshrc.local`

## 4) バックアップ

```
scripts/backup.sh
```
