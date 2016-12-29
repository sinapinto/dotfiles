filetype plugin indent on
syntax on
let mapleader = "\<space>"
let maplocalleader = ','

" {{{ plugins
call plug#begin('~/.vim/plugged')
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive' " {{{
  nnoremap <leader>gs :Gstatus<CR><C-w>10+

" }}}

Plug 'sukima/xmledit'
let g:xmledit_enable_html = 1

Plug 'fatih/vim-go'
let g:go_fmt_command = "goimports"

" {{{ javascript
Plug 'moll/vim-node'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
" Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mxw/vim-jsx'
  let g:jsx_ext_required = 0
Plug 'heavenshell/vim-jsdoc'
  let g:jsdoc_enable_es6 = 1
  let g:jsdoc_allow_input_prompt = 1
  let g:jsdoc_input_description = 1
  nnoremap <leader>c :JsDoc<CR>
" }}}

Plug 'jeetsukumaran/vim-filebeagle' " {{{
let g:filebeagle_show_hidden = 1
if argc() == 0
  au VimEnter * FileBeagle
endif
" }}}

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' } " {{{
  Plug 'junegunn/fzf.vim'
  nnoremap <Leader>a :Ag 
  xnoremap <leader>a "sy:Ag <C-R>s
  nnoremap <silent> <Leader>p <Esc>:Files<CR>
  nnoremap <silent> <Leader>[ <Esc>:History<CR>
  nnoremap <silent> <Leader>b <Esc>:Buffers<CR>
  nnoremap <silent> <Leader>gl <Esc>:Commits<CR>
  let g:fzf_action = {
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-s': 'split',
        \ 'ctrl-l': 'vsplit' }
  let g:fzf_layout = { 'down': '~50%' }
" }}}

Plug 'junegunn/vim-easy-align' " {{{
  vmap <Enter> <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
" }}}

Plug 'morhetz/gruvbox' " {{{
  let g:gruvbox_invert_selection = 0
" }}}

Plug 'scrooloose/syntastic' " {{{
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_enable_highlighting = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_javascript_checkers = ['eslint']
" }}}

Plug 'Shougo/neocomplete.vim' " {{{
  let g:acp_enableAtStartup = 0
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#max_list = 10
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#sources#syntax#min_keyword_length = 2
  let g:neocomplete#auto_completion_start_length = 2
  let g:neocomplete#keyword_patterns = {}
  inoremap <expr><Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" }}}

Plug 'Shougo/neosnippet.vim'
  imap <C-k>     <Plug>(neosnippet_expand_or_jump)
  smap <C-k>     <Plug>(neosnippet_expand_or_jump)
  xmap <C-k>     <Plug>(neosnippet_expand_target)
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  " disable default snippets
  let g:neosnippet#disable_runtime_snippets = { '_' : 1 }

  " Tell Neosnippet about the other snippets
  let g:neosnippet#snippets_directory='~/.vim/snippets/'
  " }}}

call plug#end()
" }}}

" {{{ remaps
noremap H ^
noremap L $
noremap <tab> %
noremap ( H
noremap ) L

nnoremap ; :
nnoremap : ;
nnoremap ' ;
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap j gj
nnoremap k gk
nnoremap Q <nop>
nnoremap <leader>s :%s///g<left><left>
nnoremap <leader>j :bn<cr>
nnoremap <leader>k :bp<cr>
nnoremap <leader>l gt
nnoremap <leader>h gT
nnoremap <leader>d :bdelete<cr>
nnoremap <leader>t :tabe<cr>
nnoremap <leader>o :b#<cr>
nnoremap <leader>= me=ap`e
nnoremap <leader>v :vertical wincmd f<CR>
nnoremap gp `[V`]=
nnoremap <c-n> <c-f>
nnoremap <c-p> <c-b>
nnoremap <c-h> <C-w><c-h>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-k> <c-w><C-k>
nnoremap <c-j> <c-w><c-j>
nnoremap <silent> <leader><return> :nohl<cr>
nnoremap <leader>! :SudoWrite<cr>
nnoremap <leader>e :e ~/.vimrc<cr>
nnoremap <leader>r :source ~/.vimrc<cr>
nnoremap <F9> :w<CR>:!gcc % -o %< && %:p:r <CR>
nnoremap <F4> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

cnoremap <c-p> <up>
cnoremap <c-n> <down>
cnoremap <c-u> <c-e><c-u>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-h> <left>
cnoremap <c-l> <right>
cnoremap <c-j> <S-left>
cnoremap <c-k> <S-right>

" inoremap <c-j> <S-left>
" inoremap <c-k> <S-right>
" inoremap <c-h> <left>
" inoremap <c-l> <right>
inoremap <c-e> <esc>A
inoremap <c-u> <esc>mzgUiw`za

vnoremap ; :
vnoremap <leader>r y:@"<cr>
vnoremap <leader>R :!sort<cr>
vnoremap <leader>s :s/
vnoremap // y/<c-r>"<cr>" }}}
" }}}

" {{{ settings
set nocompatible
set mouse=a
if &term =~ '^screen'
  set ttymouse=xterm2
endif
set autoread
set autowrite
set pastetoggle=<F8>
set scrolloff=7
set noswapfile
set nowritebackup
set nobackup
set undofile
set undodir=~/.vim/undo
set virtualedit=block
set encoding=utf-8
set wildmenu
set modeline
set lbr
set sbr=>
set splitright
set incsearch
set splitbelow
set hidden
set hlsearch
set ignorecase
set smartcase
set nostartofline
set confirm
set visualbell
set t_vb=
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set cc=
set number
set nocursorline
set laststatus=0
set ls=2
set timeout ttm=0
" set list listchars=tab:\›\ ,trail:·
set wildignore=*.o,.git,*.png,*.jpg,*.jpeg,*.gif
set t_Co=256
set background=dark
set nofoldenable
" }}}

" {{{ autocmds
augroup ft
  au!
  au FileType *              setlocal formatoptions-=cro
  au FileType make           setlocal ts=4 sw=4 ai noet
  au FileType go             setlocal ts=4 sw=4 ai noet
  au FileType sh             setlocal ts=4 sw=4 ai et
  au FileType gitcommit      setlocal textwidth=72 formatoptions+=tl
  au FileType markdown       setlocal textwidth=80 formatoptions+=tl
  au FileType c              setlocal cino=:0,(0 ")
  au FileType css            setlocal syntax=less
augroup END
" }}}

" {{{ colors
colorscheme gruvbox

hi SyntasticError   cterm=underline ctermfg=9  ctermbg=52
hi SyntasticWarning cterm=bold      ctermfg=11 ctermbg=58
" hi jsDocType                        ctermfg=8
" hi jsDocTags                        ctermfg=8
" hi jsOperator                       ctermfg=14
" }}}
