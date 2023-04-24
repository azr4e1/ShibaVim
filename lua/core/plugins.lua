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
    use 'nvim-treesitter/playground'
    -- Mason
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
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
        end
    }
    -- project sidebar
    use 'nvim-tree/nvim-web-devicons'
    use {'nvim-tree/nvim-tree.lua',
        opt = true,
        cmd = 'NvimTreeToggle',
        config = function()
            require'nvim-tree'.setup()
        end
    }
    -- LSP
    use {'neovim/nvim-lspconfig'}
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
            require 'lazy.nvim-colorizer'.setup()
        end
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {"windwp/nvim-autopairs"}
    use {
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup()
        end
    }
    use {'goolord/alpha-nvim',
         config = function ()
             require'plugin-config.alpha'.setup()
         end
    }
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {'nvim-lua/plenary.nvim'},
    }
    use {'chrisbra/csv.vim',                   -- CSV
        ft = {'csv'}
    }
    use {'azr4e1/luatab.nvim',
        config = function()
            require'luatab'.setup()
        end
    }
    -- Cmp
    use "hrsh7th/nvim-cmp"  -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use 'hrsh7th/cmp-cmdline'
    -- use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-omni'
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
    use 'azr4e1/adwaita.nvim'                  -- adwaita theme
    use 'vim-scripts/dbext.vim'                -- SQL
    use 'nvim-lualine/lualine.nvim'            -- statusline
    use 'linty-org/key-menu.nvim'              -- mapping hints
    use {'vimwiki/vimwiki'}
    -- Packer
use({
  "folke/noice.nvim",
  config = function()
    require("noice").setup({
        -- add any options here
    })
  end,
  requires = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
})
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
