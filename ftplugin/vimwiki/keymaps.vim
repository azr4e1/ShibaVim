nnoremap <buffer><silent> <leader>wH :VimwikiAll2HTML<CR>
nnoremap <buffer><silent> <leader>wC :VimwikiTOC<CR>
imap <buffer><silent> <C-RIGHT> <Plug>VimwikiTableNextCell
imap <buffer><silent> <C-LEFT> <Plug>VimwikiTablePrevCell
inoremap <buffer><expr> <CR> pumvisible() ? "\<C-y>" : "\<C-]>\<Esc>:VimwikiReturn 1 5\<CR>"
nnoremap <buffer><silent> <leader>wu :!update_wiki<CR>
setlocal spell! spelllang=en_gb

nnoremap <buffer> <leader>vws :VWS 

" hi Warning guifg=red
" function! PreviousTODO()
"     let today = system('date +"%Y-%m-%d"')[:-2]
"     let root = expand("%:h")
"     if expand("%:t:r") !=# today
"         echohl Warning | echom  'This is not the current day diary!' | echohl None
"         return
"     endif
"     write
"     let prev_day = system("ls ".root." | tail -3 | head -n1")
"     normal! G
"     execute "read " . root . "/" .  prev_day
"     g/\[X\]/d
"     normal! ggdd

" endfunction
