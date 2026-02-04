
return {
  "stevearc/dressing.nvim",
  lazy = false,
  config = function ()

    require("dressing").setup({
      input = {
        enabled = false, -- 👈 vuelve al input nativo abajo
      },
    })
  end

}
