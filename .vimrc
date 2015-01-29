let mapleader = ","

nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-t> :TlistToggle<CR>
nnoremap <C-k> <C-b>
nnoremap <C-m> <C-f>

nmap     <leader>f ;echomsg expand('%:p')<CR>

" Underline the current line with either a specific char
nmap     <leader>= yyp;s/./=/g<CR>
nmap     <leader>- yyp;s/./-/g<CR>

" comment out lines
"nmap    <leader># I# <ESC>
"nmap    <leader>/ I/* <ESC>A */<ESC>
"nmap    <leader>\ I//<ESC>
"nmap    <leader>u ^2x<ESC>

" same for blocks
"vmap    <leader># :s/^\s*/&# /<CR>
"vmap    <leader>/ <ESC>'<O/*<ESC>'>o */<ESC>:'<,'>s/^\s*/& * /<CR>

nnoremap : ;
nnoremap ; :

" make search results appear in the center of the screen
nmap n nzz
nmap N Nzz

nmap <Space> ;nohl<CR>
set autoread " Re-read file if changed outside
set autowrite " Automatically save before commands like :next and :make

set pastetoggle=<F8>

filetype indent on " enable indentation per language

set scrolloff=10 " Define the offset with the cursor when moving vertically
set backspace=2 " Make <BACKSPACE> do what it should do

" create a backup of existing files, delete afterwards
set noswapfile
set nowritebackup
set nobackup
set undofile
set undodir=/home/veggie/.vim/undo

set virtualedit=block " make visual blocks easier to understand

set tags+=~/.vim/systags " used for omnicompletion
set path=.,,inc,src,/usr/include,/usr/local/include " improve vim path
set encoding=utf-8  " Use UTF-8 for file/term encoding
set wildmenu        " Use the wildmenu
set modeline        " Use modeline, also
set laststatus=0 noruler 

set lbr                 " enable line break
set sbr=>               " line break indicator
"set cinoptions={1s,f1s  " whitesmith C style indentation

set splitright          " Open vsplits on the right
set nofoldenable    " disable folding

nnoremap j gj
nnoremap k gk

set nocompatible
syntax on
set hidden
set hlsearch
set ignorecase
set smartcase
set autoindent
set nostartofline
set confirm
set visualbell
set t_vb=
set notimeout ttimeout ttimeoutlen=200

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

map Y y$

execute pathogen#infect()
"nnoremap <C-n> :NERDTreeToggle<CR>
" exit vim if NERDtree/TagList are last buffers
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let Tlist_Exit_OnlyWindow = 1

" set rnu
set nu
"set cursorline
set cc=80
"colorscheme koe
set background=dark
colorscheme solarized

filetype plugin on
"set grepprg=grep\ -nH\ $*
"let g:tex_flavor='latex'

autocmd FileType make setlocal noexpandtab

set t_Co=256
