 return {

    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim", "nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "rust_analyzer",
          "clangd",
          "zls",
          "pyright",
          "ts_ls",
          "html",
          "cssls",
          "lua_ls",
        },
        automatic_installation = true,
      })
    end,
  }
