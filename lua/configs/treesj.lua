
return {

  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("treesj").setup({
      -- Opcional: configuración por defecto
      use_default_keymaps = false, -- si querés definir tus propios keymaps
    })
  end,
}
