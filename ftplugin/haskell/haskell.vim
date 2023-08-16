execute "inoremap <buffer><silent> <M-,> <ESC>a <- "
execute "inoremap <buffer><silent> <M-.> <ESC>a -> "
execute "inoremap <buffer><silent> <M--> <ESC>a => "

nnoremap <buffer><silent> <localleader>rl :call SendCmd(":l ".expand("%:p")."\n")<CR>
nnoremap <buffer> <silent> <localleader>x :!./%:r<CR>
nnoremap <buffer> <silent> <localleader>c :make %<CR>:!./%:r<CR>
