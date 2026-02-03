return {
  lazy = false,
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
  },
  
  config = function()
    -- Verifica que el módulo existe antes de cargarlo
    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      vim.notify("nvim-treesitter not loaded yet", vim.log.levels.WARN)
      return
    end
    
    configs.setup({

      ensure_installed = {
        "lua", "vim","c3", "vimdoc", "markdown", "markdown_inline",
        "bash", "c", "cpp", "rust", "python", 
        "javascript", "typescript", "tsx",
        "html", "css", "json", "yaml", "toml",
        "go", "java",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = { enable = false },
    })
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.c3 = {
      install_info = {
        url = "https://github.com/c3lang/tree-sitter-c3",
        files = { "src/parser.c", "src/scanner.c" },
        branch = "main",
      },
      filetype = "c3",
    }
    vim.filetype.add({
      extension = {
        c3 = "c3",
      },
    })
end,
}
