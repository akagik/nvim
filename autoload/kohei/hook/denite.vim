function! kohei#hook#denite#hook_source() abort
  echo "source denite"
  
  nnoremap <leader>b :Denite buffer<CR>
  nnoremap <leader>F :Denite file_rec<CR>
  nnoremap <leader>G :Denite -auto-preview grep<CR>



  " custom map in denite
"  call denite#custom#map('insert', "<C-d>", '<denite:delete_char_under_caret>', 'noremap')
endfunction
