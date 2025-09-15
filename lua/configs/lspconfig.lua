-- plugins/configs/lspconfig.lua
local configs = require("nvchad.configs.lspconfig")
-- Lista de servidores LSP que queremos
local servers = {
  -- Sistemas
  "rust_analyzer",     -- Rust
  "clangd",           -- C/C++
  "gopls",
  "pyright",          -- Python (mejor que pylsp)
  "pylsp",            -- Python alternativo
  "jdtls", -- java lsp
  -- Web
  "ts_ls",         -- TypeScript/JavaScript
  "cssls",            -- CSS
  "tailwindcss",      -- Tailwind CSS
  "emmet_ls",         -- Emmet
  
  "marksman",
  -- Otros útiles
  "lua_ls",           -- Lua
  "bashls",           -- Bash
  "jsonls",           -- JSON
  "yamlls",           -- YAML
}

-- Configuraciones específicas para cada servidor
local server_configs = {
  gopls = {
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
        gofumpt = true,
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
      },
    },
  },
  -- Asegúrate de que tailwindcss solo se active en los tipos correctos
tailwindcss = {
  filetypes = { 
    "aspnetcorerazor", "astro", "blade", "clojure", "django-html", "htmldjango", 
    "edge", "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "gohtmltmpl", 
    "haml", "handlebars", "hbs", "html", "htmlangular", "html-eex", "heex", 
    "jade", "leaf", "liquid", "mustache", "njk", "nunjucks", "php", "razor", 
    "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", 
    "sugarss", "javascript", "javascriptreact", "reason", "rescript", 
    "typescript", "typescriptreact", "vue", "svelte", "templ"
    -- NOTA: Eliminé "markdown" y "mdx" de aquí
  },
  settings = {
    tailwindCSS = {
      classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
      includeLanguages = {
        eelixir = "html-eex",
        elixir = "phoenix-heex",
        eruby = "erb",
        heex = "phoenix-heex",
        htmlangular = "html",
        templ = "html"
      },
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning"
      },
      validate = true
    }
  }
},

marksman = {
  filetypes = { "markdown" },
  single_file_support = true,
  settings = {
    completion = {
      wiki = {
        enabled = true,
      },
    },
    core = {
      text_sync = "full",
    },
  },
}, -- Rust Analyzer - configuración extensiva
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        diagnostics = {
          experimental = {
            enable = true,
          },
        },
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          buildScripts = {
            enable = true,
          },
        },
        checkOnSave = {
          command = "check", -- o "clippy" para más estricto
          extraArgs = { "--target-dir", "/tmp/rust-analyzer-check" },
        },
        
        procMacro = {
          enable = true,
          ignored = {
            ["async-trait"] = { "async_trait" },
            ["napi-derive"] = { "napi" },
            ["async-recursion"] = { "async_recursion" },
          },
        },
        inlayHints = {
          bindingModeHints = { -- si se infiere o no & &mut
            enable = true,
          },
          rangeExclusiveHints = {
            enable = true,
          },
          implicitReturnTypeHints = {
            enable = true,
          },
          chainingHints = { -- Te muestra los tipos intermedios en un chain de métodos:
            enable = true,
          },
          closingBraceHints = { -- comentarios para funciones o estructura largas al final de }
            enable = true,
            minLines = 25,
          },
          closureReturnTypeHints = {
            enable = false,
          },
          lifetimeElisionHints = {
            enable = "always",
            useParameterNames = false,
          },
          maxLength = 25,
          parameterHints = {
            enable = false,
          },
          reborrowHints = {
            enable = true,
          },
          renderColons = true,
          typeHints = {
            enable = false,
            hideClosureInitialization = false,
            hideNamedConstructor = false,
          },
        },
      },
    },
  },

  -- Clangd para C/C++ - configuración extensiva  
  clangd = {
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--header-insertion=iwyu",
      "--completion-style=detailed",
      "--function-arg-placeholders",
      "--fallback-style=llvm",
    },
    init_options = {
      usePlaceholders = true,
    },
  },

  -- Python - Pyright (más rápido)
  pyright = {
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic", -- "off", "basic", "strict"
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          autoImportCompletions = true,
        },
      },
    },
  },

  -- Python alternativo - pylsp
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = { enabled = false },
          mccabe = { enabled = false },
          pyflakes = { enabled = false },
          flake8 = { enabled = true },
          autopep8 = { enabled = false },
          yapf = { enabled = false },
          black = { enabled = true },
          isort = { enabled = true },
          mypy = { enabled = true },
        },
      },
    },
  },

  -- TypeScript/JavaScript
  tsserver = {
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "literal", -- 'none' | 'literals' | 'all'
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },

  -- Lua para Neovim
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            vim.fn.expand("$VIMRUNTIME/lua"),
            vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
            vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
            "${3rd}/luv/library",
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
        telemetry = { enable = false },
      },
    },
  },
}
-- Configurar cada servidor
for _, lsp in ipairs(servers) do
  local config = server_configs[lsp] or {}

  -- Fusionar con configuración base de NvChad
  config.on_attach = function(client, bufnr)
    -- primero llama al on_attach base de NvChad
    if configs.on_attach then
      configs.on_attach(client, bufnr)
    end

    -- 🔹 Fix específico para rust-analyzer
    if client.name == "rust_analyzer" then
      -- Desactivar semantic tokens (causan Invalid 'col')
      client.server_capabilities.semanticTokensProvider = nil

      -- Activar inlay hints con pcall (no rompe si hay error)
      if client.server_capabilities.inlayHintProvider then
        pcall(function()
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end)
config.on_init = configs.on_init
config.capabilities = configs.capabilities
require("lspconfig")[lsp].setup(config)

      end
    end
  end
end
-- Keymaps adicionales para LSP (mejorados)
local map = vim.keymap.set

-- Navegación
map("n", "gD", vim.lsp.buf.declaration, { desc = "LSP declaration" })
map("n", "gd", vim.lsp.buf.definition, { desc = "LSP definition" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "LSP implementation" })
map("n", "gr", vim.lsp.buf.references, { desc = "LSP references" })
map("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "LSP signature help" })
map("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "LSP type definition" })

-- Acciones
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP rename" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })

-- Hover y diagnósticos
map("n", "K", vim.lsp.buf.hover, { desc = "LSP hover" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Floating diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Goto prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Goto next diagnostic" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic setloclist" })

-- Formatting
map("n", "<leader>fm", function()
  vim.lsp.buf.format { async = true }
end, { desc = "LSP formatting" })

-- Workspace folders
map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
map("n", "<leader>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "List workspace folders" })

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",       -- puedes poner '●', '■', '▎', etc.
    spacing = 2,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
})
vim.diagnostic.config({
  signs = {
    active = {
      Error = { text = "✘" },
      Warn  = { text = "▲" },
      Info  = { text = "" },
      Hint  = { text = "⚑" },
    }
  }
})

