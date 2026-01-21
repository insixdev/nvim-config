return {
  -- {
  -- 'mrcjkb/rustaceanvim',
  -- version = '^6', -- Recommended
  -- lazy = false, -- This plugin is already lazy
  --
  -- },
  -- {
  --   lazy = false,
  --   "rhysd/rust-doc.vim"
  -- },
  {
    lazy =false,
    "Shougo/unite.vim",
    config = function() 
      vim.g.unite_split_rule = "botright"
    end

  }
}
