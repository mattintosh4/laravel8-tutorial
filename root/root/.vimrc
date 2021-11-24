syntax on
set expandtab
set hlsearch
set modeline
set shiftwidth=4
set softtabstop=4
set tabstop=4
augroup FileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.rb         setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.yml,*.yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
