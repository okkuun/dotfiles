# dotfiles



## 目的
- macOSのセットアップを再現性高く行う
- 秘密情報はリポジトリに含めない

## ディレクトリ構成
- `brew/`：Brewfile（共通/私用/社用）
- `dotfiles/`：共通のdotfiles
- `profiles/`：私用/社用の差分
- `config/`：`~/.config`配下の設定
- `scripts/`：セットアップ用スクリプト
- `docs/`：運用ルール・手順

## 使い方（例）
1. プロファイルを選ぶ（`personal` or `work`）
2. Brewをインストールし、Brewfileを適用
3. dotfilesをリンクする

```
PROFILE=personal scripts/bootstrap.sh
```

詳細は `docs/setup.md` を参照してください。
