""" Key mappings
let mapleader = ","
nnoremap Q <nop>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-k> <C-b>
nnoremap <C-m> <C-f>
nnoremap : ;
nnoremap ; :
nmap     <leader>f ;echomsg expand('%:p')<CR>
" underlines
nmap <leader>= yyp;s/./=/g<CR>
nmap <leader>- yyp;s/./-/g<CR>
" make search results appear in the center of the screen
nmap n nzz
nmap N Nzz
nmap <Space> ;nohl<CR>
nnoremap j gj
nnoremap k gk
map Y y$
cmap w!! w !sudo tee > /dev/null %


""" Settings
set autoread " Re-read file if changed outside
set autowrite " Automatically save before commands like :next and :make
set pastetoggle=<F8>
filetype indent on " enable indentation per language
set scrolloff=7 " Define the offset with the cursor when moving vertically
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
set splitright          " Open vsplits on the right
set splitbelow          " Open hsplits below
set nofoldenable    " disable folding
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
set nu
set cc=80
set background=dark


""" Plugins
execute pathogen#infect()
" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let Tlist_Exit_OnlyWindow = 1
" Syntastic
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✘'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_enable_highlighting = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_python_checkers = ['pylint']
let g:syntastic_full_redraws = 0
filetype plugin on
autocmd FileType make setlocal noexpandtab  " makefile tabbing
autocmd FileType c nnoremap <F6> :!./%:r<CR>
autocmd FileType c nnoremap <F5> :!clear; make CFLAGS="-Wall -Wextra -pedantic -std=c99" CC=gcc %:r 2>&1 \|less<CR>


""" Colors
if $TERM != "linux" " tty
   set t_Co=256
endif
"colorscheme solarized
colorscheme koe
