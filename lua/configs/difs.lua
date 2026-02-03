
return {
  "esmuellert/codediff.nvim",
  lazy = false,
  dependencies = { "MunifTanjim/nui.nvim" },

config = function()
  require("codediff").setup({
    highlights = {
      line_insert = "GitSignsAdd",
      line_delete = "GitSignsDelete",
      char_insert = nil,
      char_delete = nil,
      char_brightness = nil,
    },
    diff = {
      disable_inlay_hints = true,
      max_computation_time_ms = 3000,
    },
    keymaps = {
      view = {
        next_hunk = "]h",
        prev_hunk = "[h",
        next_file = "]f",
        prev_file = "[f",
      },
      explorer = {
        select = "<CR>",
        hover = "K",
        refresh = "R",
        quit = "q",
      },
    },
  })
end,
}

