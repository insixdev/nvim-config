
return{
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
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },

      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1,
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "",
        },
        git_status = {
          symbols = {
            added     = "✚",
            modified  = "",
            deleted   = "✖",
            renamed   = "󰁕",
            untracked = "",
            ignored   = "",
            unstaged  = "󰄱",
            staged    = "",
            conflict  = "",
          },
        },
      },

      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },

        follow_current_file = true,
        group_empty_dirs = false,
        use_libuv_file_watcher = true,

        window = {
          position = "left",
          width = 32,

          mappings = {
            ["<space>"] = "toggle_node",
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
            ["g"] = "fuzzy_finder",       -- buscar dentro de la carpeta
            ["G"] = "fuzzy_finder_directory",

            ["f"] = "filter_on_submit",   -- filtrar por nombre
            ["F"] = "clear_filter",

            ["?"] = "show_help",
          },
        },

        fuzzy_finder_mappings = {
          ["<cr>"] = "open",
          ["ctrl-s"] = "open_split",
          ["ctrl-v"] = "open_vsplit",
        },
      },

      buffers = {
        follow_current_file = true,
        group_empty_dirs = true,
      },

      git_status = {
        window = {
          position = "float",
          mappings = {
            ["<cr>"] = "open",
            ["l"] = "open",
            ["h"] = "close_node",
          },
        },
      },
    })

    -- Abrir neo-tree con <leader>e
    vim.keymap.set("n", "<A-n>", ":Neotree toggle<CR>", { silent = true, noremap = true })
  end,
}
