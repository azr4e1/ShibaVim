-- this toggles virtual text
vim.g.virtual_active = false
function _G.toggle_diagnostics()
  if vim.g.virtual_active then
    vim.g.virtual_active = false
    vim.diagnostic.config({virtual_text = false})
  else
    vim.g.virtual_active = true
    vim.diagnostic.config({virtual_text = true})
  end
end

-- This toggles diagnostics altogehter
vim.g.diagnostic_visible = true
function _G.hide_diagnostics()
    if vim.g.diagnostic_visible then
        vim.g.diagnostic_visible = false
        vim.diagnostic.disable()
    else
        vim.g.diagnostic_visible = true
        vim.diagnostic.enable()
    end
end

vim.cmd(':command! DiagnosticsToggle :call v:lua.hide_diagnostics()')
vim.cmd(':command! VirtualDiagnosticsToggle :call v:lua.toggle_diagnostics()')
