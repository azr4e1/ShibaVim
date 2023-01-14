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
            require'zen-mode'.setup {
                window = {
                    backdrop = 0.90, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
                    width = 120, -- width of the Zen window
                    height = 1, -- height of the Zen window
                }
            }
        end
        }
    -- git signs
    use {'lewis6991/gitsigns.nvim',
        event = 'BufReadPre',
        config = function()
            require'gitsigns'.setup()
        end
    }
    -- indentation guides
    use {'lukas-reineke/indent-blankline.nvim',
        after = 'nvim-treesitter',
        config = function()
            require('indent_blankline').setup {
                filetype_exclude = {'vimwiki', 'text', 'markdown', 'dashboard', 'startify', 'csv', 'nerdtree', 'netrw', 'help', 'rdoc', 'NvimTree', 'calendar', 'keymenu', 'packer'},
                buftype_exclude = {'terminal'},
                max_indent_increase = 1,
                show_current_context = true,
                show_current_context_start = false
            }
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
            require 'colorizer'.setup {
              'css';
              'javascript';
              'html';
            }
        end
    }
    use 'tpope/vim-surround'                   -- easy wrapping
    use 'tpope/vim-commentary'                 -- commenting
    use 'chrisbra/csv.vim'                     -- CSV
    use 'junegunn/fzf.vim'                     -- FZF
    use 'azr4e1/adwaita.nvim'                  -- adwaita theme
    use 'mhinz/vim-startify'                   -- splash screen
    use 'ervandew/supertab'                    -- tab completion
    use 'goerz/jupytext.vim'                   -- jupyter notebook integration
    use 'vim-scripts/dbext.vim'                -- SQL
    use 'jiangmiao/auto-pairs'                 -- easy bracketing
    use 'nvim-lualine/lualine.nvim'            -- statusline
    use 'linty-org/key-menu.nvim'              -- mapping hints
end)
