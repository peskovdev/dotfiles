local map = vim.api.nvim_set_keymap
local noremap = {noremap = true}
local default_opts = {noremap = true, silent = true}
local g = vim.g                 -- global variables

g.silicon = {
  -- Dark-themes:
  -- theme = "TwoDark",
  -- theme = "Dracula",
  -- theme = "Nord",
  -- theme = "Sublime Snazzy",
  -- theme = "Monokai Extended",

  -- background = '#AAB6C2',
  -- ["shadow-blur-radius"] = 50,

  -- Light-themes:
  theme = "Monokai Extended Light",
  -- theme = "GitHub",
  background = '#a1c3e6',
  ["shadow-blur-radius"] = 20,

  ["pad-horiz"] = 72,
  ["pad-vert"] = 90,
  output = '~/pictures/silicon/silicon-{time:%Y-%m-%d-%H%M%S}.png'
}


map('n', '<leader>s', ':Silicon<CR>', default_opts)
map('v', '<leader>s', ':\'<,\'>Silicon<CR>', noremap)
