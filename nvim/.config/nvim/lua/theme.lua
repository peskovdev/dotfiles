local cmd = vim.cmd             -- execute Vim commands
local g = vim.g                 -- global variables
local opt = vim.opt             -- global/buffer/windows-scoped options

-----------------------------------------------------------
-- Colorschemes
-----------------------------------------------------------
opt.termguicolors = true      --  24-bit RGB colors

-----------------------------------------------------------
-- Light
-----------------------------------------------------------
-- ayu
-- g.ayucolor="light"
-- cmd.colorscheme 'ayu'

-- catppuccin
require("catppuccin").setup({
  compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
  flavour = "latte", -- latte, frappe, macchiato, mocha
  background = { -- :h background
      light = "latte",
      dark = "mocha",
  },
  transparent_background = false,
})

-- github-theme: Default options
require('github-theme').setup({
  options = {
   -- Compiled file's destination location
    compile_path = vim.fn.stdpath('cache') .. '/github-theme',
    compile_file_suffix = '_compiled', -- Compiled file suffix
    transparent = true,       -- Disable setting background
    terminal_colors = false,    -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
  },
})

-- g.material_style = "lighter"
-- require('material').setup({
--   disable = {
--         background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
--     },
-- })
-- cmd.colorscheme 'material'


cmd.colorscheme 'catppuccin'
-- cmd.colorscheme 'github_light_tritanopia'

-----------------------------------------------------------
-- Dark
-----------------------------------------------------------
-- gruvbox
-- opt.background = "light" -- "dark" by default
-- cmd.colorscheme 'gruvbox'


-- onedark
-- cmd.colorscheme 'onedark'

-- Opacity. NOTE: Works well only with onedark & gruvbox
-- cmd([[
-- highlight Normal guibg=none
-- highlight NonText guibg=none
-- ]])

-- material.nvim
-- g.material_style = "palenight"
-- g.material_style = "oceanic"

-- g.material_style = "lighter"
-- require('material').setup({
--   disable = {
--         background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
--     },
-- })
-- cmd.colorscheme 'material'
