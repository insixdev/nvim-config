-- ~/.config/nvim/lua/custom/highlights.lua
local M = {}

M.highlights = {
  ["@type"]        = { fg = "#D9B08C", bold = true },
  ["@type.builtin"]= { fg = "#C4A69F", bold = true },

  ["@keyword"]     = { fg = "#A68DCD", bold = true },

  ["@function"]    = { fg = "#F29E74", bold = true },
  ["@function.builtin"] = { fg = "#F29E74", italic = true },
  ["@method"]      = { fg = "#F299C2", italic = true },

  ["@number"]      = { fg = "#F2C38F" },
  ["@string"]      = { fg = "#B7D7C3" },

  ["@operator"]    = { fg = "#D49982", bold = true },

  ["@comment"]     = { fg = "#A69F93", italic = true },

  ["@preproc"]     = { fg = "#F2E394", bold = true },
}

return M
