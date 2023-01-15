----------------------------------
-- Automatically install packer --
----------------------------------
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
------------------------------
-- Put all the plugins here --
------------------------------
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    -- R
    use {
        'jalvesaq/Nvim-R',
        branch = 'stable',
        ft = {'r', 'rmd'}
    }
    -- debugger
    use {
        'mfussenegger/nvim-dap',
        event = 'BufReadPre',
        opt = true,
        module = "dap",
        requires = {
            {
                'mfussenegger/nvim-dap-python',
                module = 'dap-python',
            },
            {
                'rcarriga/nvim-dap-ui',
                module = "dapui",
            }
        },
        config = function()
            require'lazy.dap'.setup()
        end
    }
    -- project sidebar
    use {'nvim-tree/nvim-tree.lua',
        opt = true,
        cmd = 'NvimTreeToggle',
        requires = {
                'nvim-tree/nvim-web-devicons'
            },
        config = function()
            require'nvim-tree'.setup()
        end
    }
    -- LSP
    use {'neovim/nvim-lspconfig',
        ft = {'python',
              'r',
              'rmd',
              'julia',
              'sh',
              'javascript',
              'typescript',
              'c',
              'cpp',
              'tex'},
        config = function()
            require'lazy.nvim-lsp'.setup()
        end
    }
    -- focus window
    use {'folke/zen-mode.nvim',
        cmd = 'ZenMode',
        config = function()
            require'plugin-config.zen-mode'.setup()
        end
    }
    -- git signs
    use {'lewis6991/gitsigns.nvim',
        event = 'BufReadPre',
        cmd = "Gitsigns",
        config = function()
            require'gitsigns'.setup()
        end
    }
    -- indentation guides
    use {'lukas-reineke/indent-blankline.nvim',
        after = 'nvim-treesitter',
        config = function()
            require('plugin-config.indent-blankline').setup()
        end
    }
    -- color visualizer
    use {'norcalli/nvim-colorizer.lua',
        ft = {'html', 'css', 'javascript'},
        cmd = {'ColorizerAttachToBuffer',
               'ColorizerDetachFromBuffer',
               'ColorizerReloadAllBuffers',
               'ColorizerToggle'},
        config = function()
            require 'plugin-config.colorizer'.setup()
        end
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        "windwp/nvim-autopairs",
        event = 'InsertEnter',
        config = function() require("plugin-config.autopairs").setup {} end
    }
    use {
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup()
        end
    }
    use {'glepnir/dashboard-nvim',
        config = function()
            require'plugin-config.dashboard'.setup()
        end
    }
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {'nvim-lua/plenary.nvim'},
        cmd = 'Telescope'
    }
    use {'chrisbra/csv.vim',                   -- CSV
        ft = {'csv'}
    }
    -- Cmp
    use "hrsh7th/nvim-cmp"  -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use 'hrsh7th/cmp-cmdline'
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
    use 'azr4e1/adwaita.nvim'                  -- adwaita theme
    use 'goerz/jupytext.vim'                   -- jupyter notebook integration
    use 'vim-scripts/dbext.vim'                -- SQL
    use 'nvim-lualine/lualine.nvim'            -- statusline
    use 'linty-org/key-menu.nvim'              -- mapping hints
end)
