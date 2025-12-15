return {
  "pocco81/auto-save.nvim",
  lazy = false,
  config = function()
    local autosave = require("auto-save")

    autosave.setup {
      enabled = true,
      execution_message = { message = function() return "" end },
      trigger_events = {"InsertLeave", "TextChanged"},
      condition = function(buf)
        -- excluir buffer sin nombr
        if not vim.api.nvim_buf_is_valid(buf) then
          return false
        end
        local ft = vim.bo[buf].filetype
        local bt = vim.bo[buf].buftype

        -- excluir Oil y otros buffers especiales
        if ft == "oil" or ft == "gitcommit" or bt == "nofile" then
          return false
        end
        -- evitar que este en buffer de lsp-saga finder
        if ft == "sagafinder" then
          return false
        end

        return vim.bo[buf].modifiable
      end,
    }
  end,
}

