local M = {}

function M.setup()
    -- Use manual completion by default
    require('plugin-config.cmp.cmp_manual_completion')
    vim.api.nvim_create_user_command("CompletionAuto", function() require('plugin-config.cmp.cmp_auto_completion') end, {nargs=0})
    vim.api.nvim_create_user_command("CompletionManual", function() require('plugin-config.cmp.cmp_manual_completion') end, {nargs=0})
end

M.setup()
