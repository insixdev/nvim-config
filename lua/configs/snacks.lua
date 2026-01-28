return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      enabled = false,
      auto_resize = false,
    },
    input = { enabled = true },
    notifier = { enabled = true, timeout = 5000 },
    profile = { enabled = false },
    quickfile = { enabled = true },
    scope = { enabled = true, highlight = "SnacksIndentScope", underline = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        sources = {
          buffers = {
            win = {
              list = {
                keys = {
                  ["<C-x>"] = "delete",  -- Ctrl+x para cerrar buffer
                  ["dd"] = "delete",      -- dd para cerrar buffer
                  ["<C-d>"] = "delete",   -- O Ctrl+d si prefieres
                },
              },
            },
          },
          explorer = {
            enable = false,
          },
        },
      },
    },

      indent = {
        enabled = false,
        animate = {
          enabled = false,
          duration = 20,
        },

        scope = {
          enabled = true,
          underline = false,
          end_underline = true,
          highlight = "SnacksIndentScope",
        },
      },

      highlight = {
        scope = {
          enabled = true,
          blend = 0.5,
          priority = 1200,
      },
    },
  },


  keys = {
    -- Picker commands con <leader>j
    { "<leader>j<space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>jb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>jg", function() Snacks.picker.git_diff() end, desc = "Git Diff" },
    { "<leader>jl", function() Snacks.picker.git_log() end, desc = "Git Log" },

    { "<leader>gg", function() Snacks.lazygit() end, desc = "lazygit" },
      { "<leader>jf", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>jD", function() Snacks.picker.code_actions() end, desc = "Diagnostics" },
    

    -- Buffers
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },

    -- Otras funcionalidades
    { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    { "<leader>;", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },

    -- LSP
    { "gn", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },

      },
}
