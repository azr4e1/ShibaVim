require('neogen').setup {
    enabled = true,
    languages = {
        lua = {
            template = {
                annotation_convention = "emmylua" -- for a full list of annotation_conventions, see supported-languages below,
                }
            },
        python = {
            template = {
                annotation_convention = 'reST'
            }
        }
    }
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', "<leader>ds", ":lua require('neogen').generate()<CR>", opts)
vim.api.nvim_set_keymap('i', '<C-Right>', "<C-o>:lua require('neogen').jump_next()<CR>", opts)
vim.api.nvim_set_keymap('i', '<C-Left>', "<C-o>:lua require('neogen').jump_prev()<CR>", opts)
