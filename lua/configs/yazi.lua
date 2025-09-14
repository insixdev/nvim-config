
return {
  "mikavilpas/yazi.nvim",
  version = "*", -- la versión más reciente estable
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  keys = {
    { "<leader>-", mode = { "n", "v" }, "<cmd>Yazi<cr>", desc = "Open Yazi (actual file)" },
    { "<leader>cw", "<cmd>Yazi cwd<cr>", desc = "Open file manager en cwd" },
    { "<c-up>", "<cmd>Yazi toggle<cr>", desc = "Toggle último session de yazi" },
  },
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
    -- otras opciones posibles aquí
  },
  init = function()
    -- si usas open_for_directories = true, puede ser útil desactivar netrw
    vim.g.loaded_netrwPlugin = 1
  end,
}
