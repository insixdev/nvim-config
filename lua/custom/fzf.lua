
-- Carpetas favoritas
local folders = {
  "~/.config/nvim/",
  "~/practice",
  "/mnt/data/proyect/",
}

vim.keymap.set("n", "<C-g>", ":FavFolders<CR>")
vim.keymap.set("n", "<C-f>", ":HomeFolder<CR>")
vim.api.nvim_create_user_command("HomeFolders", function()
  vim.fn["fzf#run"]({
    source = "fd --type d --hidden --exclude .git . ~",
    sink = function(dir)
      vim.cmd("cd " .. dir)
      print("cd → " .. dir)
    end,
    options = "--preview 'ls -la {}'"
  })
end, {})

vim.api.nvim_create_user_command("FavFolders", function()
  vim.fn["fzf#run"]({
    source = folders,
    sink = function(dir)
      vim.cmd("cd " .. dir)
      print("cd → " .. dir)
    end
  })
end, {})
-- FZF: elegir carpetas y hacer cd
vim.api.nvim_create_user_command("Folders", function()
  vim.fn["fzf#run"]({
    source = "fd --type d --hidden --exclude .git",
    sink = function(dir)
      vim.cmd("cd " .. dir)
      print("cd → " .. dir)
    end,
    options = "--preview 'ls -la {}'"
  })
end, {})
