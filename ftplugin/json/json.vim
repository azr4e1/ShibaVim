command! JSONPretty %!jq .
nnoremap <buffer><silent> <localleader>jp :JSONPretty<CR>
