
return {
  "b0o/incline.nvim",
  lazy = false,
  event = "VeryLazy",

  config = function()
    require("incline").setup({


      debounce_threshold = { falling = 50, rising = 10 },
      hide = {
        cursorline = false,
        focused_win = false,
        only_win = false,
      },

      highlight = {
        groups = {
          InclineNormal = { default = true, group = "NormalFloat" },
          InclineNormalNC = { default = true, group = "NormalFloat" },
        },
      },

      window = {
        margin = { horizontal = 0, vertical = 0 },
        padding = 1,
        placement = {
          horizontal = "right",
          vertical = "top",
        },
        zindex = 50,
      },
-- render = function(props)
--     local buf = props.buf
--     local path = vim.fn.bufname(buf)
--
--     if path == "" then
--       return {} -- Ignorar buffers sin nombre (como el inicial)
--     end
--
--     -- 1. Ruta Relativa
--     local rel_path = vim.fn.fnamemodify(path, ":~:.")
--
--     -- 2. Estado de Modificación
--     local modified = vim.bo[buf].modified
--     local modified_icon = modified and " ✏️" or ""
--     local modified_group = modified and "WarningMsg" or "InclineNormal"
--
--     -- 3. Nombre de la Función (Usando Tree-sitter o LSP si está disponible)
--     local func_name = ""
--     local lsp_ok, treesitter = pcall(require, "nvim-treesitter")
--
--     if lsp_ok and treesitter then
--         -- Intentar obtener el nombre de la función vía Tree-sitter (más rápido)
--         local func = vim.treesitter.get_current_function_name(0)
--         if func then
--             func_name = " -> " .. func
--         end
--     -- Fallback: Se podría usar vim.lsp.buf.get_name_of_function_at_cursor(),
--     -- pero Tree-sitter es generalmente más fiable para este uso.
--     end
--
--     -- 4. Construcción final de la lista de componentes (chunks)
--     return {
--       -- 1. Espacio y ruta
--       " ",
--       { rel_path, { group = "InclineNormal" } },
--
--       -- 2. Estado de modificado
--       { modified_icon, { group = modified_group } },
--
--       -- 3. Separador y nombre de la función (si existe)
--       { func_name, { group = "InclineNormal" } },
--
--       " " -- Espacio final
--     }
--   end,

    --   render = function(props)
    --     if vim.g.incline_enabled == false then
    --       return ""
    --     end
    --
    --     -- props.buf es el buffer actual de la ventana
    --     local buf = props.buf
    --     local path = vim.fn.bufname(buf)
    --     if path == "" then
    --       return {}
    --     end
    --
    --     -- ruta relativa al cwd
    --     local rel_path = vim.fn.fnamemodify(path, ":~:.")
    --     return { " " .. rel_path .. " " }
    --   end,
   })
  end,
}

