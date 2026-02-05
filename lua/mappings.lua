require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

-- Busca carpetas con fzf
vim.api.nvim_set_keymap("n", "<leader>fd",
  ":call fzf#run({'source': 'fd --type d', 'sink': 'edit'})<CR>",
  { noremap = true, silent = true })
-- Siempre repetir f/t como en Vim clásico
map("i", "jk", "<ESC>")

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    require("lualine").refresh()
  end,
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Abrir Oil en el dir actual" })
-- vim.keymap.set("n", "¡", "<CMD>Dired<CR>", { desc = "Abrir Oil en el dir actual" })
-- no se para que pero interferia en neotree
-- vim.api.nvim_create_autocmd("BufEnter", {
--     callback = function()
--         require("ibl").refresh()
--     end
-- })

vim.api.nvim_set_keymap(
  'n',
  'gG',
  ":lua require('telescope.builtin').find_files({ search_file = vim.fn.expand('<cword>') })<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  'n',
  'gF',
  ":lua require('telescope.builtin').live_grep({ default_text = vim.fn.expand('<cword>') })<CR>",
  { noremap = true, silent = true }
)

vim.keymap.set(
  {'n', 'v'},
  'gR',
  ":lua require('telescope.builtin').lsp_references()<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  'gd',
  ":Lspsaga goto_definition<CR>",
  { noremap = true, silent = true, desc =  "Telescope LSP definitions" } 
)

vim.api.nvim_set_keymap(
  'n',
  'gE',
  ":lua require('telescope.builtin').lsp_workspace_symbols()<CR>",
  { noremap = true, silent = true }
)
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- Este comando se cargará cada vez que inicies Neovim

vim.api.nvim_create_user_command('Run', function(opts)
  local efm = table.concat({
    -- 1. FORMATOS CON PREFIJO "||" (Tu salida actual)
    [[|| %f:]],

    [[|| %f:%l:%c:%m]],        -- Archivo:Línea:Columna:Mensaje
    [[|| %f:%l:%m]],           -- Archivo:Línea:Mensaje
    [[|| "%f"\, line %l:%m]],  -- Archivo entre comillas (estilo Python/C3)
    [[|| %f:%m]],              -- Archivo:Mensaje (asume línea 1)
    [[|| %f]],                 -- Solo nombre de archivo

    -- 2. FORMATOS ESTÁNDAR (GCC, Clang, C3, Ripgrep)
    [[%f:%l:%c: %t%*[^:]: %m]], -- Archivo:Línea:Col: Tipo: Mensaje
    [[%f:%l:%c: %m]],           -- Archivo:Línea:Col: Mensaje
    [[%f:%l: %t%*[^:]: %m]],    -- Archivo:Línea: Tipo: Mensaje
    [[%f:%l: %m]],              -- Archivo:Línea: Mensaje
    [[(%f:%l:%c) %m]],          -- (Archivo:Línea:Col) Mensaje (Estilo C3)

    -- 3. FORMATOS DE PIPE O COMAS (Grep viejo / MSVC)
    [[%f|%l| %m]],              -- Archivo|Línea| Mensaje
    [[%f(%l): %m]],             -- Archivo(Línea): Mensaje (Estilo Windows/MSVC)
    [[%f:%l:%m]],               -- Archivo:Línea:Mensaje (sin espacios)

    -- 4. FORMATOS DE BUSCADORES (Telescope / Ripgrep vimgrep)
    [[%f:%l:%c:%m]],            -- Sin espacios después de los dos puntos

    -- 5. LÍNEAS DE ERROR MULTI-LÍNEA (Para capturar el contexto)
    [[%f:%l:%m]],
    [[%-G%f:%l: %m]],           -- Ignorar líneas que se repitan si es necesario

    -- 6. BASURA Y FILTRADO (Ignorar mensajes informativos)
    [[-G|| grep: %f: coincidencia en fichero binario]],
    [[-G|| grep: %f: binary file matches]],
    [[-G%*\\\|%*\\\| %m]],      -- Ignorar líneas que solo sean || sin nada más
    [[-G%*\\\|%*\\\|]],         -- Ignorar líneas de solo pipes

    -- 7. CAPTURA FINAL (Si nada de lo anterior funcionó, tómalo como texto)
    [[%m]]
  }, ",")

  local command = opts.args
  local output = vim.fn.systemlist(command)

  vim.fn.setqflist({}, 'r', {
    title = command,
    lines = output,
    efm = efm
  })

  -- Abrir ventana: copen 15 (altura de 15 líneas)
  vim.cmd("copen 15")
  
  -- Forzar resaltado de sintaxis en la Quickfix para ver qué es link
  vim.cmd("setlocal syntax=qf")
end, { bang = true, nargs = '*' })


