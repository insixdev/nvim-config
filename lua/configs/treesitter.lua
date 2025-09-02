
-- plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local ts = require("nvim-treesitter.configs")

    ts.setup({
      -- Lenguajes que queremos soportar
      ensure_installed = {
        "rust",
        "c",
        "cpp",
        "typescript",
        "javascript",
        "lua",
        "python",
        "bash",
        "json",
        "yaml",
        "html",
        "css",
      },

      -- Resaltado
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        -- opcional: desactivar en buffers muy grandes
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },

      -- Indentación automática según Tree-sitter
      indent = {
        enable = true,
        disable = { "python" }, -- opcional: si no funciona bien
      },

      -- Resaltado de pares, anidamiento
      rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 1000,
      },

      -- Playground para ver árbol de parseo
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- ms
        persist_queries = false,
        keybindings = {
          toggle_query_editor = "o",
          toggle_hl_groups = "i",
          toggle_injected_languages = "t",
          toggle_anonymous_nodes = "a",
          toggle_language_display = "I",
          focus_language = "f",
          unfocus_language = "F",
          update = "R",
          goto_node = "<cr>",
          show_help = "?",
        },
      },

      -- Autopairs integrados con Treesitter
      autotag = {
        enable = true, -- útil para html/css/jsx
      },

      -- Módulo incremental selection
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },

      -- Refactor/Contextual code
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    })

    -- Asegurarnos de que termguicolors está activo
    vim.opt.termguicolors = true
  end,
}
