return {
  {import = "configs.snacks"},
  {import = "configs.neo-tree"},
  {import = "configs.snacks"},
  {import = "configs.difs"},
  { import = "configs.zen"},
  { "hrsh7th/nvim-cmp", enabled = false },
  { "hrsh7th/cmp-buffer", enabled = false },
  { "hrsh7th/cmp-path", enabled = false },
  { "hrsh7th/cmp-nvim-lsp", enabled = false },
  { "saadparwaiz1/cmp_luasnip", enabled = false },
  { import = "configs.buffer-list" },
  --{ import = "configs.ui" },
  {
    import = "configs.blinkcmp"
  },
{
  "hedyhli/outline.nvim",
    lazy = false,
  config = function()
    -- Example mapping to toggle outline
    vim.keymap.set("n", "gc", "<cmd>Outline<CR>",
      { desc = "Toggle Outline" })

    require("outline").setup {
      -- Your setup opts here (leave empty to use defaults)
    }
  end,
},
  {

    import = "configs.fuzzy",
  },
  {
    import = "configs.amp" },
  {
    import = "configs.incline",

  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    import = "configs.windsurf",
  },
  {
    import = "configs.jabs",
  },
  -- {
  --   import = "configs.lines",
  -- },
  {
    lazy= false,
    "grddavies/tidal.nvim",
    opts = {
      -- Your configuration here
      -- See configuration section for defaults
    },
    -- Recommended: Install TreeSitter parsers for Haskell and SuperCollider
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = { ensure_installed = { "haskell", "supercollider" } },
    },
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  { "savq/melange-nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "blazkowolf/gruber-darker.nvim" },
  { import = "configs.auto-save" },


  {
    "tiagovla/scope.nvim",
    lazy = false,
    config = function()
      local scope = require "scope"
      scope.setup({
        highlight_current_scope = true, -- opcional: resalta el scope actual
        show_tabline = true,
        tabline = {
          enable = true,
          always_show_tabs = true,
        },
      })
      -- Arreglo: volver a configurar scope al crear un nuevo tab
      vim.api.nvim_create_autocmd("TabNewEntered", {
        callback = function()
          -- vuelve a aplicar aislamiento por tab
          scope.setup({
            highlight_current_scope = true,
            show_tabline = true,
            tabline = {
              enable = true,
              always_show_tabs = true,
            },
          })
        end,
      })
    end,
  },
  {

    lazy = false,
    "junegunn/fzf",
    build = "./install --bin",
  },
  {
    lazy = false,
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
  },
  { import = "configs.lualine" },
  { import = "configs.yazi" },
  { import = "configs.flash" },

  { import = "configs.base16" },
  { import = "configs.treesj" },
  -- { import = "configs.obsidian" },

  { import = "configs.surround" },
  { import = "configs.markdown-preview" },
  { import = "configs.lazy-git" },
  { import = "configs.gitsigns" },
  { import = "configs.dispatch" },
  { import = "configs.render-markdown" },
  {
    import = "configs.oil",
  },

  { import = "configs.blank-line" },

  { import = "configs.themes" },
  { import = "configs.nvim-autopairs" },
  { import = "configs.nvim-saga" },

  { import = "configs.statuscol" },
  { import = "configs.ufo" },

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
  -- {
  --   import = "plugins.cmp",
  {
    import = "configs.treesitter",
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
  {
    "vague-theme/vague.nvim",
  },
  {

    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        style = "storm",
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          sidebars = "dark",
          floats = "dark",
        },
      })
    end,
  },
  -- En tu init.lua o donde cargues tu config
    {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({ disable_background = true })

      vim.cmd("colorscheme rose-pine")
      ColorMyPencils()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },
{
    dir = vim.fn.stdpath("config") .. "/lua",
    name = "custom-newest",
    priority = 1000,
    config = function()
      require("custom-newest").setup()
      vim.cmd.colorscheme("custom-newest")
    end,
  },

}


