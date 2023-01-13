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

-- GitSigns settings
require('gitsigns').setup()
-- NvimTree settings
require("nvim-tree").setup()
-- LSP
-- disable virtual text by default
vim.diagnostic.config({virtual_text = false, float = {border='rounded'}})
-- zen mode settings
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
-- DAP settings
local dap_breakpoint = {
    error = {
        text = "",
        texthl = "LspDiagnosticsSignError",
        linehl = "",
        numhl = "",
    },
    rejected = {
      text = "",
      texthl = "LspDiagnosticsSignHint",
      linehl = "",
      numhl = "",
    },
    conditional = {
      text = "",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl = "",
    },
    log = {
      text = "",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl = "",
    }
}
vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
vim.fn.sign_define("DapBreakpointCondition", dap_breakpoint.conditional)
vim.fn.sign_define("DapLogPoint", dap_breakpoint.log)
vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)

local dap, dapui = require'dap', require'dapui'
dapui.setup{}
dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
end
dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
end
-- python debugger
require('dap-python').setup(os.getenv("HOME") .. '/.venv/neovim/bin/python')
