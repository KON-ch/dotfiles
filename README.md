# Setup

macOS 向けの開発環境、Zsh/Bash 設定、アプリケーションをセットアップします。

開発環境とシェル設定:

```sh
bash setup-dev.sh
```

アプリケーション:

```sh
bash install-apps.sh
```

どちらのスクリプトも、Homebrew が未導入の場合は導入します。`setup-dev.sh` は `git` とシェル設定を、`install-apps.sh` は Docker・各種ブラウザ・VS Code・Zoom を導入します。

`~/.zshrc`、`~/.bash_profile`、`~/.bashrc`、`~/.shellrc` が存在しない場合は、このリポジトリ内の対応するファイルへのシンボリックリンクを作成します。Git・Docker のエイリアスと関数は `.shellrc` で共有します。既存ファイルは変更しません。
