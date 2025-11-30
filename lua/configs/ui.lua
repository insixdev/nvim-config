return {
  {
    "vigoux/notifier.nvim",
    config = function()
      require'notifier'.setup {
        {
          ignore_messages = {}, -- Ignore message from LSP servers with this name
          status_width = something, -- COmputed using 'columns' and 'textwidth'
          components = {  -- Order of the components to draw from top to bottom (first nvim notifications, then lsp)
            "nvim",  -- Nvim notifications (vim.notify and such)
            "lsp"  -- LSP status updates
          },
          notify = {
            clear_time = 5000, -- Time in milliseconds before removing a vim.notify notification, 0 to make them sticky
            min_level = vim.log.levels.INFO, -- Minimum log level to print the notification
          },
          component_name_recall = false, -- Whether to prefix the title of the notification by the component name
          zindex = 50, -- The zindex to use for the floating window. Note that changing this value may cause visual bugs with other windows overlapping the notifier window.
        }
        -- You configuration here
      }
    end
  },
  -- {
    --   "OXY2DEV/ui.nvim",
  --   lazy = false,
  --   config = function()
  --     require("ui").setup({
  --       popupmenu = {
  --         enable = true,
  --
  --         winconfig = {},
  --         tooltip = nil,
  --
  --         styles = {
  --           default = {
  --             padding_left = " ",
  --             padding_right = " ",
  --
  --             icon = nil,
  --             text = nil,
  --
  --             normal_hl = nil,
  --             select_hl = "CursorLine",
  --             icon_hl = nil
  --           },
  --
  --           example = {
  --             condition = function ()
  --               return true;
  --             end,
  --
  --             icon = "I "
  --           }
  --         }
  --       },
  --
  --       cmdline = {
  --         enable = true,
  --
  --         styles = {
  --           default = {
  --             cursor = "Cursor",
  --             filetype = "vim",
  --
  --             icon = { { ": ", "@comment" } },
  --             offset = 0,
  --             padding =  4,
  --
  --
  --             title = nil,
  --             winhl = ""
  --
  --
  --           },
  --
  --           example = {
  --             condition = function ()
  --               return true;
  --             end,
  --
  --             cursor = "@comment"
  --           }
  --         }
  --       },
  --
  --       message = {
  --         enable = true,
  --         wrap_notify = true,
  --         respect_replace_last = true,
  --
  --         message_winconfig = {},
  --         list_winconfig = {},
  --         confirm_winconfig = {},
  --         history_winconfig = {},
  --
  --         ignore = function ()
  --           return false
  --         end,
  --
  --         showcmd = {
  --           max_width = 10,
  --           modifier = nil
  --         },
  --
  --         msg_styles = {
  --           default = {
  --             duration = 5000,
  --
  --             modifier = nil,
  --             decorations = {
  --               icon = { { "I " } }
  --             }
  --           },
  --
  --           example = {
  --             condition = function ()
  --               return true;
  --             end,
  --
  --             decorations = {
  --               icon = { { ":" } }
  --             }
  --           }
  --         },
  --
  --         is_list = function ()
  --           return false;
  --         end,
  --
  --         list_styles = {
  --           default = {
  --             modifier = nil,
  --
  --             row = nil,
  --             col = nil,
  --
  --             width = nil,
  --             height =2,
  --
  --             winhl = nil
  --           },
  --
  --           example = {
  --             condition = function ()
  --               return true;
  --             end,
  --
  --             border = "rounded"
  --           }
  --         },
  --         confirm_styles = {
  --           default = {
  --             modifier = nil,
  --
  --             row = nil,
  --             col = nil,
  --
  --             width = nil,
  --             height = nil,
  --
  --             winhl = nil
  --           },
  --
  --           example = {
  --             condition = function ()
  --               return true;
  --             end,
  --
  --             border = "rounded"
  --           }
  --         }
  --       }
  --
  --     });
  --   end
  -- };
}
