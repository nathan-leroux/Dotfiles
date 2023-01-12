" Vim config file

"     #####  Indentation Options  #####

" same indentation as previous lines, according to filetype
set autoindent

" make shifting consistantly 4 spaces
set shiftround
set shiftwidth=4

" expand tabs to spaces
set expandtab

" insert 'tabstop' spaces when tab is pressed
set smarttab
set tabstop=4

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
set foldmethod=indent

"     #####  Misc Options  #####

" re-read files if modified somewhere else
set autoread

" double check when closing unsaved file
set confirm

" spell check
" set spell

