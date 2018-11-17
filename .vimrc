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
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'szw/vim-tags'
Plugin 'dag/vim2hs'
Plugin 'kana/vim-filetype-haskell'
Plugin 'vim-syntastic/syntastic'
Plugin 'morhetz/gruvbox'
Plugin 'vim-latex/vim-latex'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on
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

"Colorchange
syntax on
set termguicolors
colorscheme gruvbox

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
let g:hindent_indent_size=4

"indentGuide
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level=2
hi IndentGuidesOdd guibg=red ctermbg=54
hi IndentGuidesEven guibg=green ctermbg=24
set sw=4 
autocmd BufNewFile,BufRead *.rb setlocal sw=2
let g:indent_guides_color_change_percent = 10
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

"autoComplete
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", '\zs')
        exec "imap ".k." ".k."<C-N><C-P>"
endfor
au BufNewFile,BufRead *.c,*.cpp let g:vim_tags_project_tags_command="ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q"
set tags+=~/.vim/tags/cpp
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
au CursorMovedI,InsertLeave * if pumvisible()==0|silent! pclose|endif
noremap <F12> :TagsGenerate

"autoformat
noremap <F3> :Autoformat<CR>
au BufWritePre *.tex,*.c,*.cpp,*.hpp,*.html,*.css,*.h,*.js,*.py,*.rb :Autoformat | w
au BufWritePre *.c,*.cpp :TagsGenerate

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

"--- Search ---

set ignorecase  " A and a is the same
set smartcase   " If the sentence to search contains UPPER, then no-ignorecase.
set wrapscan    " Automatically go to the head of the file when searching.
set incsearch   " Automatically start to search when typing the word to search.
set gdefault    " Always add "g" s/foo/bar/g <---


"Auto load when editing file is changed
set autoread

"Autocomplete of command line
set wildmode=list:longest

"--- Moving ---

"Endless Moving
set whichwrap=h,l,<,>,[,],b

"Move by display row
noremap j gj
noremap k gk

"--- For programming ---

"General
set pumheight=10
set laststatus=2

"For C
autocmd BufNewFile,BufRead *.c,*.h,*.cpp inoremap {<CR> {<CR>}<Esc>O
autocmd BufNewFile,BufRead *.c,*.h,*.cpp inoremap {;<CR> {<CR>};<Esc>O

"For Ruby
autocmd BufNewFile,BufRead *.rb setlocal tabstop=2
autocmd BufNewFile,BufRead *.rb setlocal softtabstop=2
autocmd BufNewFile,BufRead *.rb setlocal shiftwidth=2

"For LaTeX
let g:tex_flavor='latex'
let g:Tex_CompileRule_dvi='platex $*.tex'
let g:Tex_MultipleCompileFormats='dvi,pdf'
let g:Tex_FormatDependency_pdf='dvi,pdf'
let g:Tex_CompileRule_pdf='dvipdfmx -interaction=nonstopmode $*.dvi'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='mupdf'
