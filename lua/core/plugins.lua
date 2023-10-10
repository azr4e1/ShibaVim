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
        commit='4f1c72767bec31397d59554f84096909b2887195'}
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
         commit='9ab9b0b894b2388a9dbcdee5f00ce72e25d85bf9'}
    use {'nvim-tree/nvim-tree.lua',
        opt = true,
        cmd = 'NvimTreeToggle',
        config = function()
            require'nvim-tree'.setup()
        end,
        commit='4af572246ce49883e2a52c49203a19984454f2e0'
    }
    -- LSP
    use {'neovim/nvim-lspconfig',
         commit='6b2dafb8f46fe8e59bdb8aa1baed44c942e18e0d'}
    -- focus window
    use {'folke/zen-mode.nvim',
        cmd = 'ZenMode',
        config = function()
            require'plugin-config.zen-mode'.setup()
        end,
        commit='eac78cce3eeb05799ec9a984a6ae147db77b88c1'
    }
    -- git signs
    use {'lewis6991/gitsigns.nvim',
        event = 'BufReadPre',
        cmd = "Gitsigns",
        config = function()
            require'plugin-config.git-signs'.setup()
        end,
        commit='dc2962f7fce953a2a98e7c6d3d7fc4c1d1f66758'
    }
    -- indentation guides
    use {'lukas-reineke/indent-blankline.nvim',
        after = 'nvim-treesitter',
        config = function()
            require('plugin-config.indent-blankline').setup()
        end,
        commit='6061c085417e22f1706c04ceb1cf59bf80d44993'
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
        commit='3d22da7f8d72d3eafe1491a7f05ea775b930c481'
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
    use {'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = {{'nvim-lua/plenary.nvim',
                      commit='102c02903c74b93c705406bf362049383abc87c8'}},
    }
    use {'chrisbra/csv.vim',                   -- CSV
        ft = {'csv'},
        commit='15ff93edf5b26c466affbb356e0696b7d6a3b499'
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
    use {'nvim-lualine/lualine.nvim', commit='8912bea65de93a56b1f70cdb7c3c26f9cce30394'}            -- statusline
    use {"folke/which-key.nvim", commit='65b36cc258e857dea92fc11cdc0d6e2bb01d3e87'}
    use {'vimwiki/vimwiki', commit='71edcf6802eeb724ca679547d5cb7a8eadf0cfcb'}
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
