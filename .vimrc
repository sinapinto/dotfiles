filetype plugin indent on
syntax on
let mapleader = "\<space>"
let maplocalleader = ','

call plug#begin('~/.vim/plugged')
Plug 'bronson/vim-visual-star-search'
Plug 'haya14busa/incsearch.vim'
  let g:incsearch#is_stay = 1
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)
  map n  <Plug>(incsearch-nohl-n)zz
  map N  <Plug>(incsearch-nohl-N)zz
  map *  <Plug>(incsearch-nohl-*)
  map #  <Plug>(incsearch-nohl-#)
  map g* <Plug>(incsearch-nohl-g*)
  map g# <Plug>(incsearch-nohl-g#)

Plug 'w0rp/ale'
  let g:ale_open_list = 0
  let g:ale_linter_aliases = { 'sugarss': ['css'] }
  let g:ale_lint_on_text_changed = "never"
  let g:ale_lint_on_enter = 0

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
  nnoremap <leader>gs :Gstatus<CR><C-w>10+

Plug 'moll/vim-node'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
  let g:javascript_plugin_flow = 1

Plug 'mxw/vim-jsx'
  let g:jsx_ext_required = 0

Plug 'digitaltoad/vim-pug'
Plug 'jeetsukumaran/vim-filebeagle'
  let g:filebeagle_show_hidden = 1
  if argc() == 0
    au VimEnter * FileBeagle
  endif

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
  Plug 'junegunn/fzf.vim'
  nnoremap <Leader>a :Ag<space>
  xnoremap <leader>a "sy:Ag <C-R>s
  nnoremap <silent> <leader>A <Esc>:exe('Ag '.expand('<cword>'))<CR>
  nnoremap <silent> <Leader>p <Esc>:Files<CR>
  nnoremap <silent> <Leader>b <Esc>:Buffers<CR>
  nnoremap <silent> <Leader>gl <Esc>:Commits<CR>
  nnoremap <silent> <Leader>gL <Esc>:BCommits<CR>
  let g:fzf_action = {
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-s': 'split',
        \ 'ctrl-l': 'vsplit' }
  let g:fzf_layout = { 'down': '~50%' }

Plug 'junegunn/vim-easy-align'
  vmap <Enter> <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)

Plug 'morhetz/gruvbox'
  let g:gruvbox_invert_selection = 0

Plug 'Shougo/neocomplete.vim'
  let g:acp_enableAtStartup = 0
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#max_list = 10
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#sources#syntax#min_keyword_length = 2
  let g:neocomplete#auto_completion_start_length = 2
  let g:neocomplete#keyword_patterns = {}
  inoremap <expr><Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

Plug 'Shougo/neosnippet.vim'
  imap <C-k> <Plug>(neosnippet_expand_or_jump)
  smap <C-k> <Plug>(neosnippet_expand_or_jump)
  xmap <C-k> <Plug>(neosnippet_expand_target)
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  let g:neosnippet#disable_runtime_snippets = { '_' : 1 }
  let g:neosnippet#snippets_directory='~/.vim/snippets/'

call plug#end()

noremap H ^
noremap L $
noremap <tab> %
noremap ( H
noremap ) L

nnoremap ; :
nnoremap : ;
nnoremap ' ;
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
nnoremap gp `[V`]=
nnoremap <c-n> <c-f>
nnoremap <c-p> <c-b>
nnoremap <c-h> <C-w><c-h>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-k> <c-w><C-k>
nnoremap <c-j> <c-w><c-j>
nnoremap <silent> <leader><return> :nohl<cr>

cnoremap <c-p> <up>
cnoremap <c-n> <down>
cnoremap <c-u> <c-e><c-u>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-h> <left>
cnoremap <c-l> <right>
cnoremap <c-j> <S-left>
cnoremap <c-k> <S-right>

vnoremap ; :
vnoremap <leader>s :s///g<left><left>

set nocompatible
set encoding=utf-8
set mouse=a
if &term =~ '^screen'
  set ttymouse=xterm2
endif
set pastetoggle=<F8>
set scrolloff=5
set noswapfile nowritebackup nobackup
set undofile undodir=~/.vim/undo
set wildmenu
set modeline
set splitright splitbelow
set hidden
set hlsearch incsearch
set ignorecase smartcase
set nostartofline
set confirm
set visualbell t_vb=
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab autoindent
set number
set laststatus=2
set timeout ttm=0
set t_Co=256 background=dark
set wildignore=*.o,.git,*.png,*.jpe?g,*.gif

iabbrev functino function
iabbrev reutrn return

augroup ft
  autocmd!
  autocmd FileType *         setlocal formatoptions-=cro
  autocmd Filetype *         if getfsize(@%) > 1000000 | setlocal syntax=off | endif
  autocmd FileType gitcommit setlocal formatoptions+=tl tw=72 cc=72 syntax=on
  autocmd FileType markdown  setlocal formatoptions+=tl tw=80
  autocmd FileType css       setlocal syntax=less
augroup end

colorscheme gruvbox
