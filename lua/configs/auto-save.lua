return {
  "pocco81/auto-save.nvim",
  lazy = false,
  config = function()
    local autosave = require("auto-save")

    autosave.setup {
      enabled = true,
      execution_message = { message = function() return "" end },
      trigger_events = {"InsertLeave", "TextChanged"}, -- guarda al salir de insert o al modificar
      condition = function(buf)
        return vim.bo[buf].modifiable and vim.bo[buf].filetype ~= "gitcommit"
      end,
    }

    -- Timer que guarda cada segundo mientras estás en modo normal
--    local timer = vim.loop.new_timer()
    -- timer:start(
    --   1000, -- 1000ms = 1s
    --   1000,
    --   vim.schedule_wrap(function()
    --     if vim.fn.mode() == "n" then
    --       if vim.bo.modified then
    --         vim.cmd("silent! write")
    --       end
    --     end
    --   end)
    -- )
  end,
}

