local M = {}

M.config = {
    virtual_text = false,
    float = {border='solid'},
    update_in_insert = true
}

function M.setup()
    vim.diagnostic.config(M.config)
    -- require('lazy.config.lsp.lsp-completion-signs')
    require('plugin-config.lsp.lsp-diagnostic-signs')
    require('plugin-config.lsp.lsp-settings')
    require('plugin-config.lsp.lsp-toggle-diagnostic')
    require('plugin-config.lsp.virtual-text-position')
end

M.setup()
