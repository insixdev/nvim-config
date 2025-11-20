return  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
  opts = {
      -- Toggle the profiler highlights
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = {
      enabled = false,
      win = {
        keys = {
            ["<space>"] = "explorer_select",
          },
      },

    },
    input = { enabled = true },
    picker = { enabled = true,
      picker = {
        enabled = true,
        }
      },
    -- GITGUBBBBBBBBBBBBBBBBBBBBB
    notifier = { enabled = true },
    profile = { enabled = true },
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
    { "<leader>jb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>jf", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    { "<leader>;",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    { "gn", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "<A-s>p", function() Snacks.profiler.scratch() end, desc = "Profiler Scratch Bufer" },
    { "<M-s>d",function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>pp", function() Snacks.toggle.profiler() end, desc = "Toggle Profiler" },
    { "<leader>ph", function() Snacks.toggle.profiler_highlights() end, desc = "Toggle Profiler Highlights" },

  },
}
