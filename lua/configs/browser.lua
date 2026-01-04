return {

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }

  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local actions = require("telescope.actions")

      require("telescope").setup({
        file_browser = {
          
  file_ignore_patterns = {
        "%.uid$",            -- archivos *.uid
        "^uid$",             -- carpeta literalmente llamada uid
        "^uid%d+$",          -- uid123, uid456
        "%d%d%d%d%d%d+",     -- números largos (IDs)
        "[a-f0-9][a-f0-9][a-f0-9][a-f0-9][a-f0-9]+", -- hashes
      },
        },
        defaults = {
          -- Estética: Bordes redondeados y estilo flotante
          path_display = { "smart" },
          prompt_prefix = "   ", -- Icono de búsqueda
          selection_caret = "   ", -- Icono de selección
          entry_prefix = "    ",

          -- Configuración Visual (Layout)
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top", -- El buscador arriba (estilo moderno)
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },

          -- Orden de la lista
          sorting_strategy = "ascending", -- Los resultados suben hacia el buscador

          -- Cómo se ven las ventanas (Bordes y Colores)
          -- Si usas una fuente con iconos (Nerd Fonts), esto se verá brutal
          winblend = 0, -- Transparencia
          border = {},
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<esc>"] = actions.close, -- Cerrar al primer escape
            },
          },
        },
        pickers = {
          -- Para que buscar archivos se vea como una pequeña ventana centrada
          find_files = {
            theme = "dropdown",
            previewer = false,
          },
          -- Para que los buffers abiertos se vean limpios
          buffers = {
            theme = "dropdown",
            previewer = false,
            initial_mode = "normal",
          },
        },
      })
    end
  }
}

