local cmp = require'cmp'

local M = {}

M.check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

M.abort = function()
    cmp.abort()
    cmp.core:reset()
end

M.abort_or_close = function()
    if cmp.visible() then
        M.abort()
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-c>', true, true, true), 'n', true)
    end
end

M.cmdline_cr = function()
    if cmp.visible() then
        cmp.confirm({select=false})
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<CR>', true, true, true), 'n', true)
    end
end

return M
