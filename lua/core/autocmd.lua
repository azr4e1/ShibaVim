vim.cmd[[
augroup menu
    autocmd!
    autocmd MenuPopup * lua require'plugin-config.menu'.setup()
augroup END

augroup nofile
    autocmd!
    autocmd BufEnter * if &buftype ==# "nofile" | nnoremap <buffer><silent> q :q<CR> | endif
    autocmd BufEnter * if &buftype ==# "nofile" && &modifiable ==# 0 | nnoremap <buffer><silent> <ESC> :q<CR> | endif
augroup END
]]
