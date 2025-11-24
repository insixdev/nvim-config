return {
  "OXY2DEV/ui.nvim",
  lazy = false,
  config = function()
    require("ui").setup({
      popupmenu = {
        enable = true,

        winconfig = {},
        tooltip = nil,

        styles = {
          default = {
            padding_left = " ",
            padding_right = " ",

            icon = nil,
            text = nil,

            normal_hl = nil,
            select_hl = "CursorLine",
            icon_hl = nil
          },

          example = {
            condition = function ()
              return true;
            end,

            icon = "I "
          }
        }
      },

      cmdline = {
        enable = true,

        styles = {
          default = {
            cursor = "Cursor",
            filetype = "vim",

            icon = { { ": ", "@comment" } },
            offset = 0,
            padding =  4,
            

            title = nil,
            winhl = ""
            
            
          },

          example = {
            condition = function ()
              return true;
            end,

            cursor = "@comment"
          }
        }
      },

      message = {
        enable = true,
        wrap_notify = true,
        respect_replace_last = true,

        message_winconfig = {},
        list_winconfig = {},
        confirm_winconfig = {},
        history_winconfig = {},

        ignore = function ()
          return false
        end,

        showcmd = {
          max_width = 10,
          modifier = nil
        },

        msg_styles = {
          default = {
            duration = 5000,

            modifier = nil,
            decorations = {
              icon = { { "I " } }
            }
          },

          example = {
            condition = function ()
              return true;
            end,

            decorations = {
              icon = { { ":" } }
            }
          }
        },

        is_list = function ()
          return false;
        end,

        list_styles = {
          default = {
            modifier = nil,

            row = nil,
            col = nil,

            width = nil,
            height =2,

            winhl = nil
          },

          example = {
            condition = function ()
              return true;
            end,

            border = "rounded"
          }
        },
        confirm_styles = {
          default = {
            modifier = nil,

            row = nil,
            col = nil,

            width = nil,
            height = nil,

            winhl = nil
          },

          example = {
            condition = function ()
              return true;
            end,

            border = "rounded"
          }
        }
      }
    });
  end
};
