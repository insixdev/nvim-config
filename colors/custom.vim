" took many of these colors from github.com/Coselau
" Custom minimal theme
" Took inspiration from github.com/CosecSecCot/cosec-twilight.nvim

set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'custom'

" ─────────────────────────────────────────────────────────────
" Core groups
" ─────────────────────────────────────────────────────────────
highlight CursorLine cterm=NONE ctermbg=236 guibg=#1d1d1b
highlight Normal        guifg=#edddc0 guibg=#1c1b1b"#1f1f1f"#121212
" guibg=#181818
highlight NormalFloat   guifg=#edddc0 guibg=#202020

highlight @variable guifg=#f5e7ce

highlight Comment       guifg=#6f7b68 gui=Italic
highlight Conceal       guibg=#262626
highlight Constant      guifg=#edddcc
highlight DiffAdd       guifg=#FFFEDB guibg=#2B3328
highlight DiffChange    guifg=#FFFEDB guibg=#262636
highlight DiffDelete    guifg=#C34143 guibg=#42242B
highlight DiffText      guifg=#FFFEDB guibg=#49443C
highlight Directory     guifg=#ccac93
highlight Error         guifg=#C34143 gui=undercurl
highlight Function      guifg=#f5e6d5
highlight Identifier    guifg=#e0b79b

highlight LineNrAbove   guifg=#888888 guibg=#262626
highlight LineNrBelow   guifg=#888888 guibg=#262626
highlight LineNr        guifg=#d6d2c8
highlight MatchParen    guifg=#ddcEDB
highlight NonText       guifg=#3e3d33
highlight Operator      guifg=#DEBF7C
highlight Pmenu         guifg=#8f9988 guibg=#303030
highlight PmenuSbar     guifg=#918988 guibg=#262626
highlight PmenuSel      guifg=#BFBBBA guibg=#303030
highlight PmenuThumb    guifg=#918988 guibg=#262626 gui=reverse
highlight Question      guifg=#9b8d7f
highlight QuickFixLine  guibg=#303030
highlight Search        guibg=#5F5958
highlight Special       guifg=#b3ae96
highlight SpecialChar   guifg=#c78f69 
highlight SpecialKey    guifg=#676767 gui=Italic
highlight Statement     guifg=#c4a184 
highlight StatusLineNC guifg=#888ccc guibg=#222222
highlight PreProc       guifg=#c9a393
highlight StatusLine    guifg=#ffcccB guibg=#34383C
highlight String        guifg=#A2A970
highlight Structure     guifg=#dbcdab
highlight Substitute    guifg=#1A1A1A guibg=#C1C88D
highlight TabLine       guifg=#c4a584 guibg=#212121
highlight TabLineFill   guifg=#A09998 guibg=#212121
highlight TabLineSel    guifg=#A09998 guibg=#40474F
highlight Title         guifg=#FFFEDB term=none cterm=none
highlight Todo          guifg=#8B9698
highlight Type          guifg=#a89f8f gui=Italic
highlight Underlined    gui=undercurl
highlight VertSplit     guifg=#303030
highlight Visual        guibg=#454545
highlight WarningMsg    guifg=#FFFEDB
highlight Float         guifg=#6f7b68
highlight Number        guifg=#cf95a9
highlight Boolean       guifg=#6f7b68
highlight WinSeparator  guibg=#111111 guifg=#888888
" ─────────────────────────────────────────────────────────────
" Tree-sitter & LSP semantic groups
" ─────────────────────────────────────────────────────────────

" Core variable/function tweaks
highlight link @function Function
highlight link @keyword Statement
highlight link @type Type
highlight link @string String
highlight link @number Number
highlight link @boolean Boolean
highlight link @comment Comment

" Preprocessor / include fixes
highlight link @preproc PreProc
highlight link @preproc_include PreProc
highlight link @include PreProc
highlight link @keyword.directive PreProc
highlight link @keyword.import PreProc

" Markdown inline links, optional
highlight @markup.link.label.markdown_inline cterm=NONE
highlight! @variable.builtin guifg=#8aa19a
" LSP / variables por defecto
highlight! @lsp.typemod.variable.defaultLibrary.typescript guifg=#c6cfcc

" HTML tags
highlight! @tag.html guifg=#a7ccb4
highlight! @tag.delimiter.html guifg=#b5bdb8
highlight! @tag.attribute.html guifg=#a3ada7
highlight @tag.builtin.tsx guifg=#a7ccb4

highlight @tag.tsx guifg=#a7ccb4
" TSX delimiters
highlight! @tag.delimiter.tsx guifg=#b5bdb8   " mismo color que HTML delimiter
highlight! link @tag.delimiter.tsx @tag.delimiter.html


