-- Custom minimal theme
-- Based on github.com/Coselau and github.com/CosecSecCot/cosec-twilight.nvim
-- Place in: ~/.config/nvim/colors/custom-newest.lua

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "custom-newest"

local function hi(group, opts)
  local cmd = "highlight " .. group
  if opts.fg then cmd = cmd .. " guifg=" .. opts.fg end
  if opts.bg then cmd = cmd .. " guibg=" .. opts.bg end
  if opts.gui then cmd = cmd .. " gui=" .. opts.gui end
  if opts.cterm then cmd = cmd .. " cterm=" .. opts.cterm end
  if opts.ctermbg then cmd = cmd .. " ctermbg=" .. opts.ctermbg end
  if opts.term then cmd = cmd .. " term=" .. opts.term end
  vim.cmd(cmd)
end

local function link(from, to)
  vim.cmd("highlight link " .. from .. " " .. to)
end

local function force_hi(group, opts)
  local cmd = "highlight! " .. group
  if opts.fg then cmd = cmd .. " guifg=" .. opts.fg end
  if opts.bg then cmd = cmd .. " guibg=" .. opts.bg end
  if opts.gui then cmd = cmd .. " gui=" .. opts.gui end
  vim.cmd(cmd)
end

-- ─────────────────────────────────────────────────────────────
-- Core groups
-- ─────────────────────────────────────────────────────────────
hi("CursorLine", { bg = "#1d1d1b", cterm = "NONE", ctermbg = "236" })
hi("Normal", { fg = "#edddc0", bg = "#1c1b1b" })
hi("NormalFloat", { fg = "#edddc0", bg = "#202020" })

force_hi("@variable", { fg = "#f5e7ce" })

hi("Comment", { fg = "#6f7b68", gui = "Italic" })
hi("Conceal", { bg = "#262626" })
hi("Constant", { fg = "#edddcc" })
hi("DiffAdd", { fg = "#FFFEDB", bg = "#2B3328" })
hi("DiffChange", { fg = "#FFFEDB", bg = "#262636" })
hi("DiffDelete", { fg = "#C34143", bg = "#42242B" })
hi("DiffText", { fg = "#FFFEDB", bg = "#49443C" })
hi("Directory", { fg = "#ccac93" })
hi("Error", { fg = "#C34143", gui = "undercurl" })
hi("Function", { fg = "#f5e6d5" })
hi("Identifier", { fg = "#e0b79b" })

hi("LineNrAbove", { fg = "#888888", bg = "#262626" })
hi("LineNrBelow", { fg = "#888888", bg = "#262626" })
hi("LineNr", { fg = "#d6d2c8" })
hi("MatchParen", { fg = "#ddcEDB" })
hi("NonText", { fg = "#3e3d33" })
hi("Operator", { fg = "#DEBF7C" })
hi("Pmenu", { fg = "#8f9988", bg = "#303030" })
hi("PmenuSbar", { fg = "#918988", bg = "#262626" })
hi("PmenuSel", { fg = "#BFBBBA", bg = "#303030" })
hi("PmenuThumb", { fg = "#918988", bg = "#262626", gui = "reverse" })
hi("Question", { fg = "#9b8d7f" })
hi("QuickFixLine", { bg = "#303030" })
hi("Search", { bg = "#5F5958" })
hi("Special", { fg = "#b3ae96" })
hi("SpecialChar", { fg = "#c78f69" })
hi("SpecialKey", { fg = "#676767", gui = "Italic" })
hi("Statement", { fg = "#c4a184" })
hi("StatusLineNC", { fg = "#888ccc", bg = "#222222" })
hi("PreProc", { fg = "#c9a393" })
hi("StatusLine", { fg = "#ffcccB", bg = "#34383C" })
hi("String", { fg = "#A2A970" })
hi("Structure", { fg = "#dbcdab" })
hi("Substitute", { fg = "#1A1A1A", bg = "#C1C88D" })
hi("TabLine", { fg = "#c4a584", bg = "#212121" })
hi("TabLineFill", { fg = "#A09998", bg = "#212121" })
hi("TabLineSel", { fg = "#A09998", bg = "#40474F" })
hi("Title", { fg = "#FFFEDB", term = "none", cterm = "none" })
hi("Todo", { fg = "#8B9698" })
hi("Type", { fg = "#a89f8f", gui = "Italic" })
hi("Underlined", { gui = "undercurl" })
hi("VertSplit", { fg = "#303030" })
hi("Visual", {bg = "#454545" })
hi("WarningMsg", { fg = "#FFFEDB" })
hi("Float", { fg = "#6f7b68" })
hi("Number", { fg = "#cf95a9" })
hi("Boolean", { fg = "#6f7b68" })
hi("WinSeparator", { bg = "#111111", fg = "#888888" })

-- ─────────────────────────────────────────────────────────────
-- Tree-sitter & LSP semantic groups
-- ─────────────────────────────────────────────────────────────

-- Core variable/function tweaks
link("@function", "Function")
link("@keyword", "Statement")
link("@type", "Type")
link("@string", "String")
link("@number", "Number")
link("@boolean", "Boolean")
link("@comment", "Comment")
link("@special", "Special")
-- Preprocessor / include fixes
link("@preproc", "PreProc")
link("@preproc_include", "PreProc")
link("@include", "PreProc")
link("@keyword.directive", "PreProc")
link("@keyword.import", "PreProc")

-- Markdown inline links
hi("@markup.link.label.markdown_inline", { cterm = "NONE" })

-- Variables y LSP
force_hi("@variable.builtin", { fg = "#8aa19a" })
force_hi("@lsp.typemod.variable.defaultLibrary.typescript", { fg = "#c6cfcc" })

-- HTML tags
force_hi("@tag.html", { fg = "#a7ccb4" })
force_hi("@tag.delimiter.html", { fg = "#b5bdb8" })
force_hi("@tag.attribute.html", { fg = "#a3ada7" })
hi("@tag.builtin.tsx", { fg = "#a7ccb4" })

-- TSX tags
hi("@tag.tsx", { fg = "#a7ccb4" })
force_hi("@tag.delimiter.tsx", { fg = "#b5bdb8" })

-- Additional useful Tree-sitter groups
link("@function.call", "Function")
link("@keyword.function", "Statement")
link("@constructor", "Type")
link("@parameter", "Identifier")
link("@constant", "Constant")
link("@punctuation.bracket", "Delimiter")
link("@punctuation.delimiter", "Delimiter")
-- ─────────────────────────────────────────────────────────────
-- Al final de colors/custom-newest.lua

