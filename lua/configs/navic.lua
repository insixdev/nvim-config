-- En lua/plugins/navic.lua (o donde tengas la config del plugin)
return {
  "SmiteshP/nvim-navic",
  lazy = false,
  config = function()
    require("nvim-navic").setup({
      separator = " > ",
      depth_limit = 0,
      depth_limit_indicator = "..",
    })
  end
}
