
return {
  {
    "tpope/vim-dispatch",
    event = "VeryLazy",
    config = function()
      -- Opcional: evita que vim-dispatch cree mapeos por defecto
      vim.g.dispatch_no_maps = 1

      -- Mapeos personalizados
      local opts = { noremap = true, silent = true }

      -- :Dispatch <cmd>
      vim.api.nvim_set_keymap("n", "D", ":Dispatch ", opts)
      -- :Make
      vim.api.nvim_set_keymap("n", "S-S", ":Start ", opts)

      vim.api.nvim_set_keymap("n", "M", ":Make<CR>", opts)
      -- :Start (si quieres otro comando, por ejemplo Start!)
    end,

  },

  {
    "skywind3000/asyncrun.vim",
    event = "VeryLazy",
    config = function()
      -- Opcional: evitar mapeos por defecto (asyncrun no tiene tantos, pero por si acaso)
      -- vim.g.asyncrun_open = 6  -- 0=never, 6=window if error, etc.
      local opts = { noremap = true, silent = false }


      vim.api.nvim_set_keymap("n", "Y", ":AsyncRun -mode=term ", opts)
      -- :AsyncStart (similar a :Start en dispatch)
      -- :AsyncRun con quickfix
      vim.api.nvim_set_keymap("n", "L", ":AsyncRun ", opts)
      vim.api.nvim_set_keymap("n", "+", ":AsyncStop<CR>", opts)
      -- Otro ejemplo de mapeo
      vim.api.nvim_set_keymap("n", "<leader>Rr", ":AsyncRun ", opts)
    end,
  }
}
