
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

local function folder_list(cwd)
  cwd = cwd or vim.loop.cwd()

  -- si estás en "/", no mostramos "../"
  local up = ""
  if cwd ~= "/home/insidev" then
    up = "printf '../\n';"
  end

  -- comando final
  local cmd = string.format(
    [[bash -lc "%s fd -t d --max-depth 1 --hidden --exclude .git 2>/dev/null | sed 's#^./##'" ]],
    up
  )

  return cmd
end
_G.browse_dirs = function(opts)
  opts = opts or {}
  local cwd = opts.cwd or vim.loop.cwd()

  -- Comando que muestra ".." y los subdirectorios

  fzf.fzf_exec(folder_list(cwd), {
    cwd = cwd,
    prompt = cwd .. " > ",
    

    --
    fzf_opts = {
      ["--height"] = "100%",
      ["--layout"] = "reverse",
      ["--info"]   = "inline",
      ["--border"] = "none",
      ["--preview"] = "ls -la --color=always {}",
    },

    --  Preview al costado
   
    actions = {
      -- Entrar en el directorio
      ["enter"] = function(selected)
        if not selected or not selected[1] then return end
        local sel = selected[1]

        if sel == ".." then
          browse_dirs({ cwd = vim.fn.fnamemodify(cwd, ":h") })
          return
        end

        browse_dirs({ cwd = cwd .. "/" .. sel })
      end,

      ["ctrl-o"] = function(selected)
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

