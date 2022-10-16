"""  _   _                 _            ____ _   _    
""" | \ | | ___  _____   _(_)_ __ ___  / ___| |_| | __
""" |  \| |/ _ \/ _ \ \ / / | '_ ` _ \| |  _| __| |/ /
""" | |\  |  __/ (_) \ V /| | | | | | | |_| | |_|   < 
""" |_| \_|\___|\___/ \_/ |_|_| |_| |_|\____|\__|_|\_\

if exists('g:GtkGuiLoaded')
    call rpcnotify(1, 'Gui', 'Font', 'FiraCode Nerd Font 12')
    call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
else
    GuiFont FiraCode Nerd Font:h12
endif                                                 

" Enable Mouse
set mouse=a
" show filename in title
set title
" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv

nmap <silent> <C-ENTER> <Plug>SendDownLine
imap <silent> <C-ENTER> <C-o><Plug>SendLine
vmap <silent> <C-ENTER> <Plug>SendDownSelection
nmap <silent> <F5> <Plug>ToggleTerminal
vmap <silent> <F5> <C-U><Plug>ToggleTerminal
imap <silent> <F5> <C-o><Plug>ToggleTerminal
tmap <silent> <F5> <C-\><C-n><Plug>ToggleTerminal
nmap <silent> <C-'> <Plug>ToggleTerminal
vmap <silent> <C-'> <C-U><Plug>ToggleTerminal
imap <silent> <C-'> <C-o><Plug>ToggleTerminal
tmap <silent> <C-'> <C-\><C-n><Plug>ToggleTerminal
nmap <silent> <C-Del> <Plug>KillTerminal
vmap <silent> <C-Del> <C-U><Plug>KillTerminal
imap <silent> <C-Del> <C-o><Plug>KillTerminal
tmap <silent> <C-Del> <C-\><C-n><Plug>KillTerminal
nnoremap <silent> <M-,> gT
nnoremap <silent> <M-.> gt
nnoremap <silent> <Home> :Startify<CR>
nnoremap <silent> <C-S-t> :tabnew<CR>
execute "tnoremap <silent> <M--> \<C-\>\<C-n>a <- "
execute "tnoremap <silent> <M->> \<C-\>\<C-n>a %>% "
" Toggle comments
nnoremap <silent> <C-/> :Commentary<CR>
vnoremap <silent> <C-/> :Commentary<CR>
inoremap <silent> <C-/> <C-o>:Commentary<CR>
