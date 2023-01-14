-- key-menu settings
vim.o.timeoutlen = 700
require 'key-menu'.set('n', '<Space>')
require 'key-menu'.set('n', '\\')
vim.api.nvim_set_hl(0, 'KeyMenuFloatBorder', {fg="grey40"})
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
    local branch = " " .. vim.b.gitsigns_head
    return branch
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
  extensions = {'quickfix', 'fzf', 'nvim-tree', 'man', terminal}
}
-- Treesitter settings
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
