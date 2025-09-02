

return {
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
    vim.api.nvim_set_keymap("n", "S", ":Make<CR>", opts)
    -- :Start (si quieres otro comando, por ejemplo Start!)
    vim.api.nvim_set_keymap("n", "<leader>r", ":Start<CR>", opts)
  end,
}

