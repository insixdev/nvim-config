
return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    workspaces = {
      {
        name = "Obsidian Vault",
        path = os.getenv("HOME") .. "/myInsiVault/Obsidian Vault",
      },
    },

    completion = { nvim_cmp = true },

    legacy_commands = false, -- 🔥 desactiva warnings por comandos viejos

    callbacks = {
      enter_note = function(_, note)
        local opts = { buffer = note.bufnr, silent = true }

        vim.keymap.set("n", "gf", function()
          return require("obsidian").util.gf_passthrough()
        end, vim.tbl_extend("force", opts, { expr = true, desc = "Follow Obsidian link" }))

        vim.keymap.set("n", "<CR>", function()
          return require("obsidian").util.smart_action()
        end, vim.tbl_extend("force", opts, { expr = true, desc = "Smart action" }))

        vim.keymap.set("n", "<leader>ch", function()
          return require("obsidian").util.toggle_checkbox()
        end, vim.tbl_extend("force", opts, { desc = "Toggle checkbox" }))
      end,
    },

    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
      tags = "",
    },
  },
}

