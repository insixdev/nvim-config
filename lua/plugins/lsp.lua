
return {
  priority = 2000,
  lazy = false,
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  config = function()
    require("configs.lspconfig")

  end,
}

