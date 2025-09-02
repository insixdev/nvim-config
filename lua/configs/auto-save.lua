
return {
  "pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup {
      enabled = true, -- lo podés desactivar si querés
      execution_message = {
        message = function() return "" end,
      },
      trigger_events = {"InsertLeave", "TextChanged"},
      condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")
        return false
      end,
    }
  end,
}
