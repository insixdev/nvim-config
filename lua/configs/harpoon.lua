-- lua/plugins/harpoon.lua
return {
  lazy = false,
  "ThePrimeagen/harpoon",
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    -- Keymaps para Harpoon
    vim.keymap.set("n", "<leader>ta", mark.add_file, { desc = "Harpoon: Add file" })
    vim.keymap.set("n", "<leader>ti", ui.toggle_quick_menu, { desc = "Harpoon: Toggle menu" })
    vim.keymap.set("n", "<leader>t1", function() ui.nav_file(1) end)
    vim.keymap.set("n", "<leader>t2", function() ui.nav_file(2) end)
  end
}

