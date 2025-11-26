
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
  local bufname = vim.api.nvim_buf_get_name(props.buf)
  local filename = vim.fn.fnamemodify(bufname, ":t")
  
  if filename == "" then
    filename = "[No Name]"
  end
  
  -- Simplemente retornar el string completo
  if require("nvim-navic").is_available(props.buf) then
    local location = require("nvim-navic").get_location({}, props.buf)
    if location and location ~= "" then
      return filename .. " > " .. location
    end
  end
  
  return filename
end,
})
end
}
