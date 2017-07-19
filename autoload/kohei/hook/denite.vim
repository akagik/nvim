function! kohei#hook#denite#hook_source() abort
  echo "source denite"
  nnoremap <leader>B :Denite buffer<CR>
  nnoremap <leader>F :Denite file_rec/git<CR>
  nnoremap <leader>G :Denite -auto-preview grep<CR>
  nnoremap <leader>N :Denite directory_rec -default-action=new<CR>

  " custom map in denite
	call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
	call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
	call denite#custom#map('insert', '<C-d>', '<denite:scroll_window_downwards>', 'noremap')
	call denite#custom#map('insert', '<C-u>', '<denite:scroll_window_upwards>', 'noremap')

	" Ag command on grep source
	call denite#custom#var('grep', 'command', ['ag'])
	call denite#custom#var('grep', 'default_opts',
			\ ['-i', '--vimgrep'])
	call denite#custom#var('grep', 'recursive_opts', [])
	call denite#custom#var('grep', 'pattern_opt', [])
	call denite#custom#var('grep', 'separator', ['--'])
	call denite#custom#var('grep', 'final_opts', [])

	" Define alias
	call denite#custom#alias('source', 'file_rec/git', 'file_rec')
	call denite#custom#var('file_rec/git', 'command',
	      \ ['git', 'ls-files', '-co', '--exclude-standard'])

	call denite#custom#alias('source', 'file_rec/cs', 'file_rec')
	call denite#custom#var('file_rec/cs', 'command', ['ag', '-g', '.cs$'])

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

endfunction