vim.keymap.set("n", "<C-r>", ":Run ")
vim.api.nvim_create_user_command('Runcommand', function(opts)
  local current = vim.fn.getcwd()
  vim.cmd.split()
  -- resizear para que sea mas baja
  vim.cmd.resize(15)
  vim.cmd.terminal(opts.args)
end, { nargs = '*', complete = 'file' })

vim.api.nvim_create_user_command('CompileCommand', function(opts)
vim.opt.errorformat = "(%f:%l:%c) %t%*[^:]: %m, %f:%l:%c: %t%*[^:]: %m"
  vim.cmd("Dispatch " .. opts.args)
  vim.cmd("resize 30")
end, {bang = true, nargs = '*' })

vim.api.nvim_create_user_command('D', function()
  vim.cmd("CompileCommand ")
  -- resizear para que sea mas baja
end, { nargs = '*' })



vim.keymap.set("n", "<A-a>", ":Runcommand ")
-- Reemplaza tu keymap problemático con este:
map("n", "<esc><esc>", "<CMD>q<CR>")

vim.lsp.inlay_hint.enable(true)
-- ~/.config/nvim/lua/colors.lua
local current = vim.g.colors_name  -- obtiene el colorscheme activo
-- treesj config keymap
vim.keymap.set(
  "n",
  "gS",
  function() 
    require("treesj").split()
    vim.cmd([[silent! %s/\n\s*,/, /g]])  -- mueve comas
  end,
  { desc = "Split code block" }
)

vim.keymap.set("n", "gJ", require("treesj").join,  { desc = "Join code block" })

vim.keymap.set(
  "n",
  "<leader>u",
  '<Esc>:%bdelete|edit #|normal`"<Return>',
  { desc = "Delete other buffers but the current one" }
)
vim.defer_fn(function()
  vim.cmd("Lazy load lualine.nvim")
end, 100) -- 2000 ms = 2 segundos

-- Usando vim.keymap.set
vim.keymap.set("n", "<C-t>", ":tabnew<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-A-q>", ":tabclose<CR>", { noremap = true, silent = true })

vim.keymap.set("t", "|", [[<C-\><C-n>]], { noremap = true })

vim.keymap.set("n", "gL", ":lua vim.diagnostic.setloclist()<CR>", { noremap = true })
--
-- vim.defer_fn(function()
--   vim.cmd("colorscheme sakura")
-- end, 2000) -- 2000 ms = 2 segundos
-- --

-- vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', {   silent = true })
-- vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious<CR>', {  silent = true })
--
vim.api.nvim_set_keymap('n', '<C-S-X>', '<C-w>q', { noremap = true, silent = true })

vim.keymap.set('n', '<C-x>', function()
    local cur = vim.api.nvim_get_current_buf()
    
    -- Si solo hay un buffer listado, cerramos la ventana
    local listed = vim.fn.getbufinfo({buflisted = 1})
    if #listed == 1 then
        vim.cmd('q')
        return
    end

    -- Moverse al buffer anterior
    vim.cmd('bp')  
    -- Borrar el buffer actual
    vim.cmd('silent! bd ' .. cur)
end, { noremap = true, silent = true })

