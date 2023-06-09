local picker = require('plugins.wiki-picker')

local M = {}

M.create_wiki = function()
    local current_dir = vim.fn.expand("%:p:h")
    vim.cmd("cd " .. picker.config.projectsFolder)
    local name = vim.fn.input("Name of Wiki: ", "", "dir")
    if name == "" then
        print("No valid name inserted")
        vim.cmd("cd " .. current_dir)
        return
    end
    name = '/' .. name .. "_wiki"
    local full_name = picker.config.projectsFolder .. name
    local index = full_name .. '/index.wiki'
    vim.api.nvim_call_function('system', {'mkdir ' .. full_name})
    picker.updateVimwikiList(picker.searchForWikis())
    vim.cmd("edit " .. index)
    vim.cmd("cd " .. current_dir)
end

return M
