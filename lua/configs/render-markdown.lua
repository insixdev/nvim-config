
return {
  "MeanderingProgrammer/render-markdown.nvim",
  lazy = true,
  ft = {"markdown"},  -- solo cargar en archivos markdown
  config = function()
    require("render-markdown").setup({
      -- Aquí van las opciones de configuración si las tiene el plugin
      -- Por ejemplo:
      -- preview_browser = "firefox",
      -- open_cmd = "silent !xdg-open %s"
    })
  end
}
