------------------------------
-- Put all the plugins here --
------------------------------
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'               -- packer
    use {
        'nvim-treesitter/nvim-treesitter',     -- treesitter
        run = ':TSUpdate'
    }
    use {
        'A0-Z1/vimwiki',                       -- vimwiki
        branch = 'quote_fix'
    }
    use {
        'jalvesaq/Nvim-R',                     -- R
        branch = 'stable'
    }
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-dap-python'
    use 'rcarriga/nvim-dap-ui'
    use 'tpope/vim-surround'                   -- easy wrapping
    use 'tpope/vim-fugitive'                   -- git
    use 'tpope/vim-commentary'                 -- commenting
    use 'neovim/nvim-lspconfig'                -- LSP
    use 'chrisbra/csv.vim'                     -- CSV
    use 'junegunn/fzf.vim'                     -- FZF
    use 'RRethy/nvim-base16'                   -- base16 theme
    use 'azr4e1/adwaita.nvim'                  -- adwaita theme
    use 'mhinz/vim-startify'                   -- splash screen
    use 'folke/zen-mode.nvim'                  -- focus window
    use 'lukas-reineke/indent-blankline.nvim'  -- indentation guides
    use 'ervandew/supertab'                    -- tab completion
    use 'goerz/jupytext.vim'                   -- jupyter notebook integration
    use 'kyazdani42/nvim-web-devicons'         -- icons for project sidebar
    use 'kyazdani42/nvim-tree.lua'             -- project sidebar
    use 'lewis6991/gitsigns.nvim'              -- git signs
    use 'vim-scripts/dbext.vim'                -- SQL
    use 'jiangmiao/auto-pairs'                 -- easy bracketing
    use 'norcalli/nvim-colorizer.lua'          -- color visualizer
    use 'nvim-lualine/lualine.nvim'            -- statusline
    use 'linty-org/key-menu.nvim'              -- mapping hints
end)
