return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  event = "LspAttach",
  config = function()
    require("lsp_lines").setup()

    -- Configura Neovim para usar lsp_lines en lugar del virtual_text estándar
    vim.diagnostic.config({
      virtual_text = false, -- desactiva el inline clásico
      virtual_lines = { only_current_line = true},
    })
  end,
}
