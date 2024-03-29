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
         commit='ea0cc3c59f67c440c5ff0bbe4fb9420f4350b9a3'}
    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        event = 'VimEnter',
        run = ':TSUpdate',
        tag = 'v0.9.1',
        config = function()
            require'lazy.treesitter'.setup()
    end,
    }
    use {'nvim-treesitter/playground',
        after = 'nvim-treesitter',
        commit='ba48c6a62a280eefb7c85725b0915e021a1a0749'}
    -- Mason
    use {"williamboman/mason.nvim",
        tag = 'v1.8.1'}
    use {"williamboman/mason-lspconfig.nvim",
        tag = 'v1.17.1'}
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
         commit='a1e6268779411048a87f767a27380089362a0ce2'}
    use {'nvim-tree/nvim-tree.lua',
        opt = true,
        cmd = 'NvimTreeToggle',
        config = function()
            require'nvim-tree'.setup()
        end,
        commit='53b0bcaadaffb505acff230578b56a86ec1ab38a'
    }
    -- LSP
    use {'neovim/nvim-lspconfig',
         commit='cafbeff74f063ed49456a1a99102efde824e6e00'}
    -- focus window
    use {'folke/zen-mode.nvim',
        cmd = 'ZenMode',
        config = function()
            require'plugin-config.zen-mode'.setup()
        end,
        tag = 'v1.3.0'
    }
    -- git signs
    use {'lewis6991/gitsigns.nvim',
        event = 'BufReadPre',
        cmd = "Gitsigns",
        config = function()
            require'plugin-config.git-signs'.setup()
        end,
        commit='ff01d34daaed72f271a8ffa088a7e839a60c640f'
    }
    -- indentation guides
    use {'lukas-reineke/indent-blankline.nvim',
        after = 'nvim-treesitter',
        config = function()
            require('plugin-config.indent-blankline').setup()
        end,
        tag = 'v3.2.7'
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
        commit='36c610a9717cc9ec426a07c8e6bf3b3abcb139d6'
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
        tag = 'v0.8.0'
    }
    use {"windwp/nvim-autopairs",
         commit='e8f7dd7a72de3e7b6626c050a802000e69d53ff0'}
    use {
        "kylechui/nvim-surround",
        -- tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup()
        end,
        commit='211eaad7c6d01ef4ac02cba9052b3082ec232101'
    }
    use {'goolord/alpha-nvim',
         config = function ()
             require'plugin-config.alpha'.setup()
         end,
         commit='9e33db324b8bb7a147bce9ea5496686ee859461d'
    }
    use {'nvim-telescope/telescope.nvim', tag = '0.1.3',
        requires = {{'nvim-lua/plenary.nvim',
                      tag = 'v0.1.3'}}
    }
    use {'chrisbra/csv.vim',                   -- CSV
        ft = {'csv'},
        commit='4fd88346aed02123aa5daa1a363868a576c6fdcf'
    }
    use {'azr4e1/luatab.nvim',
        config = function()
            require'luatab'.setup()
        end,
    }
    use {'azr4e1/adwaita.nvim'}                  -- adwaita theme
    -- use {'vim-scripts/dbext.vim',
    --      ft = 'sql',
    --      commit=false}                -- SQL
    use {'nvim-lualine/lualine.nvim', commit='45e27ca739c7be6c49e5496d14fcf45a303c3a63'}            -- statusline
    use {"folke/which-key.nvim", tag = 'v1.5.1'}
    use {'vimwiki/vimwiki', commit='f0fe154ede6b11e3db9b058b930005a056a3d1c6'}
    use {'azr4e1/todo.vim',
         -- opt = true,
         cmd = 'TODO'}
    use {'azr4e1/nnn.vim',
         -- opt = true,
         cmd = 'NNN'}
    use {'azr4e1/terminal.nvim'}
    use {'nvim-telescope/telescope-ui-select.nvim', commit='62ea5e58c7bbe191297b983a9e7e89420f581369'}
    use {'danymat/neogen', commit='70127baaff25611deaf1a29d801fc054ad9d2dc1'}
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
