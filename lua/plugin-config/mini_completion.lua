require("mini.completion").setup({
	delay = {
		completion = 10 ^ 7,
		info = 100,
		signature = 100,
	},
	lsp_completion = {
		source_func = "omnifunc",
		auto_setup = false,
	},
	set_vim_settings = false,
})

local keys = {
	["cr"] = vim.api.nvim_replace_termcodes("<CR>", true, true, true),
	["ctrl-y"] = vim.api.nvim_replace_termcodes("<C-y>", true, true, true),
	["ctrl-y_cr"] = vim.api.nvim_replace_termcodes("<C-y><CR>", true, true, true),
}

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

vim.o.completeopt = "menu,menuone"
