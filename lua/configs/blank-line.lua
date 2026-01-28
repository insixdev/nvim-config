
vim.api.nvim_set_hl(0, "Whitespace", { fg = "#404040", nocombine = true })
-- lua/custom/plugins/indent.lua
return {
  {
    "echasnovski/mini.move",
    lazy = false,
    version = false,
    config = function()
      require("mini.move").setup({
        mappings = {
          -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
          left = '<M-h>',
          right = '<M-l>',
          down = '<M-j>',
          up = '<M-k>',

          -- Move current line in Normal mode
          line_left = '<M-h>',
          line_right = '<M-l>',
          line_down = '<M-j>',
          line_up = '<M-k>',
        },     
      })
    end,
  },


  {

    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    lazy = false,
    config = function()
      local ibl = require("ibl")


      -- 2️⃣ Configuración del plugin
      ibl.setup({
        indent = {
          char = "│",--┆
        },
        whitespace = {
          highlight = { "Whitespace" },
          remove_blankline_trail = true,
        },
        scope = {
          enabled = false,
          char = "‧",
          show_start = false,
          show_end = true,
        }, -- si usás mini.indentscope // ENABLE para que remarque donde estoy luego hay otro plugin para ver la animacion:
      })

      -- 3️⃣ Re-aplicar al cambiar de colorscheme
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern ="*",
        callback = function()
          vim.api.nvim_set_hl(0, "Whitespace", { fg = "#555555", nocombine = true })
        end,
      })
    end,

  },
  {
    lazy = false,
    'HiPhish/rainbow-delimiters.nvim',
    config = function()
      local rainbow = require('rainbow-delimiters')

      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow.strategy['global'],
          vim = rainbow.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
    end,
  }
}
