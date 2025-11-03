
return {
  "b0o/incline.nvim",
  lazy = false,
  event = "VeryLazy",

  config = function()
    require("incline").setup({
      debounce_threshold = { falling = 50, rising = 10 },

      hide = {
        cursorline = false,
        focused_win = false,
        only_win = false,
      },

      highlight = {
        groups = {
          InclineNormal = { default = true, group = "NormalFloat" },
          InclineNormalNC = { default = true, group = "NormalFloat" },
        },
      },

      window = {
        margin = { horizontal = 0, vertical = 0 },
        padding = 1,
        placement = {
          horizontal = "right",
          vertical = "top",
        },
        zindex = 50,
      },

      render = function(props)
        -- props.buf es el buffer actual de la ventana
        local buf = props.buf
        local path = vim.fn.bufname(buf)
        if path == "" then
          return {}
        end

        -- ruta relativa al cwd
        local rel_path = vim.fn.fnamemodify(path, ":~:.")
        return { " " .. rel_path .. " " }
      end,
    })
  end,
}

