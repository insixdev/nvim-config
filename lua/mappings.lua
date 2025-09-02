require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
map("n", ",", ";")

map("n", ",", ";")
map("i", "jk", "<ESC>")

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Abrir Oil en el dir actual" })    
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
