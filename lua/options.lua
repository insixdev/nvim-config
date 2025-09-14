require "nvchad.options"

vim.opt.conceallevel = 2
vim.o.swapfile = false       -- Desactiva archivos swap
vim.o.writebackup = false    -- Desactiva backup al guardar
-- add yours here!
vim.wo.relativenumber = true
vim.opt.termguicolors = false
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!


vim.opt.wildmenu = true
vim.g.neovide_font = "Hack:h12"  -- Fuente y tamaño
vim.g.neovide_antialiasing = true
vim.g.neovide_cursor_antialiasing = true

vim.o.termguicolors = true

vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = -1
vim.opt.foldenable = true
vim.opt.foldmethod= "indent"

-- En tu init.lua o dentro de autocmds
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.opt_local.shiftwidth = 3 -- cuántos espacios al indentar
    vim.opt_local.tabstop = 3     -- ancho del tab visual
    vim.opt_local.softtabstop = 3 -- para <Tab> en insert mode
  end,
})
