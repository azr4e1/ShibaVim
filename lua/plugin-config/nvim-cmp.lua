local M = {}

function M.setup()
    -- Use manual completion by default
    require('plugin-config.cmp.cmp_manual_completion').setup()
    vim.api.nvim_create_user_command("CompletionAuto", function() require'plugin-config.cmp.cmp_auto_completion'.setup() end, {nargs=0})
    vim.api.nvim_create_user_command("CompletionManual", function() require'plugin-config.cmp.cmp_manual_completion'.setup() end, {nargs=0})
    vim.api.nvim_set_keymap("n", "<leader>ca", ':CompletionAuto<CR>', {silent=true, desc="Activate Auto Completion", noremap=true})
    vim.api.nvim_set_keymap("n", "<leader>cm", ':CompletionManual<CR>', {silent=true, desc="Activate Manual Completion", noremap=true})
end

M.setup()
