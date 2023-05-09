local M = {}

local border = {"┌", "─", "┐", "│", "┘", "─", "└",  "│" }

function M.setup()
    -- disable virtual text by default
    vim.diagnostic.config({virtual_text = false, float = {border=border}})
    -- require('lazy.config.lsp.lsp-completion-signs')
    require('plugin-config.lsp.lsp-diagnostic-signs')
    require('plugin-config.lsp.lsp-keybindings')
    -- require('plugin-config.lsp.lsp-toggle-diagnostic')
    require('plugin-config.lsp.virtual-text-position')
end

M.setup()
