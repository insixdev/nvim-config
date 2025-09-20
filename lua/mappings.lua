require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

-- Busca carpetas con fzf
vim.api.nvim_set_keymap("n", "<leader>fd",
  ":call fzf#run({'source': 'fd --type d', 'sink': 'edit'})<CR>",
  { noremap = true, silent = true })
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

vim.api.nvim_set_keymap(
  'n',
  '<leader>fg',
  ":lua require('telescope.builtin').find_files({ search_file = vim.fn.expand('<cword>') })<CR>",
  { noremap = true, silent = true }
)


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- Este comando se cargará cada vez que inicies Neovim
vim.api.nvim_create_user_command('R', function(opts)
  vim.cmd.split()
  vim.cmd.terminal(opts.args)
end, { nargs = '*' })

vim.keymap.set("n", "<C-A-a>", ":R ")
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

vim.keymap.set("n", "Ñ", ":tabprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "ñ", ":tabNext<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-A-q>", ":tabclose<CR>", { noremap = true, silent = true })

vim.keymap.set("t", "|", [[<C-\><C-n>]], { noremap = true })

vim.keymap.set("n", "gL", ":lua vim.diagnostic.setloclist()<CR>", { noremap = true })
--
-- vim.defer_fn(function()
--   vim.cmd("colorscheme sakura")
-- end, 2000) -- 2000 ms = 2 segundos
--
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'X', ':bd<CR>', { noremap = true, silent = true })
