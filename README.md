# Setup

macOS 向けの開発環境と Zsh/Bash の設定をセットアップします。

```sh
bash install.sh
```

このスクリプトは Homebrew（未導入の場合）、`git`、`fzf`、および Docker・各種ブラウザ・VS Code などを導入します。

`~/.zshrc`、`~/.bash_profile`、`~/.bashrc`、`~/.shellrc` が存在しない場合は、このリポジトリ内の対応するファイルへのシンボリックリンクを作成します。Git・Docker のエイリアスと関数は `.shellrc` で共有します。既存ファイルは変更しません。
