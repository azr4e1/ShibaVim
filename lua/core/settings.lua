-------------------------------------
-- Put all the neovim options here --
-------------------------------------
HOME = os.getenv("HOME")
vim.opt.showmode = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.hidden = true
vim.opt.confirm = true
vim.opt.tgc = true
vim.opt.undofile = true
vim.opt.undodir = HOME .. "/.local/share/nvim/undo"
vim.opt.undolevels = 10000
vim.opt.completeopt = "menu,menuone"
vim.opt.grepprg = "grep -nP $* /dev/null"
vim.opt.makeprg = "autocompile $*"
vim.opt.updatetime = 250
vim.opt.mouse = "a"
vim.opt.listchars = "eol:↴,lead:⋅,tab:<->"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait400-blinkoff600-blinkon900-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.opt.scrolloff = 4

-- for cmdline height
-- vim.opt.cmdheight = 0
-- vim.opt.shortmess = 'filnxtToOFs'

-- for which-key completion
vim.o.timeout = true
vim.o.timeoutlen = 500
vim.o.signcolumn = 'auto:2'

---------------------------------------------
-- Put all the user-defined variables here --
---------------------------------------------
vim.g.tex_flavor = "latex"
vim.g.python3_host_prog = HOME .. "/.venv/neovim/bin/python"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-----------------------------------------
-- Put all the highlight settings here --
-----------------------------------------
vim.api.nvim_command("colorscheme adwaita")
vim.api.nvim_set_hl(0, 'Error', {fg="red"})
vim.api.nvim_set_hl(0, 'ModeMsg', {bg=nil})
