
return {
  event = "VeryLazy",
  "ahkohd/buffer-sticks.nvim",
  keys = {
    {
      "<leader>ph",
      function()
      BufferSticks.list({ action = "close" })
      end,
      desc = "Buffer close",
    },
    {
      "<leader>jh",
      function()
        BufferSticks.jump()
      end,
      desc = "Jump to buffer",
    },

  },
  config = function()
    require("buffer-sticks").setup({
      offset = { x = 0, y = 0 },    -- Position offset (positive moves inward from right edge)
      padding = { top = 0, right = 1, bottom = 0, left = 1 }, -- Padding inside the float
      active_char = "──",           -- Character for active buffer
      inactive_char = " ─",         -- Character for inactive buffers
      alternate_char = " ─",        -- Character for alternate buffer
      active_modified_char = "──",  -- Character for active modified buffer (unsaved changes)
      inactive_modified_char = " ─", -- Character for inactive modified buffers (unsaved changes)
      alternate_modified_char = " ─", -- Character for alternate modified buffer (unsaved changes)
      transparent = true,           -- Remove background color (shows terminal/editor background)
      auto_hide = true,                -- Auto-hide when cursor is over float (default: true)
      label = { show = "list" },       -- Label display: "always", "list", or "never"
      list = {
        show = { "filename", "space", "label" }, -- List mode display options
        active_indicator = "•",       -- Symbol for selected item in list mode (arrow navigation)
        keys = {
          close_buffer = "<C-q>",      -- Key to close buffer in list mode
          move_up = "<Up>",           -- Key to move selection up in list mode
          move_down = "<Down>",       -- Key to move selection down in list mode
        },
        filter = {
          title = "➜ ",                -- Filter prompt title when input is not empty
          title_empty = "Filter",       -- Filter prompt title when input is empty
          active_indicator = "•",       -- Symbol for selected item in filter mode
          fuzzy_cutoff = 100,           -- Cutoff value for fuzzy matching algorithm (default: 100)
          keys = {
            enter = "/",                -- Key to enter filter mode
            confirm = "<CR>",           -- Key to confirm selection
            exit = "<Esc>",             -- Key to exit filter mode
            move_up = "<Up>",           -- Key to move selection up
            move_down = "<Down>",       -- Key to move selection down
          },
        },
      },
      preview = {
        enabled = true,                    -- Enable buffer preview during navigation
        mode = "current",                    -- Preview mode: "float", "current", or "last_window"
        float = {
          position = "right",              -- Float position: "right", "left", or "below"
          width = 0.5,                     -- Width as fraction of screen (0.0 to 1.0)
          height = 0.8,                    -- Height as fraction of screen (0.0 to 1.0)
          border = "single",               -- Border style: "none", "single", "double", "rounded", "solid", "shadow"
          title = nil,                     -- Window title: nil/true = filename, false = no title, "string" = custom (default: nil/filename)
          title_pos = "center",            -- Title position: "left", "center", "right"
          footer = nil,                    -- Window footer (string or nil)
          footer_pos = "center",           -- Footer position: "left", "center", "right"
        },
      },
      -- winblend = 100,                    -- Window blend level (0-100, 0=opaque, 100=fully blended)
      -- filter = {
      --   filetypes = { "help", "qf" },    -- Exclude by filetype (also: "NvimTree", "neo-tree", "Trouble")
      --   buftypes = { "terminal" },       -- Exclude by buftype (also: "help", "quickfix", "nofile")
      --   names = { ".*%.git/.*", "^/tmp/.*" },  -- Exclude buffers matching lua patterns
      -- },
      highlights = {
        active = { fg = "#bbbbbb" },
        alternate = { fg = "#888888" },
        inactive = { fg = "#333333" },
        active_modified = { fg = "#ffffff" },
        alternate_modified = { fg = "#dddddd" },
        inactive_modified = { fg = "#999999" },
        label = { fg = "#aaaaaa", italic = true },
        filter_selected = { fg = "#bbbbbb", italic = true },
        filter_title = { fg = "#aaaaaa", italic = true },
        list_selected = { fg = "#bbbbbb", italic = true },
      }
    })
    BufferSticks.show()
  end,
}
