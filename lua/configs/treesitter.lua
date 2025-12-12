return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",

    "nvim-treesitter/nvim-treesitter-context",
  },
  config = function()
    require("nvim-treesitter.configs").setup({

      -- Instalación automática de parsers
      ensure_installed = {
        -- Lenguajes principales
        "rust",
        "c",
        "cpp",
        "typescript",
        "javascript",
        "lua",
        "python",
        "bash",
        
        -- Web
        "html",
        "css",
        "tsx",
        "vue",
        "svelte",
        
        -- Configuración
        "json",
        "yaml",
        "toml",
        
        -- Markdown y documentación
        "markdown",
        "markdown_inline",
        
        -- Otros útiles
        "vim",
        "vimdoc",
        "regex",
        "go",
        "java",
      },
      
      -- Instalar parsers de forma sincrónica (solo aplicable a ensure_installed)
      sync_install = false,
      
      -- Instalar parsers automáticamente cuando abras un archivo
      auto_install = true,
      
      -- Resaltado de sintaxis
      highlight = {
        enable = true,
          additional_vim_regex_highlighting = false, -- 
        -- Desactivar en archivos grandes para mantener performance
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        
        -- Necesario para spellcheck en comentarios
        additional_vim_regex_highlighting = false,
      },
      
      -- Indentación basada en Tree-sitter
      indent = {
        enable = false,
        -- Python a veces tiene problemas, ajusta según necesites
        disable = {},
      },
      
      -- Selección incremental
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = "<S-CR>",
          node_decremental = "<BS>",
        },
      },
      
      -- Text objects para movimiento y manipulación de código
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            -- Funciones
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            
            -- Clases
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            
            -- Parámetros/argumentos
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            
            -- Bloques
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            
            -- Condicionales
            ["ai"] = "@conditional.outer",
            ["ii"] = "@conditional.inner",
            
            -- Loops
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
          },
        },
        
        -- Moverse entre funciones, clases, etc.
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
            ["]a"] = "@parameter.inner",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
            ["]A"] = "@parameter.inner",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
            ["[a"] = "@parameter.inner",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
            ["[A"] = "@parameter.inner",
          },
        },
        
        -- Swap de nodos (intercambiar parámetros, etc.)
        swap = {
          enable = true,
          swap_next = {
            ["<leader>sp"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>sP"] = "@parameter.inner",
          },
        },
      },
      
      -- Auto-cerrado de tags HTML/JSX
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
      },
    })
    
    -- Habilitar colores verdaderos
    vim.opt.termguicolors = true
    
    -- Folding basado en Tree-sitter (opcional)
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    vim.opt.foldenable = false -- Empezar con folds abiertos
  end,
}
