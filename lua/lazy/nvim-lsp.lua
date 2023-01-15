local M = {}

local M = {}

function M.setup()
    -- disable virtual text by default
    vim.diagnostic.config({virtual_text = false, float = {border='rounded'}})
    -- require('lazy.config.lsp.lsp-completion-signs')
    require('lazy.config.lsp.lsp-diagnostic-signs')
    require('lazy.config.lsp.lsp-keybindings')
    require('lazy.config.lsp.lsp-toggle-diagnostic')
end

return M
