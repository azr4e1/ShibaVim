local M = {}

local setup = {

    exclude = {
        filetypes = { 'vimwiki', 'text', 'markdown', 'dashboard', 'startify', 'csv', 'nerdtree', 'netrw', 'help', 'rdoc',
            'NvimTree', 'calendar', 'keymenu', 'packer', 'mason', 'alpha' },
        buftypes = { 'terminal', 'nofile' }
    },
    scope = {
        enabled = true,
        show_start = false,
        show_end = false
    },
}

function M.setup()
    require'ibl'.setup(setup)
end

return M
