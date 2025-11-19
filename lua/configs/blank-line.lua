
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
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true, highlight = "SnacksIndentScope", underline = true,},
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      indent = {
        enabled = true,

        animate = {
          enabled = true,
          duration = 40 ,
        },
        scope = {
          enabled = true,

          underline = true,   -- subraya la primera línea del bloque
          --         underline_char = "─ .",
          end_underline = true, -- subraya la última línea del bloque

          highlight = "SnacksScopeBorder",
        },
      },
      highlight = {
        scope = {
          enabled = true,
          blend = 0.12, -- el "fade" suave del bloque
          priority = 1200,
        },
      },
    },
    keys = {
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<M-n>", function() Snacks.explorer() end, desc = "File Explorer", silent = true, nowait = true },
      { "<leader>jb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
      { "<leader>jb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>jf", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
      { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
      { "<leader>;",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
 { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" }

    }
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
          char = "·",--┆
          highlight = { "Whitespace" },
        },
        whitespace = {
          highlight = { "Whitespace" },
          remove_blankline_trail = true,
        },
        scope = { enabled = true, char = "", show_start = true, show_end = true}, -- si usás mini.indentscope
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
}
