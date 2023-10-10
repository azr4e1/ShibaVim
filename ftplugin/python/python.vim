"" Python
compiler pyunit
" " Set folding in Python files
" setlocal foldmethod=indent foldlevel=50
" set dictionary for autocompletion
setlocal dictionary=/home/ld/.config/nvim/words/python/complete-dict
" terminal commands
nnoremap <buffer><silent> <localleader>ph :call Redir("!pydoc ".expand("<cword>"))<CR>
vnoremap <buffer><silent> <localleader>ph :<C-U>call Redir("!pydoc ".Get_visual_selection())<CR>
nnoremap <buffer><silent> <localleader>pp :call SendCmd('print('.expand("<cword>").')'."\n")<CR>
vnoremap <buffer><silent> <localleader>pp :call SendCmd('print('.Get_visual_selection().')'."\n")<CR>

nnoremap <silent><buffer> <C-down> :call NextChunk()<CR>
nnoremap <silent><buffer> <C-up> :call PrevChunk()<CR>

nnoremap <silent><buffer> <localleader><CR> :call DownLine_noIndent()<CR>

nnoremap <buffer><silent> <leader><CR> :call SendDownLine_Python()<CR>
vnoremap <buffer><silent> <leader><CR> :<C-U>call DownSelection_nonewline()<CR>

nnoremap <buffer><silent> <localleader>ft :call FormatComment()<CR>
vnoremap <buffer><silent> <localleader>ft J:call FormatComment()<CR>
