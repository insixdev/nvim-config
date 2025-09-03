-- configs/cmp.lua - CMP MINIMALISTA ADAPTATIVO ESTILO NVCHAD
local cmp = require("cmp")

-- ═══════════════════════════════════════════════════════════════
-- 🎨 FUNCIÓN PARA OBTENER COLORES DEL TEMA NVCHAD
-- ═══════════════════════════════════════════════════════════════
local function get_nvchad_colors()
  local status, base46 = pcall(require, "base46")
  
  if status then
    local colors = base46.get_theme_tb("base_30")
    if colors then
      return colors
    end
  end
  
  -- Fallback: colores por defecto
  return {
    white = "#D9E0EE",
    darker_black = "#191B28",
    black = "#1E2030",
    black2 = "#252738", 
    one_bg = "#2D3348",
    one_bg2 = "#363A4F",
    one_bg3 = "#3E4255",
    grey = "#51576D",
    grey_fg = "#5D6578",
    grey_fg2 = "#676B80",
    light_grey = "#7C819A",
    red = "#E06B75",
    baby_pink = "#F5C2E7",
    pink = "#F5C2E7",
    line = "#2D3348",
    green = "#98C379",
    vibrant_green = "#A6E3A1",
    nord_blue = "#5E81AC",
    blue = "#61AFEF",
    yellow = "#E5C07B",
    sun = "#FFCB6B", 
    purple = "#C678DD",
    dark_purple = "#A569BD",
    teal = "#56B6C2",
    orange = "#D19A66",
    cyan = "#56B6C2",
  }
end

-- ═══════════════════════════════════════════════════════════════
-- 🎭 HIGHLIGHTS MINIMALISTAS PERO ADAPTATIVOS
-- ═══════════════════════════════════════════════════════════════
local function apply_minimal_highlights()
  local colors = get_nvchad_colors()
  
  local highlights = {
    -- Pmenu principal - estilo NvChad
    CmpPmenu = { bg = colors.darker_black, fg = colors.white },
    CmpPmenuBorder = { bg = colors.darker_black, fg = colors.grey },
    CmpPmenuSbar = { bg = colors.one_bg },
    CmpPmenuThumb = { bg = colors.grey },
    
    -- Selección - minimalista
    CmpPmenuSel = { bg = colors.one_bg, bold = true },
    
    -- Documentación - limpia
    CmpDoc = { bg = colors.black, fg = colors.light_grey },
    CmpDocBorder = { bg = colors.black, fg = colors.blue },
    
    -- Items - colores del tema actual
    CmpItemKindDefault = { fg = colors.white },
    
    -- Solo los más importantes con colores
    CmpItemKindFunction = { fg = colors.blue },
    CmpItemKindMethod = { fg = colors.blue },
    CmpItemKindKeyword = { fg = colors.purple },
    CmpItemKindVariable = { fg = colors.cyan },
    CmpItemKindConstant = { fg = colors.orange },
    CmpItemKindText = { fg = colors.white },
    CmpItemKindSnippet = { fg = colors.green },
    
    -- Texto principal
    CmpItemAbbr = { fg = colors.white },
    CmpItemAbbrMatch = { fg = colors.nord_blue, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = colors.blue },
    CmpItemMenu = { fg = colors.grey_fg },
  }
  
  for group, hl in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end
end

-- ═══════════════════════════════════════════════════════════════
-- 🎨 ICONOS MINIMALISTAS (estilo NvChad)
-- ═══════════════════════════════════════════════════════════════
local kind_icons = {
  Text = "󰉿",
  Method = "󰆧",
  Function = "󰊕", 
  Constructor = "",
  Field = "󰜢",
  Variable = "󰀫",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "󰑭",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈚",
  Reference = "󰈇",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "󰙅",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "",
}

-- ═══════════════════════════════════════════════════════════════
-- ⚙️ CONFIGURACIÓN MINIMALISTA (estilo NvChad UI)
-- ═══════════════════════════════════════════════════════════════
local function setup_minimal_cmp()
  -- Aplicar highlights adaptativos
  apply_minimal_highlights()
  
  local options = {
    completion = {
      completeopt = "menu,menuone,noselect",
    },
    
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    
    -- Ventana minimalista - bordes simples
    window = {
      completion = {
        border = "rounded", -- Bordes simples
        winhighlight = "Normal:CmpPmenu,CursorLine:CmpPmenuSel,Search:None,FloatBorder:CmpPmenuBorder",
        scrollbar = false, -- Sin scrollbar, más limpio
        col_offset = -2,
        side_padding = 1,
      },
      documentation = {
        border = "rounded",
        winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder",
        max_width = 60,
        max_height = 15,
      },
    },
    
    -- Formato minimalista pero funcional
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, item)
        local icons = kind_icons
        if icons[item.kind] then
          item.kind = icons[item.kind] .. " " .. item.kind
        end
        
        -- Truncar texto si es muy largo
        if #item.abbr > 40 then
          item.abbr = string.sub(item.abbr, 1, 37) .. "..."
        end
        
        -- Menu simple
        local source_names = {
          nvim_lsp = "LSP",
          luasnip = "Snippet",
          buffer = "Buffer", 
          path = "Path",
          nvim_lua = "Lua",
        }
        
        item.menu = string.format("[%s]", source_names[entry.source.name] or entry.source.name)
        
        return item
      end,
    },
    
    -- Mappings básicos de NvChad
    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif require("luasnip").expand_or_jumpable() then
          require("luasnip").expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif require("luasnip").jumpable(-1) then
          require("luasnip").jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    
    -- Sources simples
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
    },
  }
  cmp.setup(options)
  
  -- Cmdline setup minimalista
  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" }
    }
  })
  

local cmp = require("cmp")

cmp.setup({
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true })
        local entry = cmp.get_selected_entry()
        if entry then
          local item = entry:get_completion_item()
          local path = item.label or item.abbr
          local stat = vim.loop.fs_stat(path)
          if stat and stat.type == "directory" then
            vim.api.nvim_feedkeys("/", "n", true)
          end
        end
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = "path" },
    { name = "buffer" },
  },
})
end

-- ═══════════════════════════════════════════════════════════════
-- 🔄 AUTO-ACTUALIZACIÓN CUANDO CAMBIA TEMA
-- ═══════════════════════════════════════════════════════════════

-- Configurar al inicio
setup_minimal_cmp()

-- Auto-update cuando cambie el tema
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.defer_fn(function()
      apply_minimal_highlights()
    end, 50)
  end,
})

-- Update cuando base46 cambie
vim.api.nvim_create_autocmd("User", {
  pattern = "NvChadThemeReload",
  callback = function()
    apply_minimal_highlights()
  end,
})

-- ═══════════════════════════════════════════════════════════════
-- 📦 EXPORTAR MÓDULO (estilo NvChad)
-- ═══════════════════════════════════════════════════════════════
return {
  -- Función para refrescar manualmente
  refresh = function()
    apply_minimal_highlights()
  end
}
