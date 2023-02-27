" vimtime todo list
"   commenting functions into vim motions
"   install syntax highlighting
"   writeout on unfocus
"   case insensitive searching
"   consider switch to gvim
"   cleanup menu bar
"
" Vim config file
"     #####  Plugin Setup  #####
set nocompatible
filetype plugin on

" set runtime path to include vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'           "required
Plugin 'nathanaelkane/vim-indent-guides'"indent lines
"Plugin 'thaerkh/vim-indentguides'
Plugin 'scrooloose/Syntastic'           "syntax highlighting
Plugin 'valloric/youcompleteme'         "completion engine
Plugin 'scrooloose/nerdcommenter'       "commenting functions
Plugin 'vim-airline/vim-airline'        "clean af menu bar
Plugin 'honza/vim-snippets'             "snippets library
Plugin 'sirver/ultisnips'               "snippets engine

call vundle#end()
filetype plugin indent on



"     #####  Comment Options  #####
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1



"     #####  Save On Unfocus  #####
" (doesn't currently work)
:au FocusLost * silent! wa



"     #####  Indentation Options  #####
" same indentation as previous lines, according to filetype
set autoindent

" tabs to spaces
set shiftround
set tabstop=4
set shiftwidth=4
set expandtab

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=7
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=8

" config for indent guides (vim-indent-guides)
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
"let g:indent_guides_color_change_percent  = 100
let g:indent_guides_guide_size  =  1
let g:indent_guides_exculde_filetypes = ['text']

" config fore indent guides (vim-indentguides)
let g:indentguides_ignorelist = ['text']



"     #####  Syntax Checking Options  #####
" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



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

