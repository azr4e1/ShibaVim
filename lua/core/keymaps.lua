local no_plugins = require('core.plugins')
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
-- copy to clipboard
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', {silent=true, desc="Copy to clipboard", noremap=true})
vim.api.nvim_set_keymap("n", "<C-p>", '"+p', {silent=true, desc="Paste from clipboard", noremap=true})
vim.api.nvim_set_keymap("n", "<leader>n", ":bnext<CR>", {silent=true, desc="Next buffer", noremap=true})
vim.api.nvim_set_keymap("n", "<leader>N", ":bprevious<CR>", {silent=true, desc="Previous buffer", noremap=true})
vim.api.nvim_set_keymap("n", "gm", ":call cursor(0, virtcol('$')/2)<CR>", {silent=true, desc="Go to middle line", noremap=true})
vim.api.nvim_set_keymap("n", "<leader>cc", ":set cursorcolumn!<CR>", {silent=true, desc="Toggle cursor column", noremap=true})
vim.api.nvim_set_keymap("n", "<leader>ev", ":vsplit $MYVIMRC<CR>", {silent=true, desc="Edit init file", noremap=true})
vim.api.nvim_set_keymap("n", "<leader>sv", ":source $MYVIMRC<CR>", {silent=true, desc="Source init", noremap=true})
vim.api.nvim_set_keymap("n", "-", "<C-^>", {silent=true, desc="Jump to alternate buffer", noremap=true})
vim.api.nvim_set_keymap("n", "<BS>", "za", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<A-h>", "<C-w>h", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<A-j>", "<C-w>j", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<A-k>", "<C-w>k", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<A-l>", "<C-w>l", {silent=true, noremap=true})
vim.api.nvim_set_keymap("i", "<A-h>", "<ESC><C-w>h", {silent=true, noremap=true})
vim.api.nvim_set_keymap("i", "<A-j>", "<ESC><C-w>j", {silent=true, noremap=true})
vim.api.nvim_set_keymap("i", "<A-k>", "<ESC><C-w>k", {silent=true, noremap=true})
vim.api.nvim_set_keymap("i", "<A-l>", "<ESC><C-w>l", {silent=true, noremap=true})
vim.api.nvim_set_keymap("t", "<A-h>", "<C-\\><C-n><C-w>h", {silent=true, noremap=true})
vim.api.nvim_set_keymap("t", "<A-j>", "<C-\\><C-n><C-w>j", {silent=true, noremap=true})
vim.api.nvim_set_keymap("t", "<A-k>", "<C-\\><C-n><C-w>k", {silent=true, noremap=true})
vim.api.nvim_set_keymap("t", "<A-l>", "<C-\\><C-n><C-w>l", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-e>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-y>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("i", "<C-j>", "<C-o><C-e>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("i", "<C-k>", "<C-o><C-y>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<Up>", ":resize +2<CR>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<Down>", ":resize -2<CR>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<Right>", ":vertical resize +2<CR>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<Left>", ":vertical resize -2<CR>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<ESC>", "<ESC>:nohlsearch<CR>:echo ''<CR>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("v", "<", "<gv", {silent=true, noremap=true, desc="Hold on to visual mode when indenting"})
vim.api.nvim_set_keymap("v", ">", ">gv", {silent=true, noremap=true, desc="Hold on to visual mode when indenting"})
vim.api.nvim_set_keymap("n", "<leader>wd", ":%s#\\v\\s+$##g<CR>:nohlsearch<CR>", {silent=true, noremap=true, desc="Delete trailing whitespaces"})
vim.api.nvim_set_keymap("n", "<leader>i", ":setlocal spell! spelllang=en_gb<CR>", {silent=true, noremap=true, desc="English spelling check toggle"})
vim.api.nvim_set_keymap("n", "<leader>I", ":setlocal spell! spelllang=it<CR>", {silent=true, noremap=true, desc="Italian spelling check toggle"})
vim.api.nvim_set_keymap("n", "<leader>qo", ":copen<CR>", {silent=true, noremap=true, desc="Open quickfix list"})
vim.api.nvim_set_keymap("n", "<leader>qq", ":cclose<CR>", {silent=true, noremap=true, desc="Close quickfix list"})
vim.api.nvim_set_keymap("n", "<leader>qn", ":cnext<CR>", {silent=true, noremap=true, desc="Next in quickfix"})
vim.api.nvim_set_keymap("n", "<leader>qp", ":cprev<CR>", {silent=true, noremap=true, desc="Previous in quickfix"})
vim.api.nvim_set_keymap("n", "<leader>qf", ":cfirst<CR>", {silent=true, noremap=true, desc="First in quickfix"})
vim.api.nvim_set_keymap("n", "<leader>ql", ":clast<CR>", {silent=true, noremap=true, desc="Last in quickfix"})
vim.api.nvim_set_keymap("n", "<leader>lo", ":lopen<CR>", {silent=true, noremap=true, desc="Open locallist list"})
vim.api.nvim_set_keymap("n", "<leader>lq", ":lclose<CR>", {silent=true, noremap=true, desc="Close locallist list"})
vim.api.nvim_set_keymap("n", "<leader>ln", ":lnext<CR>", {silent=true, noremap=true, desc="Next in locallist"})
vim.api.nvim_set_keymap("n", "<leader>lp", ":lprev<CR>", {silent=true, noremap=true, desc="Previous in locallist"})
vim.api.nvim_set_keymap("n", "<leader>lf", ":lfirst<CR>", {silent=true, noremap=true, desc="First in locallist"})
vim.api.nvim_set_keymap("n", "<leader>ll", ":llast<CR>", {silent=true, noremap=true, desc="Last in locallist"})
vim.api.nvim_set_keymap("n", "<leader>x", ":make %<CR>", {silent=true, noremap=true, desc="Compile current file"})
vim.api.nvim_set_keymap("n", "<leader>cd", ':echom "Changing directory to ".expand("%:h")<CR>:cd %:h<CR>', {silent=true, noremap=true, desc="Change to current directory"})
-- vim.api.nvim_set_keymap("i", "<ESC>", 'pumvisible() ? "\\<C-e>" : "\\<Esc>"', {expr=true, noremap=true})
-- vim.api.nvim_set_keymap("c", "<ESC>", 'pumvisible() ? "\\<C-e>" : "\\<C-c>"', {expr=true, noremap=true})
-- vim.api.nvim_set_keymap("i", "<CR>", 'pumvisible() ? "\\<C-y>" : "\\<CR>"', {expr=true, noremap=true})
-- vim.api.nvim_set_keymap("c", "<CR>", 'pumvisible() ? "\\<C-y>" : "\\<CR>"', {expr=true, noremap=true})
vim.api.nvim_create_user_command("Infos", [[echo "Informations about file "."'".expand("%:t")."'"."\nFile Type:\t".toupper(&filetype)."\nFile Encoding:\t".toupper(&fenc)."\nFile Format:\t".toupper(&ff)]], {nargs=0})
vim.api.nvim_set_keymap("n", "tn", ":tabnew<CR>", {silent=true, noremap=true, desc="Open new tab"})
vim.api.nvim_set_keymap("n", "<M-,>", "gT", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<M-.>", "gt", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<leader><BS>", "zA", {silent=true, noremap=true, desc="Toggle folding"})
vim.api.nvim_set_keymap("t", "<M-->", "<C-\\><C-n>a <- ", {silent=true, noremap=true})
vim.api.nvim_set_keymap("t", "<M->>", "<C-\\><C-n>a %>% ", {silent=true, noremap=true})
vim.api.nvim_set_keymap("i", "<C-SPACE>", "<C-x><C-o>", {silent=true, noremap=true, desc="Force omnifunc"})
-- Things that require a plugin
HOME = os.getenv("HOME")
vim.api.nvim_set_keymap("n", "<F2>", ":NvimTreeToggle<CR>", {silent=true, noremap=true, desc="Toggle Project Drawer"})
vim.api.nvim_set_keymap("n", "<M-w>", ":NvimTreeFocus<CR>", {silent=true, noremap=true, desc="Focus Project Drawer"})
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", {silent=true, noremap=true, desc="Telescope on Files"})
vim.api.nvim_set_keymap("n", "<leader>fm", ":Telescope marks<CR>", {silent=true, noremap=true, desc="Telescope on Marks"})
vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope oldfiles<CR>", {silent=true, noremap=true, desc="Telescope on History"})
vim.api.nvim_set_keymap("n", "<leader>fw", ":Telescope live_grep<CR>", {silent=true, noremap=true, desc="Telescope on term searched with RipGrep"})
vim.api.nvim_set_keymap("n", "<leader>fc", ":Telescope colorscheme<CR>", {silent=true, noremap=true, desc="Telescope on Colorschemes"})
vim.api.nvim_set_keymap("n", "<leader>fk", ":Telescope keymaps<CR>",{silent=true, noremap=true, desc="Telescope on keymaps"})
vim.api.nvim_set_keymap("n", "<leader>fs", ":Telescope find_files cwd=" .. HOME .. "/.scripts<CR>", {silent=true, noremap=true, desc="Telescope on personal scripts"})
vim.api.nvim_set_keymap("n", "<leader>fp", ":Telescope find_files cwd=" .. HOME .. "/Desktop/Projects<CR>", {silent=true, noremap=true, desc="Telescope on personal Projects"})
vim.api.nvim_set_keymap("n", "<leader>fgc", ":Telescope git_commits<CR>", {silent=true, noremap=true, desc="Telescope on git commits"})
vim.api.nvim_set_keymap("n", "<leader>fgb", ":Telescope git_branches<CR>", {silent=true, noremap=true, desc="Telescope on git branches"})
vim.api.nvim_set_keymap("n", "<leader>fgs", ":Telescope git_status<CR>", {silent=true, noremap=true, desc="Telescope on git status"})
vim.api.nvim_set_keymap("n", "<leader>b", ":Telescope buffers<CR>", {silent=true, noremap=true, desc="Telescope on Buffers"})
vim.api.nvim_set_keymap("n", "<leader>fd", ":Telescope diagnostics<CR>", {silent=true, noremap=true, desc="Telescope on Buffers"})
vim.api.nvim_set_keymap("n", "<leader>z", ":ZenMode<CR>", {silent=true, noremap=true, desc="Toggle Zen Mode"})
vim.api.nvim_set_keymap("n", "<CR>", "<Plug>SendDownLine", {silent=true, desc="Send line to terminal and move down"})
vim.api.nvim_set_keymap("v", "<CR>", "<Plug>SendDownSelection", {silent=true, desc="Send selection to terminal and move down"})
vim.api.nvim_set_keymap("n", "<leader><CR>", "<CR>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("v", "<leader><CR>", "<CR>", {silent=true, noremap=true})
vim.api.nvim_set_keymap("n", "<C-_>", "<Plug>(comment_toggle_linewise_current)", {silent=true, noremap=true, desc="Toggle Comment"})
vim.api.nvim_set_keymap("v", "<C-_>", "<Plug>(comment_toggle_linewise_visual)", {silent=true, noremap=true, desc="Toggle Comment"})
vim.api.nvim_set_keymap("n", "<leader>ss", ":SessionSave<CR>", {silent=true, noremap=true, desc="Save Session"})
vim.api.nvim_set_keymap("n", "<leader>sl", ":SessionLoad ", {noremap=true, desc="Load Session"})
vim.api.nvim_set_keymap("n", "<leader>sd", ":SessionDelete ", {noremap=true, desc="Delete Session"})
vim.api.nvim_set_keymap("n", "<leader>th", "<Plug>CreateHorTerm", {silent=true, desc="Create horizontal terminal"})
vim.api.nvim_set_keymap("n", "<leader>tv", "<Plug>CreateVertTerm", {silent=true, desc="Create vertical terminal"})
vim.api.nvim_set_keymap("n", "<leader>tT", "<Plug>CreateDynamicTerm", {silent=true, desc="Create terminal dynamically"})
vim.api.nvim_set_keymap("n", "<leader>TT", "<Plug>CreateDynamicCons", {silent=true, desc="Create bash console dynamically"})
vim.api.nvim_set_keymap("n", "<leader>tD", "<Plug>CreateDynamicDebugger", {silent=true, desc="Create debugger dynamically"})
vim.api.nvim_set_keymap("n", "<leader>tt", "<Plug>ToggleTerminal", {silent=true, desc="Toggle Terminal"})
vim.api.nvim_set_keymap("n", "<leader>tk", "<Plug>KillTerminal", {silent=true, desc="Kill Terminal"})
vim.api.nvim_set_keymap("n", "<leader>ts", "<Plug>SendLine", {silent=true, desc="Send current line to terminal"})
vim.api.nvim_set_keymap("v", "<leader>ts", "<Plug>SendSelection", {silent=true, desc="Send current selection to terminal"})
vim.api.nvim_set_keymap("n", "<leader>td", "<Plug>SendDownLine", {silent=true, desc="Send current line to terminal and move down"})
vim.api.nvim_set_keymap("v", "<leader>td", "<Plug>SendDownSelection", {silent=true, desc="Send current selection to terminal and move down"})
vim.api.nvim_set_keymap("n", "<leader>tc", "<Plug>ClearTerm", {silent=true, desc="Clear terminal"})
vim.api.nvim_set_keymap("v", "<leader>tc", "<Plug>ClearTerm", {silent=true, desc="Clear terminal"})
vim.api.nvim_set_keymap("n", "<leader>to", "<Plug>SpawnTODO", {silent=true, desc="Open TODO"})
vim.api.nvim_set_keymap("n", "<leader><leader>", "<Plug>NNNChoose_file", {silent=true, desc="Open NNN"})
vim.api.nvim_set_keymap("n", "<leader>gs", ":G<CR>", {silent=true, noremap=true, desc="Launch Gitsigns"})
vim.api.nvim_set_keymap("n", "<leader>gb", ":Gitsigns blame_line<CR>", {silent=true, noremap=true, desc="Blame Line"})
vim.api.nvim_set_keymap("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", {silent=true, noremap=true, desc="Preview hunk"})
vim.api.nvim_set_keymap("n", "<leader>gp", ":Gitsigns prev_hunk<CR>", {silent=true, noremap=true, desc="Jump to previous hunk"})
vim.api.nvim_set_keymap("n", "<leader>gn", ":Gitsigns next_hunk<CR>", {silent=true, noremap=true, desc="Jump to next hunk"})
vim.api.nvim_set_keymap("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", {silent=true, noremap=true, desc="Stage current hunk"})
vim.api.nvim_set_keymap("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>", {silent=true, noremap=true, desc="Undo last staging"})
vim.api.nvim_set_keymap("n", "<leader>gb", ":Gitsigns stage_buffer<CR>", {silent=true, noremap=true, desc="Stage all hunks in buffer"})
