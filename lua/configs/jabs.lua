
return {
  lazy =false,
  "matbme/JABS.nvim",
  config = function()
    require("jabs").setup({
      offset = { -- window position offset
        -- derecha 
        top = 0,
        bottom = 12,
        left = 0,
        right = 0
      },
      --     focus_alternate_buffer = true,
      relative = "editor",
      width = 60,            -- ancho de la ventana (número absoluto)
      height = 20,           -- alto
      border = "rounded",    -- "single", "double", "rounded", "none"
      preview_position = "left", -- posición del preview relativo a la lista
      use_devicons = true,   -- requiere nvim-web-devicons
      sort_mru = true,       -- ordenar por uso reciente
      split_filename = true, -- mostrar solo nombre (no ruta completa)
      symbols = {
        current = "➤",       -- buffer actual
        alternate = "•",     -- último buffer
        hidden = "·",        -- oculto
        locked = "",        -- bloqueado (modificado sin guardar)
      },
      keymap = {
        -- h spñit
        h_split = "h",
        close = "<C-q>",
        v_split= "v",
        preview = "<C-p>",
      },


    })

  vim.keymap.set("n", "<leader>bb", "<cmd>JABSOpen<CR>", { desc = "Open buffer switcher" })
-- Toggle JABS en split lateral
vim.keymap.set("n", "gB", function()
  -- buscar ventana con JABS
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local name = vim.api.nvim_buf_get_name(buf):lower()
    if name:match("jabs") then
      vim.api.nvim_win_close(win, true)
      return
    end
  end

  -- abrir en split lateral

  -- abrir JABS
  if vim.fn.exists(":JABSOpen") == 2 then

    vim.cmd("JABSOpen")

  vim.cmd("wincmd L")

  vim.cmd("vertical resize -40")
  else

    local ok, jabs = pcall(require, "jabs")
    if ok and jabs.open then
      jabs.open()
    elseif ok and jabs.toggle then
      jabs.toggle()
    else
      vim.notify("No se pudo abrir JABS", vim.log.levels.WARN)
    end
  end
end, { desc = "Toggle JABS sidebar" })
  end,
}

