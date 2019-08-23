filetype plugin indent on
syntax on
let mapleader = "\<space>"

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

Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
  nnoremap <leader>gs :Gstatus<CR>
  nnoremap <leader>ga :Git add .<CR><CR>

Plug 'editorconfig/editorconfig-vim'
  let g:EditorConfig_exclude_patterns = ['fugitive://.*']

Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'moll/vim-node'
Plug 'elzr/vim-json'
Plug 'jparise/vim-graphql'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mxw/vim-jsx'
  let g:jsx_ext_required = 0
Plug 'morhetz/gruvbox'
  let g:gruvbox_invert_selection = 0
Plug 'itchyny/lightline.vim'

" Plug 'jaredly/reason-language-server'
" Plug 'reasonml-editor/vim-reason-plus'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
  nnoremap <leader>a :Ag<space>
  xnoremap <leader>a "sy:Ag <C-R>s
  nnoremap <silent> <Leader>p <Esc>:Files<CR>
  nnoremap <silent> <Leader>b <Esc>:Buffers<CR>
  nnoremap <silent> <Leader>gl <Esc>:Commits<CR>
  nnoremap <silent> <Leader>gL <Esc>:BCommits<CR>
  let g:fzf_action = {
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-s': 'split',
        \ 'ctrl-l': 'vsplit' }
  let g:fzf_layout = { 'down': '~50%' }

Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'Shougo/neosnippet.vim'
Plug 'jeetsukumaran/vim-filebeagle'
  let g:filebeagle_show_hidden = 1
  if argc() == 0
    augroup fb
      autocmd!
      autocmd VimEnter * FileBeagle
    augroup end
  endif

call plug#end()

" neosnippet
" -------------------------------------------------------------
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }
let g:neosnippet#snippets_directory='~/.vim/snippets/'

" CoC
" -------------------------------------------------------------
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>s <Plug>(coc-rename)
nmap <leader>i <Plug>(coc-fix-current)
nnoremap <silent> K :call <SID>show_documentation()<CR>
map <2-LeftMouse> <Plug>(coc-action-highlight)

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

augroup coc
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'filename': 'RelativePathFilename'
      \ },
      \ }
function RelativePathFilename()
  return fnamemodify(expand("%"), ":~:.")
endfunction


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
nnoremap `. `.zz
nnoremap <F12> <Esc>:syntax sync fromstart<CR>
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>

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
if !has('nvim') && &term =~ '^screen'
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
set wildignore=.git,*.png,*.jpe?g,*.gif
set nofixeol
set nofoldenable
set noshowmode
set cmdheight=2
set updatetime=300 " for CursorHold
set shortmess+=c
set signcolumn=auto

iabbrev functino function
iabbrev reutrn return
iabbrev improt import

command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

augroup ft
  autocmd!
  autocmd FileType *         setl formatoptions-=cro
  autocmd FileType *         if getfsize(@%) > 1000000 | setl syntax=off | endif
  " autocmd FileType gitcommit setl formatoptions+=tl textwidth=72 colorcolumn=72
  autocmd FileType markdown  setl formatoptions+=tl textwidth=80
  " autocmd CursorHold *       silent call CocAction('highlight')
  " autocmd BufWrite *.ts,*.tsx :OR
  autocmd VimResized * redraw!
augroup end

colorscheme gruvbox

hi default CocHighlightText  ctermbg=237 guibg=#3c3836 ctermfg=NONE guifg=NONE
hi default link CocHighlightRead  CocHighlightText
hi default link CocHighlightWrite CocHighlightText

" Plug 'w0rp/ale'
"   let g:ale_lint_on_text_changed = "never"
"   let g:ale_lint_on_enter = 0
"   let g:ale_fixers = {
"   \   'javascript': ['prettier'],
"   \   'typescript': ['prettier'],
"   \}
"   let g:ale_linters = {
"   \   'typescript': ['tsserver'],
"   \}
"   let g:ale_fix_on_save = 1
