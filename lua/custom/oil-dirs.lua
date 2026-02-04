
local M = {}

-- Variable para guardar directorios
M.dirs = {}

-- Guardar directorio
function M.save_dir(dir)
  -- Evita duplicados consecutivos
  if #M.dirs > 0 and M.dirs[1].path == dir then
    return
  end
  
  table.insert(M.dirs, 1, {
    path = dir,
    time = os.time()
  })
  
  -- Mantén solo los últimos 10
  if #M.dirs > 10 then
    table.remove(M.dirs)
  end
  
  vim.notify("Saved: " .. dir, vim.log.levels.INFO)
end
-- shit
local qf_items = {}
-- Ejecutar comando en el último directorio guardado
function M.run_in_saved_dir()
  if #M.dirs == 0 then
    vim.notify("No saved directories", vim.log.levels.WARN)
    return
  end
  
  local last_dir = M.dirs[1].path
  
  vim.ui.input({ prompt = "Command in " .. last_dir .. ": " }, function(cmd)
    if not cmd or cmd == "" then return end

    local full_cmd = string.format("cd %s && %s", vim.fn.shellescape(last_dir), cmd)

    vim.fn.jobstart(full_cmd, {
      on_stdout = function(_, data)
        if data and #data > 0 then
          -- new buffer
          for _, line in ipairs(data) do
            table.insert(qf_items, {
              text = line, -- texto que se muestra
            })
          end

          vim.fn.setqflist(qf_items, "r") -- "r" = replace
          vim.cmd("copen") -- abrir quickfix
          vim.cmd("resize 23")

        end
      end,
      on_stderr = function(_, data)
        if data and #data > 0 then
          qf_items = {}
          print("perras test")
          vim.notify(table.concat(data , "\n"), vim.log.levels.ERROR)
        end
      end,
    })
  end)
end

-- Ver historial de directorios
function M.show_dirs()
  if #M.dirs == 0 then
    vim.notify("No saved directories", vim.log.levels.WARN)
    return
  end
  
  local lines = {}
  for i, entry in ipairs(M.dirs) do
    table.insert(lines, string.format("%d. %s", i, entry.path))
  end
  
  vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO)
end

-- Setup autocmds y keymaps
function M.setup()
  -- Hook en Oil
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "oil",
    callback = function()
      local ok, oil = pcall(require, "oil")
      if not ok then return end
      
      -- Guarda el directorio inicial
      local current = oil.get_current_dir()
      if current then
        M.save_dir(current)
      end
      
      -- Hook para detectar cambios
      vim.api.nvim_create_autocmd("BufEnter", {
        buffer = 0,
        callback = function()
          local new_dir = oil.get_current_dir()
          if new_dir then
            M.save_dir(new_dir)
          end
        end,
      })
    end,
  })
  
  -- Keymaps
  vim.keymap.set("n", "<M-e>", M.run_in_saved_dir, { desc = "Run command in saved Oil dir" })
  vim.keymap.set("n", "<M-#>", M.show_dirs, { desc = "Show saved Oil directories" })
end

return M
