require "nvchad.options"
require("custom.fzf")
vim.opt.conceallevel = 2
vim.o.swapfile = false       -- Desactiva archivos swap
vim.o.writebackup = false    -- Desactiva backup al guardar
-- add yours here!
vim.wo.relativenumber = true

vim.o.showtabline = 0  -- 0 = nunca mostrar, 1 = solo si hay >1 tab, 2 = siempre mostrar
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

local actions = require("oil.actions")
local oil= require("oil")




local actions = require("oil.actions")
local oil = require("oil")
-- joder tio cost
vim.api.nvim_create_autocmd("DirChanged", {
  callback = function()
    -- Simula una "promesa": esperar a que Neovim termine la operación
    vim.schedule(function()
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[buf].filetype == "oil" then
          oil.open(vim.fn.getcwd())
          vim.api.nvim_buf_call(buf, function()
            -- Primero refresca la lista de archivos
            actions.refresh.callback({ force = true })
            -- Luego abre el cwd actual
          end)
        end
      end
    end)
  end,
})
-- Mapear _ solo en buffers de Oil
-- Mapear _ solo en buffers de Oil
vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil",
  callback = function()
    vim.keymap.set("n", "_", "<cmd>Yazi toggle<cr>", { buffer = true, desc = "Toggle Yazi desde Oil" })
  end,
})

require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {
    Keyword = { fg = "#859285", bold = true },
    Type    = { fg = "#ebc96c", italic = true },
  },
  dim_inactive = false,
  transparent_mode = true,
})
