let mapleader = " "

" hard to press
noremap ( ^
noremap ) $
noremap ( ^
noremap ) $
noremap <tab> %

nnoremap n nzzzv
nnoremap N Nzzzv

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
nnoremap <leader>t :tabe<cr>
nnoremap <leader>u :tabnew#<cr>

vnoremap <leader>c :w !curl -F "sprunge=<-" http://sprunge.us

nnoremap <leader>= :tabm +1<cr>
nnoremap <leader>- :tabm -1<cr>

nnoremap Q <nop>

nnoremap <C-m> <C-f>
nnoremap <C-n> <C-f>
nnoremap <C-p> <C-b>

nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>

nnoremap <leader>f :echomsg expand('%:p')<cr>

nnoremap <leader><Return> :nohl<cr>

nnoremap <leader>r :source ~/.vimrc<cr>
nnoremap <leader>e :e ~/.vimrc<cr>
nnoremap <leader>! :w ! sudo tee %<cr>

nnoremap <leader>a :tabe<CR>:Ag 

" fugitive git bindings
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
" nnoremap <leader>gps :Dispatch! git push<CR>
" nnoremap <leader>gpl :Dispatch! git pull<CR>

inoremap <C-U> <C-G>u<C-U>

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
" set cc=80
set cc=
set laststatus=0
set ls=2
set timeout ttm=0 "fix ESC + Shift-O lag
set noruler
" set list
" set listchars=tab:▸\ ,eol:¬

filetype plugin on
autocmd FileType make setlocal noexpandtab
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype json setlocal ts=2 sts=2 sw=2
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " disable auto commenting

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


let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
" let g:airline_left_sep='>'
" let g:airline_right_sep='<'
let g:airline#extensions#tabline#show_buffers = 0

setglobal commentstring=#\ %s

if $TERM != "linux"
   set t_Co=256
endif
set background=dark
"colorscheme koe
colorscheme gruvbox
set runtimepath^=~/.vim/bundle/ag

let base16colorspace=256