vim.api.nvim_create_autocmd("BufEnter", { 

  callback = function()

    -- vim.cmd("TSEnable highlight")
    local ft = vim.bo.filetype
    -- Solo asignar Tab si NO es un buffer de plugin
    -- print("Autocmd BufEnter fired! Filetype: " .. vim.bo.filetype)  -- COMENTADA O ELIMINADA
    
    if ft ~= "yazi" and ft ~= "fzf" and ft ~= "oil" then
      vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true, buffer = true })
      vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true, buffer = true })
    end
  end,
})
vim.keymap.set("n", "<C-c>", function()
  require("telescope.builtin").colorscheme({
    enable_preview = true,
  })
end, { desc = "Telescope Colorscheme Picker" })

vim.keymap.set({"n", "v", "o"}, "<C-a>", "$", {noremap = true, silent = true})

vim.keymap.set("n", "ñ", ":tabNext<CR>", { noremap = true, silent = true })
vim.defer_fn(function()
  vim.cmd("colorscheme custom_v2")
end, 100)

vim.keymap.set(
  {'n', 'v'},
  'gr',
  ":lua vim.lsp.buf.rename()<CR>",
  { noremap = true, silent = true }
)

-- para que scope no se rompa y funcione
vim.keymap.set("n", "<C-w>t", ":tabnew | term<CR>", { noremap = true, silent = true })

-- Resize windows con Ctrl-A + hjkl
vim.api.nvim_set_keymap('n', '<C-A-h>', ':vertical resize -5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-A-l>', ':vertical resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-A-j>', ':resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-A-k>', ':resize -5<CR>', { noremap = true, silent = true })
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "c", "cpp" },
--   command = "setlocal makeprg=gcc\\ %\\ -o\\ %<"
-- })
--
--



--fyler lo agarrare mas adelant-- fyler lo agarrare mas adelantee
-- local fyler = require("fyler")
-- vim.keymap.set(
--   "n",
--   "<A-e>",
--   function()  fyler.toggle({ kind = "split_left" }) end,
--   { desc = "Open Fyler View" }
-- )
--
-- fyler.setup({
--   view = {
--     width = 10,
--     adaptive_size = false,  -- mantiene un ancho fijo estilo tree
--     relativenumber = true,
--   },
--   mappings = {
--     ["<C-e>"] = "GotoParent",
--   },
--
-- })
-- vim.keymap.set("n", "<A-S-e>",function() fyler.open({ kind = "split_left_most" }) end,  { desc = "Open Fyler View" })
--
vim.keymap.set("n", "<A-r>", ":exe @:<CR>", { desc = "Run last command" })
-- Or via lua api
vim.opt.verbose = 0

--
-- vim.keymap.set("n", "gc", ":Lspsaga outline<CR>", { desc = "Open Fyler View" })
-- para debug
vim.api.nvim_create_user_command('BufExec', function(opts)
  local output = vim.fn.execute(opts.args)
  vim.cmd('enew')
  vim.bo.buftype = 'nofile'
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(output, '\n'))
end, { nargs = '+' })

vim.keymap.set("n", "<A-g>", ":CodeDiff<CR>", { desc = "Open CodeDiff vscode like View" })

local diagnostics_enabled = true

-- función toggle
function ToggleDiagnostics()
    if diagnostics_enabled then
        vim.diagnostic.disable()
        diagnostics_enabled = false
        print("Diagnostics OFF")
    else
        vim.diagnostic.enable()
        diagnostics_enabled = true
        print("Diagnostics ON")
    end
end

function ToggleBlink()
    blink_enabled = not blink_enabled
    require("blink.cmp").setup({ auto_complete = blink_enabled })
    print("Blink autocomplete:", blink_enabled and "ON" or "OFF")
end

-- Desactiva todos los diagnósticos automáticamente
vim.keymap.set("n","<A-d>", function() ToggleBlink() end, {desc = "thisn"}) 
vim.keymap.set("n","<A-s>", function() ToggleDiagnostics() end, {desc = "thisn"}) 



vim.keymap.set("i", "<A-l>", "<C-Left>")
vim.keymap.set("i", "<A-j>", "<C-Right>")
vim.keymap.set("i", "<A-e>", "<C-o>dw")

local function toggle_qf()
  local curwin = vim.api.nvim_get_current_win()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.bo[vim.api.nvim_win_get_buf(win)].buftype == "quickfix" then
      vim.cmd("cclose")
      return
    end
  end
  vim.cmd("copen")
  vim.api.nvim_set_current_win(curwin)
