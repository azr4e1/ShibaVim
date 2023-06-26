execute "inoremap <buffer><silent> <M-,> <ESC>a <- "
execute "inoremap <buffer><silent> <M-.> <ESC>a -> "
execute "inoremap <buffer><silent> <M--> <ESC>a => "

nnoremap <buffer><silent> <leader>rl :call SendCmd(":l ".expand("%:p")."\n")<CR>
