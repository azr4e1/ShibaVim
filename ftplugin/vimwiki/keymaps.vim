nnoremap <buffer><silent> <leader>wH :VimwikiAll2HTML<CR>
nnoremap <buffer><silent> <leader>wC :VimwikiTOC<CR>
imap <buffer><silent> <C-RIGHT> <Plug>VimwikiTableNextCell
imap <buffer><silent> <C-LEFT> <Plug>VimwikiTablePrevCell
nnoremap <buffer><silent> <leader>wu :!update_wiki<CR>
nnoremap <buffer><silent> <leader>vwt :VimwikiTable<CR>
nnoremap <buffer><silent> <leader>vwb :VimwikiBacklinks<CR>
setlocal spell! spelllang=en_gb

nnoremap <buffer> <leader>vws :VWS 

iabbrev <buffer> py_css {{{class="prettyprint lang-python"<CR><CR>}}}<UP>
iabbrev <buffer> r_css {{{class="prettyprint lang-r"<CR><CR>}}}<UP>
iabbrev <buffer> c_css {{{class="prettyprint lang-c"<CR><CR>}}}<UP>
iabbrev <buffer> lua_css {{{class="prettyprint lang-lua"<CR><CR>}}}<UP>
iabbrev <buffer> hs_css {{{class="prettyprint lang-haskell"<CR><CR>}}}<UP>
iabbrev <buffer> jl_css {{{class="prettyprint lang-julia"<CR><CR>}}}<UP>
iabbrev <buffer> sh_css {{{class="prettyprint lang-bash"<CR><CR>}}}<UP>