end


vim.keymap.set("n", "<A-c>", function() toggle_qf() end, { noremap = true, silent = true })

vim.keymap.set("v", "&", function()
  local oil = require("oil")
  local bufnr = vim.api.nvim_get_current_buf()
  local dir = oil.get_current_dir()
  if not dir then return end

  -- rango visual real
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")

  local paths = {}

  for lnum = start_line, end_line do
    local entry = oil.get_entry_on_line(bufnr, lnum)
    if entry and entry.name then
      table.insert(paths, vim.fn.shellescape(dir .. entry.name))
    end
  end

  if #paths == 0 then return end

  vim.ui.input({ prompt = "Command: " }, function(cmd)
    if not cmd or cmd == "" then return end
    vim.fn.system(cmd .. " " .. table.concat(paths, " "))
  end)
end, { desc = "Oil: apply shell command to visual selection" })


vim.keymap.set("n", "yp", function()
  local oil = require("oil")
  local entry = oil.get_cursor_entry()
  if not entry then return end

  local path = oil.get_current_dir() .. entry.name
  vim.fn.setreg("+", path)
  print("Yanked: " .. path)
end)

function exec(path) 
  print("Executing: " .. path)
  local final_cmd = "." .. path
  vim.cmd("Runcommand " .. path)
end

vim.keymap.set("n", "&", function()
  local oil = require("oil")
  local entry = oil.get_cursor_entry()
  if not entry then return end

  local path = oil.get_current_dir() .. entry.name
  local current_path = oil.get_current_dir()

  vim.ui.input({ prompt = "Command: " }, function(cmd)
    if not cmd or cmd == "" then return end

    if cmd == "." then 
      exec(oil.get_current_dir() .. entry.name)
      return 
    end 
    local function run(args_before)
      local full_cmd
      if args_before then
        local args_path = " " .. current_path .. args_before   
        full_cmd = cmd .. " " .. vim.fn.shellescape(path) .. args_path
      else
        full_cmd = cmd .. " " .. vim.fn.shellescape(path)
      end

      print("Executing:", full_cmd)
      vim.cmd("Runcommand " .. full_cmd)
    end

    -- si contiene o al final
    local is_open = cmd:sub(1, 2) == "! "
    if is_open then
      cmd = cmd:gsub("^%s*o%s+", "")
      print(cmd)
      vim.ui.input({ prompt = "Args before path: " }, function(args)
        if args == "" then args = nil end
        run(args)
      end)
    else
      run(nil)
    end
  end)
end, { desc = "Oil: apply shell command to entry" })

local function find_list()
  local vim_ui = require("marker-groups.pickers.vim_ui")
  vim_ui.show_markers()
end

vim.api.nvim_create_user_command("FindList", find_list, {})

vim.keymap.set(
  "n",
  "<leader>mf",
  ":FindList<CR>",
  { desc = "Abrir Oil en el dir actual" }
)


-- Guardamos la ventana del file_browser
local fb_win = nil

local function toggle_file_browser()
  -- Si la ventana existe y es válida, la cerramos
  if fb_win and vim.api.nvim_win_is_valid(fb_win) then
    vim.api.nvim_win_close(fb_win, true)
    fb_win = nil
    return
  end

  -- Path real, Oil-safe
  local path = vim.fn.expand("%:p:h")
  if path:match("^oil://") then
    path = require("oil").get_current_dir()
  end

  -- Abrir file_browser
  require("telescope").extensions.file_browser.file_browser({
    path = path,
    cwd = path,
    layout_strategy = "bottom_pane",
    layout_config = { height = 0.30, preview_cutoff = 1 },
    sorting_strategy = "ascending",
    file_ignore_patterns = {
      "%.uid$",           -- archivos *.uid
      "^uid$",            -- carpeta llamada uid
      "^uid%d+$",         -- uid123, uid456
      "%d%d%d%d%d%d+",    -- IDs largos
    },
  })

  -- Guardamos la ventana después de que Telescope se abra
  vim.defer_fn(function()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      if vim.bo[buf].filetype == "TelescopePrompt" then
        fb_win = win
        break
      end
    end
  end, 50)
