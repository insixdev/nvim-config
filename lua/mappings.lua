require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

-- Siempre repetir f/t como en Vim clásico
map("i", "jk", "<ESC>")

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    require("lualine").refresh()
  end,
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Abrir Oil en el dir actual" })    

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        require("ibl").refresh()
    end
})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- Este comando se cargará cada vez que inicies Neovim
vim.api.nvim_create_user_command('R', function(opts)
  vim.cmd.split()
  vim.cmd.terminal(opts.args)
end, { nargs = '*' })
-- Reemplaza tu keymap problemático con este:
vim.keymap.set("n", "<C-a>", function()
  require("telescope.builtin").colorscheme({
    enable_preview = true,
  })
end, { desc = "Telescope Colorscheme Picker" })
map("n", "<esc><esc>", "<CMD>q<CR>")

vim.lsp.inlay_hint.enable(true)
-- ~/.config/nvim/lua/colors.lua
local current = vim.g.colors_name  -- obtiene el colorscheme activo
-- treesj config keymap
vim.keymap.set("n", "gS", require("treesj").split, { desc = "Split code block" })
vim.keymap.set("n", "gJ", require("treesj").join,  { desc = "Join code block" })
vim.keymap.set(
  "n",
  "<leader>u",
  '<Esc>:%bdelete|edit #|normal`"<Return>',
  { desc = "Delete other buffers but the current one" }
)
vim.defer_fn(function()
  vim.cmd("Lazy load lualine.nvim")
end, 100) -- 2000 ms = 2 segundos

-- Usando vim.keymap.set
vim.keymap.set("n", "<C-t>", ":tabnew<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-h", ":tabprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", ":tabNext<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-A-q>", ":tabclose<CR>", { noremap = true, silent = true })
--
-- vim.defer_fn(function()
--   vim.cmd("colorscheme sakura")
-- end, 2000) -- 2000 ms = 2 segundos
