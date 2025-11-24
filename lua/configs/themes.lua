-- FAVORITOS: 
-- mountains.nvim
-- KANAGAWA DRAGON
-- mellow
return {
  priority = 1000,     -- que se aplique antes que otros
  lazy = false,
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
  } ,
  { "anAcc22/sakura.nvim",
    dependencies = "rktjmp/lush.nvim",
    config = function()
      vim.opt.background = "dark" -- or "light"
    end
  },
  {
      'sainnhe/gruvbox-material',
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.gruvbox_material_enable_italic = true
        vim.cmd.colorscheme('gruvbox-material')
      end
    },
  {
    lazy = false,
    "datsfilipe/vesper.nvim",
    config = function()
    require('vesper').setup({
      transparent = true,
      italics = {
        comments = true, -- Boolean: Italicizes comments
        keywords = true, -- Boolean: Italicizes keywords
        functions = true, -- Boolean: Italicizes functions
        strings = true, -- Boolean: Italicizes strings
        variables = true, -- Boolean: Italicizes variables
      },
    })
    end
  },
  {
    lazy = false,
    "ramojus/mellifluous.nvim"


  },
{
  "kvrohit/rasmus.nvim",
    lazy =false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme rasmus]])
  end,
},

  {
    "thesimonho/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    "mellow-theme/mellow.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      transparent = true,
      -- NO hay setup(), solo aplicá el colorscheme
      vim.cmd.colorscheme("mellow")
    end,  }
}
