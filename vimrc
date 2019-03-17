""""""""""""""""""""""""""""""""""""""
" to install all plugins:
"     vim +PlugInstall +qall
set nocompatible
filetype off
call plug#begin('~/.vim/plugged')
""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""
" plugins
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'jamessan/vim-gnupg'
Plug 'vim-syntastic/syntastic'
Plug 'rust-lang/rust.vim'
"Plugin 'idris-hackers/idris-vim'
Plug 'racer-rust/vim-racer'
" Black (Python PEP8)
" Plug 'ambv/black'
" Prettier (javascript)
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
""""""""""""""""""""""""""""""""""""""
call plug#end()
filetype plugin on
filetype plugin indent on

let g:racer_experimental_completer = 1

" run rustfmt on save
"let g:rustfmt_autosave = 1
nmap <c-a> :%! rustfmt <enter> <enter>
smap <c-a> :%! rustfmt <enter> <enter>

" folding
set foldmethod=indent
set foldlevel=99

" line numbers
set nu

" status line
set statusline=
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor
set ls=2                                " alwways show status line

" ignorecase when searching
set ignorecase smartcase
" highlight searches
set hlsearch

" show matching brackets
set showmatch

" syntax highlighting
syntax enable

" no backup, thank you.
set nobackup


" tabs, 4 spaces
set smarttab
set shiftwidth=4
set tabstop=4
set expandtab

" indent same as previous line
set autoindent
" indent based on syntax
set smartindent


