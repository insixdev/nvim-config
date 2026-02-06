
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
highlight CursorLine cterm=NONE ctermbg=236 guibg=#181818
highlight Normal        guifg=#edddc0 guibg=#181818"#262626"#181818"#0d1117"#181818
" guibg=#181818
highlight NormalFloat   guifg=#95a99f guibg=#202020


highlight RainbowDelimiterRed    guifg=#cf95a9  " Rosado (como tu Number)

highlight clear rustDerive 

highlight RainbowDelimiterYellow guifg=#fa7a2f "Amarillo dorado (como tu Operator)
highlight RainbowDelimiterBlue   guifg=#8aa19a  " Verde azulado (como @variable.builtin)
highlight RainbowDelimiterOrange guifg=#c78f69  " Naranja (como tu SpecialChar)
highlight RainbowDelimiterGreen  guifg=#A2A970  " Verde (como tu String)
highlight RainbowDelimiterViolet guifg=#8f8ccc  " Violeta (como tu StatusLineNC)
highlight RainbowDelimiterCyan   guifg=#a7ccb4  " Cyan (como tu @tag.html)
highlight DiagnosticUnnecessary guibg=NONE guifg=#6f7b68
highlight FlashBackdrop         guibg=NONE guifg=#6f7b68

" #6f7b68 
highlight Comment       guifg=#a18e78 gui=Italic
highlight Conceal       guibg=#262626
highlight Constant      guifg=#95a99f"#96a6c8"#8c9c94
highlight DiffAdd       guifg=#FFFEDB guibg=#2B3328
highlight DiffChange    guifg=#FFFEDB guibg=#262636
highlight DiffDelete    guifg=#C34143 guibg=#42242B
highlight DiffText      guifg=#FFFEDB guibg=#49443C
highlight Directory     guifg=#ff7c69
highlight Error         guifg=#C34143 gui=undercurl
highlight PreProc       guifg=#fbdb9b""#96a6c8""#ffcb73

highlight @variable guifg=#efe4e7
highlight Identifier    guifg=#f0b79b "#ffc8c2
highlight Function      guifg=#efe4e7"#ffc9c9""#efe4e7
highlight Statement     guifg=#FF7B72"#ff7c69"#f29718 "#fd7f1f"#e3692b "#f78e48 gui=bold

highlight LineNrAbove   guifg=#888888 guibg=#181818
highlight LineNrBelow   guifg=#888888 guibg=#181818
highlight LineNr        guifg=#d6d2c8
highlight MatchParen    guifg=#ddcEDB
highlight NonText       guifg=#3d3d33
highlight Operator      guifg=#ffd1f0
highlight Pmenu         guifg=#8f9988 guibg=#303030
highlight PmenuSbar     guifg=#918988 guibg=#262626
highlight PmenuSel      guifg=#ba9279 guibg=#303030
highlight PmenuThumb    guifg=#918988 guibg=#262626 gui=reverse
highlight Question      guifg=#9b8d7f
highlight QuickFixLine  guibg=#303030
highlight Search        guibg=#5F5958
highlight Special       guifg=#b3ae96
highlight SpecialChar   guifg=#c78f69 
highlight SpecialKey    guifg=#676767 
highlight StatusLineNC  guifg=#8f8ccc guibg=#292621
highlight StatusLine    guifg=#ffccff guibg=#33302b
highlight String        guifg=#A2A970
highlight Structure     guifg=#dbcdab
highlight Substitute    guifg=#1A1A1A guibg=#C1C88D
highlight TabLine       guifg=#c4a584 guibg=#212121
highlight TabLineFill   guifg=#A09998 guibg=#212121
highlight TabLineSel    guifg=#A09998 guibg=#40474F
highlight Title         guifg=#FFFEDB term=none cterm=none
highlight Todo          guifg=#8B9698
highlight Type          guifg=#989e9b"#9aa19d
highlight Underlined    gui=undercurl
highlight VertSplit     guifg=#303030
highlight Visual        guibg=#454545
highlight WarningMsg    guifg=#FFFEDB
highlight Float         guifg=#6f7b68
highlight Number        guifg=#cf95a9
highlight Boolean       guifg=#6f7b68
highlight WinSeparator  guibg=#101010 guifg=#333232
highlight WinBar         guibg=#101010 guifg=#888888
highlight WinBarNC    guibg=#101010   guifg=#888888
hi clear @lsp.typemod.method.associated.rust 
hi @lsp.typemod.method.associated.rust guifg=#efe4e7
hi @lsp.type.class.c guifg=#ffe3e1
"hi clear @lsp.type.struct.rust
hi clear @lsp.type.typeAlias.rust 
hi clear @lsp.type.parameter.rust
hi @lsp.type.struct.rust guifg=#FFC272 
hi Structure     guifg=#dbc5b4
hi link @lsp.type.typeAlias.rust Identifier
hi clear RustEnum 
hi RustEnum guifg=#ffdd33"" #FFC272 
hi clear RustAttribute 
hi RustAttribute guifg=#caa393"#899BAD "#79C0FF"#a37e98"#ff8f85 

hi clear rustFoldBraces 
hi rustFoldBraces guifg=#e8a72e 
" ─────────────────────────────────────────────────────────────
" Tree-sitter & LSP semantic groups
" ─────────────────────────────────────────────────────────────
hi compileSuccess guifg=#a6e22e ctermfg=Green
hi compileFailure guifg=#f92672 ctermfg=Red
hi compileError   guifg=#f92672 ctermfg=Red gui=bold
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


