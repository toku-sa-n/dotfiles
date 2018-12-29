scriptencoding utf-8
"vim-plug{{{

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'Chiel92/vim-autoformat'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-endwise'
Plug 'dag/vim2hs'
Plug 'kana/vim-filetype-haskell'
Plug 'vim-syntastic/syntastic'
Plug 'morhetz/gruvbox'
Plug 'steffanc/cscopemaps.vim'
Plug 'thinca/vim-splash'
Plug 'vim-latex/vim-latex'
Plug 'tpope/vim-fugitive'   " Git wrapper
Plug 'airblade/vim-gitgutter'
Plug 'szw/vim-dict'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'    " line up
Plug 'kana/vim-textobj-user'    "needed for vim-textobj-entire
Plug 'kana/vim-textobj-entire'  "ae for targeting the entire content of the current buffer.
Plug 'adimit/prolog.vim'
Plug 'vim-jp/vim-vimlparser'
Plug 'syngan/vim-vimlint'
Plug 'vim-jp/vimdoc-ja'
Plug 'vim-scripts/OmniCppComplete'
Plug 'vim-airline/vim-airline'
Plug 'KeitaNakamura/tex-conceal.vim', {'for':'tex'}
Plug 'eagletmt/neco-ghc'


if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'


call plug#end()
"}}}
"Display"{{{

"Colorchange
syntax on
set termguicolors
set background=dark

set display=lastline
colorscheme gruvbox
set number

"Show which keys are pressed
set showcmd

"Move the pair parenthesis when entering ( or ).
set showmatch
set matchtime=10

"Fold
set foldmethod=marker
set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1

"autoformat
filetype plugin indent on
noremap <F3> :Autoformat<CR>
au BufWritePre *.pl,*.css,*.tex,*.c,*.cpp,*.hpp,*.html,*.css,*.h,*.js,*.py,*.rb :Autoformat

set pumheight=10
set laststatus=2

"Scroll
set scrolloff=5

let g:splash#path=$HOME.'/dotfiles/title.txt'

highlight Normal NONE
highlight NonText NONE
highlight Folded NONE
highlight EndOfBuffer NONE
"}}}
"Syntastic{{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"}}}
"indent{{{
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
autocmd BufNewFile,BufRead *.txt  IndentGuidesDisable
"let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level=2
"highlight IndentGuidesOdd guibg=red ctermbg=54
"highlight IndentGuidesEven guibg=green ctermbg=24
let g:indent_guides_color_change_percent = 10
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
"}}}
"Completions{{{
set omnifunc=syntaxcomplete#Complete

set tags+=~/.vim/tags/cpp

map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extras=+q .<CR>

" OmniCppComplete
let g:OmniCpp_NamespaceSearch = 1
let g:OmniCpp_GlobalScopeSearch = 1
let g:OmniCpp_ShowAccess = 1
let g:OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let g:OmniCpp_MayCompleteDot = 1 " autocomplete after .
let g:OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let g:OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let g:OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
set complete+=U,k,d,]

"}}}
"Search{{{

set ignorecase  " A and a is the same
set smartcase   " If the sentence to search contains UPPER, then no-ignorecase.
set wrapscan    " Automatically go to the head of the file when searching.
set incsearch   " Automatically start to search when typing the word to search.
set gdefault    " Always add "g" s/foo/bar/g <---
set hlsearch
set smartcase   " If the word contains UPPER, then do not ignore UPPER and lower when searching.


"Auto load when editing file is changed
set autoread
set autowrite

"Autocomplete of command line
set wildmenu
set wildmode=list:longest

"Show the searched word at the center of the display.
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

nmap <silent> <Esc><Esc> :nohl<CR>
"}}}
"Moving{{{

"Endless Moving
set whichwrap=h,l,<,>,[,],b

"Move by display row
noremap j gj
noremap k gk

"}}}
"Shortcut{{{
inoremap jj <Esc>
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap Y y$
nnoremap gO O<Esc>
nnoremap go o<Esc>
"}}}
"vimrc{{{
nnoremap <space>. :<c-u>tabedit $MYVIMRC<CR>    " Shortcut for vimrc. It may be good to add the shortcut ":source ~/.vimrc" when .vimrc are opened.
"}}}
"NeoSnippet{{{
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
"}}}
"Others{{{
"--- For files ---
set ignorecase

"--- Language ---
set helplang=ja,en

"cancelAutoComment
set formatoptions-=cro
"For preventing to create a new Buffer of make
cnoreabbrev make make!

set ttyfast

set matchpairs+=「:」,<:>

if has('python3')
    set pyxversion=3
else
    set pyxversion=2
endif

"}}}
"For programming{{{
"C{{{
autocmd BufNewFile,BufRead *.c,*.h,*.cpp inoremap {<CR> {<CR>}<Esc>O
autocmd BufNewFile,BufRead *.c,*.h,*.cpp inoremap {;<CR> {<CR>};<Esc>O
set cinwords+=case
autocmd BufNewFile,BufRead *.c,*.h,*.cpp set foldmethod=indent
let g:syntastic_c_checkers=['gcc','clang','cppcheck']
"}}}
"HTML{{{
autocmd BufNewFile,BufRead *.html setlocal tabstop=2
autocmd BufNewFile,BufRead *.html setlocal softtabstop=2
autocmd BufNewFile,BufRead *.html setlocal shiftwidth=2
"}}}
"Perl{{{
autocmd Filetype perl setlocal equalprg=perltidy\ -st
"}}}
"Ruby{{{
autocmd BufNewFile,BufRead *.rb setlocal tabstop=2
autocmd BufNewFile,BufRead *.rb setlocal softtabstop=2
autocmd BufNewFile,BufRead *.rb setlocal shiftwidth=2
"}}}
"LaTeX{{{
let g:tex_flavor='latex'
let g:Tex_CompileRule_dvi='platex $*.tex'
let g:Tex_MultipleCompileFormats='dvi,pdf'
let g:Tex_FormatDependency_pdf='dvi,pdf'
let g:Tex_CompileRule_pdf='dvipdfmx -interaction=nonstopmode $*.dvi'
let g:Tex_DefaultTargetFormat='pdf'
autocmd BufNewFile,BufRead *.tex set iskeyword+=":."
let g:Tex_ViewRule_pdf='evince'
let g:Tex_Env_table = "\\begin{table}[<+Hhtbp+>]\<CR>\\centering\<CR>\\caption{<++>}\<CR>\\begin{tabular}{<+lcr+>}\\toprule\<CR><++>\<CR>\\end{tabular}\<CR>\\end{table}<++>"
let g:Tex_Env_equation="\\begin{equation}\<CR><+contents+>\<CR>\\end{equation}<++>"
let g:Tex_Env_equ="\\begin{equation}\<CR><+contents+>\<CR>\\end{equation}<++>"
let g:Tex_Env_align="\\begin{align}\<CR><+contents+>\<CR>\\end{align}<++>"
let g:Tex_HotKeyMappings='align,table,equation'
autocmd BufNewFile,BufRead *.tex call IMAP('`M','\sum_{<++>}^{<++>}<++>','tex')
autocmd BufNewFile,BufRead *.tex call IMAP('((','{\left(<++>  \right)}<++>','tex')
autocmd BufNewFile,BufRead *.tex call IMAP('`J','\mathrm{<++>}<++>','tex')
autocmd BufNewFile,BufRead *.tex call IMAP('``','\partial','tex')
autocmd BufRead *.tex call Tex_ViewLaTeX()
set concealcursor=""
set conceallevel=2
let g:tex_conceal="abdmgs"
"}}}}}}
