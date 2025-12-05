return {
  { 
    lazy = false,
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      require("neo-tree").setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        
        -- OPTIMIZACIÓN: limitar profundidad de escaneo
        hide_root_node = false,
        retain_hidden_root_indent = false,
        
        source_selector = {
          winbar = false,
          statusline = false,
          sources = {
            { source = "filesystem", display_name = " 󰉋 Files " },
          },
          content_layout = "center",
          tabs_layout = "equal",
          show_separator_on_edge = false,
        },
        
        default_component_configs = {
          indent = {
            indent_size = 2,
            padding = 1,
          },
          git_status = {
            symbols = {
              added     = "✚",
              modified  = "",
              deleted   = "✖",
              renamed   = "󰁕",
              untracked = "",
              ignored   = "",
              unstaged  = "󰄱",
              staged    = "",
              conflict  = "",
            },
          },
        },
        
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = true,  -- IMPORTANTE: ocultar gitignored para mejor performance
            hide_hidden = false,
            hide_by_name = {
              "node_modules",  -- CRÍTICO: ignorar carpetas pesadas
              ".git",
              ".venv",
              "__pycache__",
              "venv",
              "dist",
              "build",
              ".next",
              ".nuxt",
              "target",
            },
            hide_by_pattern = {
              "*.pyc",
              "*.pyo",
              "*.cache",
            },
            never_show = {
              ".DS_Store",
              "thumbs.db",
            },
          },
          follow_current_file = {
            enabled = false,  -- Deshabilitar para mejor performance
            leave_dirs_open = false,
          },
          group_empty_dirs = false,
          use_libuv_file_watcher = false,  -- Desactivar watcher en carpetas grandes
          scan_mode = "shallow",  -- IMPORTANTE: escaneo superficial
          async_directory_scan = "auto",  -- Escaneo async
          
          window = {
            position = "left",
            width = 32,
            mappings = {
              --["<space>"] = "toggle_node",
              ["<cr>"] = "open",
              ["l"] = "open",
              ["h"] = "close_node",
              ["H"] = "close_all_nodes",
              ["a"] = "add",
              ["A"] = "add_directory",
              ["d"] = "delete",
              ["r"] = "rename",
              ["m"] = "move",
              ["c"] = "copy_to_clipboard",
              ["x"] = "cut_to_clipboard",
              ["p"] = "paste_from_clipboard",
              ["P"] = "toggle_preview",
              ["o"] = "open_with_window_picker",
              ["s"] = "open_split",
              ["v"] = "open_vsplit",
              ["t"] = "open_tabnew",
              ["R"] = "refresh",
              ["q"] = "close_window",
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
              ["g"] = "fuzzy_finder",
              ["G"] = "fuzzy_finder_directory",
              ["f"] = "filter_on_submit",
              ["F"] = "clear_filter",
              ["?"] = "show_help",
              -- Navegación entre tabs
              ["<Tab>"] = "next_source",
              ["<S-Tab>"] = "prev_source",
            },
          },
        },
        
        buffers = {
          follow_current_file = {
            enabled = false,  -- Deshabilitar para mejor performance
          },
          group_empty_dirs = false,
          show_unloaded = true,  -- No mostrar buffers no cargados
          bind_to_cwd = true,
          auto_refresh = false,
          
          window = {
            mappings = {
              ["<cr>"] = "open",
              ["l"] = "open",
              --["<space>"] = "toggle_node",
              ["bd"] = "buffer_delete",
              ["<bs>"] = "navigate_up",
              ["o"] = "open_with_window_picker",
              ["s"] = "open_split",
              ["v"] = "open_vsplit",
              ["t"] = "open_tabnew",
              ["R"] = "refresh",
              ["q"] = "close_window",
              -- Navegación entre tabs
              ["<Tab>"] = "next_source",
              ["<S-Tab>"] = "prev_source",
            },
          },
        },

        git_status = {
          async_directory_scan = "auto",
          window = {
            position = "float",
            mappings = {
              ["<cr>"] = "open",
              ["l"] = "open",
              ["A"] = "git_add_all",
              ["gu"] = "git_unstage_file",
              ["ga"] = "git_add_file",
              ["gr"] = "git_revert_file",
              ["gc"] = "git_commit",
              ["gp"] = "git_push",
              ["gg"] = "git_commit_and_push",
              ["o"] = "open_with_window_picker",
              ["q"] = "close_window",
              -- Navegación entre tabs
              ["<Tab>"] = "next_source",
              ["<S-Tab>"] = "prev_source",
            },
          },
          auto_refresh = false,
        },
      })

      -- Keymaps
      vim.keymap.set("n", "<A-n>", ":Neotree toggle<CR>", { silent = true, noremap = true, desc = "Toggle Neo-tree" })
      vim.keymap.set("n", "<leader>ee", ":Neotree filesystem reveal left<CR>", { silent = true, noremap = true, desc = "Explorer" })
      vim.keymap.set("n", "<C-A-e>", ":Neotree buffers reveal left<CR>", { silent = true, noremap = true, desc = "Buffers" })  -- Cambié a left

      vim.keymap.set("n", "<leader>ge", ":Neotree git_status reveal float<CR>", { silent = true, noremap = true, desc = "Git Status" })
      vim.keymap.set("n", "<leader>be", ":Neotree buffers reveal float<CR>", { silent = true, noremap = true, desc = "Git Status" })

      -- Navegación directa entre sources
      vim.keymap.set("n", "<leader>1", ":Neotree filesystem show left<CR>", { silent = true, noremap = true, desc = "Files" })
      vim.keymap.set("n", "<leader>2", ":Neotree buffers show left<CR>", { silent = true, noremap = true, desc = "Buffers" })
      vim.keymap.set("n", "<leader>3", ":Neotree git_status show left<CR>", { silent = true, noremap = true, desc = "Git" })
    end,
  }
}
