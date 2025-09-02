
-- plugins/configs/nvim-saga.lua
return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    local saga = require("lspsaga")

    saga.setup({
      -- Movimientos y ventanas flotantes
      scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
      -- Diagnósticos
      diagnostic = {
        on_insert = false,
        show_code_action = true,
        show_source = true,
        jump_num_shortcut = true,
        max_width = 0.6,
        border = "rounded",
        winblend = 10,
        show_header = true,
        text_hl_follow = true,
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
        quit = "<C-c>",
        exec = "<CR>",
        mark = "",
        confirm = true,
        in_select = false,
      },
      finder = {
        max_height = 0.5, -- ventana máxima
        min_width = 30,
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
        win_width = 35,
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
        winblend = 10,
        expand = "",
        collapse = "",
        code_action = "💡",
        incoming = " ",
        outgoing = " ",
        hover = ' ',
        kind = {},
      },
    })

    -- Keymaps
    local map = vim.keymap.set

    -- Hover
    map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Doc" })

    -- Signature Help
    map("i", "<C-k>", "<cmd>Lspsaga signature_help<CR>", { desc = "Signature Help" })

    -- Rename
    map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Rename Symbol" })

    -- Code Action
    map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })

    -- Finder (definition, references)
    map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { desc = "LSP Finder" })

    -- Diagnostics
    map("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Line Diagnostics" })
    map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Prev Diagnostic" })
    map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next Diagnostic" })

    -- Outline
    map("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { desc = "Outline" })
  end,
}

