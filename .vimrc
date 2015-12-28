filetype plugin indent on
syntax on
let mapleader = "\<space>"
let maplocalleader = ','

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
nnoremap <Leader>a :Ag 
xnoremap <leader>a "sy:Ag <C-R>s
nnoremap <silent> <Leader>p <Esc>:FZF<CR>
nnoremap <silent> <Leader>b <Esc>:Buffers<CR>
nnoremap <silent> <Leader>/ <Esc>:History<CR>
nnoremap <silent> <Leader>gl <Esc>:Commits<CR>

Plug 'junegunn/vim-easy-align'
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

Plug 'tpope/vim-fugitive'
nnoremap <leader>gs :Gstatus<CR>

Plug 'morhetz/gruvbox'
let g:gruvbox_invert_selection = 0

Plug 'lervag/vimtex'
let g:vimtex_motion_matchparen = 0
let g:vimtex_motion_enabled = 0
let g:vimtex_fold_enabled = 0
let g:vimtex_view_method = 'mupdf'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

Plug 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ignore_files = ['.jsx$', '.js$']
" let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_c_compiler_options = '-std=c99 -Wall -pedantic -DVERSION=1'

call plug#end()

noremap H ^
noremap L $

nnoremap ; :
nnoremap : ;
nnoremap ' ;
nnoremap ( H
nnoremap ) L
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap j gj
nnoremap k gk
nnoremap Q <nop>
nnoremap <tab> %
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
nnoremap <leader>e :e ~/.vimrc<cr>
nnoremap <leader>! :SudoWrite<cr>
nnoremap <F5> "=strftime("%c")<cr>P
nnoremap <leader>r :source ~/.vimrc<cr>

cnoremap <c-p> <up>
cnoremap <c-n> <down>
cnoremap <c-u> <c-e><c-u>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-h> <left>
cnoremap <c-l> <right>

inoremap <c-j> <S-left>
inoremap <c-k> <S-right>
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-e> <esc>A
inoremap <c-u> <esc>mzgUiw`za

vnoremap ; :
vnoremap <leader>r y:@"<cr>
vnoremap <leader>R :!sort<cr>
vnoremap <leader>s :s/
vnoremap // y/<c-r>"<cr>

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
set undodir=/home/veggie/.vim/undo
set virtualedit=block
set encoding=utf-8
set wildmenu
set modeline
set lbr
set sbr=>
set splitright
set incsearch
set splitbelow
set nofoldenable
set hidden
set hlsearch
set ignorecase
set smartcase
set nostartofline
set confirm
set visualbell
set t_vb=

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

set cc=80
set nonumber
set nocursorline
set laststatus=0
set ls=2
set timeout ttm=0
set list listchars=tab:\›\ ,trail:★
set wildignore=*.o,.git,*.png,*.jpg,*.jpeg,*.gif
set t_Co=256
set background=dark

augroup ft
  au!
  au FileType *               setlocal formatoptions-=cro
  au FileType make            setlocal noet noai
  au FileType gitcommit       setlocal textwidth=72 formatoptions+=tl
  au BufReadPost fugitive://* set bufhidden=delete
  au FileType c               setlocal noet noai ts=8 sts=8 sw=8 cino=:0,(0 ")
  au FileType javascript*     setlocal ai et ts=2 sts=2 sw=2
augroup END

colorscheme gruvbox
