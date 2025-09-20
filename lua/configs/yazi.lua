
return {
  "mikavilpas/yazi.nvim",
  version = "*", -- la versión más reciente estable
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  keys = {
    { "<leader>-", mode = { "n", "v" }, "<cmd>Yazi cwd<cr>", desc = "en la ultima ss"},
    { "_", "<cmd>Yazi<cr>", desc = "abre actual" },
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
