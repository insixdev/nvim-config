-- plugins/configs/lspconfig.lua
local configs = require("nvchad.configs.lspconfig")

-- Lista de servidores LSP
local servers = {
  "rust_analyzer",
  "c3-lsp",
  "clangd",
  "gopls",
  "pyright",
  "zls",
  "zcls",
  "pylsp",
  "jdtls",
  "ts_language_server",
  "ts_ls",
  "cssls",
  "tailwindcss",
  "csharp-language-server",
  "emmet_ls",
  "marksman",
  "lua_ls",
  "ast-grep",
  "bashls",
  "jsonls",
  "yamlls",
  "zclsp"
}

local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')
--
-- -- 1. Definir la configuración de Zen C si no existe
-- if not configs.zenc_lsp then
--   configs.zenc_lsp = {
--     default_config = {
--       cmd = { 'zc', 'lsp' }, -- El binario zc con el flag de lsp
--       filetypes = { 'zc', 'zen-c' },
--       root_dir = lspconfig.util.root_pattern('zc.json', '.git'),
--       settings = {},
--     },
--   }
-- end
--
-- -- 2. Activar el servidor
-- lspconfig.zenc_lsp.setup{
--   on_attach = function(client, bufnr)
--     -- Aquí puedes poner tus shortcuts habituales de LSP
--     print("Zen C LSP conectado!")
--   end
-- }
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

  csharp_ls = {
    cmd = { "/usr/bin/OmniSharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
    filetypes = { "cs" },
    root_dir = require("lspconfig.util").root_pattern("*.sln", "*.csproj", ".git"),
    settings = {
      csharp = {
        roslynAnalyzerExecutable = nil,
      },
    },
  },

  tailwindcss = {
    filetypes = {
      "aspnetcorerazor", "astro", "blade", "clojure", "django-html", "htmldjango",
      "edge", "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "gohtmltmpl",
      "haml", "handlebars", "hbs", "html", "htmlangular", "html-eex", "heex",
      "jade", "leaf", "liquid", "mustache", "njk", "nunjucks", "php", "razor",
      "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus",
      "sugarss", "javascript", "javascriptreact", "reason", "rescript",
      "typescript", "typescriptreact", "vue", "svelte", "templ"
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
  zcls = {
    cmd = { "zc","lsp" },
    filetypes = { "zc" },
    on_attach = function(client, bufnr)
      -- Aquí puedes poner tus shortcuts habituales de LSP
      print("Zen C LSP conectado!")
    end
  },

  c3_lsp = {
    cmd = { "c3lsp" },
    filetypes = { "c3" },
  },

  jdtls = {
    filetypes = { "java" },
    settings = {
      java = {
        configuration = {
          updateBuildConfiguration = "automatic",
        },
        eclipse = {
          downloadSources = true,
        },
        implementationsCodeLens = {
          enabled = true,
        },
        referencesCodeLens = {
          enabled = true,
        },
        references = {
          includeDecompiledSources = true,
        },
        inlayHints = {
          parameterNames = {
            enabled = "all",
          },
          parameterTypes = {
            enabled = "all",
          },
        },
      },
    },
  },

  zls = {
    cmd = { "zls" },
    filetypes = { "zig" },
       -- inlay
  settings = {
    zig = {

      build_on_save = true,
      enable_build_on_save = true,
      inlayHints = {
        enable = false, -- 👈 mejor activarlo
        show_parameter_name = true,
        show_variable_type_hints = false,
        show_builtin = true,
        show_stdlib = true,
      },
      completion = {
        snippetSupport = true,
      },
    },
  },  
},

  marksman = {
    filetypes = { "markdown" },
    single_file_support = true,
    settings = {
      marksman = {
        completion = {
          wiki = {
            enabled = true,
          },
        },
        core = {
          text_sync = "full",
        },
      },
    },
  },

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
        procMacro = {
          enable = true,
          ignored = {
            ["async-trait"] = { "async_trait" },
            ["napi-derive"] = { "napi" },
            ["async-recursion"] = { "async_recursion" },
          },
        },
        inlayHints = {
          bindingModeHints = {
            enable = true,
          },
          rangeExclusiveHints = {
            enable = true,
          },
          implicitReturnTypeHints = {
            enable = true,
          },
          chainingHints = {
            enable = true,
          },
          closingBraceHints = {
            enable = false,
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

  clangd = {
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--header-insertion=iwyu",
      "--completion-style=detailed",
      "--function-arg-placeholders",
      "--fallback-style=llvm",
      "--query-driver=/usr/bin/clang++",
      "--all-scopes-completion",
      "--log=error",
      "--pretty",
      "--offset-encoding=utf-16",
    },
    init_options = {
      usePlaceholders = false,
      clangdFileStatus = true,
      completeMacros = true,
      completeUnimported = true,
    },
  },

  pyright = {
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "strict",
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          autoImportCompletions = true,
        },
      },
    },
  },

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

  ts_ls = {
    init_options = {
    -- root_dir = function(fname)
    --   local util = require('lspconfig.util')
    --   return util.root_pattern('package.json', 'tsconfig.json', 'jsconfig.json')(fname)
    --     or util.root_pattern('.git')(fname)
    --     or util.find_git_ancestor(fname)
    --     or vim.fn.getcwd()
    -- end,
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "literal",
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

    }
  },

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

local capa = require("blink.cmp").get_lsp_capabilities()
local navic = require("nvim-navic")
-- Configurar cada servidor con la API moderna de Neovim 0.11
for _, lsp in ipairs(servers) do
  local config = server_configs[lsp] or {}

  config.on_attach = function(client, bufnr)
    if configs.on_attach then
      configs.on_attach(client, bufnr)
    end
    -- activar navic si el server lo soporta
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end
    --
    if client.server_capabilities.signatureHelpProvider then
      require("lsp_signature").on_attach(client, bufnr)
    end

    if client.server_capabilities.semanticTokensProvider then
      -- vim.lsp.semantic_tokens.on_attach(client, bufnr)
      vim.lsp.semantic_tokens.start(bufnr, client.id)
    end

    -- Habilitar inlay hints
    if client.server_capabilities.inlayHintProvider then
      pcall(function()
        vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
      end)
    end
    -- navi

    -- Fix específico para rust-analyzer
    if client.name == "rust_analyzer" then
      
      if client.server_capabilities.inlayHintProvider then
        pcall(function()
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end)
      end
    end
  end

  config.on_init = configs.on_init
  config.capabilities = capa

  -- Agregar filetypes si no están especificados
  if not config.filetypes then
    local default_filetypes = {
      ts_ls = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      lua_ls = { "lua" },
      rust_analyzer = { "rust" },
      -- zenc_lsp = {"zenc"},
      clangd = { "c", "cpp" },
      gopls = { "go" },
      pyright = { "python" },
      cssls = { "css", "scss", "less" },
      bashls = { "sh", "bash" },
      jsonls = { "json" },
      yamlls = { "yaml" },
      marksman = { "markdown" },
    }
    config.filetypes = default_filetypes[lsp]
  end

  -- Usar la API moderna de Neovim 0.11
  vim.lsp.config(lsp, config)
end

-- Agregar Mason bin al PATH
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

-- Habilitar LSP automáticamente por filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    local filetype = vim.bo[args.buf].filetype

    -- Mapeo de filetypes a servidores LSP
    local ft_to_lsp = {
      rust = "rust_analyzer",
      c = "clangd",
      cpp = "clangd",
      zc = "zcls",
      c3 = "c3_lsp",
      zig = "zls",
      go = "gopls",
      python = "pyright",
      java = "jdtls",
      javascript = "ts_ls",
      javascriptreact = "ts_ls",
      typescript = "ts_ls",
      typescriptreact = "ts_ls",
      ["typescript.tsx"] = "ts_ls",
      ["javascript.jsx"] = "ts_ls",
      css = "cssls",
      scss = "cssls",
      less = "cssls",
      html = "html",
      lua = "lua_ls",
      sh = "bashls",
      bash = "bashls",
      json = "jsonls",
      yaml = "yamlls",
      markdown = "marksman",
    }

    local lsp_name = ft_to_lsp[filetype]
    if lsp_name then
      -- Intentar habilitar el LSP
      local ok, err = pcall(vim.lsp.enable, lsp_name)
      if not ok then
        vim.notify("Error habilitando " .. lsp_name .. ": " .. tostring(err), vim.log.levels.WARN)
      end
    end
  end,
})

-- Keymaps adicionales para LSP
local map = vim.keymap.set

-- Navegación
map("n", "gD", vim.lsp.buf.declaration, { desc = "LSP declaration" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "LSP implementation" })
map("n", "gr", vim.lsp.buf.references, { desc = "LSP references" })
map("n", "<leader>lh", vim.lsp.buf.signature_help, { desc = "LSP signature help" })
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

-- Configuración de diagnósticos
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    spacing = 2,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ">",
      [vim.diagnostic.severity.WARN] = "▲",
      [vim.diagnostic.severity.INFO] = "!",
      [vim.diagnostic.severity.HINT] = "⚑",
    }
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
})
