
-- lua/custom/plugins/indent.lua
return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    lazy = false,
    config = function()
      local ibl = require("ibl")

      -- 1️⃣ Definir highlight antes de setup
      vim.api.nvim_set_hl(0, "Whitespace", { fg = "#404040", nocombine = true })

      -- 2️⃣ Configuración del plugin
      ibl.setup({
        indent = {
          char = "┆",
          highlight = { "Whitespace" },
        },
        whitespace = {
          highlight = { "Whitespace" },
          remove_blankline_trail = false,
        },
        scope = { enabled = false }, -- si usás mini.indentscope
      })

      -- 3️⃣ Re-aplicar al cambiar de colorscheme
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern ="*",
        callback = function()
          vim.api.nvim_set_hl(0, "Whitespace", { fg = "#555555", nocombine = true })
        end,
      })
    end,
  }
