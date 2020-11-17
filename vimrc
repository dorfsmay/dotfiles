""""""""""""""""""""""""""""""""""""""
" to install all plugins:
"     vim +PlugInstall +qall
"
" to clean old plugin, remove from .vimrc +
"     vim +PlugClean
"
" Both commands can be run from : prompt inside vim.
"
set nocompatible
filetype off

" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ALE
let g:ale_completion_enabled = 1
let g:ale_linters = {'rust': ['analyzer', 'cargo']}
let g:ale_fixers = {
    \'rust': ['rustfmt'],
    \'javascript': ['prettier'],
    \'json': ['prettier'],
    \'typescript': ['prettier'],
    \'css': ['prettier'],
    \'scss': ['prettier'],
    \'markdown': ['prettier'],
\}
let g:ale_rust_cargo_use_clippy = 1
" ale_cursor_detail opens a window with more details on error/suggestions
" let g:ale_cursor_detail = 1
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_check_examples = 1
" /ALE

call plug#begin('~/.vim/plugged')
""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""
" plugins
Plug 'andymass/vim-matchup'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'jamessan/vim-gnupg'
" Typescript, tsx
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
"
Plug 'maxmellon/vim-jsx-pretty'
""Plug 'vim-syntastic/syntastic'
" Black (Python PEP8)
" Plug 'ambv/black'
Plug 'dense-analysis/ale'
" Prettier (js, ts, json, html, css...)
Plug 'prettier/vim-prettier'
""""""""""""""""""""""""""""""""""""""
call plug#end()
filetype plugin on
filetype plugin indent on

"nmap <c-a> :%! rustfmt <enter> <enter>
nmap <silent> <Leader>f <Plug>(ale_fix)
nmap <silent> <Leader>l <Plug>(ale_lint)
nmap <silent> <Leader>w <Plug>(ale_detail)
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)
nmap <silent> <Leader>d <Plug>(ale_go_to_definition)
nmap <silent> <Leader>r <Plug>(ale_find_references)

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


" tabs
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
"IF TAB NEEDE USE EITHER
" :set noexpandtab
" ctrl-V tab

" indent same as previous line
set autoindent
set smartindent

" show tabs and spaces at eol
set list
set listchars=tab:⇥·,trail:␣

" So .rs files are detected as rust and not hercules
au BufRead,BufNewFile *.rs set filetype=rust

