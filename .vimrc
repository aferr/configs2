" pathogen
execute pathogen#infect()

syntax on
filetype plugin indent on
set nocompatible
set ruler
set showcmd
set incsearch
set showmatch
set hlsearch
set smartcase
set autoindent

" text wrapping
" autocmd FileType text setlocal textwidth=78
set textwidth=79
set formatoptions=c,q,r,t,w
"set nowrap
set wrap

" tabulation
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" Mac needs this for deleting stuff
set backspace=indent,eol,start


set number
set modeline
set ls=2


" color scheme
" let g:solarized_termtrans=1
" let g:solarized_termcolors=256
let g:solarized_termcolors=16
set background=dark
" let g:solarized_contrast = "high"
colorscheme solarized 

" disable bell
set vb t_vb=

" Plug
"
call plug#begin()
"Languages / File Types
Plug 'mlr-msft/vim-loves-dafny', {'for': 'dafny'} 
Plug 'https://github.com/mtikekar/vim-bsv.git'
Plug 'dylon/vim-antlr'
Plug 'https://github.com/derekwyatt/vim-scala.git'
Plug 'FStarLang/VimFStar', {'for': 'fstar'}
" Display extra info
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'https://github.com/scrooloose/syntastic.git'
" Git / Version Control
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'gregsexton/gitv'
" Navigation / Searching
Plug 'scrooloose/nerdtree'
Plug 'https://github.com/Shougo/unite.vim.git'
Plug 'https://github.com/mileszs/ack.vim.git'
" Other
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'altercation/vim-colors-solarized'
Plug 'jlanzarotta/bufexplorer'
Plug 'wolfgangmehner/perl-support'
" Coq
" Plug 'the-lambda-church/coquille', { 'branch' : 'pathogen-bundle' } "ide
" This is the regular vim version:
" Plug 'https://gitlab.inria.fr/jlepille/coquille.git', { 'branch' : 'pathogen-bundle' }
Plug 'let-def/vimbufsync' "dep for coquille
Plug 'vim-scripts/coq-syntax' "syntax highlight
Plug 'vim-scripts/Coq-indent' "indentation
" Plug 'vim-scripts/CoqIde' "an alternative to 

" ==== These are for neovim. Some day re-write this for better compatibility
" This is the neovim version
Plug 'https://framagit.org/tyreunom/coquille.git'
" Dialog boxes suggesting words
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" -----------------------------------------------------------------------------
" Syntax Highlighting for Weird Languages
" -----------------------------------------------------------------------------
au BufReadPost *.sdfy set filetype=dafny
au BufReadPost *.vad set filetype=vale
au BufReadPost *.jif set filetype=java
au BufRead,BufNewFile *.g set filetype=antlr3
au BufRead,BufNewFile *.g4 set filetype=antlr4

if has('win32')
  " Avoid mswin.vim making Ctrl-v act as paste
  noremap <C-V> <C-V>
endif

" ConEmu
if !empty($CONEMUBUILD)
    echom "Running in conemu"
    set termencoding=utf8
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    " termcap codes for cursor shape changes on entry and exit to
    " /from insert mode
    " doesn't work
    "let &t_ti="\e[1 q"
    "let &t_SI="\e[5 q"
    "let &t_EI="\e[1 q"
    "let &t_te="\e[0 q"
endif

" Powerline fonts for airline
let g:airline_powerline_fonts=1
let g:airline_whitespace_disabled=1
let g:airline_theme='solarized'
" let g:airline_theme='kalisi'

" NERDTree
:command NE NERDTree "shortcut
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2

" Deoplete autocompletion
let g:deoplete#enable_at_startup = 1
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Coq IDE key bindings
if !has('nvim')
    :nnoremap <C-h> :CoqToCursor<CR>
    :nnoremap <C-j> :CoqNext<CR>
    :nnoremap <C-K> :CoqUndo<CR>
    :nnoremap <C-L> :CoqLaunch<CR>
else
    :nnoremap <C-H> :call CoqToCursor()<CR>
    :nnoremap <C-J> :call CoqNext()<CR>
    :nnoremap <C-K> :call CoqUndo()<CR>
    :nnoremap <C-L> :call CoqLaunch()<CR>
endif

" Coq IDE key bindings
let CoqIDE_coqtop = "/usr/local/bin/coqtop.opt"
au BufRead,BufNewFile *.sv set filetype=coq
