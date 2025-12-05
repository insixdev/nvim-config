return {
  lazy = false,
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  opts = {
    attach_navic = true,
    show_dirname = true,
    show_basename = true,
    show_modified = true,
  },
}
