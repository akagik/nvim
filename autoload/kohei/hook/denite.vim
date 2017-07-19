function! kohei#hook#denite#hook_source() abort
  echo "source denite"
  
  nnoremap <leader>b :Denite buffer<CR>
  nnoremap <leader>F :Denite file_rec/git<CR>
  nnoremap <leader>G :Denite -auto-preview grep<CR>

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

	" Change ignore_globs
  " TODO うまく反映されてない
	call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
	      \ [ '*.jar', '.git/', '.ropeproject/', '__pycache__/',
	      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
endfunction
