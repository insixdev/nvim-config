
local M = {}

function M.winbar_icon()
  local devicons = require("nvim-web-devicons")
  local filename = vim.fn.expand("%:t")
  local icon = devicons.get_icon(filename, nil, { default = true })
  return icon or ""
end

-- HACERLA GLOBAL:
_G.WinbarIcon = M.winbar_icon

return M

