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
  --
  -- {
  --   lazy = false,
  --   "nvim-treesitter/nvim-treesitter-context",
  --   opts = {
  --     separator = "-",
  --   }
  --
  -- },
  {
    lazy = false,
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()

local function fb(extra)
  return vim.tbl_deep_extend("force", {
    both = { fallback = true },
  }, extra or {})
end
      require("treesj").setup({
        -- Opcional: configuración por defecto
        use_default_keymaps = false, -- si querés definir tus propios keymaps

        langs = {
          c_sharp = {
            accessor_list      = fb(),
            argument_list      = fb(),
            block              = fb(),
            initializer_list   = fb(),
            parameter_list     = fb(),
            attribute_list     = fb(),
            array_initializer  = fb(),
            switch_section     = fb(),
            switch_expression  = fb(),
            tuple_expression   = fb(),
            -- especiales
            object_initializer_expression = fb({
              split = {
                space_in_braces = true,
              },
              join = {
                space_in_braces = false,
              },
            }),
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
