set nocompatible
filetype plugin on

let maplocalleader="\<space>"

" Code Highlighting
syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
"set smartindent
set nu
set smartcase
set noswapfile
set nobackup
set incsearch

" XML Formatting
au FileType xml setlocal equalprg=xmllint\ --encode\ utf8\ --format\ --recover\ -\ 2>/dev/null


augroup vimrc-incsearch-highlight
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd CmdlineLeave /,\? :set nohlsearch
augroup END
