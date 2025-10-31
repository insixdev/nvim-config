
return {
  {

    lazy = false,
    "Exafunction/windsurf.vim",
    config = function()
      vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    end
  },
}

