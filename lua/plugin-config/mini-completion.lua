_G.has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0
		and vim.api
				.nvim_buf_get_lines(0, line - 1, line, true)[1]
				:sub(col, col)
				:match("%s")
			== nil
end

_G.has_slash_before = function()
    unpack = unpack or table.unpack
    local _, col = unpack(vim.api.nvim_win_get_cursor(0))
    local cword = vim.fn.expand('<cWORD>')
    return col ~= 0
        and cword:match("/") ~= nil
end

local keys = {
    ['cr']            = vim.api.nvim_replace_termcodes('<CR>', true, true, true),
    ['ctrl-y']        = vim.api.nvim_replace_termcodes('<C-y>', true, true, true),
    ['ctrl-y_cr']     = vim.api.nvim_replace_termcodes('<C-y><CR>', true, true, true),
    ['esc']	          = vim.api.nvim_replace_termcodes('<C-c>', true, true, true),
    ['ctrl-e']        = vim.api.nvim_replace_termcodes('<C-e>', true, true, true),
    ['ctrl-n']        = vim.api.nvim_replace_termcodes('<C-n>', true, true, true),
    ['ctrl-x_n']      = vim.api.nvim_replace_termcodes('<C-x><C-n>', true, true, true),
    ['ctrl-x_f']      = vim.api.nvim_replace_termcodes('<C-x><C-f>', true, true, true),
    ['ctrl-x_o']      = vim.api.nvim_replace_termcodes('<C-x><C-o>', true, true, true),
    ['tab']           = vim.api.nvim_replace_termcodes('<TAB>', true, true, true)
}

_G.tab_action = function()
    if vim.fn.pumvisible() ~= 0 then
      -- If popup is visible, confirm selected item or add new line otherwise
      return keys['ctrl-n']
    elseif _G.has_slash_before() then
      return keys['ctrl-x_f']
    elseif _G.has_words_before() then
      return keys['ctrl-x_o']
    -- elseif _G.has_words_before() then
    --     return keys['ctrl-n']
    else
        return keys['tab']
    end
end

_G.cr_action = function()
    if vim.fn.pumvisible() ~= 0 then
      -- If popup is visible, confirm selected item or add new line otherwise
      local item_selected = vim.fn.complete_info()['selected'] ~= -1
      return (item_selected and keys['ctrl-y']) or keys['ctrl-y_cr']
    else
      -- If popup is not visible, use plain `<CR>`. You might want to customize
      -- according to other plugins. For example, to use 'mini.pairs', replace
      -- next line with `return require('mini.pairs').cr()`
      return keys['cr']
    end
end

_G.esc_action = function()
    if vim.fn.pumvisible() ~= 0 then
      local selected_item = vim.fn.complete_info()['selected']
      local item_selected = (selected_item ~= -1 and selected_item ~= nil)
      return (item_selected and keys['ctrl-e']) or keys['esc']
    else
      -- If popup is not visible, use plain `<CR>`. You might want to customize
      -- according to other plugins. For example, to use 'mini.pairs', replace
      return keys['esc']
    end
end

vim.api.nvim_set_keymap('i', '<CR>', 'v:lua._G.cr_action()', { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', '<ESC>', 'v:lua._G.esc_action()', { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', '<TAB>', '<C-R>=v:lua._G.tab_action()<CR>', { noremap = true, silent=true})
vim.api.nvim_set_keymap("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { noremap = true, expr = true })
