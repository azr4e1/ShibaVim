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
         lock=false}
    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        lock=false
    }
    use {'nvim-treesitter/playground',
        lock=false}
    -- Mason
    use {"williamboman/mason.nvim",
        lock=false}
    use {"williamboman/mason-lspconfig.nvim",
        lock=false}
    -- use {"jay-babu/mason-nvim-dap.nvim",
    --     commit="b4af78dd862e465dfc00ce7a4c0dd811fafb09ed"}
    -- debugger
    -- use {
    --     'mfussenegger/nvim-dap',
    --     event = 'VimEnter',
    --     opt = true,
    --     module = "dap",
    --     requires = {
    --         {
    --             'rcarriga/nvim-dap-ui',
    --             module = "dapui",
    --         }
    --     },
    --     config = function()
    --         require'lazy.dap'.setup()
    --     end,
    --     lock=false
    -- }
    -- project sidebar
    use {'nvim-tree/nvim-web-devicons',
         lock=false}
    use {'nvim-tree/nvim-tree.lua',
        opt = true,
        cmd = 'NvimTreeToggle',
        config = function()
            require'nvim-tree'.setup()
        end,
        lock=false
    }
    -- LSP
    use {'neovim/nvim-lspconfig',
         lock=false}
    -- focus window
    use {'folke/zen-mode.nvim',
        cmd = 'ZenMode',
        config = function()
            require'plugin-config.zen-mode'.setup()
        end,
        lock=false
    }
    -- git signs
    use {'lewis6991/gitsigns.nvim',
        event = 'BufReadPre',
        cmd = "Gitsigns",
        config = function()
            require'plugin-config.git-signs'.setup()
        end,
        lock=false
    }
    -- indentation guides
    use {'lukas-reineke/indent-blankline.nvim',
        after = 'nvim-treesitter',
        config = function()
            require('plugin-config.indent-blankline').setup()
        end,
        lock=false
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
        lock=false
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
        lock=false
    }
    use {"windwp/nvim-autopairs",
         lock=false}
    use {
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup()
        end,
        lock=false
    }
    use {'goolord/alpha-nvim',
         config = function ()
             require'plugin-config.alpha'.setup()
         end,
         lock=false
    }
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {'nvim-lua/plenary.nvim'},
        lock=false
    }
    use {'chrisbra/csv.vim',                   -- CSV
        ft = {'csv'},
        lock=false
    }
    use {'azr4e1/luatab.nvim',
        config = function()
            require'luatab'.setup()
        end,
    }
    -- Cmp
    -- use {"hrsh7th/nvim-cmp", lock=false}  -- The completion plugin
    -- use {"hrsh7th/cmp-buffer", lock=false} -- buffer completions
    -- use {"hrsh7th/cmp-path", lock=false} -- path completions
    -- use {"saadparwaiz1/cmp_luasnip", lock=false} -- snippet completions
    -- use {"hrsh7th/cmp-nvim-lsp", lock=false}
    -- use {"hrsh7th/cmp-nvim-lua", lock=false}
    -- use {'hrsh7th/cmp-cmdline', lock=false}
    -- use {'hrsh7th/cmp-omni', lock=false}
    use 'echasnovski/mini.completion'


    -- use {"L3MON4D3/LuaSnip", lock=false} --snippet engine
    -- use {"rafamadriz/friendly-snippets", lock=false} -- a bunch of snippets to use
    use {'azr4e1/adwaita.nvim'}                  -- adwaita theme
    use {'vim-scripts/dbext.vim', lock=false}                -- SQL
    use {'nvim-lualine/lualine.nvim', lock=false}            -- statusline
    use {"folke/which-key.nvim", lock=false}
    use {'vimwiki/vimwiki', lock=false}
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
