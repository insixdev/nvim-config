return {
  'luukvbaal/statuscol.nvim',
  lazy = false,
  opts = function()
    local builtin = require('statuscol.builtin')
    return {
      setopt = true,
      -- override the default list of segments with:
      fold = {
        width = 1,           -- current width of the fold column
        -- 'fillchars' option values:
        close = "<",         -- foldclose
        open = "",          -- foldopen
        sep = ""            -- foldsep
      },

      segments = {
        { text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
        { text = { '%s' }, click = 'v:lua.ScSa' },
        { sign = { name = { "GitSignsAdd", "GitSignsChange", "GitSignsDelete" }, maxwidth = 0, text = {"c", "<", ">"} } },
        {
          text = { builtin.lnumfunc, ' ' },
          condition = { true, builtin.not_empty },
          click = 'v:lua.ScLa',
        },
      },
    }
  end,
}
