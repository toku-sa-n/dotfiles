set encoding=utf-8
scriptencoding utf-8
"Plugins{{{
"vim-plug auto install{{{
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"}}}
call plug#begin('~/.vim/plugged')
"vim-autoformat{{{
Plug 'Chiel92/vim-autoformat'
autocmd FileType tex let b:autoformat_autoindent=0
"}}}
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-endwise'
Plug 'dag/vim2hs'
Plug 'kana/vim-filetype-haskell'
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'noahfrederick/vim-noctu'
Plug 'steffanc/cscopemaps.vim'
Plug 'thinca/vim-splash'
"vimtex{{{
Plug 'lervag/vimtex'

if empty(v:servername) && exists('*remote_startserver')
    call remote_startserver('VIM')
endif

let g:vimtex_view_method='zathura'
let g:vimtex_compiler_latexmk = {
            \ 'options':[
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \   '-pdfdvi',
            \ ],
            \}
let g:vimtex_compiler_latexmk_engines={'_':'-pdfdvi'}   " See: https://texwiki.texjp.org/?vimtex
let g:vimtex_fold_enabled=1
let g:vimtex_fold_manual=1
"}}}
"vim-gutentags{{{
"Auto tags file generator.
Plug 'ludovicchabant/vim-gutentags'

set statusline+=%{gutentags#statusline()}
"}}}
Plug 'tpope/vim-fugitive'   " Git wrapper
Plug 'airblade/vim-gitgutter'
Plug 'szw/vim-dict'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'    " line up
Plug 'adimit/prolog.vim'
Plug 'vim-jp/vim-vimlparser'
Plug 'syngan/vim-vimlint'
Plug 'vim-jp/vimdoc-ja'
Plug 'vim-scripts/OmniCppComplete'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'KeitaNakamura/tex-conceal.vim', {'for':'tex'}
Plug 'zah/nim.vim'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'chrisbra/Colorizer'
Plug 'nelstrom/vim-visual-star-search'
Plug 'mileszs/ack.vim'
Plug 'SirVer/ultisnips'
Plug 'kchmck/vim-coffee-script'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-repeat'
"ale{{{
Plug 'w0rp/ale'
let g:ale_set_loclist=0
let g:ale_set_quickfix=1
let g:ale_open_list=1
"}}}
"quickrun{{{
Plug 'thinca/vim-quickrun'
let g:quickrun_config={
            \"hook/output_encode/enable":1,
            \"hook/output_encode/encoding":"utf-8",
            \}
"}}}
Plug 'zxqfl/tabnine-vim'
"tagbar{{{
Plug 'majutsushi/tagbar'
set updatetime=0    " seemless syncking with tagbar.
nnoremap <F8> :TagbarToggle<CR>
"}}}
"vim-cheatsheet{{{
Plug 'reireias/vim-cheatsheet'
let g:cheatsheet#cheat_file='$HOME/dotfiles/.cheatsheet.md'
"}}}
call plug#end()

packadd! matchit
"}}}
"Display"{{{

"Colorchange
let g:hybrid_custom_term_colors=1
let g:hybrid_reduced_contrast=1
set t_Co=16
syntax on
set background=dark

set display=lastline
colorscheme default
set number

let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_theme='jellybeans'
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
autocmd BufWritePre *.hs,*.java,*.css,*.tex,*.c,*.cpp,*.hpp,*.html,*.css,*.h,*.js,*.py,*.rb :Autoformat

set pumheight=10
set laststatus=2

"Cursor position
nnoremap <Leader>c :<C-u>setlocal cursorline! cursorcolumn!<CR>

"Scroll
set scrolloff=5

let g:splash#path=$HOME.'/dotfiles/title.txt'

"Colorize
let g:colorizer_colornames=0

hi Folded ctermbg=none
"}}}
"Snippet{{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME.'/dotfiles/snippets']
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
set completeopt=menuone,menu,longest,preview
set complete+=U,k,d,]
set infercase

"}}}
" Search and Grep{{{

set ignorecase  " A and a is the same
set smartcase   " If the sentence to search contains UPPER, then no-ignorecase.
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

set shortmess-=S    " To show the number of matched words.
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
"}}}
"Moving{{{

"Endless Moving
set whichwrap=h,l,<,>,[,],b

"Move by display row
noremap j gj
noremap k gk

"}}}
"Shortcut{{{
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap Y y$
nnoremap gO O<Esc>
nnoremap go o<Esc>

"For preventing from creating a new Buffer of make
cnoreabbrev make make!

let g:filetype_to_ignore=['latex','plaintex','tex','text']

augroup about_make
    autocmd!
    autocmd BufNewFile,BufRead * if index(filetype_to_ignore,&ft)<0 | nnoremap \ll :up <Bar> make!<CR>
    autocmd BufNewFile,BufRead * if index(filetype_to_ignore,&ft)<0 | nnoremap \lv :up <Bar> make! run<CR>
augroup END

nnoremap <space>. :<C-u>execute 'tabnew '.escape(resolve(expand($MYVIMRC)),'\ ')<CR>    " Shortcut for vimrc. It may be good to add the shortcut ":source ~/.vimrc" when .vimrc are opened.
nnoremap <space><space> :<c-u>UltiSnipsEdit<CR>

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

nnoremap & :&&<CR>
xnoremap & :&&<CR>
"}}}
"Tests{{{
let g:test#strategy='dispatch'
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>L :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
"}}}
"Others{{{
"--- For files ---
set ignorecase

"--- Language ---
set helplang=ja,en

" cancelAutoComment
set formatoptions-=cro

set ttyfast

set history=200

set matchpairs+=「:」

if has('python3')
    set pyxversion=3
else
    set pyxversion=2
endif

" chomp each line
augroup chomp
    autocmd!
    autocmd BufWritePre * silent! exec "%s/ \\+$//g"
augroup END


set autoread

set mouse=a
"}}}
"Extension specific{{{
"Text{{{
augroup text_specific
    autocmd!
    autocmd Filetype text IndentGuidesDisable
    autocmd Filetype text setlocal textwidth=0 " No auto line break. See http://stst.hateblo.jp/entry/2014/07/14/010844.
augroup END
"}}}
"Perl{{{
"}}}
"C{{{
set cinwords+=case
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
"Coffeescript{{{
augroup coffeescript_specific
    autocmd!
    autocmd Filetype coffee setlocal tabstop=2
    autocmd Filetype coffee setlocal softtabstop=2
    autocmd Filetype coffee setlocal shiftwidth=2
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
augroup END
"}}}
"LaTeX{{{
set concealcursor=""
set conceallevel=2
let g:tex_flavor="latex"
let g:tex_conceal="abdmgs"
"}}}
"Snippet{{{
augroup snippet_specific
    autocmd!
    autocmd BufNewFile,BufRead *.snip set noexpandtab
augroup END
"}}}
"Assembly{{{
augroup assembly_specific
    autocmd!
    autocmd BufNewFile,BufRead *.asm set filetype=nasm
augroup END
"}}}
"}}}}}}
set fileencodings=utf-8,sjis
