
return {
  {
    "echasnovski/mini.indentscope",
    version = false, -- siempre la última versión
    event = "BufReadPre",
    config = function()
      local indentscope = require("mini.indentscope")

      indentscope.setup({
        symbol = "┆",
        options = { try_as_border = true },
        draw = {
          -- Animación cúbica (suave, efecto in/out)
          animation = indentscope.gen_animation.cubic({
            easing = "in-out",
            duration = 30, -- cuanto mayor, más lento
            unit = "step",
          }),
        },
      })

      -- Color blanco opaco para la guía de indentación
      vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#b3b3b3", nocombine = false})

      -- Desactivar en buffers especiales
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "NvimTree", "lazy", "Trouble" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}

