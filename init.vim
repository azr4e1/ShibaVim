"""  _ __   ___  _____   _(_)_ __ ___  
""" | '_ \ / _ \/ _ \ \ / / | '_ ` _ \ 
""" | | | |  __/ (_) \ V /| | | | | | |
""" |_| |_|\___|\___/ \_/ |_|_| |_| |_|


" Put all the nvim options here
"{{{
set showmode " Enable showmode (show current mode in command line)
set number relativenumber " Enable row numbers
set cursorline " Enable cursorline
set hlsearch " Highlight searches
set ignorecase smartcase " Do case insensitive searches
set incsearch " Show incremental search results as you type
set autoindent expandtab tabstop=4 shiftwidth=4 " Enable autoindent
set splitbelow splitright " Regulate positions of new windows
set hidden " To leave buffers that have changes
set confirm
set tgc " Enable 24bit colors in TUI
set undofile " Save undo trees in files
set undodir=~/.local/share/nvim/undo " undo directory
set undolevels=10000 " Number of undo saved
set completeopt=menuone " specify how popup menu works
" Set grep engine with the Perl -P option
let &grepprg="grep -nP $* /dev/null"
" Set the make command
let &makeprg="autocompile $*"
" settings specific to neovim
set nocompatible
" update time for CursorHold event in milliseconds
set updatetime=250
" set mouse
set mouse=a
set omnifunc=syntaxcomplete#Complete
filetype plugin on
syntax on
"" don't implement dbext stupid keybindings
"let g:omni_sql_no_default_maps = 1
set listchars=eol:↴,lead:⋅,tab:<->
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=99
" set blinking
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
              \,a:blinkwait400-blinkoff600-blinkon900-Cursor/lCursor
              \,sm:block-blinkwait175-blinkoff150-blinkon175
"}}}

" Put all the user-defined variables here
" {{{
" Make every .tex file become filetype latex
let g:tex_flavor="latex"
" enable python for virtualenvs
let g:python3_host_prog = '~/.venv/neovim/bin/python'
" }}}

" Put all the plugins here
"{{{
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-surround'                                   " easy bracket managing
Plug 'tpope/vim-fugitive'                                   " Add integration with Git
Plug 'tpope/vim-commentary'                                 " easy comment stuff
Plug 'neovim/nvim-lspconfig'                                " LSP
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}                " R develop
Plug 'chrisbra/csv.vim'                                     " csv editing
Plug 'A0-Z1/vimwiki', {'branch': 'quote_fix'}               " wikis
Plug 'junegunn/fzf.vim'                                     " fzf integration
Plug 'Mofiqul/adwaita.nvim'
Plug 'RRethy/nvim-base16'                                   " colorscheme
Plug 'mhinz/vim-startify'                                   " startup page
Plug 'folke/zen-mode.nvim'                                  " focus mode
Plug 'lukas-reineke/indent-blankline.nvim'                  " indentation guides
Plug 'ervandew/supertab'                                    " tab completion
Plug 'goerz/jupytext.vim'                                   " jupyter notebook integration
Plug 'kyazdani42/nvim-web-devicons'                         " navigation panel
Plug 'kyazdani42/nvim-tree.lua'                             " icons for navigation panel
Plug 'lewis6991/gitsigns.nvim'                              " git signs on editor
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " treesitter
Plug 'vim-scripts/dbext.vim'                                " SQL integration
Plug 'jiangmiao/auto-pairs'                                 " auto pairs for brackets
Plug 'norcalli/nvim-colorizer.lua'                          " highlight hex codes
Plug 'sakhnik/nvim-gdb'                                     " Debugging
Plug 'nvim-lualine/lualine.nvim'                            " Statusline
call plug#end()
"}}}
" Put all the plugin settings here
"{{{
" lualine settings
lua << EOF
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

local terminal = { sections = { lualine_a = {'filename'} }, inactive_sections = {lualine_a = {'filename'}}, filetypes = {'terminal'} }
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
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
    lualine_b = {'Branch', 'diff', 'diagnostics'},
    lualine_c = {},
    lualine_x = {TreeSitter, 'Spelling', 'filetype'},
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
EOF
" colorizer settings
lua <<EOF
require 'colorizer'.setup {
  'css';
  'javascript';
  'html';
}
EOF
" Startify
let g:startify_custom_header =
      \ 'startify#center(startify#fortune#cowsay())'
" GitSigns
lua require('gitsigns').setup()
" NvimTree
lua require("nvim-tree").setup()
"dbext settings
let g:dbext_default_profile_monzo = 'type=MYSQL:user=ld:passwd=19/Matematica/96:host=a0z1.info:dbname=monzo'
" jupytext settings
let g:jupytext_fmt = 'py'
let g:jupytext_command = '/home/ld/.miniconda3/bin/jupytext'
" nvim-R
let g:markdown_fenced_languages = ['r', 'python']
let g:rmd_fenced_languages = ['r', 'python']
"" LSP
" disable virtual text by default
lua vim.diagnostic.config({virtual_text = false, float = {border='rounded'}})
" supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
"let g:SuperTabCrMapping = 1
let g:SuperTabRetainCompletionDuration = 'completion'
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
augroup supertab
    autocmd!
    autocmd FileType tex let b:SuperTabContextTextMemberPatterns = ['\\', '{']
    autocmd FileType c let b:SuperTabContextTextMemberPatterns = ['#']
    autocmd FileType html,css,javascript let b:SuperTabContextTextMemberPatterns = ['</', '<']
    autocmd FileType python let b:SuperTabContextTextMemberPatterns = ['\.', '@']
    autocmd FileType javascript let b:SuperTabContextTextMemberPatterns = ['\.', '__']
    autocmd FileType sh,bash let b:SuperTabContextTextMemberPatterns = ['\$', '(']
    autocmd FileType r,rmd let b:SuperTabContextTextMemberPatterns = ['\.', '\$', ':', '@']
    autocmd FileType vimwiki let b:SuperTabContextTextMemberPatterns = ['\[', '#', ':']
    autocmd FileType ps1 let b:SuperTabContextTextMemberPatterns = ['\$', '-', ':', '.']
augroup END
" vimwiki
"let g:vimwiki_folding = 'expr'
let g:vimwiki_toc_link_format = 1
let g:vimwiki_list = [{'path': '~/Desktop/Wikis/Personal',
      \ 'path_html': '~/Desktop/Wikis/Personal/html/',
      \ 'template_path': '~/Desktop/Wikis/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default',
      \ 'nested_syntaxes': {'python': 'python', 'r': 'r'}},
      \ {'path': '~/Desktop/Wikis/Machine\ Learning',
      \ 'path_html': '~/Desktop/Wikis/Machine\ Learning/html/',
      \ 'template_path': '~/Desktop/Wikis/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default',
      \ 'nested_syntaxes': {'python': 'python', 'r': 'r'}},
      \ {'path': '~/Desktop/Wikis/Coding',
      \ 'path_html': '~/Desktop/Wikis/Coding/html/',
      \ 'template_path': '~/Desktop/Wikis/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default',
      \ 'nested_syntaxes': {'python': 'python', 'r': 'r'}},
      \ {'path': '~/Desktop/Wikis/Statistics',
      \ 'path_html': '~/Desktop/Wikis/Statistics/html/',
      \ 'template_path': '~/Desktop/Wikis/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default',
      \ 'nested_syntaxes': {'python': 'python', 'r': 'r'}},
      \ {'path': '~/Desktop/Wikis/Marketing',
      \ 'path_html': '~/Desktop/Wikis/Marketing/html/',
      \ 'template_path': '~/Desktop/Wikis/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default',
      \ 'nested_syntaxes': {'python': 'python', 'r': 'r'}},
      \ {'path': '~/Desktop/Wikis/Finance',
      \ 'path_html': '~/Desktop/Wikis/Finance/html/',
      \ 'template_path': '~/Desktop/Wikis/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default',
      \ 'nested_syntaxes': {'python': 'python', 'r': 'r'}}]
let g:vimwiki_key_mappings = {
      \ 'table_mappings': 0
      \}

" ZenMode config
lua << EOF
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
EOF

" Calendar Settings
" let g:calendar_google_calendar = 1
" let g:calendar_google_task = 1
" source ~/.cache/calendar.vim/credentials.vim

" indent line filetypes
let g:indent_blankline_filetype_exclude = ['vimwiki', 'text', 'markdown', 'dashboard', 'startify', 'csv', 'nerdtree', 'netrw', 'help', 'rdoc', 'NvimTree', 'calendar']
let g:indent_blankline_buftype_exclude = ['terminal']
let g:indent_blankline_max_indent_increase = 1
let g:indent_blankline_show_current_context = v:true
let g:indent_blankline_show_current_context_start = v:true
"let g:indent_blankline_show_end_of_line = v:true
"let g:indent_blankline_show_first_indent_level = v:false

" Treesitter
lua<<EOF
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
EOF
"}}}

" Put all the highlight settings here
"{{{
" launch colorscheme
" colorscheme adwaita
colorscheme base16-twilight
" set error message
hi Error guifg=red
"}}}

" Put all the global mappings and commands here
"{{{
let mapleader = "\<SPACE>"
let maplocalleader ="\\"

" copy to clipboard
vnoremap <silent> <C-c> "+y
nnoremap <silent> <C-p> "+p
" copy to the end of line
nnoremap <silent> Y y$
" View the current buffers
"nnoremap <silent> <leader>b :ls<CR>:buffer<SPACE>
" Switch to prev/next buffer
nnoremap <silent> <leader>n :bnext<CR>
nnoremap <silent> <leader>N :bprevious<CR>
" Remap to go to middle of text line
nnoremap <silent> gm :call cursor(0, virtcol('$')/2)<CR>
" cursorcolumn
nnoremap <silent> <leader>cc :set cursorcolumn!<CR>
" Go quickly to init.vim
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<CR>
" Go quickly to ginit.vim
nnoremap <silent> <leader>eg :vsplit ~/.config/nvim/ginit.vim<CR>
" Source init.vim
nnoremap <silent> <leader>sv :source $MYVIMRC<CR>
" jump to alternate buffer (also CTRL_^)
nnoremap <silent> - <C-^>
" remap fold/unfold
nnoremap <silent> <BS> za
nnoremap <silent> <S-BS> zA
nnoremap <silent> <C-S-BS> :call ToggleFold()<CR>
" Remap window movements
nnoremap <silent> <A-h> <C-w>h
nnoremap <silent> <A-j> <C-w>j
nnoremap <silent> <A-k> <C-w>k
nnoremap <silent> <A-l> <C-w>l
inoremap <silent> <A-h> <ESC><C-w>h
inoremap <silent> <A-j> <ESC><C-w>j
inoremap <silent> <A-k> <ESC><C-w>k
inoremap <silent> <A-l> <ESC><C-w>l
tnoremap <silent> <A-h> <C-\><C-n><C-w>h
tnoremap <silent> <A-j> <C-\><C-n><C-w>j
tnoremap <silent> <A-k> <C-\><C-n><C-w>k
tnoremap <silent> <A-l> <C-\><C-n><C-w>l
" Scroll
nnoremap <silent> <C-j> <C-e>
nnoremap <silent> <C-k> <C-y>
inoremap <silent> <C-j> <C-o><C-e>
inoremap <silent> <C-k> <C-o><C-y>
" Remap window resizing
nnoremap <silent> <Up>      :resize +2<CR>
nnoremap <silent> <Down>    :resize -2<CR>
nnoremap <silent> <Right>   :vertical resize +2<CR>
nnoremap <silent> <Left>    :vertical resize -2<CR>
" Stop highlighting from last search
nnoremap <silent> <ESC> <ESC>:nohlsearch<CR>:echo ""<CR>
" Delete trailing whitespaces
nnoremap <silent> <leader>wd :%s#\v\s+$##g<CR>:nohlsearch<CR>
" Toggle spelling check
nnoremap <silent> <leader>i :setlocal spell! spelllang=en_gb<CR>
nnoremap <silent> <leader>I :setlocal spell spelllang=it<CR>
" remap quickfix commands
nnoremap <silent> <leader>qo :copen<CR>
nnoremap <silent> <leader>qq :cclose<CR>
nnoremap <silent> <leader>qn :cnext<CR>
nnoremap <silent> <leader>qp :cprev<CR>
nnoremap <silent> <leader>qf :cfirst<CR>
nnoremap <silent> <leader>ql :clast<CR>
" compile
nnoremap <silent> <leader>x :make %<CR>
" Project drawer
nnoremap <silent> <F2> :NvimTreeToggle<CR>
nnoremap <silent> <M-w> :NvimTreeFocus<CR>
" change directory to local file
nnoremap <silent> <leader>cd :echom "Changing directory to ".expand("%:h")<CR>:cd %:h<CR>
" exit from completion without modifying the word with ESC
inoremap <expr> <ESC> pumvisible() ? "\<C-e>" : "\<Esc>"
cnoremap <expr> <ESC> pumvisible() ? "\<C-e>" : "\<C-c>"
" confirm completion with CR
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
cnoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
"" commands
" Display infos about current file
command! Infos echo "Informations about file "."'".expand("%:t")."'"."\nFile Type:\t".toupper(&filetype)."\nFile Encoding:\t".toupper(&fenc)."\nFile Format:\t".toupper(&ff)
command! Myscripts :Files ~/.scripts

" display space char
"nnoremap <silent> <leader>ll :set list!<CR>
" FZF remappings
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fm :Marks<CR>
nnoremap <silent> <leader>fh :History<CR>
nnoremap <silent> <leader>fw :Rg<CR>
nnoremap <silent> <leader>fc :Colors<CR>
nnoremap <silent> <leader>fs :Files ~/.scripts<CR>
nnoremap <silent> <leader>b :Buffers<CR>

" save session
"nnoremap <silent> <leader>ss :mksession! /home/ld/.cache/vim/session/default.vim<CR>:echo "Session saved"<CR>
"nnoremap <silent> <leader>ll :source /home/ld/.cache/vim/session/default.vim<CR>:echo "Session restored"<CR>
" Zen Mode
nnoremap <silent><leader>z :ZenMode<CR>

nmap <silent> <leader><CR> <Plug>SendDownLine
vmap <silent> <leader><CR> <Plug>SendDownSelection
nnoremap <silent> <leader>/ :Commentary<CR>
vnoremap <silent> <leader>/ :Commentary<CR>
nnoremap <silent>tn :tabnew<CR>
nnoremap <silent> <M-,> gT
nnoremap <silent> <M-.> gt
nnoremap <silent> <Home> :Startify<CR>
nnoremap <silent> <leader><BS> zA
execute 'tnoremap <silent> <M--> <C-\><C-n>a <- '
execute 'tnoremap <silent> <M->> <C-\><C-n>a %>% '
"}}}

" Put all functions here
" {{{
function! ToggleFold()
    if &foldlevel == 0
        set foldlevel=99
    else
        set foldlevel=0
    endif
endfunction

function! Spelling()
    if &spell
        let status = "暈" . &spelllang
    else
        let status = ""
    endif

    return status
endfunction

" Display Git branching
function! Branch()
    let branch = FugitiveStatusline()
    if branch ==# ""
        let status  = ""
    else
        let status = " ".substitute(branch, '^.*(\(.*\)).*$', '\1', '')
    endif

    return status
endfunction
" }}}
