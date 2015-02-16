let mapleader = " "

nnoremap j gj
nnoremap k gk
nnoremap <leader>s :%s/
vmap <leader>s :s/
nnoremap <leader>S :s/
nnoremap <leader>o o<esc>k
nnoremap <leader>O O<esc>j
nnoremap <leader>j :bn<cr>
nnoremap <leader>k :bp<cr>
nnoremap <leader>l gt
nnoremap <leader>h gT
nnoremap <leader>d :bdelete<cr>
nnoremap <leader>t :tab sball<cr>

nnoremap <leader>E :set expandtab!<cr>
vmap <leader>R :!sort<cr>
nnoremap <silent> <leader>C :set cursorline!<cr>
nnoremap <silent> <F7> :set number!<cr>
nnoremap <silent> <F8> :set hlsearch!<cr>
nnoremap <silent> <F12> :make<cr>
nnoremap <leader>r :source ~/.vimrc<cr>
nnoremap <leader>e :e ~/.vimrc<cr>

nnoremap Q <nop>
nnoremap <C-o> 5j
nnoremap <C-p> 5k
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-k> <C-b>
nnoremap <C-m> <C-f>
nnoremap <leader>f :echomsg expand('%:p')<cr>
nnoremap <leader><Return> :nohl<cr>
nnoremap <leader>r :source ~/.vimrc<cr>
nnoremap <leader>e :e ~/.vimrc<cr>
nnoremap <leader>! :w ! sudo tee %<cr>

nnoremap : ;
nnoremap ; :

set mouse=a
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
set laststatus=0 noruler 
set lbr
set sbr=>
set splitright
set incsearch
set splitbelow 
set nofoldenable
set nocompatible
set hidden
set hlsearch
set ignorecase
set smartcase
set autoindent
set nostartofline
set confirm
set visualbell
set t_vb=
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set nu
set cc=80

filetype plugin on
autocmd FileType make setlocal noexpandtab
autocmd FileType c nnoremap <F5> :!clear; make CFLAGS="-Wall -Wextra -pedantic -std=c99" CC?=gcc %:r 2>&1 \|less<CR>
autocmd FileType c nnoremap <F6> :!./%:r<CR>

syntax on
filetype indent on


execute pathogen#infect()

nnoremap <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let Tlist_Exit_OnlyWindow = 1
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✘'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_enable_highlighting = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 2
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_full_redraws = 0

let g:gruvbox_italic=0

if $TERM != "linux"
   set t_Co=256
endif
set background=dark
colorscheme gruvbox
