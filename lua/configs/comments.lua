
return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- config = function()
    --   vim.api.nvim_create_autocmd("FileType", {
    --     pattern = "oil",
    --     callback = function(args)
    --       vim.b[args.buf].todo_comments_disable = true
    --     end,
    --   })
    -- end,
    opts = {
      -- sources = {
      --   file = true,
      --   lsp = true,
      --   treesitter = true,
      -- },
      signs = true,

      search = {
        command = "rg",
        exclude = { "oil" },
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        -- regex that will be used to match keywords.
        -- don't replace the () placeholder
        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
        -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
      },
      gui_style = {
        fg = "NONE", -- The gui style to use for the fg highlight group.
        bg = "BOLD", -- The gui style to use for the bg highlight group.
      },
      merge_keywords = true, -- when true, custom keywords will be merged with the defaults
      -- highlighting of the line containing the todo comment
      -- * before: highlights before the keyword (typically comment characters)
      -- * keyword: highlights of the keyword
      -- * after: highlights after the keyword (todo text)
      highlight = {
        multiline = true, -- enable multine todo comments
        exclude = {"oil"},
        multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
        before = "", -- "fg" or "bg" or empty
        keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
        after = "fg", -- "fg" or "bg" or empty
        -- pattern can be a string, or a table of regexes that will be checked
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
        -- pattern = { [[.*<(KEYWORDS)\s*:]], [[.*\@(KEYWORDS)\s*]] }, -- pattern used for highlightng (vim regex)
        comments_only = true, -- uses treesitter to match keywords in comments only
        max_line_len = 400, -- ignore lines longer than this
        throttle = 200,
      },
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "#fbbbb0" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "#ffcc66" },
        CONV= { icon = " ", color = "#cc6c66" },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
    }
  },
  {

    lazy = false,
    "jameswolensky/marker-groups.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required
      "ibhagwan/fzf-lua", -- Optional: fzf-lua picker
      "folke/snacks.nvim", -- Optional: Snacks picker
      "nvim-telescope/telescope.nvim", -- Optional: Telescope picker
      -- mini.pick is part of mini.nvim; this plugin vendors mini.nvim for tests,
      -- but you can also install mini.nvim explicitly to use mini.pick system-wide
      -- "nvim-mini/mini.nvim",
    },
    config = function()
      require("marker-groups").setup({
        -- Default picker is 'vim' (built-in vim.ui)
        -- Accepted values: 'vim' | 'snacks' | 'fzf-lua' | 'mini.pick' | 'telescope'
        picker = 'telescope',
        keymaps = {
          enabled = true,
          prefix = "<leader>m",
          mappings = {
            marker = {
              add = { suffix = "A", mode = { "n", "v" }, desc = "Add marker", opts = { noremap = true, silent = true } },
              edit = { suffix = "e", desc = "Edit marker at cursor" },
              delete = { suffix = "d", desc = "Delete marker at cursor" },
              list = { suffix = "l", desc = "List markers in buffer" },
              info = { suffix = "i", desc = "Show marker at cursor" },
            },
            group = {
              create = { suffix = "gc", desc = "Create marker group" },
              select = { suffix = "gs", desc = "Select marker group" },
              list = { suffix = "gl", desc = "List marker groups" },
              rename = { suffix = "gr", desc = "Rename marker group" },
              delete = { suffix = "gd", desc = "Delete marker group" },
              info = { suffix = "gi", desc = "Show active group info" },
              from_branch = { suffix = "gb", desc = "Create group from git branch" },
            },
            view = { toggle = { suffix = "v", desc = "Toggle drawer marker viewer" } },

          },
        }, 
      })
    end,

  },
}

