vim.cmd[[
augroup menu
    autocmd!
    autocmd MenuPopup * lua require'plugin-config.menu'.setup()
augroup END

augroup nofile
    autocmd!
    autocmd BufEnter * if &buftype ==# "nofile" | nnoremap <buffer><silent> q :q<CR> | endif
augroup END
]]
