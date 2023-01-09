--  _ __   ___  _____   _(_)_ __ ___
-- | '_ \ / _ \/ _ \ \ / / | '_ ` _ \
-- | | | |  __/ (_) \ V /| | | | | | |
-- |_| |_|\___|\___/ \_/ |_|_| |_| |_|

-------------------------------------
-- Put all the neovim options here --
-------------------------------------
HOME = os.getenv("HOME")
vim.opt.showmode = true
vim.opt.number = true
vim.opt.relativenumber = false
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
vim.opt.completeopt = "menuone"
vim.opt.grepprg = "grep -nP $* /dev/null"
vim.opt.makeprg = "autocompile $*"
vim.opt.updatetime = 250
vim.opt.mouse = "a"
vim.opt.omnifunc = "syntaxcomplete#Complete"
vim.opt.listchars = "eol:↴,lead:⋅,tab:<->"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait400-blinkoff600-blinkon900-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

---------------------------------------------
-- Put all the user-defined variables here --
---------------------------------------------
vim.g.tex_flavor = "latex"
vim.g.python3_host_prog = HOME .. "/.venv/neovim/bin/python"

-----------------------------------------
-- Put all the highlight settings here --
-----------------------------------------
vim.api.nvim_command("colorscheme adwaita")
vim.api.nvim_set_hl(0, 'Error', {fg="red"})

---------------------------------------------------
-- Put all the global mappings and commands here --
---------------------------------------------------
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
-- copy to clipboard
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', {silent=true, desc="Copy to clipboard", noremap=true})
vim.api.nvim_set_keymap("n", "<C-p>", '"+p', {silent=true, desc="Paste from clipboard", noremap=true})
vim.api.nvim_set_keymap("n", "<leader>n", ":bnext<CR>", {silent=true, desc="Next buffer", noremap=true})
vim.api.nvim_set_keymap("n", "<leader>N", ":bprevious<CR>", {silent=true, desc="Previous buffer", noremap=true})
vim.api.nvim_set_keymap("n", "gm", ":call cursor(0, virtcol('$')/2)<CR>", {silent=true, desc="Go to middle line", noremap=true})
vim.api.nvim_set_keymap("n", "<leader>cc", ":set cursorcolumn!<CR>", {silent=true, desc="Toggle cursor column", noremap=true})
vim.api.nvim_set_keymap("n", "<leader>ev", ":vsplit $MYVIMRC<CR>", {silent=true, desc="Edit init file", noremap=true})
vim.api.nvim_set_keymap("n", "<leader>sv", ":source $MYVIMRC<CR>", {silent=true, desc="Source init", noremap=true})
vim.api.nvim_set_keymap("n", "-", "<C-^>", {silent=true, desc="Jump to alternate buffer", noremap=true})
vim.api.nvim_set_keymap("n", "<BS>", "za", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<A-h>", "<C-w>h", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<A-j>", "<C-w>j", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<A-k>", "<C-w>k", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<A-l>", "<C-w>l", {silent=true, noremap=true})
vim.api.nvim_set_keymap("i", "<A-h>", "<ESC><C-w>h", {silent=true, noremap=true})
vim.api.nvim_set_keymap("i", "<A-j>", "<ESC><C-w>j", {silent=true, noremap=true})
vim.api.nvim_set_keymap("i", "<A-k>", "<ESC><C-w>k", {silent=true, noremap=true})
vim.api.nvim_set_keymap("i", "<A-l>", "<ESC><C-w>l", {silent=true, noremap=true})
vim.api.nvim_set_keymap("t", "<A-h>", "<C-\\><C-n><C-w>h", {silent=true, noremap=true})
vim.api.nvim_set_keymap("t", "<A-j>", "<C-\\><C-n><C-w>j", {silent=true, noremap=true})
vim.api.nvim_set_keymap("t", "<A-k>", "<C-\\><C-n><C-w>k", {silent=true, noremap=true})
vim.api.nvim_set_keymap("t", "<A-l>", "<C-\\><C-n><C-w>l", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-e>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-y>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("i", "<C-j>", "<C-o><C-e>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("i", "<C-k>", "<C-o><C-y>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<Up>", ":resize +2<CR>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<Down>", ":resize -2<CR>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<Right>", ":vertical resize +2<CR>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<Left>", ":vertical resize -2<CR>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<ESC>", "<ESC>:nohlsearch<CR>:echo ''<CR>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<leader>wd", ":%s#\\v\\s+$##g<CR>:nohlsearch<CR>", {silent=true, noremap=true, desc="Delete trailing whitespaces"})
vim.api.nvim_set_keymap("n", "<leader>i", ":setlocal spell! spelllang=en_gb<CR>", {silent=true, noremap=true, desc="English spelling check toggle"})
vim.api.nvim_set_keymap("n", "<leader>I", ":setlocal spell! spelllang=it<CR>", {silent=true, noremap=true, desc="Italian spelling check toggle"})
vim.api.nvim_set_keymap("n", "<leader>qo", ":copen<CR>", {silent=true, noremap=true, desc="Open quickfix list"})
vim.api.nvim_set_keymap("n", "<leader>qq", ":cclose<CR>", {silent=true, noremap=true, desc="Close quickfix list"})
vim.api.nvim_set_keymap("n", "<leader>qn", ":cnext<CR>", {silent=true, noremap=true, desc="Next in quickfix"})
vim.api.nvim_set_keymap("n", "<leader>qp", ":cprev<CR>", {silent=true, noremap=true, desc="Previous in quickfix"})
vim.api.nvim_set_keymap("n", "<leader>qf", ":cfirst<CR>", {silent=true, noremap=true, desc="First in quickfix"})
vim.api.nvim_set_keymap("n", "<leader>ql", ":clast<CR>", {silent=true, noremap=true, desc="Last in quickfix"})
vim.api.nvim_set_keymap("n", "<leader>lo", ":lopen<CR>", {silent=true, noremap=true, desc="Open locallist list"})
vim.api.nvim_set_keymap("n", "<leader>lq", ":lclose<CR>", {silent=true, noremap=true, desc="Close locallist list"})
vim.api.nvim_set_keymap("n", "<leader>ln", ":lnext<CR>", {silent=true, noremap=true, desc="Next in locallist"})
vim.api.nvim_set_keymap("n", "<leader>lp", ":lprev<CR>", {silent=true, noremap=true, desc="Previous in locallist"})
vim.api.nvim_set_keymap("n", "<leader>lf", ":lfirst<CR>", {silent=true, noremap=true, desc="First in locallist"})
vim.api.nvim_set_keymap("n", "<leader>ll", ":llast<CR>", {silent=true, noremap=true, desc="Last in locallist"})
vim.api.nvim_set_keymap("n", "<leader>x", ":make %<CR>", {silent=true, noremap=true, desc="Compile current file"})
vim.api.nvim_set_keymap("n", "<F2>", ":NvimTreeToggle<CR>", {silent=true, noremap=true, desc="Toggle Project Drawer"})
vim.api.nvim_set_keymap("n", "<M-w>", ":NvimTreeFocus<CR>", {silent=true, noremap=true, desc="Focus Project Drawer"})
vim.api.nvim_set_keymap("n", "<leader>cd", ':echom "Changing directory to ".expand("%:h")<CR>:cd %:h<CR>', {silent=true, noremap=true, desc="Change to current directory"})
vim.api.nvim_set_keymap("i", "<ESC>", 'pumvisible() ? "\\<C-e>" : "\\<Esc>"', {expr=true, noremap=true})
vim.api.nvim_set_keymap("c", "<ESC>", 'pumvisible() ? "\\<C-e>" : "\\<C-c>"', {expr=true, noremap=true})
vim.api.nvim_set_keymap("i", "<CR>", 'pumvisible() ? "\\<C-y>" : "\\<CR>"', {expr=true, noremap=true})
vim.api.nvim_set_keymap("c", "<CR>", 'pumvisible() ? "\\<C-y>" : "\\<CR>"', {expr=true, noremap=true})
vim.api.nvim_create_user_command("Infos", [[echo "Informations about file "."'".expand("%:t")."'"."\nFile Type:\t".toupper(&filetype)."\nFile Encoding:\t".toupper(&fenc)."\nFile Format:\t".toupper(&ff)]], {nargs=0})
vim.api.nvim_create_user_command("MyScripts", ":Files " .. HOME .. "/.scripts", {nargs=0})
vim.api.nvim_set_keymap("n", "<leader>ff", ":Files<CR>", {silent=true, noremap=true, desc="FZF on Files"})
vim.api.nvim_set_keymap("n", "<leader>fm", ":Marks<CR>", {silent=true, noremap=true, desc="FZF on Marks"})
vim.api.nvim_set_keymap("n", "<leader>fh", ":History<CR>", {silent=true, noremap=true, desc="FZF on History"})
vim.api.nvim_set_keymap("n", "<leader>fg", ":Rg<CR>", {silent=true, noremap=true, desc="FZF on term searched with RipGrep"})
vim.api.nvim_set_keymap("n", "<leader>fc", ":Colors<CR>", {silent=true, noremap=true, desc="FZF on Colorschemes"})
vim.api.nvim_set_keymap("n", "<leader>fs", ":MyScripts<CR>", {silent=true, noremap=true, desc="FZF on personal scripts"})
vim.api.nvim_set_keymap("n", "<leader>b", ":Buffers<CR>", {silent=true, noremap=true, desc="FZF on Buffers"})
vim.api.nvim_set_keymap("n", "<leader>fw", ":Files " .. HOME .. "/Documents/Wikis/<CR>", {silent=true, noremap=true, desc="FZF on Wikis"})
vim.api.nvim_set_keymap("n", "<leader>z", ":ZenMode<CR>", {silent=true, noremap=true, desc="Toggle Zen Mode"})
vim.api.nvim_set_keymap("n", "<leader><CR>", "<Plug>SendDownLine", {silent=true, desc="Send line to terminal and move down"})
vim.api.nvim_set_keymap("v", "<leader><CR>", "<Plug>SendDownSelection", {silent=true, desc="Send selection to terminal and move down"})
vim.api.nvim_set_keymap("n", "<leader>/", ":Commentary<CR>", {silent=true, noremap=true, desc="Toggle Comment"})
vim.api.nvim_set_keymap("v", "<leader>/", ":Commentary<CR>", {silent=true, noremap=true, desc="Toggle Comment"})
vim.api.nvim_set_keymap("n", "tn", ":tabnew<CR>", {silent=true, noremap=true, desc="Open new tab"})
vim.api.nvim_set_keymap("n", "<M-,>", "gT", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<M-.>", "gt", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<Home>", ":Startify<CR>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<leader><BS>", "zA", {silent=true, noremap=true, desc="Toggle folding"})
vim.api.nvim_set_keymap("t", "<M-->", "<C-\\><C-n>a <- ", {silent=true, noremap=true})
vim.api.nvim_set_keymap("t", "<M->>", "<C-\\><C-n>a %>% ", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<leader>g", ":G<CR>", {silent=true, noremap=true, desc="Launch Fugitive"})


------------------------
-- Source the plugins --
------------------------
require('plugins')

--------------------------------------
-- Put all the plugin settings here --
--------------------------------------
-- SuperTab plugins
vim.g.SuperTabDefaultCompletionType = "context"
vim.g.SuperTabContextDefaultCompletionType = "<c-n>"
vim.g.SuperTabRetainCompletionDuration = 'completion'
vim.g.SuperTabContextTextOmniPrecedence = {'&omnifunc', '&completefunc'}
-- key-menu settings
vim.o.timeoutlen = 700
require 'key-menu'.set('n', '<Space>')
require 'key-menu'.set('n', '\\')
-- lualine settings
local function transform_line(line)
    local line = line:gsub('%s*[%[%(%{].*$', '')
    line = line:gsub('%s*:%s*$', '')
    return line
end

local function TreeSitter()
    local scope = require'nvim-treesitter'.statusline({indicator_size=50, transform_fn = transform_line})
    local status
    if scope == "" or scope == "null" then
        status = ""
    else
        status = "</> " .. scope
    end
    return status
end

local function Spelling()
    local status
    if vim.opt.spell._value then
        status =  "暈" .. vim.opt.spelllang._value
    else
        status = ""
    end
    return status
end

local function Branch()
    local branch
    local status
    branch = vim.fn["FugitiveStatusline"]()
    if branch == "" then
        status = ""
    else
        status = " " .. branch:match("%((.-)%)")
    end
    return status
end

local terminal = { sections = { lualine_a = {'filename'} }, inactive_sections = {lualine_a = {'filename'}}, filetypes = {'terminal'} }
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'adwaita',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
        'startify',
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'filename'},
    lualine_b = {Branch, 'diff', 'diagnostics'},
    lualine_c = {},
    lualine_x = {TreeSitter, Spelling, 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {'quickfix', 'fzf', 'fugitive', 'nvim-tree', 'man', terminal}
}
-- colorizer settings
require 'colorizer'.setup {
  'css';
  'javascript';
  'html';
}
-- Startify settings
vim.g.startify_custom_header = "startify#center(startify#fortune#cowsay())"
-- GitSigns settings
require('gitsigns').setup()
-- NvimTree settings
require('nvim-tree').setup()
-- jupytext settings
vim.g.jupytext_fmt = "py"
vim.g.jupytext_command = HOME .. "/.miniconda3/bin/jupytext"
-- nvim-R settings
vim.g.markdown_fenced_languages = "r, python"
vim.g.rmd_fenced_languages = "r, python"
-- LSP settings
---- disable virtual text by default
vim.diagnostic.config({virtual_text = false, float = {border='rounded'}})
-- ZenMode settings
require("zen-mode").setup {
    window = {
        backdrop = 0.90, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        -- height and width can be:
        -- * an absolute number of cells when > 1
        -- * a percentage of the width / height of the editor when <= 1
        -- * a function that returns the width or the height
        width = 120, -- width of the Zen window
        height = 1, -- height of the Zen window
        -- by default, no options are changed for the Zen window
        -- uncomment any of the options below, or add other vim.wo options you want to apply
        options = {
          -- signcolumn = "no", -- disable signcolumn
          -- number = false, -- disable number column
          -- relativenumber = false, -- disable relative numbers
          -- cursorline = false, -- disable cursorline
          -- cursorcolumn = false, -- disable cursor column
          -- foldcolumn = "0", -- disable fold column
          -- list = false, -- disable whitespace characters
        }
    }
}
-- IndetLine settings
require("indent_blankline").setup {
	filetype_exclude = {"vimwiki", "text", "markdown", "dashboard", "startify", "csv", "nerdtree", "netrw", "help", "rdoc", "NvimTree", "calendar"},
	buftype_exclude = {"terminal"},
	max_indent_increase = 1,
	show_current_context = true,
	show_current_context_start = true,
}
-- TreeSitter settings
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "all",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  --ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    --disable = {"r"},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gsi",
      node_incremental = "gsn",
      scope_incremental = "gsc",
      node_decremental = "gsm",
    },
  },
}
-- VimWiki settings
vim.cmd([[
let g:vimwiki_toc_link_format = 1
let g:vimwiki_list = [{'path': '~/Documents/Wikis/Personal',
      \ 'path_html': '~/Documents/Wikis/Personal/html/',
      \ 'template_path': '~/Documents/Wikis/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default',
      \ 'nested_syntaxes': {'python': 'python', 'r': 'r', 'lua':'lua'}},
      \ {'path': '~/Documents/Wikis/Machine\ Learning',
      \ 'path_html': '~/Documents/Wikis/Machine\ Learning/html/',
      \ 'template_path': '~/Documents/Wikis/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default',
      \ 'nested_syntaxes': {'python': 'python', 'r': 'r'}},
      \ {'path': '~/Documents/Wikis/Coding',
      \ 'path_html': '~/Documents/Wikis/Coding/html/',
      \ 'template_path': '~/Documents/Wikis/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default',
      \ 'nested_syntaxes': {'python': 'python', 'r': 'r'}},
      \ {'path': '~/Documents/Wikis/Statistics',
      \ 'path_html': '~/Documents/Wikis/Statistics/html/',
      \ 'template_path': '~/Documents/Wikis/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default',
      \ 'nested_syntaxes': {'python': 'python', 'r': 'r'}},
      \ {'path': '~/Documents/Wikis/Marketing',
      \ 'path_html': '~/Documents/Wikis/Marketing/html/',
      \ 'template_path': '~/Documents/Wikis/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default',
      \ 'nested_syntaxes': {'python': 'python', 'r': 'r'}},
      \ {'path': '~/Documents/Wikis/Finance',
      \ 'path_html': '~/Documents/Wikis/Finance/html/',
      \ 'template_path': '~/Documents/Wikis/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default',
      \ 'nested_syntaxes': {'python': 'python', 'r': 'r'}}]
let g:vimwiki_key_mappings = {
      \ 'table_mappings': 0
      \}
]])
