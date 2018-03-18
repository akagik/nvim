" pyevn の Python へのパスを指定
if empty($PYENV_ROOT)
  if has('win32')
  elseif has('mac')
    let g:python_host_prog = '/usr/bin/python'
    let g:python3_host_prog = '/usr/local/bin/python3'
  else
    let g:python_host_prog = '/usr/bin/python'
    let g:python3_host_prog = '/usr/bin/python3'
  endif
else
  let g:python_host_prog = $PYENV_ROOT . '/shims/python'
  let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'
endif


set clipboard+=unnamedplus " クリップボードを有効にする

syntax on
set number
set hidden              " バッファを閉じる代わりに
                        " 隠す（Undo履歴を残すため）
set matchpairs& matchpairs+=<:> 
                        " 対応括弧に'<'と'>'のペアを追加
set matchtime=2         " 対応括弧のハイライトする時間を 2 秒に。
set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase          " 大文字・小文字を無視する。
set smartcase           " 検索文字に大文字が入っている場合、区別する。
set incsearch
set hlsearch
set colorcolumn=100      " 100文字目に色付け
set backspace=indent,eol,start 
                        " BSで削除できるものを指定する
set fdm=marker          " 折り畳みを作成したときにマーカーを挿入

set backup
set backupdir=/tmp
set noswapfile          " スワップファイルを作成しない

set encoding=utf-8
set fileencoding=utf-8

let mapleader = "\<Space>" " マップリーダーをスペースに設定

" カーソル下の単語を * で検索
vnoremap <silent> *
    \ "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>
" ESCを二回押すことでハイライトを消す
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

" " 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" window の移動, Insert Mode からでも移動できるようにする
" inoremap <C-w><C-w> <ESC><C-w><C-w> " <C-w> 単語削除と被るので削除
nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j
inoremap <Right> <ESC><C-w>l
inoremap <Left> <ESC><C-w>h
inoremap <Up> <ESC><C-w>k
inoremap <Down> <ESC><C-w>j
inoremap <C-^> <ESC><C-^>

inoremap <silent> jj <ESC>
