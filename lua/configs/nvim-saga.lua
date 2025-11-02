
-- plugins/configs/nvim-saga.lua
return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    vim.keymap.set("n", "gH", "<cmd>:Lspsaga show_buf_diagnostics<CR>", { silent = true }) 
    local saga = require("lspsaga")
    local signs = { Error = "🗴", Warn = "△", Info = "✦", Hint = "﹡" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    saga.setup({
      -- Scroll preview
      scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },

      -- Emojis y nerd font
      -- Diagnostics (inline y flotante)
      diagnostic = {
        on_insert = false,             -- no mostrar en insert mode
        show_code_action = true,
        show_source = true,
        severity_sort = true,
        underline =true,
        jump_num_shortcut = true,
        max_width = 0.3,
        border = "rounded",
       -- winblend = 10,
--        symbol_in_winbar = { show_file = true, show_package = true, separator = " > puto " },
        show_layout = "auto",
        virutal_line = true,
        virutal_text = false,
        show_header = true,
        text_hl_follow = true,
        diagnostic_only_current = false, -- mostrar solo el de la ventana actual
      },

      -- Código acciones y renombrar
      code_action = {
        num_shortcut = true,
        show_server_name = true,
        extend_gitsigns = true,
        keys = {
          quit = "q",
          exec = "<CR>",
        },
      },

      rename = {
        quit = "<ESC>",
        exec = "<CR>",
        mark = "",
        confirm = true,
        in_select = false,
      },

      finder = {
        max_height = 0.5,
        min_width = 10,
        force_max_height = false,
        keys = {
          edit = { "o", "<CR>" },
          vsplit = "v",
          split = "s",
          tabe = "t",
          quit = { "q", "<ESC>" },
          close_in_preview = "<ESC>",
        },
      },

      outline = {
        win_position = "right",
        win_width = 20,
        show_detail = true,
        auto_preview = true,
        auto_refresh = true,
        custom_sort = nil,
        keys = {
          expand_or_jump = "<CR>",
          quit = "q",
        },
      },

      ui = {
        title = true,
        border = "rounded",
        winblend = 5,
        expand = "",
        collapse = "",
        code_action = "",
        incoming = "",
        outgoing = "",
        hover = "",
        kind = {},
      },
      symbol_in_winbar = {
        enable = false,
        separator = " > ",
      }
    })

    -- Keymaps (inline y potente)
    local map = vim.keymap.set
    map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Doc" })

    map("n", "gW", "<cmd>Lspsaga show_workspace_diagnostics<CR>", { desc = "Hover Doc" })
    map("n", "gP", "<cmd>Lspsaga peek_definition<CR>", { desc = "Hover Doc" })
    map("i", "<C-k>", "<cmd>Lspsaga signature_help<CR>", { desc = "Signature Help" })
    map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Rename Symbol" })
    map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })
    map("n", "gh", "<cmd>Lspsaga finder<CR>", { desc = "LSP Finder" })
    map("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Line Diagnostics" })
    map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Prev Diagnostic" })
    map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next Diagnostic" })
    map("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { desc = "Outline" })
  end,
}

