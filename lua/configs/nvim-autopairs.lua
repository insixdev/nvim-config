return {
require("nvim-autopairs").setup{
  check_ts = true,  -- usa Treesitter para detectar contexto
  enable_check_bracket_line = true,  -- no cierra en líneas incompletas
  enable_moveright = true,  -- si ya hay un par, salta al siguiente
  map_cr = true,  -- Enter automáticamente con indent
  map_bs = true,  -- Backspace inteligente
}
}
