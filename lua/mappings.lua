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
-- no se para que pero interferia en neotree
-- vim.api.nvim_create_autocmd("BufEnter", {
--     callback = function()
--         require("ibl").refresh()
--     end
-- })

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
  ":Lspsaga goto_definition<CR>",
  { noremap = true, silent = true, desc =  "Telescope LSP definitions" } 
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
  -- resizear para que sea mas baja
  vim.cmd.resize(10)
  vim.cmd.terminal(opts.args)
end, { nargs = '*' })

vim.api.nvim_create_user_command('D', function(opts)
  -- resizear para que sea mas baja
  vim.cmd("Dispatch" .. opts.args)
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

-- vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', {   silent = true })
-- vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious<CR>', {  silent = true })
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
vim.keymap.set("n", "<C-S-j>",    ":resize +2<CR>")
vim.keymap.set("n", "<C-S-k>",  ":resize -2<CR>")

-- aumentar/disminuir ancho
vim.keymap.set("n", "<C-S-l>",  ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-S-h>", ":vertical resize +2<CR>")

vim.api.nvim_create_autocmd("BufEnter", { 
  callback = function()
    local ft = vim.bo.filetype
    -- Solo asignar Tab si NO es un buffer de plugin
    -- print("Autocmd BufEnter fired! Filetype: " .. vim.bo.filetype)  -- COMENTADA O ELIMINADA
    
    if ft ~= "yazi" and ft ~= "fzf" and ft ~= "oil" then
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

vim.keymap.set("n", "<A-c>", ":copen<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "c", ":tabprevious<CR>", { noremap = true, silent = true })
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
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "c", "cpp" },
--   command = "setlocal makeprg=gcc\\ %\\ -o\\ %<"
-- })
--
--

vim.keymap.set("n", "<M-f>", ":lua browse_dirs()<CR>", { noremap = true, silent = true })

if vim.g.neovide then
  -- Asegúrate de tener una fuente por defecto
  if vim.o.guifont == "" then
    vim.o.guifont = "Hack:h14"
  end

  -- Zoom in
  vim.keymap.set('n', '<C-=>', function()
    local font = vim.o.guifont
    local size = tonumber(font:match("h(%d+)")) or 14  -- fallback a 14 si es nil
    size = size + 1
    vim.o.guifont = font:gsub("h%d+", "h"..size)
  end, { desc = "Neovide Zoom In" })

  -- Zoom out
  vim.keymap.set('n', '<C-->', function()
    local font = vim.o.guifont
    local size = tonumber(font:match("h(%d+)")) or 14  -- fallback a 14 si es nil
    size = size - 1
    vim.o.guifont = font:gsub("h%d+", "h"..size)
  end, { desc = "Neovide Zoom Out" })
end
-- fyler lo agarrare mas adelant-- fyler lo agarrare mas adelantee
-- local fyler = require("fyler")
-- vim.keymap.set("n", "<A-e>", ":Fyler<CR>", { desc = "Open Fyler View" })
-- fyler.setup({
--   mappings = {
--     ["<C-e>"] = "GotoParent",
--   },
--
-- })
-- vim.keymap.set("n", "<A-S-e>",function() fyler.open({ kind = "split_left_most" }) end,  { desc = "Open Fyler View" })
--
vim.keymap.set("n", "<A-r>", ":exe @:<CR>", { desc = "Run last command" })
-- Or via lua api
vim.opt.verbose = 0

--
-- vim.keymap.set("n", "gc", ":Lspsaga outline<CR>", { desc = "Open Fyler View" })
-- para debug
vim.api.nvim_create_user_command('BufExec', function(opts)
  local output = vim.fn.execute(opts.args)
  vim.cmd('enew')
  vim.bo.buftype = 'nofile'
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(output, '\n'))
end, { nargs = '+' })

vim.keymap.set("n", "<A-g>", ":CodeDiff<CR>", { desc = "Open CodeDiff vscode like View" })

