if has('win32')
	nmap <F1> :w<CR>:!firefox %<CR>
elseif has('mac')
	nmap <F1> :w<CR>:!open %<CR>
else
	nmap <F1> :w<CR>:!firefox %<CR>
endif

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
