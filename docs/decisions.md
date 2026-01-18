# Decisions

## 秘密情報の扱い
- SSHキーやトークンなどはリポジトリ外で管理
- 共有が必要な設定はテンプレ化して、値はローカルで設定

## 私用/社用の差分
- `profiles/personal/` と `profiles/work/` に分離
- `scripts/apply.sh` が選択したプロファイルのみをリンク
