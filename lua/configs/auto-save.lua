
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
        local ft = vim.bo[buf].filetype
        local bt = vim.bo[buf].buftype

        -- excluir Oil y otros buffers especiales
        if ft == "oil" or ft == "gitcommit" or bt == "nofile" then
          return false
        end

        return vim.bo[buf].modifiable
      end,
    }
  end,
}

