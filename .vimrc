" Vim config file
"     #####  Plugin Setup  #####
set nocompatible
filetype off

" set runtime path to include vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'           "required
Plugin 'nathanaelkane/vim-indent-guides'"indent lines
Plugin 'scrooloose/Syntastic'           "syntax highlighting
Plugin 'valloric/youcompleteme'         "completion engine
Plugin 'scrooloose/nerdcommenter'       "commenting functions
Plugin 'vim-airline/vim-airline'        "clean af menu bar
Plugin 'honza/vim-snippets'             "snippets library
Plugin 'sirver/ultisnips'               "snippets engine

call vundle#end()
filetype plugin indent on

"     #####  Indentation Options  #####

" same indentation as previous lines, according to filetype
set autoindent

" tabs to spaces
set shiftround
set tabstop=4
set shiftwidth=4
set expandtab

" config for indent guides (vim-indent-guides)
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=8

"     #####  Completion Options  #####

" triggers to use snippets
let g:UltiSnipsExpandTrigger="<space>"
let g:UltiSnipsJumpForwardTrigger="<S-j>"
let g:UltiSnipsJumpBackwardTrigger="<S-k>"

"     #####  Search Options  #####

" highlight searchs
set hlsearch

" only case sensitive when cap letter included
set smartcase


"     #####  Text Rendering Options  #####

" encode using unicode
set encoding=utf-8

" wrap lines
set wrap
set linebreak

" keep cursor away from screen boundaries
set scrolloff=5
set sidescrolloff=5

" highlight bad syntax
syntax enable

"     ######  UI Options  #####

" show status bar
" set laststatus=2

" show cursor position and line
set ruler
" set cursorline

" show command completions as a menu
set wildmenu

" pick colourscheme
" set colorscheme <scheme>

" show linenumbers
set number
set relativenumber

" set title for WM
set title

"     #####  Folding Options  #####

" fold based on indents
"set foldmethod=indent

"     #####  Misc Options  #####

" re-read files if modified somewhere else
set autoread

" double check when closing unsaved file
set confirm

" spell check
" set spell

