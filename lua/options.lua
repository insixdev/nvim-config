require "nvchad.options"
require("custom.fzf")
vim.opt.conceallevel = 2
vim.o.swapfile = false       -- Desactiva archivos swap
vim.o.writebackup = false    -- Desactiva backup al guardar
-- add yours here!
vim.wo.relativenumber = true

vim.o.showtabline = 0  -- 0 = nunca mostrar, 1 = solo si hay >1 tab, 2 = siempre mostrar
-- local o = vim.o
vim.o.cursorlineopt ='both' -- to enable cursorline!
vim.opt.wildmenu = true
vim.opt.cursorline = true
vim.opt.linebreak = true 


--vim.g.neovide_font = "Hack:h12"  -- Fuente y tamaño
vim.g.neovide_antialiasing = true
vim.g.neovide_cursor_antialiasing = true

vim.o.termguicolors = true 

vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = -1
vim.opt.foldenable = true
vim.opt.foldmethod= "indent"

-- En tu init.lua o dentro de autocmds
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.opt_local.shiftwidth = 3 -- cuántos espacios al indentar
    vim.opt_local.tabstop = 3     -- ancho del tab visual
    vim.opt_local.softtabstop = 3 -- para <Tab> en insert mode
  end,
})



vim.api.nvim_create_autocmd("DirChanged", {
  callback = function()
    local ok, oil = pcall(require, "oil")
    local ok2, act = pcall(require, "oil.actions")
    if not ok then return end
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype == "oil"
        then
          -- usamos la API interna de Oil para refrescar el buffer existente
          pcall(oil.refresh, buf)
        end
      end
    end,
  })
  -- Mapear _ solo en buffers de Oil
  -- Mapear _ solo en buffers de Oil
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "oil",
    callback = function()
      vim.keymap.set("n", "_", "<cmd>Yazi toggle<cr>", { buffer = true, desc = "Toggle Yazi desde Oil" })
    end,
  })


require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {
    Keyword = { fg = "#859285", bold = true },
    Type    = { fg = "#ebc96c", italic = true },
  },
  dim_inactive = false,
  transparent_mode = true,
})
-- TREEE CONFIGURATIO=N 
require("nvim-tree").setup({
  disable_netrw = true,           -- desactiva netrw
  hijack_netrw = true,            -- nvim-tree reemplaza netrw
  view = {
    width = 25,                   -- ancho del panel
    side = "left",
    hide_root_folder = true,      -- oculta el root folder
    mappings = {
      list = {
        { key = "q", action = "close" }, -- cerrar con q
      },
    },
  },
  renderer = {
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
      },
    },
  },
  view = {
    number = false,
    relativenumber = false,
    signcolumn = "no",
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  filters = {
    dotfiles = true,               -- oculta archivos .dot
    custom = { "node_modules" },   -- oculta node_modules
  },
})

-- loual ine arriba aa 
--
--
-- Habilitar winbar global
vim.o.showtabline = 0  -- desactiva statusline de abajo
--vim.o.winbar = ""
vim.opt.fillchars:append({ eob = "~" })
vim.opt.statusline = "f"

-- NEOVIDEJko
vim.api.nvim_create_user_command("OpenInNewNeovide", function()
  local file = vim.fn.expand("%:p")
  vim.fn.jobstart({ "neovide", "--", file }, { detach = true })
end, {})


vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
-- zen

-- Apagar y prender incline al entrar/salir de ZenMode
vim.api.nvim_create_autocmd("User", {
  pattern = "ZenModeEnter",
  callback = function()
    vim.g.incline_enabled = false
    require("incline").disable()
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "ZenModeLeave",
  callback = function()
    vim.g.incline_enabled = true
    require("incline").enable()
  end,
})



vim.notify = function(msg, log_level, opts)
  if msg:match("Autocmd BufEnter fired!") then
    return
  end
  vim.api.nvim_echo({{msg}}, true, {})
end


vim.opt.signcolumn = "yes:1"
vim.opt.numberwidth = 2



vim.defer_fn(function()
  vim.cmd('TSToggle highlight')
end, 300)

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("LualineThemeReload", { clear = true }),
  callback = function()
    local cs = vim.g.colors_name
    reload_lualine(cs)
  end,
})


local navic = require("nvim-navic")
local devicons = require("nvim-web-devicons")
vim.o.autochdir = false
--
-- vim.o.winbar =
--   "%f %{%v:lua.WinbarIcon()%} > " .. "%{%v:lua.require'nvim-navic'.get_location()%}"

-- porfin es asi p
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    -- Restaurar cwd real automáticamente
    vim.cmd("cd .")

    -- Refrescar winbar + navic
    pcall(function()
      require("nvim-navic").refresh()
    end)

    vim.cmd("redrawstatus")
  end,
})


vim.api.nvim_create_autocmd('BufWinEnter', {
    command = 'set formatoptions-=cro',
})

