let g:dein_dir = expand('~/.config/nvim/bundles')
let g:rc_dir    = expand("~/.config/nvim/rc")

let s:dein_repo_dir = g:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:toml      = g:rc_dir . '/dein.toml'
let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

execute 'set runtimepath+=' . s:dein_repo_dir

if dein#load_state(g:dein_dir)
  call dein#begin(g:dein_dir)

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
"  call dein#add('Shougo/dein.vim')

  call dein#end()
  call dein#save_state()
endif

"so ~/.config/nvim/rc/deoplete.vim
"so ~/.config/nvim/rc/denite.vim
"so ~/.config/nvim/rc/syntastic.vim
"so ~/.config/nvim/rc/OmniSharp.vim

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
