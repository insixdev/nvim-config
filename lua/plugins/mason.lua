return {
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim", "nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "rust_analyzer",
          "clangd",
          "zls",
          "pyright",
          "lua_ls",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    -- En tu configuración de mason.nvim
    {
      "williamboman/mason.nvim",
      opts = {
        registries = {
          "github:mason-org/mason-registry",
          "github:Crashdummyy/mason-registry", -- OBLIGATORIO para roslyn
        },
      },
    }
  }
}
