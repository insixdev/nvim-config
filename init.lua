vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"


vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "@preproc", { link = "PreProc" })
    vim.api.nvim_set_hl(0, "@preproc.include", { link = "PreProc" })
    vim.api.nvim_set_hl(0, "@include", { link = "PreProc" })
  end,
})

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

vim.g.incline_enabled = true,

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)


-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
require "options"

vim.schedule(function()
  require "mappings"
end)

