let mapleader = " "

nnoremap j gj
nnoremap k gk
vnoremap <leader>s :s/
vnoremap <leader>R :!sort<cr>
nnoremap <leader>s :%s/
nnoremap <leader>j :bn<cr>
nnoremap <leader>k :bp<cr>
nnoremap <leader>l gt
nnoremap <leader>h gT
nnoremap <leader>d :bdelete<cr>
nnoremap <leader>t :tab sball<cr>
nnoremap <leader>u :tabnew#<cr>

vnoremap <leader>c :w !curl -F "sprunge=<-" http://sprunge.us

nnoremap <leader>= :tabm +1<cr>
nnoremap <leader>- :tabm -1<cr>

nnoremap <leader>E :set expandtab!<cr>
"nnoremap <silent> <F12> :make<cr>

nnoremap Q <nop>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-k> <C-b>
nnoremap <C-m> <C-f>
nnoremap <leader>f :echomsg expand('%:p')<cr>
nnoremap <leader><Return> :nohl<cr>
nnoremap <leader>r :source ~/.vimrc<cr>
nnoremap <leader>e :e ~/.vimrc<cr>
nnoremap <leader>! :w ! sudo tee %<cr>

noremap ' ;

noremap ; :
noremap : ;


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
set nocompatible
set hidden
set hlsearch
set ignorecase
set smartcase
set nostartofline
set confirm
set visualbell
set t_vb=
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set expandtab
set nu
set cc=80
set laststatus=0
"set ls=2
set timeout ttm=0 "fix ESC + Shift-O lag
set noruler
set list
set listchars=tab:▸\ ,eol:¬

filetype plugin on
autocmd FileType make setlocal noexpandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype json setlocal ts=2 sts=2 sw=2
autocmd FileType c nnoremap <F5> :!clear; make %:r 2>&1 \|less<CR>
autocmd FileType c nnoremap <F6> :!./%:r<CR>
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " auto commenting

syntax on
filetype indent on

execute pathogen#infect()

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

let g:Imap_UsePlaceHolders = 0

let g:syntastic_javascript_checkers = ['jshint']

let g:ctrlp_map = '<C-t>'
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/](node_modules)$',
\ }

let g:surround_{char2nr('-')} = "<% \r %>"
let g:surround_{char2nr('=')} = "<%= \r %>"
let g:surround_{char2nr('8')} = "/* \r */"
let g:surround_{char2nr('s')} = " \r"
let g:surround_{char2nr('^')} = "/^\r$/"
let g:surround_indent = 1

setglobal commentstring=#\ %s


nnoremap <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


if $TERM != "linux"
   set t_Co=256
endif
set background=dark
"colorscheme badwolf
"colorscheme koe
colorscheme gruvbox
