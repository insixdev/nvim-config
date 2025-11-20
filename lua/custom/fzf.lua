
-- Carpetas favoritas
local folders = {
  "~/.config/nvim/",
  "~/practice",
  "/mnt/data/proyect/",
}
vim.keymap.set("n", "<C-A-f>", ":Files<CR>")
vim.keymap.set("n", "<A-S-f>", ":FilesHome<CR>")
vim.keymap.set("n", "<C-g>", ":FavFolders<CR>")
vim.keymap.set("n", "<C-f>", ":HomeFolder<CR>")

vim.api.nvim_create_user_command("HomeFolders", function()
  vim.fn["fzf#run"]({
    source = "fd --type d --hidden --exclude .git . ~",
    sink = function(dir)
      vim.cmd("tcd " .. dir)
      print("tcd → " .. dir)
    end,
    options = "--preview 'ls -la {}'"
  })
end, {})

vim.api.nvim_create_user_command("FilesHome", function()
  vim.fn["fzf#run"]({
    source = "fd --type f . ~",
    sink = "edit",
    options = "--preview 'cat {}'"
  })
end, {})

vim.api.nvim_create_user_command("FavFolders", function()
  vim.fn["fzf#run"]({
    source = folders,
    sink = function(dir)
      vim.cmd("tcd " .. dir)
      print("tcd → " .. dir)
    end
  })
end, {})
-- FZF: elegir carpetas y hacer cd
-- vim.api.nvim_create_user_command("Folders", function()
--   vim.fn["fzf#run"]({
--     source = "fd --type d --hidden --exclude .git",
--     sink = function(dir)
--       vim.cmd("tcd " .. dir)
--       print("tcd → " .. dir)
--     end,
--     options = "--preview 'ls -la {}'"
--   })
-- end, {})

local fzf = require("fzf-lua")

-- Función que genera el comando Bash para listar directorios
local function folder_list(cwd)
  cwd = cwd or vim.loop.cwd()

  -- 1. Determina el directorio padre de 'cwd'.
  local parent_dir = vim.fn.fnamemodify(cwd, ":h")

  -- 2. Solo agregamos ".." si el directorio actual NO es el mismo que su padre.
  local up = ""
  if cwd ~= parent_dir then
      up = "printf '../\n';"
  end

  local cmd = string.format(
    [[bash -lc "%s fd -t d --max-depth 1 --hidden --exclude .git 2>/dev/null | sed 's#^./##'" ]],
    up
  )

  return cmd
end

-- Función global para iniciar la navegación de directorios con fzf-lua
_G.browse_dirs = function(opts)
  opts = opts or {}
  -- Obtiene la ruta de trabajo actual o la definida en opts, y la limpia a una ruta absoluta.
  local cwd = vim.fn.fnamemodify(opts.cwd or vim.loop.cwd(), ":p")
  local prompt_cwd = cwd 
  -- ya que la lógica de limpieza de ruta ya se maneja arriba con :p y la lógica de 'up' en folder_list.

  -- Ejecuta FZF con el comando generado y las opciones.
  fzf.fzf_exec(folder_list(cwd), {
    cwd = cwd,
    prompt = prompt_cwd .. " > ",

    fzf_opts = {
      ["--height"] = "100%",
      ["--layout"] = "reverse",
      ["--info"]    = "inline",
      ["--border"] = "none",
      ["--preview"] = "ls -la --color=always {}",
    },

    actions = {
      -- Acción 'enter': Cambia al directorio seleccionado y relanza el buscador.
      ["enter"] = function(selected)
        if not selected or not selected[1] then return end
        local sel = selected[1]

        if sel == ".." then
          -- Ir al directorio padre
          browse_dirs({ cwd = vim.fn.fnamemodify(cwd, ":h") })
          return
        end

        -- Ir al subdirectorio seleccionado
        browse_dirs({ cwd = cwd .. "/" .. sel })
      end,

      -- Acción 'space': Abre el directorio seleccionado con el plugin Oil (o similar).
      ["space"] = function(selected)
        if not selected or not selected[1] then return end
        local sel = selected[1]

        local target
        if sel == ".." then
          target = vim.fn.fnamemodify(cwd, ":h")
        else
          target = cwd .. "/" .. sel
        end

        target = vim.fn.fnamemodify(target, ":p")

        vim.cmd("Oil " .. vim.fn.fnameescape(target))
      end,
    },
  })
end
