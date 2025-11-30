
return {
  "b0o/incline.nvim",
  dependencies = { "SmiteshP/nvim-navic", "nvim-lua/plenary.nvim",  },
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
        local buf = props.buf

        -----------------------------------------------------------
        -- 1) NOMBRE DE ARCHIVO
        -----------------------------------------------------------
        local bufname = vim.api.nvim_buf_get_name(buf)
        local filename = vim.fn.fnamemodify(bufname, ":t")
        if filename == "" then
          filename = "[No Name]"
        end

        -----------------------------------------------------------
        -- 2) DIAGNÓSTICOS
        -----------------------------------------------------------
        local errors = #vim.diagnostic.get(buf, { severity = vim.diagnostic.severity.ERROR })
        local warnings = #vim.diagnostic.get(buf, { severity = vim.diagnostic.severity.WARN })
        local hints = #vim.diagnostic.get(buf, { severity = vim.diagnostic.severity.HINT })
        local info = #vim.diagnostic.get(buf, { severity = vim.diagnostic.severity.INFO })

        local diag_parts = {}
        if errors > 0 then table.insert(diag_parts, " " .. errors) end
        if warnings > 0 then table.insert(diag_parts, " " .. warnings) end
        if info > 0 then table.insert(diag_parts, " " .. info) end
        if hints > 0 then table.insert(diag_parts, " " .. hints) end

        local diag_text = ""
        if #diag_parts > 0 then
          diag_text = "  " .. table.concat(diag_parts, " ")
        end

        -----------------------------------------------------------
        -- 3) NAVIC BREADCRUMBS
        -----------------------------------------------------------
     

        -----------------------------------------------------------
        -- FINAL: filename + diagnostics + location
        -----------------------------------------------------------
        return filename .. diag_text
      end,
    })
  end
}