end

-- Map solo en modo normal
vim.keymap.set("n", "<M-f>", toggle_file_browser, { desc = "Toggle Telescope File Browser" })

vim.keymap.set("n", "<M-b>", ":Unite buffer<CR>", { noremap = true, silent = true })

local opts = { noremap = true, silent = false }
vim.keymap.set(
  "n",
  "L",
  function ()
    vim.fn.feedkeys(":AsyncRun ", "n")
   vim.cmd("copen 10")
  end,
  opts
)

vim.keymap.set(
  "n",
  "Z",
  ":Zi<CR>",
  opts
)
-- require('fzf-lua').register_ui_select()
local function vis_expand(dire)
    local mode = vim.api.nvim_get_mode().mode
    local is_visual = mode:sub(1, 1) == "v" or mode:sub(1, 1) == "V"

    if not is_visual then
        -- PRIMER TOQUE (Desde modo Normal)
        if dire == "atras" then
            -- v (activar) -> b (atrás) -> o (anclar al final)
            vim.cmd("normal! vbo")
        else
            -- v (activar) -> e (final de palabra) -> o (anclar al inicio)
            vim.cmd("normal! veo")
        end
    else
        -- SIGUIENTES TOQUES (Ya en modo Visual)
        if dire == "atras" then
            -- o (ir al extremo izquierdo) -> b (retroceder más) -> o (volver al ancla derecha)
            vim.cmd("normal! obo")
        else
            -- o (ir al extremo derecho) -> w (avanzar) -> e (asegurar palabra) -> o (volver al ancla izquierda)
            vim.cmd("normal! oweo")
        end
    end
end

-- Mapeos
-- vv: Expandir hacia adelante (cursor al inicio)
vim.keymap.set({ "n", "x" }, "vv", function() vis_expand("adelante") end, { desc = "Expandir selección hacia adelante" })

-- vr: Expandir hacia atrás (cursor al final)
vim.keymap.set({ "n", "x" }, "vr", function() vis_expand("atras") end, { desc = "Expandir selección hacia atrás" })-- Mover el cursor letra a letra sin usar las flechas
vim.keymap.set('c', '<C-h>', '<C-Left>')
vim.keymap.set('c', '<C-l>', '<C-Right>')
vim.keymap.set('c', '<C-a>', '<C-w>')

local function vis_expand_smart(direction)
    local mode = vim.api.nvim_get_mode().mode
    local is_visual = mode:sub(1, 1) == "v" or mode:sub(1, 1) == "V"

    if not is_visual then
        -- PRIMER TOQUE (Desde modo Normal)
        -- Activamos visual, movemos y regresamos al inicio
        vim.cmd("normal! v" .. direction .. "o")
    else
        -- TOQUES SUCESIVOS
        if direction == "W" or direction == "w" or direction == "e" then
            -- Expandir hacia ADELANTE:
            -- 1. o (ir al frente móvil) 
            -- 2. W (avanzar) 
            -- 3. o (volver al ancla fija atrás)
            vim.cmd("normal! owo")
        else
            -- Expandir hacia ATRÁS (B):
            -- 1. o (ir al frente móvil que ahora está a la izquierda)
            -- 2. B (retroceder)
            -- 3. o (volver al ancla fija que está a la derecha)
            vim.cmd("normal! obo")
        end
    end
end

-- IMPORTANTE: Usamos {"n", "x"} para que funcione desde modo normal y visual
vim.keymap.set("x", "W", function() vis_expand_smart("W") end, { desc = "Expandir selección adelante" })

vim.keymap.set("x", "B", function() vis_expand_smart("B") end, { desc = "Expandir selección atrás" })

map("n", "<A-X>", function()
	vim.opt.cmdheight = 0
   vim.api.nvim_create_autocmd("CmdwinEnter", {
	  once = true,
	  callback = function()
    		vim.o.laststatus = 0
		  vim.opt_local.filetype = "minibuffer"
	  end
   })
	return "q:i <BS>"
end, { expr = true })
