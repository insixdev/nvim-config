
return {

  {
    lazy = false,
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      separator = "-",
    }

  },
  {

    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup({
        -- Opcional: configuración por defecto
        use_default_keymaps = false, -- si querés definir tus propios keymaps

        langs = {
          cpp = {
            field_declaration_list = {
              both = { fallback = true },
            },

            parameter_list = {
              both = {
                fallback = true,
              },
            },

            argument_list = {
              both = {
                fallback = true,
              },
            },

            initializer_list = {
              both = {
                fallback = true,
              },
            },
          },
        },
      })
    end,
  }

}
