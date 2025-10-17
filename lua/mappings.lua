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
  'gG',
  ":lua require('telescope.builtin').find_files({ search_file = vim.fn.expand('<cword>') })<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n',
  'gF',
  ":lua require('telescope.builtin').live_grep({ default_text = vim.fn.expand('<cword>') })<CR>",
  { noremap = true, silent = true }
)

vim.keymap.set(
  {'n', 'v'},
  'gR',
  ":lua require('telescope.builtin').lsp_references()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  'gd',
  ":lua require('telescope.builtin').lsp_definitions()<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n',
  'gE',
  ":lua require('telescope.builtin').lsp_workspace_symbols()<CR>",
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

vim.keymap.set("n", "<C-A-q>", ":tabclose<CR>", { noremap = true, silent = true })

vim.keymap.set("t", "|", [[<C-\><C-n>]], { noremap = true })

vim.keymap.set("n", "gL", ":lua vim.diagnostic.setloclist()<CR>", { noremap = true })
--
-- vim.defer_fn(function()
--   vim.cmd("colorscheme sakura")
-- end, 2000) -- 2000 ms = 2 segundos
-- --

vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', {   silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious<CR>', {  silent = true })
--
vim.api.nvim_set_keymap('n', '<C-S-X>', '<C-w>q', { noremap = true, silent = true })

vim.keymap.set('n', '<C-x>', function()
    local cur = vim.api.nvim_get_current_buf()
    
    -- Si solo hay un buffer listado, cerramos la ventana
    local listed = vim.fn.getbufinfo({buflisted = 1})
    if #listed == 1 then
        vim.cmd('q')
        return
    end

    -- Moverse al buffer anterior
    vim.cmd('bp')  
    -- Borrar el buffer actual
    vim.cmd('silent! bd ' .. cur)
end, { noremap = true, silent = true })

-- aumentar/disminuir alto
vim.keymap.set("n", "<C-Down>",    ":resize +2<CR>")
vim.keymap.set("n", "<C-Up>",  ":resize -2<CR>")

-- aumentar/disminuir ancho
vim.keymap.set("n", "<C-Right>",  ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>")
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local ft = vim.bo.filetype
    -- Solo asignar Tab si NO es un buffer de plugin
    --
print("Autocmd BufEnter fired! Filetype: " .. vim.bo.filetype)
    if ft ~= "yazi" or ft ~= "fzf" or ft ~= "oil" then
      vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true, buffer = true })
      vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true, buffer = true })
    end
  end,
})
vim.keymap.set("n", "<C-c>", function()
  require("telescope.builtin").colorscheme({
    enable_preview = true,
  })
end, { desc = "Telescope Colorscheme Picker" })

vim.keymap.set({"n", "v", "i", "o"}, "<C-a>", "$", {noremap = true, silent = true})
vim.keymap.set("n", "<A-n>", ":NvimTreeToggle<CR>", {noremap = true, silent = true})

vim.keymap.set("n", "Ñ", ":tabprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "ñ", ":tabNext<CR>", { noremap = true, silent = true })
vim.defer_fn(function()
  vim.cmd("colorscheme custom")
end, 100)

vim.keymap.set(
  {'n', 'v'},
  'gr',
  ":lua vim.lsp.buf.rename()<CR>",
  { noremap = true, silent = true }
)

-- para que scope no se rompa y funcione
vim.keymap.set("n", "<C-w>t", ":tabnew | term<CR>", { noremap = true, silent = true })

-- Resize windows con Ctrl-A + hjkl
vim.api.nvim_set_keymap('n', '<C-A-h>', ':vertical resize -5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-A-l>', ':vertical resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-A-j>', ':resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-A-k>', ':resize -5<CR>', { noremap = true, silent = true })

