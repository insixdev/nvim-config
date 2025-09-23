
" ~/.config/nvim/colors/tsoding.vim
set bg=dark
hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'verdoso'

" ===== Colores principales =====
highlight Normal        guifg=#C0C0B0 guibg=#1E1E1E
highlight NonText       guifg=#454343
highlight LineNr        guifg=#8B9185
highlight VertSplit     guifg=#303030
highlight StatusLine    guifg=#C0C0B0 guibg=#2A2D2B
highlight TabLine       guifg=#A09998 guibg=#212121
highlight TabLineFill   guifg=#A09998 guibg=#212121
highlight TabLineSel    guifg=#C0C0B0 guibg=#40474F
highlight WinSeparator  guibg=#111111 guifg=#888888

" ===== Comentarios =====
highlight Comment       guifg=#859285 gui=italic
highlight Float         guifg=#859285
highlight Number        guifg=#859285
highlight Boolean       guifg=#859285
highlight Constant      guifg=#859285
highlight Type          guifg=#8f92f85 gui=italic
highlight Identifier    guifg=#8B9698
highlight Function      guifg=#AA9AAC

" ===== Strings y caracteres =====
highlight String        guifg=#859f5f gui=NONE
highlight Special       guifg=#baa0af
highlight SpecialChar   guifg=#C1C88D
highlight SpecialKey    guifg=#6f6767

" ===== Keywords =====
highlight Keyword      guifg=#cccccc gui=bold
highlight Statement    guifg=#cccccf gui=italic
highlight PreProc      guifg=#8B9698
highlight Include      guifg=#ccccff gui=bold
highlight Todo         guifg=#8B9698

" ===== Operadores y paréntesis =====
highlight Operator      guifg=#DEBF7C
highlight MatchParen    guifg=#FFFEDB
highlight Underlined    gui=undercurl

" ===== Errores =====
highlight Error         guifg=#C34143 gui=undercurl
highlight ErrorMsg      guifg=#FFFEDB
highlight WarningMsg    guifg=#FFFEDB
highlight Question      guifg=#9b8d7f

" ===== Diferencias en Git/Diff =====
highlight DiffAdd       guifg=#FFFEDB guibg=#2B3328
highlight DiffChange    guifg=#FFFEDB guibg=#262636
highlight DiffDelete    guifg=#C34143 guibg=#42242B
highlight DiffText      guifg=#FFFEDB guibg=#49443C gui=italic

" ===== Menús y popups =====
highlight Pmenu         guifg=#859285 guibg=#282828
highlight PmenuSel      guifg=#C0C0B0 guibg=#2B2B2B
highlight PmenuSbar     guifg=#859285 guibg=#282828
highlight PmenuThumb    guifg=#859285 guibg=#282828 gui=reverse
highlight QuickFixLine  guibg=#303030
highlight Search        guibg=#4F5B4F
highlight Visual        guibg=#3A3F3B
highlight Substitute    guifg=#1A1A1A guibg=#859285

" ===== Directorios y títulos =====
highlight Directory     guifg=#C1C88D
highlight Title         guifg=#FFFEDB term=none cterm=none


set termguicolors
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
colorscheme gruvbox
hi LspCxxHlGroupMemberVariable guifg=#83a598
