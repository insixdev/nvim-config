
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
  },
  config = function()
    -- Registrar parser c3 ANTES del setup
    local parser_config = require("nvim-treesitter.parsers")
    parser_config.c3 = {
      install_info = {
        url = "https://github.com/c3lang/tree-sitter-c3",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "c3",
    }

    vim.filetype.add({
      extension = {
        c3 = "c3",
      },
    })

    require("nvim-treesitter.config").setup({
      ensure_installed = {
        "lua", "vim", "vimdoc", "markdown", "markdown_inline",
        "bash", "c", "cpp", "rust", "python",
        "javascript", "typescript", "tsx",
        "html", "css", "json", "yaml", "toml",
        "go", "java", "c3",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = false },
    })
  end,
}

