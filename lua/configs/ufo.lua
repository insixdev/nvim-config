-- lua/custom/configs/ufo.lua

-- Definir la función ANTES del return
local function fold_handler(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  -- Cuando UFO llama esta función, el fold siempre está cerrado
  -- Usamos ▸ para folds cerrados (que es el caso aquí)
  local arrow = "▸"  -- fold cerrado
  local suffix = (" %s %d "):format(arrow, endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      table.insert(newVirtText, { chunkText, chunk[2] })
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, "MoreMsg" })  -- Highlight del arrow
  return newVirtText
end


-- lua/custom/plugins/ufo.lua
return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  lazy = false,
  init = function()
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = -1
    vim.o.foldenable = true

    -- Definir signos de fold
  end,
  config = function()
    local ufo = require("ufo")
    ufo.setup({
      open_fold_hl_timeout = 150,
      close_fold_kind_for_ft = { "imports", "comment" },
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
      fold_virt_text_handler = fold_handler,
      preview = {
        win_config = {
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:Normal",
          winblend = 0,
        },
        mappings = {
          scrollU = "<C-u>",
          scrollD = "<C-d>",
        },
      },
    })

    -- Keymaps
    vim.keymap.set("n", "zR", ufo.openAllFolds, { desc = "Abrir todos los folds" })
    vim.keymap.set("n", "zM", ufo.closeAllFolds, { desc = "Cerrar todos los folds" })
    vim.keymap.set("n", "K", function()
      local winid = ufo.peekFoldedLinesUnderCursor()
      if not winid then
        vim.lsp.buf.hover()
      end
    end, { desc = "Peek fold o hover" })
  end,
}

