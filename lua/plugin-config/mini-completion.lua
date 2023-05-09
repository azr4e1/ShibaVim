-- No need to copy this inside `setup()`. Will be used automatically.
local border = {"┌", "─", "┐", "│", "┘", "─", "└",  "│" }
require'mini.completion'.setup(
{
  -- Delay (debounce type, in ms) between certain Neovim event and action.
  -- This can be used to (virtually) disable certain automatic actions by
  -- setting very high delay time (like 10^7).
  delay = { completion = 100, info = 100, signature = 10^7 },

  -- Configuration for action windows:
  -- - `height` and `width` are maximum dimensions.
  -- - `border` defines border (as in `nvim_open_win()`).
  window = {
    info = { height = 25, width = 80, border = border},
    signature = { height = 25, width = 80, border = border},
  },

  -- Way of how module does LSP completion
  lsp_completion = {
    -- `source_func` should be one of 'completefunc' or 'omnifunc'.
    source_func = 'completefunc',

    -- `auto_setup` should be boolean indicating if LSP completion is set up
    -- on every `BufEnter` event.
    auto_setup = true,

    -- `process_items` should be a function which takes LSP
    -- 'textDocument/completion' response items and word to complete. Its
    -- output should be a table of the same nature as input items. The most
    -- common use-cases are custom filtering and sorting. You can use
    -- default `process_items` as `MiniCompletion.default_process_items()`.
    -- process_items = 
  },

  -- Fallback action. It will always be run in Insert mode. To use Neovim's
  -- built-in completion (see `:h ins-completion`), supply its mapping as
  -- string. Example: to use 'whole lines' completion, supply '<C-x><C-l>'.
  fallback_action = '<C-n>',

  -- Module mappings. Use `''` (empty string) to disable one. Some of them
  -- might conflict with system mappings.
  mappings = {
    force_twostep = '<C-Space>', -- Force two-step completion
    force_fallback = '<A-Space>', -- Force fallback completion
  },

  -- Whether to set Vim's settings for better experience (modifies
  -- `shortmess` and `completeopt`)
  -- set_vim_settings = true,
}
)

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

vim.api.nvim_set_keymap(
	"i",
	"<Tab>",
	[[pumvisible() ? "\<C-n>" : v:lua._G.has_words_before() ? "\<C-Space>" : "\<Tab>"]],
	{ noremap = false, expr = true }
)

vim.api.nvim_set_keymap(
	"i",
	"<S-Tab>",
	[[pumvisible() ? "\<C-p>" : "\<S-Tab>"]],
	{ noremap = true, expr = true }
)

local keys = {
    ['cr']            = vim.api.nvim_replace_termcodes('<CR>', true, true, true),
    ['ctrl-y']        = vim.api.nvim_replace_termcodes('<C-y>', true, true, true),
    ['ctrl-y_cr']     = vim.api.nvim_replace_termcodes('<C-y><CR>', true, true, true),
    ['esc']	          = vim.api.nvim_replace_termcodes('<C-c>', true, true, true),
    ['ctrl-e']        = vim.api.nvim_replace_termcodes('<C-e>', true, true, true),
}

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
