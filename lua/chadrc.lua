---@type ChadrcConfig
local M = {}

 M.base46 = {
  theme = "kanagawa-dragon",
  hl_override = {
    ["@type"]        = { fg = "#ebbc2f", bold = false},
    ["@type.builtin"]= { fg = "#ebbc2f", bold = false},
    Keyword = {fg = "#D9B033"},
 Type = {fg = "#ffe1c7"},
    ["@type.definition"] = { fg ="#C4A69F", bold = false},
    ["@structure"]     = { fg = "#A68DCD", bold = true },

    ["@keyword.return"]     = { fg = "#bd5757", bold = true },
    ["@keyword.repeat"]     = { fg = "#bd5757", bold = true },
    ["@function"]    = { fg = "#ffd1a6", italic = true },
    ["@function.builtin"] = { fg = "#E1D5CC", italic = true },
    ["@method"]      = { fg = "#F2C38F", italic = true },
    ["@constructor"] = {fg = "#fffDD2"},
    ["@variable.parameter"] = {fg = "#fffDD2"},
    ["@number"]      = { fg = "#F2C38F" },
    ["@string"]      = { fg = "#B7D7C3" },

    ["@lsp.type.class"]    = { fg = "#E1D5CC", bold = true },

    ["@operator"]    = { fg = "#D49982", bold = true },
    ["@comment"]     = { fg = "#A69F93", italic = true },

    ["@include"]     = { fg = "#e0326b" },
    ["@preproc"]     = { fg = "#E1D5CC" },
  },

}
-- M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    lazyload =true
  }
}

return M
