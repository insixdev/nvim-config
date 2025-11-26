return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()

    -- Función para mostrar CWD o root del proyecto
    local function project_and_cwd()
      local cwd = vim.fn.getcwd()
      local root = vim.fn.finddir(".git", cwd .. ";")
      if root ~= "" then
        root = vim.fn.fnamemodify(root, ":h")
      else
        root = cwd
      end
      return string.format(" %s ", cwd)
    end

    -- Configuración de lualine con bloques cuadrados y colores dinámicos
    require("lualine").setup({
      options = {
        padding= 1,
        theme =  vim.g.colors_name,
        -- theme = {
        --   normal = {
        --     a = { fg = "#181818", bg = "#fab39b", gui = "bold" },
        --     b = { fg = "#FFFEDB", bg = "#34383C" },
        --     c = { fg = "#FFFEDB", bg = "#34383C" },
        --   },
        --   insert = {
        --     a = { fg = "#181818", bg = "#d6b389", gui = "bold" },
        --     b = { fg = "#FFFEDB", bg = "#34383C" },
        --     c = { fg = "#FFFEDB", bg = "#34383C" },
        --   },
        --   visual = {
        --     a = { fg = "#181818", bg = "#8B9698", gui = "bold" },
        --     b = { fg = "#FFFEDB", bg = "#34383C" },
        --     c = { fg = "#FFFEDB", bg = "#34383C" },
        --   },
        --   replace = {
        --     a = { fg = "#181818", bg = "#f5e6d5", gui = "bold" },
        --     b = { fg = "#FFFEDB", bg = "#34383C" },
        --     c = { fg = "#FFFEDB", bg = "#34383C" },
        --   },
        --   inactive = {
        --     a = { fg = "#888888", bg = "#222222" },
        --     b = { fg = "#888888", bg = "#222222" },
        --     c = { fg = "#888888", bg = "#222222" },
        --   },
        -- },
        icons_enabled = true,
        section_separators = { left = ":", right = "" },
        component_separators = { left = ":", right = "" },
        globalstatus = false,
      },
      sections = {
        lualine_a = {},
        lualine_b = {"mode",
           "diff", "diagnostics" },
        -- lualine_c = { { "filename", path = 2 }, project_and_cwd },
        lualine_x = { "encoding",  "filetype", {
            'tabs',
            mode = 0,       -- 0 = números normales, 1 = mostrar nombre de la pestaña
          tabs_color = {
            active = { fg = '#ffffff', bg = '#96866c', gui='bold' },   -- tab activa
            inactive = { fg = '#bbbbbb', bg = '#3c3836' },   
          }
        }},
        lualine_y = { "progress"  },
        --lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {"fileformat"},
        lualine_b = {},
        lualine_c = { {"filename", path = 2} },
        lualine_x = { "location" },
        lualine_y = {
          "progress"
        },
        lualine_z = {},
      },
      winbar= {

      },
      extensions = { "fugitive", "nvim-tree", "lazy", "quickfix" },
    })

  end,
}

