return {
  priority = 1000,     -- que se aplique antes que otros
  lazy = false,
  { "anAcc22/sakura.nvim",
    dependencies = "rktjmp/lush.nvim",
    config = function()
      vim.opt.background = "dark" -- or "light"
    end
  },
{
  "kvrohit/rasmus.nvim",
    lazy =false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme rasmus]])
  end,
},

  {
    "thesimonho/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    "mellow-theme/mellow.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- NO hay setup(), solo aplicá el colorscheme
      vim.cmd.colorscheme("mellow")
    end,  }
}