vim.opt.guicursor = ""

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = {
    "kanso",
    "ayu",
    "kanso-zen",
    "kanso-mist",
    "kanso-pearl",
    "base16-ayu-dark",
    "base16-gruvbox-material-dark-medium",
    "custom_v2",
    "gruvbox",
    "vague"
  }, 
  callback = function()
    vim.cmd [[
      highlight RainbowDelimiterRed    guifg=#DDCca9
      highlight RainbowDelimiterYellow guifg=#DEBF7C
      highlight RainbowDelimiterBlue   guifg=#8aa19a
      highlight RainbowDelimiterOrange guifg=#c78f69
      highlight RainbowDelimiterGreen  guifg=#A2A970
      highlight RainbowDelimiterViolet guifg=#8f8ccc
      highlight RainbowDelimiterCyan   guifg=#a7ccb4

      highlight DiagnosticUnnecessary guibg=NONE guifg=#6f7b68
      highlight FlashBackdrop         guibg=NONE guifg=#6f7b68
    ]]
  end,
})

local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function open_in_oil(prompt_bufnr)
  local entry = action_state.get_selected_entry()
  actions.close(prompt_bufnr)

  local path = entry.path or entry.value
  if path then
    require("oil").open(path)
  end
end

require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<C-o>"] = open_in_oil,
      },
      n = {
        ["o"] = open_in_oil,
      },
    },
  },
})

--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "dired",
--   callback = function()
--     vim.keymap.set("n", "'", function()
--       vim.cmd.tcd(vim.fn.expand("%:p:h"))
--     end, { buffer = true })
--   end,
-- })
--
vim.keymap.set("n", "¿", function()
  local dir = vim.fn.expand("%:p:h")
  vim.cmd.lcd(dir)
  require("dired").open(dir)
end, { buffer = true })

require('fff').setup({
    base_path = vim.fn.getcwd(),
    prompt = '🪿 ',
    title = 'FFFiles',
    max_results = 100,
    max_threads = 4,
    lazy_sync = true, -- set to false if you want file indexing to start on open
    layout = {
      height = 0.8,
      width = 0.8,
      prompt_position = 'bottom', -- or 'top'
      preview_position = 'right', -- or 'left', 'right', 'top', 'bottom'
      preview_size = 0.5,
    },
    preview = {
      enabled = true,
      max_size = 10 * 1024 * 1024, -- Do not try to read files larger than 10MB
      chunk_size = 8192, -- Bytes per chunk for dynamic loading (8kb - fits ~100-200 lines)
      binary_file_threshold = 1024, -- amount of bytes to scan for binary content (set 0 to disable)
      imagemagick_info_format_str = '%m: %wx%h, %[colorspace], %q-bit',
      line_numbers = false,
      wrap_lines = false,
      show_file_info = true,
      filetypes = {
        svg = { wrap_lines = true },
        markdown = { wrap_lines = true },
        text = { wrap_lines = true },
      },
    },
    keymaps = {
      close = '<Esc>',
      select = '<CR>',
      select_split = '<C-s>',
      select_vsplit = '<C-v>',
      select_tab = '<C-t>',
      -- you can assign multiple keys to any action
      move_up = { '<Tab>', '<C-p>' },
      move_down = { '<S-Tab>', '<C-n>' },
      preview_scroll_up = '<C-u>',
      preview_scroll_down = '<C-d>',
      toggle_debug = '<F2>',
      -- goes to the previous query in history
      cycle_previous_query = '<C-Up>',
    },
    hl = {
      border = 'FloatBorder',
      normal = 'Normal',
      cursor = 'CursorLine',
      matched = 'IncSearch',
      title = 'Title',
      prompt = 'Question',
      active_file = 'Visual',
      frecency = 'Number',
      debug = 'Comment',
    },
    -- Store file open frecency 
    frecency = {
      enabled = true,
      db_path = vim.fn.stdpath('cache') .. '/fff_nvim',
    },
    -- Store successfully opened queries with respective matches
    history = {
      enabled = true,
      db_path = vim.fn.stdpath('data') .. '/fff_queries',
      min_combo_count = 3, -- file will get a boost if it was selected 3 in a row times per specific query
      combo_boost_score_multiplier = 100, -- Score multiplier for combo matches 
    },
    debug = {
      enabled = false, -- Set to true to show scores in the UI
      show_scores = false,
    },
    logging = {
      enabled = true,
      log_file = vim.fn.stdpath('log') .. '/fff.log',
      log_level = 'info',
    }
})

local cwd = vim.fn.getcwd()
local project_file = cwd .. '/project.godot'
local is_godot_project = vim.uv.fs_stat(project_file) ~= nil
local godot_project_path = cwd

if is_godot_project then
    local server_pipe = godot_project_path .. '/server.pipe'
    local is_server_running = vim.uv.fs_stat(server_pipe) ~= nil

    if not is_server_running then
        vim.fn.serverstart(server_pipe)
        print("Godot server started at " .. server_pipe)
    else
        print("Godot server already running")
    end
else
  -- not a godot proyect
end
vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil",
  callback = function(args)
    vim.b[args.buf].todo_comments_disable = true
  end,
})
