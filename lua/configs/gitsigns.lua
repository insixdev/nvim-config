
-- ~/.config/nvim/lua/plugins/gitsigns.lua
return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",  -- o lazy = false para cargar siempre
  opts = function()
    -- Obtener colores de NvChad
    local colors = require("base46").get_theme_tb("base_30")

    return {
      signs = {
        add          = { text = "▎", texthl = "GitSignsAdd", numhl = "GitSignsAddNr" },
        change       = { text = "▎", texthl = "GitSignsChange", numhl = "GitSignsChangeNr" },
        delete       = { text = "契", texthl = "GitSignsDelete", numhl = "GitSignsDeleteNr" },
        topdelete    = { text = "契", texthl = "GitSignsDelete", numhl = "GitSignsDeleteNr" },
        changedelete = { text = "▎", texthl = "GitSignsChange", numhl = "GitSignsChangeNr" },
        untracked    = { text = "▎", texthl = "GitSignsAdd", numhl = "GitSignsAddNr" },
      },

      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500,
        virt_text_pos = "eol",
      },
      current_line_blame_formatter = "<author>, <author_time:%R> • <summary>",

      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        -- Navegación entre hunks
        map("n", "]c", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(gs.next_hunk)
          return "<Ignore>"
        end, "Next Hunk")

        map("n", "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(gs.prev_hunk)
          return "<Ignore>"
        end, "Prev Hunk")

        -- Acciones
        map("n", "<leader>gs", gs.stage_hunk, "Stage Hunk")
        map("n", "<leader>gr", gs.reset_hunk, "Reset Hunk")
        map("v", "<leader>gs", function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end, "Stage Hunk")
        map("v", "<leader>gr", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end, "Reset Hunk")
        map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>gb", function() gs.blame_line { full = true } end, "Blame Line")
        map("n", "<leader>gd", gs.diffthis, "Diff This")
        map("n", "<leader>gD", function() gs.diffthis("~") end, "Diff This ~")
      end,
    }
  end,
  config = function(_, opts)
    require("gitsigns").setup(opts)
    -- Highlights usando base46 para los signos
    local colors = require("base46").get_theme_tb("base_30")
    vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.green })
    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors.yellow })
    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = colors.red })
  end,
}

