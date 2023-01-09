------------------------------
-- Put all the plugins here --
------------------------------
return require('packer').startup(function(use)
    -- Packer can manage itself
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'A0-Z1/vimwiki',
        branch = 'quote_fix'
    }
    use {
        'jalvesaq/Nvim-R',
        branch = 'stable'
    }
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'
    use 'neovim/nvim-lspconfig'
    use 'chrisbra/csv.vim'
    use 'junegunn/fzf.vim'
    use 'RRethy/nvim-base16'
    use 'azr4e1/adwaita.nvim'
    use 'mhinz/vim-startify'
    use 'folke/zen-mode.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'ervandew/supertab'
    use 'goerz/jupytext.vim'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'lewis6991/gitsigns.nvim'
    use 'vim-scripts/dbext.vim'
    use 'jiangmiao/auto-pairs'
    use 'norcalli/nvim-colorizer.lua'
    use 'nvim-lualine/lualine.nvim'
    use 'linty-org/key-menu.nvim'
end)
