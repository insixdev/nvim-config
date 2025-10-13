
return {
  "echasnovski/mini.surround",
  version = false, -- usa siempre la última
  event = "VeryLazy",
  config = function()
    require("mini.surround").setup({
      insert_at_cursor = false
    })
  end,
}
