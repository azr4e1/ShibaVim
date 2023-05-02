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
    use {'wbthomason/packer.nvim',
         lock=true}
    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        lock=true
    }
    use {'nvim-treesitter/playground',
        lock=true}
    -- Mason
    use {"williamboman/mason.nvim",
        lock=true}
    use {"williamboman/mason-lspconfig.nvim",
        lock=true}
    use {"jay-babu/mason-nvim-dap.nvim",
        commit="b4af78dd862e465dfc00ce7a4c0dd811fafb09ed"}
    -- debugger
    use {
        'mfussenegger/nvim-dap',
        event = 'VimEnter',
        opt = true,
        module = "dap",
        requires = {
            {
                'rcarriga/nvim-dap-ui',
                module = "dapui",
            }
        },
        config = function()
            require'lazy.dap'.setup()
        end,
        lock=true
    }
    -- project sidebar
    use {'nvim-tree/nvim-web-devicons',
         lock=true}
    use {'nvim-tree/nvim-tree.lua',
        opt = true,
        cmd = 'NvimTreeToggle',
        config = function()
            require'nvim-tree'.setup()
        end,
        lock=true
    }
    -- LSP
    use {'neovim/nvim-lspconfig',
         lock=true}
    -- focus window
    use {'folke/zen-mode.nvim',
        cmd = 'ZenMode',
        config = function()
            require'plugin-config.zen-mode'.setup()
        end,
        lock=true
    }
    -- git signs
    use {'lewis6991/gitsigns.nvim',
        event = 'BufReadPre',
        cmd = "Gitsigns",
        config = function()
            require'plugin-config.git-signs'.setup()
        end,
        lock=true
    }
    -- indentation guides
    use {'lukas-reineke/indent-blankline.nvim',
        after = 'nvim-treesitter',
        config = function()
            require('plugin-config.indent-blankline').setup()
        end,
        lock=true
    }
    -- color visualizer
    use {'norcalli/nvim-colorizer.lua',
        ft = {'html', 'css', 'javascript'},
        cmd = {'ColorizerAttachToBuffer',
               'ColorizerDetachFromBuffer',
               'ColorizerReloadAllBuffers',
               'ColorizerToggle'},
        config = function()
            require 'lazy.nvim-colorizer'.setup()
        end,
        lock=true
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
        lock=true
    }
    use {"windwp/nvim-autopairs",
         lock=true}
    use {
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup()
        end,
        lock=true
    }
    use {'goolord/alpha-nvim',
         config = function ()
             require'plugin-config.alpha'.setup()
         end,
         lock=true
    }
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {'nvim-lua/plenary.nvim'},
        lock=true
    }
    use {'chrisbra/csv.vim',                   -- CSV
        ft = {'csv'},
        lock=true
    }
    use {'azr4e1/luatab.nvim',
        config = function()
            require'luatab'.setup()
        end,
    }
    -- Cmp
    use {"hrsh7th/nvim-cmp", lock=true}  -- The completion plugin
    use {"hrsh7th/cmp-buffer", lock=true} -- buffer completions
    use {"hrsh7th/cmp-path", lock=true} -- path completions
    use {"saadparwaiz1/cmp_luasnip", lock=true} -- snippet completions
    use {"hrsh7th/cmp-nvim-lsp", lock=true}
    use {"hrsh7th/cmp-nvim-lua", lock=true}
    use {'hrsh7th/cmp-cmdline', lock=true}
    use {'hrsh7th/cmp-omni', lock=true}


    use {"L3MON4D3/LuaSnip", lock=true} --snippet engine
    use {"rafamadriz/friendly-snippets", lock=true} -- a bunch of snippets to use
    use {'azr4e1/adwaita.nvim'}                  -- adwaita theme
    use {'vim-scripts/dbext.vim', lock=true}                -- SQL
    use {'nvim-lualine/lualine.nvim', lock=true}            -- statusline
    use {"folke/which-key.nvim", lock=true}
    use {'vimwiki/vimwiki', lock=true}
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
