"""""""""""""""""""""" Learn """"""""""""""""""""
" :b  - buffer
" :sb  - split buffer
" C-w K - move split to top
" C-w H - move split to left
" remember to use f and t
" R for insert mode
" <localleader>lv  vimtex-view
" <localleader>ll  vimtex-compile-toggle
" <localleader>le  vimtex-errors
" <localleader>lo  vimtex-compile-output
" <localleader>lg  vimtex-status
" <localleader>lc  vimtex-clean
"""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

let mapleader = " "
let maplocalleader = ','

" inoremap f<tab> function() {<cr>}<esc>k$F)i

cmap <c-p> <Up>
cmap <c-n> <Down>

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
vnoremap <leader>R :!sort<cr>
vnoremap <leader>s :s/
nnoremap <leader>s :%s/
nnoremap <leader>j :bn<cr>
nnoremap <leader>k :bp<cr>
nnoremap <leader>l gt
nnoremap <leader>h gT
nnoremap <leader>d :bdelete<cr>
nnoremap <leader>t :tabe<cr>


" vnoremap <leader>c :w !curl -F "sprunge=<-" http://sprunge.us
nnoremap <leader>cd :cd %:p:h<CR>

" nnoremap <leader>= :tabm +1<cr>
" nnoremap <leader>- :tabm -1<cr>
nnoremap <leader>= me=ap`e
nnoremap ga `[v`]

nnoremap <leader>v :vert sb 
nnoremap Q <nop>

noremap ' ;
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
nnoremap <F5> "=strftime("%c")<CR>P

nnoremap <leader>a :Ag! 
nnoremap <leader>A :Ag '\b<C-R>=expand("<cword>")<CR>\b'
xnoremap <leader>a "sy:Ag '<C-R>s'

" fugitive git bindings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>ga :Git add .<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gl :silent! Glog<CR>:bot copen<CR>
" nnoremap <leader>ge :Gedit<CR>
" nnoremap <leader>gm :Gmove<Space>
" nnoremap <leader>gb :Git branch<Space>
" nnoremap <leader>go :Git checkout<Space>
" nnoremap <leader>gps :Dispatch git push<CR>
" nnoremap <leader>gpl :Dispatch git pull<CR>

augroup fugitive
  au!
  au User Fugitive 
    \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
    \   nnoremap <buffer> .. :edit %:h<CR> |
    \ endif

  " auto-clean fugitive buffers
  au BufReadPost fugitive://* set bufhidden=delete
augroup END


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

" http://vim.wikia.com/wiki/Making_a_list_of_numbers
function! Incr()
        let a = line('.') - line("'<")
        let c = virtcol("'<")
        if a > 0
                execute 'normal! '.c.'|'.a."\<C-a>"
        endif
        normal `<
endfunction
vnoremap <C-a> :call Incr()<CR>


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
" set number
" set cc=80
set cc=
set laststatus=0
set ls=2
set timeout ttm=0 "fix ESC + Shift-O lag
set noruler
set list
" set listchars=tab:▸\ ,eol:¬
set listchars=tab:▸\ 

filetype plugin on

augroup ft
  au!
  au FileType make setlocal noet noai ts=4
  au FileType c,h,sh,py setlocal shiftwidth=4 tabstop=4 softtabstop=4
  au FileType js,tex setlocal shiftwidth=2 tabstop=2 softtabstop=2
  au FileType xdefaults setlocal cms=!%s
  au BufNewFile,BufRead *.xresources setf xdefaults
  au FileType * setlocal formatoptions-=cro " disable auto commenting
augroup END

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

let g:syntastic_ignore_files = ['.jsx$', '.js$']
let g:syntastic_javascript_checkers = ['eslint', 'jshint']

let g:gruvbox_italic=1
let g:gruvbox_italic=1
set t_ZH=[3m
set t_ZR=[23m

let g:gruvbox_invert_selection = 0


" let g:ctrlp_map = '<C-t>'
" let g:ctrlp_custom_ignore = {
" \ 'dir':  '\v[\/](node_modules)$',
" \ }
" nnoremap <C-b> :CtrlPBuffer<CR>
" nnoremap <C-t> :CtrlP<CR>

let g:surround_{char2nr('-')} = "<% \r %>"
let g:surround_{char2nr('=')} = "<%= \r %>"
let g:surround_{char2nr('8')} = "/* \r */"
let g:surround_{char2nr('s')} = " \r"
let g:surround_{char2nr('^')} = "/^\r$/"
let g:surround_indent = 1

let g:airline_powerline_fonts=1
" powerline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0

if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m
endif

if executable("chromium")
  let g:gist_executable_for_linux = "chromium"
endif
let g:gist_open_url = 0
vnoremap <leader>G :Gist -a<CR>
vnoremap <leader>g :Gist -a<CR>
nnoremap <leader>G :Gist -a<CR>

" let g:indentLine_faster = 1
" let g:indentLine_enabled = 0
" conceallevel hides json quotes. may want to also set concealcursor
" sets conceallevel=2

let g:jsx_ext_required = 0

" tree style
" let g:netrw_liststyle = 3

let g:vimtex_motion_matchparen = 0
let g:vimtex_motion_enabled = 0
let g:vimtex_fold_enabled = 0
if executable("mupdf")
  let g:vimtex_view_method = 'mupdf'
endif
" let g:vimtex_latexmk_continuous = 0
" map <localleader>ll <plug>(vimtex-compile)

" if $TERM != "linux"
   set t_Co=256
" endif
set background=light
colorscheme solarized
" highlight Comment cterm=italic
highlight SyntasticError cterm=underline ctermfg=9 ctermbg=52
highlight SyntasticWarning cterm=bold ctermfg=11 ctermbg=58

if has("gui_running")
  set belloff=all
  set guifont=Monaco\ for\ Powerline\ 10
  set number
  colorscheme badwolf
endif
