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
" indent line settings
" indent line filetypes
let g:indent_blankline_filetype_exclude = ['vimwiki', 'text', 'markdown', 'dashboard', 'startify', 'csv', 'nerdtree', 'netrw', 'help', 'rdoc', 'NvimTree', 'calendar', 'keymenu', 'packer']
let g:indent_blankline_buftype_exclude = ['terminal']
let g:indent_blankline_max_indent_increase = 1
let g:indent_blankline_show_current_context = v:true
let g:indent_blankline_show_current_context_start = v:true
" vimwiki settings
let g:vimwiki_toc_link_format = 1
let g:vimwiki_list = [{'path': '~/Documents/Wikis/Personal',
      \ 'path_html': '~/Documents/Wikis/Personal/html/',
      \ 'template_path': '~/Documents/Wikis/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default',
      \ 'nested_syntaxes': {'python': 'python', 'r': 'r', 'lua':'lua'}},
      \ {'path': '~/Documents/Wikis/Machine\ Learning',
      \ 'path_html': '~/Documents/Wikis/Machine\ Learning/html/',
      \ 'template_path': '~/Documents/Wikis/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default',
      \ 'nested_syntaxes': {'python': 'python', 'r': 'r'}},
      \ {'path': '~/Documents/Wikis/Coding',
      \ 'path_html': '~/Documents/Wikis/Coding/html/',
      \ 'template_path': '~/Documents/Wikis/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default',
      \ 'nested_syntaxes': {'python': 'python', 'r': 'r'}},
      \ {'path': '~/Documents/Wikis/Statistics',
      \ 'path_html': '~/Documents/Wikis/Statistics/html/',
      \ 'template_path': '~/Documents/Wikis/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default',
      \ 'nested_syntaxes': {'python': 'python', 'r': 'r'}},
      \ {'path': '~/Documents/Wikis/Marketing',
      \ 'path_html': '~/Documents/Wikis/Marketing/html/',
      \ 'template_path': '~/Documents/Wikis/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default',
      \ 'nested_syntaxes': {'python': 'python', 'r': 'r'}},
      \ {'path': '~/Documents/Wikis/Finance',
      \ 'path_html': '~/Documents/Wikis/Finance/html/',
      \ 'template_path': '~/Documents/Wikis/templates/',
      \ 'template_ext': '.html',
      \ 'template_default': 'default',
      \ 'nested_syntaxes': {'python': 'python', 'r': 'r'}}]
let g:vimwiki_key_mappings = {
      \ 'table_mappings': 0
      \}
