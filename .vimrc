set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'mh21/errormarker.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-endwise'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"colorscheme
syntax on

"Number
colorscheme ron

"Errormarker
let g:errormarker_errortext='!!'
let g:errormarker_warningtext='??'
let g:errormarker_errorgroup='Error'
let g:errormarker_warninggroup='Warn'

"indent
set list listchars=tab:>-,trail:_
set autoindent
set cindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"indentGuide
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level=2
hi IndentGuidesOdd guibg=red ctermbg=52
hi IndentGuidesEven guibg=green ctermbg=22
set sw=4 
let g:indent_guides_color_change_percent = 10
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

"autoformat
noremap <F3> :Autoformat<CR>
au BufWritePre *.hs,*.tex,*.c,*.cpp,*.hpp,*.html,*.css,*.h,*.js,*.py,*.rb :Autoformat | w

"cancelAutoComment
set formatoptions-=cro

"autoFold
set foldmethod=syntax
set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1

"Show which keys are pressed
set showcmd

"highlight
set hlsearch

"For preventing bugs of make
cnoreabbrev make make!

"Scroll
set scrolloff=5

"About searching
set ignorecase  " A and a is the same
set smartcase   " If the sentence to search contains UPPER, then no-ignorecase.
set wrapscan    " Automatically go to the head of the file when searching.
set incsearch   " Automatically start to search when typing the word to search.


"Auto load when editing file is changed
set autoread
"Autocomplete of command line
set wildmode=list:longest


"Endless Moving
set whichwrap=h,l,<,>,[,],b

