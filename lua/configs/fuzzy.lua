return {
  lazy = false,
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")
    local actions = require("fzf-lua.actions")
    fzf.setup({
          keymap = {
        builtin = {
          ["<F1>"] = "toggle-help",
          ["<F2>"] = "toggle-fullscreen",
          ["<C-/>"] = "toggle-preview",
          ["<C-p>"] = "toggle-preview",
          ["<C-d>"] = "preview-page-down",
          ["<C-u>"] = "preview-page-up",
          ["<C-q>"] = "select-all+accept",
          ["<C-s>"] = "toggle-search",
          -- Movimiento con Tab y flechas
          -- ["<Tab>"] = "down",
          -- ["<S-Tab>"] = "up",
          ["<Down>"] = "down",
          ["<Up>"] = "up",
          ["<C-j>"] = "down",
          ["<C-k>"] = "up",
        },
        fzf = {
          ["ctrl-q"] = "select-all+accept",
          ["ctrl-d"] = "half-page-down",
          ["ctrl-u"] = "half-page-up",
          ["ctrl-a"] = "beginning-of-line",
          ["ctrl-e"] = "end-of-line",
          ["alt-a"] = "toggle-all",
          -- -- Asegurar movimiento en fzf nativo
          -- ["<Tab>"] = "down",
          -- ["<S-Tab>"] = "up",
          ["tab"] = "down",
          ["shift-tab"] = "up",
          ["ctrl-j"] = "down",
          ["ctrl-k"] = "up",
        },
      },

      -- Estilo general similar a Telescope dropdown
      winopts = {
        height = 0.70,
        width = 0.86,
        row = 0.40,
        col = 0.50,
        border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
        fullscreen = false,
        
        -- Preview configuration (lado derecho como Telescope)
        preview = {
          default = 'bat',
          border = 'noborder',
          wrap = 'nowrap',
          hidden = 'nohidden',
          vertical = 'down:50%',
          horizontal = 'right:50%',
          layout = 'flex',
          flip_columns = 120,
          title = true,
          title_pos= "center",
          scrollbar = 'border',
          scrolloff = '-2',
          scrollchars = {'█', '' },
          delay = 100,
          winopts = {
            number = false,
            relativenumber = true,
            cursorline = true,
            cursorlineopt = 'both',
            cursorcolumn = false,
            signcolumn = 'no',
            list = false,
            foldenable = false,
            foldmethod = 'manual',
          },
        },
      },
      
      -- Opciones de fzf para mejor experiencia
      --
      fzf_opts = {
        ["--bind"] = table.concat({
          "ctrl-h:change-prompt(.. )+reload(builtin-dir)",
          "ctrl-?:change-prompt(.. )+reload(builtin-dir)",
        }, ","),
        ["--layout"] = "reverse",
        ["--info"] = "inline-right",
        ["--height"] = "100%",
        ["--multi"] = "",
        ["--prompt"] = "perra  ",
        ["--pointer"] = "▶",
        ["--marker"] = "✓",
        ["--border"] = "none",
        ["--padding"] = "0,1",
        ["--no-scrollbar"] = "",
        ["--cycle"] = "",
      },
      
      -- Colores mejorados (ajustados para Vesper)
      fzf_colors = {
        ["fg"] = { "fg", "Normal" },
        ["bg"] = { "bg", "Normal" },
        ["hl"] = { "fg", "Function" },
        ["fg+"] = { "fg", "Normal" },
        ["bg+"] = { "bg", "CursorLine" },
        ["hl+"] = { "fg", "Statement" },
        ["info"] = { "fg", "Comment" },
        ["prompt"] = { "fg", "Conditional" },
        ["pointer"] = { "fg", "Exception" },
        ["marker"] = { "fg", "Keyword" },
        ["spinner"] = { "fg", "Label" },
        ["header"] = { "fg", "Comment" },
        ["gutter"] = { "bg", "Normal" },
        ["border"] = { "fg", "Comment" },
      },
      -- Keymaps mejorados
      -- keymap = {
      --   builtin = {
      --     ["<F1>"] = "toggle-help",
      --     ["<F2>"] = "toggle-fullscreen",
      --     ["<C-/>"] = "toggle-preview",
      --     ["<C-p>"] = "toggle-preview",
      --     ["<C-d>"] = "preview-page-down",
      --     ["<C-u>"] = "preview-page-up",
      --     ["<C-q>"] = "select-all+accept",
      --     ["<C-s>"] = "toggle-search",
      --   },
      --   fzf = {
      --     ["ctrl-q"] = "select-all+accept",
      --     ["ctrl-d"] = "half-page-down",
      --     ["ctrl-u"] = "half-page-up",
      --     ["ctrl-a"] = "beginning-of-line",
      --     ["ctrl-e"] = "end-of-line",
      --     ["alt-a"] = "toggle-all",
      --   },
      -- },
      -- Files: configuración optimizada con preview
      files = {
        prompt = "Files  ",
        multiprocess = true,
        git_icons = true,
        file_icons = true,
        color_icons = true,
        cmd = "fd --type f --hidden --follow --exclude .git",
        -- Mostrar preview de archivos
        previewer = "builtin",
        actions = {
          ["default"] = actions.file_edit,
          ["ctrl-q"] = actions.file_edit_or_qf,
          ["ctrl-s"] = actions.file_split,
          ["ctrl-v"] = actions.file_vsplit,
          ["ctrl-t"] = actions.file_tabedit,
          ["alt-q"] = actions.file_sel_to_qf,
    --       ["backspace"] = function(selected, opts)
    --         require("fzf-lua").files({
    --           cwd = vim.fn.fnamemodify(opts.cwd or ".", ":h"),
    --   })
    -- end,
        },
        winopts = {
          preview = {
            hidden = "nohidden",
          }
        }
      },
      -- Git files
      git = {
        files = {
          prompt = "Git Files  ",
          cmd = "git ls-files --exclude-standard",
          multiprocess = true,
          git_icons = true,
          file_icons = true,
          color_icons = true,
          previewer = "builtin",
        },
        status = {
          prompt = "Git Status  ",
          cmd = "git -c color.status=false status -su",
          previewer = "git_diff",
          file_icons = true,
          git_icons = true,
          color_icons = true,
        },
        commits = {
          prompt = "Commits  ",
          cmd = "git log --color --pretty=format:'%C(yellow)%h%Creset %Cgreen(%><(12)%cr%><|(12))%Creset %s %C(blue)<%an>%Creset'",
          preview = "git show --color {1}",
          actions = {
            ["default"] = actions.git_checkout,
          },
        },
        branches = {
          prompt = "Branches  ",
          cmd = "git branch --all --color",
          preview = "git log --graph --pretty=oneline --abbrev-commit --color {1}",
          actions = {
            ["default"] = actions.git_switch,
          },
        },
      },
      
      -- Grep: live grep con preview
      grep = {
        prompt = "Rg  ",
        input_prompt = "Grep For  ",
        multiprocess = true,
        git_icons = true,
        file_icons = true,
       color_icons = true,
        cmd = "rg --column --line-number --no-heading --color=always --smart-case",
        -- Preview del resultado con contexto
        previewer = "builtin",
        actions = {
          ["default"] = actions.file_edit,
          ["ctrl-s"] = actions.file_split,
          ["ctrl-v"] = actions.file_vsplit,
          ["ctrl-t"] = actions.file_tabedit,
          ["alt-q"] = actions.file_sel_to_qf,
        },
      },
      
      -- Buffers con preview
      buffers = {
        prompt = "Buffers  ",
        file_icons = true,
        color_icons = true,
        sort_lastused = true,
        sort_mru = true,
        show_all_buffers = true,
        ignore_current_buffer = false,
        current_buffer = true,          -- permitir seleccionarlo
        cwd_only = false,
        previewer = "builtin",
        actions = {
          ["default"] = actions.buf_edit,
          ["ctrl-s"] = actions.buf_split,
          ["ctrl-v"] = actions.buf_vsplit,
          ["ctrl-t"] = actions.buf_tabedit,
          ["alt-d"] = { fn = actions.buf_del, reload = true },

          ["ctrl-d"] = {
            fn = function(selected)
              local actions = require("fzf-lua.actions")
              local bufnr = tonumber(selected[1]:match("^(%d+)"))

              if not bufnr then return end

              if bufnr == vim.api.nvim_get_current_buf() then
                vim.cmd("bnext")   -- mover a otro buffer
              end

              actions.buf_del({ tostring(bufnr) }, { force = true })
            end,
            reload = true,
          },

        },
      },
      -- Oldfiles con preview
      oldfiles = {
        prompt = "History  ",
        cwd_only = false,
        stat_file = true,
        include_current_session = true,
        previewer = "builtin",
        file_icons = true,
        color_icons = true,
        actions = {
          ["default"] = actions.file_edit_or_qf,
        },
      },
      
      -- LSP con preview mejorado
      lsp = {
        prompt_postfix = "  ",
        cwd_only = false,
        async_or_timeout = 5000,
        file_icons = true,
        git_icons = false,
        lsp_icons = true,
        ui_select = true,
        symbol_style = 1,
        code_actions = {
          prompt = "Code Actions  ",
          previewer = "codeaction_native",
          preview_pager = "delta --side-by-side --width=$FZF_PREVIEW_COLUMNS",
        },
      },
      
      -- Comandos y keymaps con preview
      commands = {
        prompt = "Commands  ",
        actions = {
          ["default"] = actions.ex_run,
        },
      },
      
    })
    vim.defer_fn(function() 
      vim.keymap.set("n", "<leader>fw", fzf.live_grep , { desc = "Grep", noremap = true }) 

     -- vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Buffers" })
      vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find Files" })
    end, 200)

    -- ==========================================
    -- KEYM    -- Búsqueda principal con Ctrl-g 
    vim.keymap.set("n", "<C-g>", function()
      fzf.files({
        winopts = {
          preview = { hidden = "nohidden" }
        }
      })
    end, { desc = "Fuzzy Search Files" })
    
    -- Files y navegación
    vim.keymap.set("n", "<leader>fg", fzf.git_files, { desc = "Git Files" })

    vim.keymap.set("n", "<leader>fr", fzf.oldfiles, { desc = "Recent Files" })
    
    -- Búsqueda de texto
    vim.keymap.set("n", "<leader>fw", ":FzfLua live_grep<CR>", { noremap = true , silent = true,  }) 
      vim.keymap.set("n", "<leader>fW", fzf.grep_cword, { desc = "Grep Word" })
    vim.keymap.set("v", "gV", fzf.grep_visual, { desc = "Grep Visual" })
    vim.keymap.set("n", "<leader>fl", fzf.blines, { desc = "Buffer Lines" })
    vim.keymap.set("n", "<leader>fL", fzf.lines, { desc = "All Lines" })
    
    -- Git
    vim.keymap.set("n", "<leader>gs", fzf.git_status, { desc = "Git Status" })
    vim.keymap.set("n", "<leader>gc", fzf.git_commits, { desc = "Git Commits" })
    vim.keymap.set("n", "<leader>gC", fzf.git_bcommits, { desc = "Buffer Commits" })
    vim.keymap.set("n", "<leader>gb", fzf.git_branches, { desc = "Git Branches" })
    
    -- LSP
    vim.keymap.set("n", "<leader>jr", fzf.lsp_references, { desc = "LSP References" })
    vim.keymap.set("n", "<leader>jd", fzf.lsp_definitions, { desc = "LSP Definitions" })
    vim.keymap.set("n", "<leader>ji", fzf.lsp_implementations, { desc = "LSP Implementations" })
    vim.keymap.set("n", "<leader>js", fzf.lsp_document_symbols, { desc = "Document Symbols" })
    vim.keymap.set("n", "<leader>jS", fzf.lsp_workspace_symbols, { desc = "Workspace Symbols" })
    vim.keymap.set("n", "<leader>ja", fzf.lsp_code_actions, { desc = "Code Actions" })
    vim.keymap.set("n", "<leader>je", fzf.diagnostics_document, { desc = "Document Diagnostics" })
    vim.keymap.set("n", "<leader>jE", fzf.diagnostics_workspace, { desc = "Workspace Diagnostics" })
    
    -- Utilidades
    vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help Tags" })
    vim.keymap.set("n", "<leader>fc", fzf.commands, { desc = "Commands" })
    vim.keymap.set("n", "<leader>fk", fzf.keymaps, { desc = "Keymaps" })
    vim.keymap.set("n", "<leader>fm", fzf.marks, { desc = "Marks" })
    vim.keymap.set("n", "<leader>fj", fzf.jumps, { desc = "Jumps" })
    vim.keymap.set("n", "<leader>fq", fzf.quickfix, { desc = "Quickfix" })
    vim.keymap.set("n", "<leader>fp", fzf.resume, { desc = "Resume Last" })
    
    -- Colorschemes
    vim.keymap.set("n", "<leader>ft", fzf.colorschemes, { desc = "Colorschemes" })
  end,
}
