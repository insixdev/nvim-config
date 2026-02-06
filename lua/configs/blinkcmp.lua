
-- ~/github/dotfiles-latest/neovim/neobean/lua/plugins/blink-cmp.lua
local trigger_text = ";"

return {
  {
    "ray-x/lsp_signature.nvim",
    lazy = false,
    opts = {
      hint_enable = true,
      floating_window = true,
      floating_window_above_cur_line = true,
      handler_opts = { border = "rounded" },
    },
  },

  {
    "saghen/blink.cmp",
    version = "1.*",
    enabled = true,
    build = "cargo build --release",
    lazy = false,
    priority = 1000,

    dependencies = {
      "moyiz/blink-emoji.nvim",
      "Kaiser-Yang/blink-cmp-dictionary",
      "L3MON4D3/LuaSnip",
    },

    opts = function(_, opts)
      -- enable/disable por filetype
      opts.enabled = function()
        local ft = vim.bo.filetype
        return not vim.tbl_contains({
          "TelescopePrompt",
          "minifiles",
          "snacks_picker_input",
        }, ft)
      end

      -- UI
      opts.appearance = {
        nerd_font_variant = "mono",
      }

      opts.completion = {
        trigger = {
          show_on_insert_on_trigger_character = true,
        },

        menu = {
          border = "rounded",
          min_width = 10,
          max_height = 30,
          draw = {
            treesitter = { "lsp" },
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind", gap = 1 },
              { "source_name" },
            },
          },
        },

        documentation = {
          auto_show = true,
          auto_show_delay_ms = 0,
          window = {
            border = "rounded",
            max_width = 80,
            max_height = 30,
          },
        },
      }
      opts.sources = vim.tbl_deep_extend("force", opts.sources or {}, {
        default = { "lsp", "snippets", "path", "dictionary" },

        providers = {
          -- LSP (máxima prioridad)
          lsp = {
            name = "lsp",
            module = "blink.cmp.sources.lsp",
            enabled = true,
            max_items = 20,
            min_keyword_length = 0,
            score_offset = 200,
          },

          -- PATH
          path = {
            name = "Path",
            module = "blink.cmp.sources.path",
            score_offset = 30,
            min_keyword_length = 0,
            opts = {
              trailing_slash = false,
              label_trailing_slash = true,
              get_cwd = function(ctx)
                return vim.fn.expand(("#%d:p:h"):format(ctx.bufnr))
              end,
              show_hidden_files_by_default = true,
            },
          },

          -- SNIPPETS
          snippets = {
            name = "snippets",
            module = "blink.cmp.sources.snippets",
            enabled = true,
            max_items = 13,
            min_keyword_length = 0,
            score_offset = 190,

            should_show_items = function()
              return true
            end,

            transform_items = function(_, items)
              local line = vim.api.nvim_get_current_line()
              local col = vim.api.nvim_win_get_cursor(0)[2]
              local before = line:sub(1, col)
              local s, e = before:find(trigger_text .. "[^" .. trigger_text .. "]*$")
              if s then
                for _, item in ipairs(items) do
                  if not item.trigger_text_modified then
                    item.trigger_text_modified = true
                    item.textEdit = {
                      newText = item.insertText or item.label,
                      range = {
                        start = { line = vim.fn.line(".") - 1, character = s - 1 },
                        ["end"] = { line = vim.fn.line(".") - 1, character = e },
                      },
                    }
                  end
                end
              end
              return items
            end,
          },

          -- DICTIONARY
          dictionary = {
            module = "blink-cmp-dictionary",
            name = "Dict",
            score_offset = 20,
            enabled = true,
            max_items = 8,
            min_keyword_length = 2,
            opts = {
              dictionary_directories = {
                vim.fn.expand("~/github/dotfiles-latest/dictionaries"),
              },
              dictionary_files = {
                vim.fn.expand("~/github/dotfiles-latest/neovim/neobean/spell/en.utf-8.add"),
                vim.fn.expand("~/github/dotfiles-latest/neovim/neobean/spell/es.utf-8.add"),
              },
            },
          },
        },
      })

      opts.cmdline = { enabled = true }

      -- =========================
      opts.keymap = {
        preset = "default",

        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },

        ["<CR>"] = { "accept", "fallback" },

        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },

        ["<Down>"] = { "snippet_forward", "fallback" },
        ["<Up>"] = { "snippet_backward", "fallback" },

        ["<S-k>"] = { "scroll_documentation_up", "fallback" },

        ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "cancel", "fallback" },
      }

      return opts
    end,
  },
}

