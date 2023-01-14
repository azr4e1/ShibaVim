" Startify settings
let g:startify_custom_header =
      \ 'startify#center(startify#fortune#cowsay())'
" jupytext settings
let g:jupytext_fmt = 'py'
let g:jupytext_command = '/home/ld/.miniconda3/bin/jupytext'
" nvim-R settings
let g:markdown_fenced_languages = ['r', 'python']
let g:rmd_fenced_languages = ['r', 'python']
" supertab settings
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabRetainCompletionDuration = 'completion'
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
