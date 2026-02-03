return {
{
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  opts = {
    bind = true,
    handler_opts = {
      border = "rounded"
    }
  },
  -- or use config
  -- config = function(_, opts) require'lsp_signature'.setup({you options}) end
},
{
  lazy = false,
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
        local mc = require("multicursor-nvim")
        mc.setup()

        local set = vim.keymap.set

        -- Add or skip cursor above/below the main cursor.
        set({"n", "x"}, "<up>", function() mc.lineAddCursor(-1) end)
        set({"n", "x"}, "<down>", function() mc.lineAddCursor(1) end)
        set({"n", "x"}, "<leader><up>", function() mc.lineSkipCursor(-1) end)
        set({"n", "x"}, "<leader><down>", function() mc.lineSkipCursor(1) end)

        -- Add or skip adding a new cursor by matching word/selection
        set({"n", "x"}, "<leader>k", function() mc.matchAddCursor(1) end)
        set({"n", "x"}, "<leader>s", function() mc.matchSkipCursor(1) end)
        set({"n", "x"}, "<leader>N", function() mc.matchAddCursor(-1) end)
        set({"n", "x"}, "<leader>sm", function() mc.matchSkipCursor(-1) end)

        -- Add and remove cursors with control + left click.
        set("n", "<c-leftmouse>", mc.handleMouse)
        set("n", "<c-leftdrag>", mc.handleMouseDrag)
        set("n", "<c-leftrelease>", mc.handleMouseRelease)

        -- Disable and enable cursors.
        set({"n", "x"}, "<c-q>", mc.toggleCursor)

        set({"n", "x"}, "<c-Q>", mc.enableCursors)
        -- Mappings defined in a keymap layer only apply when there are
        -- multiple cursors. This lets you have overlapping mappings.
        mc.addKeymapLayer(function(layerSet)

            -- Select a different cursor as the main one.
            layerSet({"n", "x"}, "<left>", mc.prevCursor)
            layerSet({"n", "x"}, "<right>", mc.nextCursor)

            -- Delete the main cursor.
            layerSet({"n", "x"}, "<leader>x", mc.deleteCursor)

            -- Enable and clear cursors using escape.
            layerSet("n", "<esc>", function()
                if not mc.cursorsEnabled() then
                    mc.enableCursors()
                else
                    mc.clearCursors()
                end
            end)
        end)

        -- Customize how cursors look.
        local hl = vim.api.nvim_set_hl
        hl(0, "MultiCursorCursor", { reverse = true })
        hl(0, "MultiCursorVisual", { link = "Visual" })
        hl(0, "MultiCursorSign", { link = "SignColumn"})
        hl(0, "MultiCursorMatchPreview", { link = "Search" })
        hl(0, "MultiCursorDisabledCursor", { reverse = true })
        hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
        hl(0, "MultiCursorDisabledSign", { link = "SignColumn"})
    end
},  
{

    lazy = false,
    "nanotee/zoxide.vim"
  },
  {

    lazy = false,
    "paretje/nvim-man",
  },
  {

    lazy = false,
    'norcalli/nvim-colorizer.lua'
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.csharpier, -- agrega CSharpier
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end, {})
          end
        end,
      })
    end

  },

  {
    'abecodes/tabout.nvim',
    lazy = false,
    config = function()
      require('tabout').setup {
        tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = '<C-d>', -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = false, -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = '`', close = '`' },
          { open = '(', close = ')' },
          { open = '[', close = ']' },
          { open = '{', close = '}' }
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {} -- tabout will ignore these filetypes
      }
    end,
    dependencies = { -- These are optional
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
      "hrsh7th/nvim-cmp"
    },
    opt = true,  -- Set this to true if the plugin is optional
    event = 'InsertCharPre', -- Set the event to 'InsertCharPre' for better compatibility
    priority = 1000,
  },
}
