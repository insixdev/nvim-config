return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {import ="configs.auto-save"},

  {import ="configs.harpoon"},

  {import ="configs.yazi"},
  {import ="configs.flash"},
  {import ="configs.bullets"},
  {import ="configs.obsidian"},


  {import ="configs.bullets"},
  {import ="configs.bullets"},
  {import ="configs.lazy-git"},
  {import ="configs.gitsigns"},
  {import = "configs.dispatch"},
  {import = "configs.render-markdown"},
  {
    import = "configs.oil"
  },

  {import = "configs.blank-line"},

  {import ="configs.themes"},
  {import = "configs.nvim-autopairs"},
  {import ="configs.nvim-saga"},

  {import ="configs.statuscol"},
  {import ="configs.ufo"},


  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require "configs.lspconfig"
  --   end,
  -- },
  --
  -- -- Mason
  -- {
  --   "williamboman/mason.nvim",
  --   opts = function()
  --     return require "configs.mason"
  --   end,
  -- },
  --
  -- -- Mason + LSP integration
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   dependencies = { "mason.nvim", "nvim-lspconfig" },
  --   config = function()
  --     require("mason-lspconfig").setup({
  --       ensure_installed = {
  --         "rust_analyzer",
  --         "clangd", 
  --         "pyright",
  --         "tsserver",
  --         "html",
  --         "cssls",
  --         "lua_ls",
  --       },
  --       automatic_installation = true,
  --     })
  --   end,
  -- },

  -- Rust tools específico
  -- Tu cmp existente
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require "configs.cmp"
    end,
  },
  {
    import = "configs.treesitter"
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  --
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
