-- vemos si remplaza 
-- Open the file or directory at the cursor.
-- -- d	Create new directories and files.
-- -- M	Mark directories and files (both in normal and visual mode).
-- -- C	Copy files.
-- -- X	Move files.
-- -- P	Paste files in the current directory.
-- -- D	Delete directories and files (both in normal and visual mode).
-- -- R	Rename directories and files.
-- -- MD	Delete marked files.
-- -- MC	Copy marked files.
-- -- MX	Move marked files.
-- -- _	Go to the parent directory.
-- -- -	Go back to previous directory.
-- -- !	Apply any command to directories/files under cursor.
-- -- &	Apply any command to marked directories and files.
-- -- .	Toggle show_hidden.
-- -- ,	Change sort_order.
-- -- c	Toggle colors.
-- -- *	Toggle filetype icons.
-- -- (	Toggle hiding/showing file details.
-- -- q	Quit the 'dired' interface.
return {
  lazy = false,
  "X3eRo0/dired.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  config = function()
    require("dired").setup( {
      path_separator = "/",
      show_banner = false,
      show_icons = false,
      show_hidden = true,
      show_dot_dirs = true,
      show_colors = true,
    })
  end
}
