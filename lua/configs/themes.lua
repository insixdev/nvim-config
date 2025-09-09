return {
priority = 1000,     -- que se aplique antes que otros
  lazy = false,
    "anAcc22/sakura.nvim",
    dependencies = "rktjmp/lush.nvim",
    config = function()
        vim.opt.background = "dark" -- or "light"
    end
}
