local options = {
  ensure_installed = {
    -- LSP servers
    "rust-analyzer",
    "clangd", 
    "pyright",
    "pylsp",
    "typescript-language-server",
    "html-lsp",
    "css-lsp", 
    "tailwindcss-language-server",
    "emmet-ls",
    "lua-language-server",
    "bash-language-server",
    "json-lsp",
    "yaml-language-server",
    
    -- Formatters
    "prettier",
    "black",
    "isort", 
    "rustfmt",
    "clang-format",
    "stylua",
    "shfmt",
    
    -- Linters  
    "eslint_d",
    "flake8",
    "shellcheck",
    "markdownlint",
    
    -- Debug adapters (opcional)
    "debugpy", -- Python
    "codelldb", -- Rust/C++
  },
  
  max_concurrent_installers = 10,
  
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
}

return options
