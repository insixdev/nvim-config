require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set
map("n", ",", ";")

map("n", ",", ";")
map("i", "jk", "<ESC>")

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

map("n", "<C-a>", "<CMD>colorscheme sakura<CR>")
map("n", "<esc><esc>", "<CMD>q<CR>")

vim.lsp.inlay_hint.enable(true)
-- ~/.config/nvim/lua/colors.lua
local current = vim.g.colors_name  -- obtiene el colorscheme activo

vim.keymap.set(
  "n",
  "<leader>u",
  '<Esc>:%bdelete|edit #|normal`"<Return>',
  { desc = "Delete other buffers but the current one" }
)
--
-- vim.defer_fn(function()
--   vim.cmd("colorscheme sakura")
-- end, 2000) -- 2000 ms = 2 segundos
