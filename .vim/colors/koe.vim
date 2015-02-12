set background=dark
if version > 580
    highlight clear
    if exists("g:syntax_on")
         syntax reset
    endif
endif

let g:colors_name = "koe"

hi VertSplit    term=NONE cterm=bold ctermfg=0    ctermbg=NONE
hi Search       cterm=NONE  ctermbg=11   ctermfg=black
hi MatchParen   cterm=NONE  ctermbg=8   ctermfg=black
hi Visual       cterm=NONE  ctermbg=11   ctermfg=black
"hi LineNr       cterm=NONE  ctermfg=8   ctermbg=0
hi LineNr       cterm=NONE  ctermfg=8   ctermbg=NONE
hi VertSplit    ctermfg=black  ctermbg=black cterm=none

hi SpellBad     ctermfg=0   ctermbg=1
hi SpellCap     ctermfg=0   ctermbg=1

highlight ColorColumn  term=NONE cterm=NONE ctermfg=NONE ctermbg=0
highlight Comment      term=NONE cterm=bold ctermfg=0    ctermbg=NONE
highlight Cursor       term=NONE cterm=bold ctermfg=NONE    ctermbg=NONE
highlight CursorLine   term=NONE cterm=NONE ctermfg=NONE ctermbg=0
highlight CursorLineNR term=NONE cterm=NONE ctermfg=NONE ctermbg=0
highlight DiffAdd      term=NONE cterm=bold ctermfg=2    ctermbg=NONE
highlight DiffChange   term=NONE cterm=bold ctermfg=NONE ctermbg=NONE
highlight DiffDelete   term=NONE cterm=bold ctermfg=7    ctermbg=1
highlight DiffText     term=NONE cterm=bold ctermfg=NONE    ctermbg=0
highlight Directory    term=NONE cterm=bold ctermfg=4    ctermbg=0
highlight ErrorMsg     term=NONE cterm=bold ctermfg=1    ctermbg=0
highlight FoldColumn   term=NONE cterm=bold ctermfg=0    ctermbg=NONE
highlight Folded       term=NONE cterm=bold ctermfg=0    ctermbg=NONE
highlight Function     term=NONE cterm=bold ctermfg=7    ctermbg=NONE
highlight NonText      term=NONE cterm=bold ctermfg=0    ctermbg=NONE
highlight Normal       term=NONE cterm=NONE ctermfg=7    ctermbg=NONE
highlight Pmenu        term=NONE cterm=NONE ctermfg=0    ctermbg=7
highlight SpecialKey   term=NONE cterm=NONE ctermfg=2    ctermbg=NONE
highlight StatusLine   term=NONE cterm=bold ctermfg=0    ctermbg=NONE
highlight String       term=NONE cterm=NONE ctermfg=1    ctermbg=NONE
highlight TabLineSel   term=NONE cterm=bold ctermfg=7    ctermbg=NONE
highlight Underlined   term=underline cterm=underline ctermfg=NONE   ctermbg=NONE
highlight WarningMsg   term=NONE cterm=bold ctermfg=3    ctermbg=NONE

highlight! link diffAdded       DiffAdd
highlight! link diffRemoved     DiffDelete
highlight! link diffChanged     DiffChange
highlight! link StatusLineNC    StatusLine
highlight! link Title           Normal
highlight! link MoreMsg         Normal
highlight! link Question        DiffChange
highlight! link TabLine         StatusLineNC
highlight! link TabLineFill     StatusLineNC
highlight! link VimHiGroup      VimGroup

hi Constant term=underline ctermfg=1
hi Special term=bold ctermfg=5
hi Identifier term=underline ctermfg=6
hi Statement term=bold ctermfg=3
hi PreProc term=underline ctermfg=5
hi Type term=underline ctermfg=10
hi Ignore cterm=bold ctermfg=7
hi Error term=reverse cterm=bold ctermfg=7 ctermbg=1
hi Todo term=standout ctermfg=0 ctermbg=3
