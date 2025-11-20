return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    profile = { enabled = true },
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
            win = {
              list = {
                keys = {
                  ["<space>"] = "toggle",  -- Seleccionar/deseleccionar archivos
                },
              },
            },
          },
        },
      },
    },

      indent = {
        enabled = true,
        animate = {
          enabled = true,
          duration = 40,
        },
        scope = {
          enabled = true,
          underline = true,
          end_underline = true,
          highlight = "SnacksScopeBorder",
        },
      },

      highlight = {
        scope = {
          enabled = true,
          blend = 0.12,
          priority = 1200,
        },
      },
    },

    keys = {
      -- Picker commands con <leader>j
      { "<leader>j<space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
      { "<leader>jb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
      { "<leader>jf", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>jd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },

      -- Buffers
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },

      -- Otras funcionalidades
      { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
      { "<leader>;", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },

      -- LSP
      { "gn", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },

      -- Profiler
      { "<leader>pp", function() Snacks.toggle.profiler() end, desc = "Toggle Profiler" },
      { "<leader>ph", function() Snacks.toggle.profiler_highlights() end, desc = "Toggle Profiler Highlights" },
      { "<leader>ps", function() Snacks.profiler.scratch() end, desc = "Profiler Scratch Buffer" },
    },
  }
