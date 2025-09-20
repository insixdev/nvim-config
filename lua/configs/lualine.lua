
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "RRethy/nvim-base16" },
  config = function()
    -- CARGAR EL THEME ANTES
    vim.cmd("colorscheme base16-black-metal-gorgoroth")

    local base16_mod = require("base16-colorscheme")
    if not base16_mod or not base16_mod.colors then
      vim.notify("base16-colorscheme not loaded!", vim.log.levels.ERROR)
      return
    end

    local base16 = base16_mod.colors

    local base16_theme = {
      normal = { a = { bg = base16.base0D, fg = base16.base00, gui = "bold" }, b = { bg = base16.base01, fg = base16.base05 }, c = { bg = base16.base00, fg = base16.base05 } },
      insert = { a = { bg = base16.base0B, fg = base16.base00, gui = "bold" }, b = { bg = base16.base01, fg = base16.base05 }, c = { bg = base16.base00, fg = base16.base05 } },
      visual = { a = { bg = base16.base09, fg = base16.base00, gui = "bold" }, b = { bg = base16.base01, fg = base16.base05 }, c = { bg = base16.base00, fg = base16.base05 } },
      replace = { a = { bg = base16.base08, fg = base16.base00, gui = "bold" }, b = { bg = base16.base01, fg = base16.base05 }, c = { bg = base16.base00, fg = base16.base05 } },
      inactive = { a = { bg = base16.base00, fg = base16.base05 }, b = { bg = base16.base00, fg = base16.base05 }, c = { bg = base16.base00, fg = base16.base05 } },
    }

    require("lualine").setup({
      options = {
        theme = base16_theme,
        icons_enabled = false,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 2 }, { "cwd", color = { fg = "#a0a0f0"}} },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "fugitive", "nvim-tree", "lazy", "quickfix" },
    })
  end,
}

