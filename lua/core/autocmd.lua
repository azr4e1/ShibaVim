vim.cmd[[
augroup menu
    autocmd!
    autocmd MenuPopup * lua require'plugin-config.menu'.setup()
augroup END
]]
