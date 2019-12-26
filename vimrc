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

call plug#begin('~/.vim/plugged')
""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""
" plugins
Plug 'andymass/vim-matchup'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'jamessan/vim-gnupg'
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'vim-syntastic/syntastic'
"Plug 'rust-lang/rust.vim'
"Plug 'racer-rust/vim-racer'
" Rust
Plug 'rust-lang/rust.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" /Rust
" Black (Python PEP8)
" Plug 'ambv/black'
" Prettier (javascript)
Plug 'prettier/vim-prettier'
"  \ 'do': 'npm install',
"  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html', 'jsx', 'tsx'] }
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

" For Rust RLS
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

