
function! kohei#hook#denite#hook_source() abort
  nnoremap <leader>b :Denite buffer<CR>
  nnoremap <leader>f :Denite file/rec<CR>
  nnoremap <leader>F :Denite file/rec/git<CR>
  nnoremap <leader>G :Denite -auto-action=preview grep<CR>
  nnoremap <leader>N :Denite directory_rec -default-action=new<CR>
  nnoremap <leader><leader> :Denite -resume<CR>
  
	" Ag command on grep source
	call denite#custom#var('grep', 'command', ['ag'])
	call denite#custom#var('grep', 'default_opts',
			\ ['-i', '--vimgrep'])
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'pattern_opt', [])
	call denite#custom#var('grep', 'separator', ['--'])
	call denite#custom#var('grep', 'final_opts', [])
  "
	" Define alias
	call denite#custom#alias('source', 'file/rec/git', 'file/rec')
	call denite#custom#var('file/rec/git', 'command',
	      \ ['git', 'ls-files', '-co', '--exclude-standard'])

	call denite#custom#alias('source', 'file/rec/cs', 'file/rec')
	call denite#custom#var('file/rec/cs', 'command', ['ag', '-g', '.cs$'])

	" Change ignore_globs
  " TODO うまく反映されてない
	call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
	      \ [ '*.jar', '.git/', '.ropeproject/', '__pycache__/',
	      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

  function! s:open_newfile(context) abort
    let s:newfilename = input('new file name:')
    let s:newpath = a:context['targets'][0]['action__path'] . '/' . s:newfilename
    execute('e ' . s:newpath)
  endfunction

	" Custom action
	call denite#custom#action('directory', 'new', {context -> s:open_newfile(context)})

	autocmd FileType denite call s:denite_my_settings()
	function! s:denite_my_settings() abort
    inoremap <silent><buffer><expr> <BS>    denite#do_map('move_up_path')
    nnoremap <silent><buffer><expr> <CR>    denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d       denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p       denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q       denite#do_map('quit')
    nnoremap <silent><buffer><expr> i       denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
	endfunction

  echo "source denite"
endfunction
