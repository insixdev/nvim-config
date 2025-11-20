-- ~/github/dotfiles-latest/neovim/neobean/lua/plugins/blink-cmp.lua
local trigger_text = ";"

return {
  "saghen/blink.cmp",
  version = "1.*",
  enabled = true,
  build = "cargo build --release",
  dependencies = {
    "moyiz/blink-emoji.nvim",
    "Kaiser-Yang/blink-cmp-dictionary",
    "L3MON4D3/LuaSnip"
  },
  priority = 1000,
  lazy = false,
  opts = function(_, opts)
    opts.enabled = function()
      local filetype = vim.bo[0].filetype
      if filetype == "TelescopePrompt" or filetype == "minifiles" or filetype == "snacks_picker_input" then
        return false
      end
      return true
    end
    opts.appearance = {
      nerd_font_variant = 'mono',
    }
    
    -- MEJORA: Configuración de completion unificada
    opts.completion = {
      trigger = {
        show_on_insert_on_trigger_character = true,
      },
      menu = {
        border = "rounded",
        min_width = 10,
        max_height = 30,
        draw = {
          treesitter = { 'lsp' },
        }
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 100,
        window = { border = "single" },
      },
    }
    
    opts.sources = vim.tbl_deep_extend("force", opts.sources or {}, {
      default = { "lsp", "path", "snippets", "dictionary" },
      providers = {
        lsp = {
          max_items = 30,
          name = "lsp",
          enabled = true,
          module = "blink.cmp.sources.lsp",
          min_keyword_length = 0,
          score_offset = 90,
        },
        path = {
          name = "Path",
          module = "blink.cmp.sources.path",
          score_offset = 25,
          min_keyword_length = 0,
          fallbacks = { "snippets", "buffer" },
          opts = {
            trailing_slash = false,
            label_trailing_slash = true,
            get_cwd = function(context)
              return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
            end,
            show_hidden_files_by_default = true,
          },
        },
        snippets = {
          name = "snippets",
          enabled = true,
          max_items = 13,
          min_keyword_length = 0,
          module = "blink.cmp.sources.snippets",
          score_offset = 85,
          should_show_items = function()
            -- Mostrar snippets siempre (más responsivo)
            return true
          end,
          transform_items = function(_, items)
            local line = vim.api.nvim_get_current_line()
            local col = vim.api.nvim_win_get_cursor(0)[2]
            local before_cursor = line:sub(1, col)
            local start_pos, end_pos = before_cursor:find(trigger_text .. "[^" .. trigger_text .. "]*$")
            if start_pos then
              for _, item in ipairs(items) do
                if not item.trigger_text_modified then
                  item.trigger_text_modified = true
                  item.textEdit = {
                    newText = item.insertText or item.label,
                    range = {
                      start = { line = vim.fn.line(".") - 1, character = start_pos - 1 },
                      ["end"] = { line = vim.fn.line(".") - 1, character = end_pos },
                    },
                  }
                end
              end
            end
            return items
          end,
        },
        dictionary = {
          module = "blink-cmp-dictionary",
          name = "Dict",
          score_offset = 20,
          enabled = true,
          max_items = 8,
          min_keyword_length = 2,
          opts = {
            dictionary_directories = { vim.fn.expand("~/github/dotfiles-latest/dictionaries") },
            dictionary_files = {
              vim.fn.expand("~/github/dotfiles-latest/neovim/neobean/spell/en.utf-8.add"),
              vim.fn.expand("~/github/dotfiles-latest/neovim/neobean/spell/es.utf-8.add"),
            },
          },
        },
      },
    })

    opts.cmdline = {
      enabled = true,
    }

    opts.keymap = {
      preset = "default",
      ["<Down>"] = { "snippet_forward", "fallback" },
      ["<Up>"] = { "snippet_backward", "fallback" },

      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<Tab>"] = { "select_next", "fallback" },
      ["<CR>"] = { "accept", "fallback" },

      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },

      ["<S-k>"] = { "scroll_documentation_up", "fallback" },
      ["<S-j>"] = { "scroll_documentation_down", "fallback" },

      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "cancel", "fallback" },
    }

    return opts
  end,
}
