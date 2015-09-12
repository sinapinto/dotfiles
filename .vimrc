set nocompatible
let mapleader = " "

inoremap f<tab> function() {<cr>}<esc>k$F)i

cmap <c-p> <Up>
cmap <c-n> <Down>


""""""""""""" Learn """""""""""
noremap ' ;
" remember to use f and t

nnoremap <C-m> <C-e>
" <C-y> to scroll up
"""""""""""""""""""""""""""""""

" rsi
inoremap <expr> <C-E> col('.')>strlen(getline('.'))<bar><bar>pumvisible()?"\<Lt>C-E>":"\<Lt>End>"
cnoremap <C-U> <C-E><C-U>
noremap! <C-j> <S-Left>
noremap! <C-h> <C-W>
noremap! <C-k> <S-Right>
inoremap <C-U> <C-G>u<C-U>
inoremap <C-l> <right>

noremap ( H
noremap ) L
noremap H ^
noremap L $
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

vnoremap <leader>c :w !curl -F "sprunge=<-" http://sprunge.us

" nnoremap <leader>= :tabm +1<cr>
" nnoremap <leader>- :tabm -1<cr>
nnoremap <leader>= me=ap`e

nnoremap Q <nop>

nnoremap <C-n> <C-f>
nnoremap <C-p> <C-b>

nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>

nnoremap <leader>f :echomsg expand('%:p')<cr>

nnoremap <leader><Return> :nohl<cr>:ccl<CR>

nnoremap <leader>r :source ~/.vimrc<cr>
nnoremap <leader>e :e ~/.vimrc<cr>
nnoremap <leader>! :w ! sudo tee %<cr>

nnoremap <leader>a :tabe<CR>:Ag 

" fugitive git bindings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>ga :Git add .<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch git push<CR>
nnoremap <leader>gpl :Dispatch git pull<CR>

autocmd User Fugitive 
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" auto-clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

nnoremap <leader>w :Dispatch webpack -d<CR>


noremap ; :
noremap : ;

function! StripWhitespace ()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>S :call StripWhitespace ()<CR>



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
set shiftwidth=2
set tabstop=2
set softtabstop=2
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
set listchars=tab:▸\ ,eol:¬

filetype plugin on
autocmd FileType make setlocal noexpandtab
autocmd FileType c,sh,rb,py setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " disable auto commenting

syntax on
filetype indent on

execute pathogen#infect()

let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = '●'
let g:syntastic_style_error_symbol = '✘'
let g:syntastic_style_warning_symbol = '●'
let g:syntastic_enable_highlighting = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 2
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_full_redraws = 0

let g:syntastic_ignore_files = ['.jsx$']

if &term =~ '^rxvt'
    let g:gruvbox_italic=1
    set t_ZH=[3m
    set t_ZR=[23m
endif
if &term =~ '^screen'
    let g:gruvbox_italic=0
endif

let g:gruvbox_invert_selection = 0


let g:syntastic_javascript_checkers = ['jshint']

let g:ctrlp_map = '<C-t>'
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/](node_modules)$',
\ }
nnoremap <C-b> :CtrlPBuffer<CR>
nnoremap <C-t> :CtrlP<CR>

let g:surround_{char2nr('-')} = "<% \r %>"
let g:surround_{char2nr('=')} = "<%= \r %>"
let g:surround_{char2nr('8')} = "/* \r */"
let g:surround_{char2nr('s')} = " \r"
let g:surround_{char2nr('^')} = "/^\r$/"
let g:surround_indent = 1

set commentstring=//\ %s
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#buffer_nr_format = '%s '
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#fnamemod = ':t'

if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m
endif

let g:gist_executable_for_linux = "chromium"
let g:gist_open_url = 0
vnoremap <leader>G :Gist -a<CR>
vnoremap <leader>g :Gist -a<CR>
nnoremap <leader>G :Gist -a<CR>

" if $TERM != "linux"
   set t_Co=256
" endif
set background=dark
colorscheme gruvbox
