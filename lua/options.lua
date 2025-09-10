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

vim.cmd("colorscheme sakura")
