return {
  -- {
  --   "nvim-treesitter-refactor"
  --   dependencies = { "nvim-treesitter/nvim-treesitter" },
  --   config = function()
  --     require("nvim-treesitter-refactor").setup({
  --     highlight_definitions = { enable = true },
  --     highlight_current_scope = { enable = true },
  --     smart_rename = { enable = true, keymaps = { smart_rename = "grr" } },
  --     })
  --   end,d
  -- },
  {
    lazy = false,
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      separator = "-",
    }

  },
  {
    lazy = false,
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup({
        -- Opcional: configuración por defecto
        use_default_keymaps = false, -- si querés definir tus propios keymaps

        langs = {
          c_sharp = {
            object_initializer_expression = {
              split = {
                space_in_braces = true,  -- pone cada nodo en su propia línea
              },
              join = {
                space_in_braces = false, -- junta todo en línea sin saltos extra
              },
            },
            block = {
              both = {
                fallback = true,
              },
            },
            initializer_list = {

              both = {
                fallback = true,
              },
            },
            initializer_expression = {
              both = {
                fallback = true,

              },
            },
            field_declaration_list = {
              both = { fallback = true },
            },
          },
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
