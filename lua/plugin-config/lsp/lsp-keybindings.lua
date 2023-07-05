local nvim_lsp = require('lspconfig')
local mason_lsp = require('mason-lspconfig')

local border = { "", "▔", "", "▕", "", "▁", "", "▏" }
--
-- LSP settings (for overriding per client) to change border of window
local handlers =  {
    ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = 'solid'}),
    ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = 'solid'}),
}

require('lspconfig.ui.windows').default_options = {
  border = 'rounded'
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local mappings = function(_, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<C-h>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('v', '<C-h>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('i', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '[w', '<cmd>lua vim.diagnostic.goto_prev({float = false, severity = vim.diagnostic.severity.WARN})<CR>', opts)
    buf_set_keymap('n', ']w', '<cmd>lua vim.diagnostic.goto_next({float = false, severity = vim.diagnostic.severity.WARN})<CR>', opts)
    buf_set_keymap('n', '[e', '<cmd>lua vim.diagnostic.goto_prev({float = false, severity = vim.diagnostic.severity.ERROR})<CR>', opts)
    buf_set_keymap('n', ']e', '<cmd>lua vim.diagnostic.goto_next({float = false, severity = vim.diagnostic.severity.ERROR})<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev({float = false})<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next({float = false})<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>qd', '<cmd>lua vim.diagnostic.setqflist({severity = vim.diagnostic.severity.ERROR})<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>dd', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    --buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    --buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    --buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    --buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    --buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    buf_set_keymap('n', '<space>ft', '<cmd>lua vim.lsp.buf.format({async=true})<CR>', opts)
    buf_set_keymap('v', '<space>ft', '<cmd>lua vim.lsp.buf.format({async=true})<CR>', opts)
end

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- mappings
    mappings(client, bufnr)
end

local configure_lsp = {
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
    handlers = handlers
}

mason_lsp.setup_handlers {
    function (server_name)
        nvim_lsp[server_name].setup(configure_lsp)
    end
}
