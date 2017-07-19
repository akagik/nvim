# Install
neovim をインストール.

```bash
pip install neovim
pip3 install neovim
```

pyenv 環境を使って python2 と python3 の path をrc/settings.vim で指定する必要がある.

```vim
let g:python_host_prog = $PYENV_ROOT . '/shims/python'
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'
```

# Shougo's plugins
nvim を起動して
:UpdateRemotePlugins
を実行して、nvim を再起動したら動いた

# omnisharp のビルド
サブモジュールをアップデートした後, server ディレクトリ下で xbuild を実行.

```bash
git submodule update --init --recursive
cd server
xbuild
```
