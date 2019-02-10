scriptencoding utf-8
"vim-plug{{{
"vim-plug auto install{{{
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"}}}
call plug#begin('~/.vim/plugged')
Plug 'Chiel92/vim-autoformat'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-endwise'
Plug 'dag/vim2hs'
Plug 'kana/vim-filetype-haskell'
Plug 'vim-syntastic/syntastic'
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'noahfrederick/vim-noctu'
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
Plug 'vim-airline/vim-airline-themes'
Plug 'KeitaNakamura/tex-conceal.vim', {'for':'tex'}
Plug 'zah/nim.vim'

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

let g:deoplete#enable_at_startup = 1
"For deoplete{{{
Plug 'eagletmt/neco-ghc'
Plug 'zchee/deoplete-jedi'
Plug 'c9s/perlomni.vim'
Plug 'Shougo/deoplete-clangx'
Plug 'Shougo/neco-syntax'
Plug 'takkii/Bignyanco'
"}}}
"For neosnippet{{{
Plug 'Shougo/neosnippet.vim'
"}}}

call plug#end()
"}}}
"Display"{{{

"Colorchange
let g:hybrid_custom_term_colors=1
let g:hybrid_reduced_contrast=1
set t_Co=16
syntax on
set background=dark

set display=lastline
colorscheme noctu
set number

let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_theme='light'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = 'Ξ'
let g:airline_symbols.maxlinenr = ''

"Show which keys are pressed
set showcmd

"Move the pair parenthesis when entering ( or ).
set showmatch
set matchtime=5

"Fold
set foldmethod=marker
set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1

"autoformat
filetype plugin indent on
noremap <F3> :Autoformat<CR>
autocmd BufWritePre *.pl,*.css,*.tex,*.c,*.cpp,*.hpp,*.html,*.css,*.h,*.js,*.py,*.rb :Autoformat

set pumheight=10
set laststatus=2

"Cursor position
nnoremap <Leader>c :<C-u>setlocal cursorline! cursorcolumn!<CR>

"Scroll
set scrolloff=5

let g:splash#path=$HOME.'/dotfiles/title.txt'

hi Folded ctermbg=none
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

let g:indent_guides_start_level=2
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

" inoremap ( ()<left>
" inoremap { {}<left>
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap [ []<left>
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

let g:neosnippet#enable_snipmate_compatibility=1
let g:neosnippet#snippets_directory='~/dotfiles/snippets/'
let g:neosnippet#disable_runtime_snippets = {
            \   '_' : 1,
            \ }

<<<<<<< HEAD
=======
let g:neosnippet#disable_runtime_snippets={'python':1,'ruby':1}
>>>>>>> 21264e5df6ab558e0f73f4ebc0dc4159ce1b888d
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

let g:filetype_to_ignore=['latex','plaintex','tex','text']

augroup about_make
    autocmd!
    autocmd BufNewFile,BufRead * if index(filetype_to_ignore,&ft)<0 | nnoremap \ll :w<CR>:make!<CR>
    autocmd BufNewFile,BufRead * if index(filetype_to_ignore,&ft)<0 | nnoremap \lv :w<CR>:make! run<CR>
augroup END

set autoread

"}}}
"Extension specific{{{
"Text{{{
augroup text_specific
    autocmd!
    autocmd Filetype text IndentGuidesDisable
augroup END
"}}}
"Perl{{{
let g:syntastic_enable_perl_checker = 1
"}}}
"C{{{
set cinwords+=case
let g:syntastic_c_checkers=['gcc','clang','cppcheck']
let g:syntastic_c_compiler_options='-W -Wall -Wconversion -lm -lncurses'
augroup c_specific
    autocmd!
    autocmd Filetype c inoremap {<CR> {<CR>}<Esc>O
    autocmd Filetype c inoremap {;<CR> {<CR>};<Esc>O
    autocmd Filetype c setlocal foldmethod=indent
augroup END
"}}}
"HTML{{{
augroup html_specific
    autocmd!
    autocmd Filetype html setlocal tabstop=2
    autocmd Filetype html setlocal softtabstop=2
    autocmd Filetype html setlocal shiftwidth=2
augroup END
"}}}
"Perl{{{
augroup perl_specific
    autocmd!
    autocmd Filetype perl setlocal equalprg=perltidy\ -st
augroup END
"}}}
"Ruby{{{
augroup ruby_specific
    autocmd!
    autocmd Filetype ruby setlocal tabstop=2
    autocmd Filetype ruby setlocal softtabstop=2
    autocmd Filetype ruby setlocal shiftwidth=2
augroup END
"}}}
"Haskell{{{
let g:haskellmode_completion_ghc=0
augroup haskell_specific
    autocmd!
    autocmd Filetype haskell setlocal tabstop=8
    autocmd Filetype haskell setlocal softtabstop=4
    autocmd Filetype haskell setlocal shiftwidth=4
    autocmd Filetype haskell setlocal shiftround
    autocmd Filetype haskell setlocal omnifunc=necoghc#omnifunc
augroup END
"}}}
"LaTeX{{{
let g:tex_flavor='latex'
let g:Tex_CompileRule_dvi='platex $*.tex'
let g:Tex_MultipleCompileFormats='dvi,pdf'
let g:Tex_FormatDependency_pdf='dvi,pdf'
let g:Tex_CompileRule_pdf='dvipdfmx -interaction=nonstopmode $*.dvi'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='evince'
let g:Tex_Env_table = "\\begin{table}[<+Hhtbp+>]\<CR>\\centering\<CR>\\caption{<++>}\<CR>\\begin{tabular}{<+lcr+>}\\toprule\<CR><++>\<CR>\\end{tabular}\<CR>\\end{table}<++>"
let g:Tex_Env_equation="\\begin{equation}\<CR><+contents+>\<CR>\\end{equation}<++>"
let g:Tex_Env_equ="\\begin{equation}\<CR><+contents+>\<CR>\\end{equation}<++>"
let g:Tex_Env_align="\\begin{align}\<CR><+contents+>\<CR>\\end{align}<++>"
let g:Tex_HotKeyMappings='align,table,equation'
set concealcursor=""
set conceallevel=2
let g:tex_conceal="abdmgs"
augroup tex_specific
    autocmd!
    autocmd BufNewFile,BufRead *.tex set iskeyword+=":."
    autocmd Filetype tex call IMAP('`M','\sum_{<++>}^{<++>}<++>','tex')
    autocmd Filetype tex call IMAP('((','{\left(<++>  \right)}<++>','tex')
    autocmd Filetype tex call IMAP('`J','\mathrm{<++>}<++>','tex')
    autocmd Filetype tex call IMAP('``','\partial','tex')
    autocmd Filetype tex call Tex_ViewLaTeX()
augroup END
"}}}
"Snippet{{{
augroup snippet_specific
    autocmd!
    autocmd BufNewFile,BufRead *.snip set noexpandtab
augroup END
"}}}
"}}}}}}
