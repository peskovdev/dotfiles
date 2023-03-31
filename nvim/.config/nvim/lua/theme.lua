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
-- require("catppuccin").setup({
--   flavour = "latte", -- latte, frappe, macchiato, mocha
--   background = { -- :h background
--       light = "latte",
--       dark = "mocha",
--   },
--   transparent_background = true,
--   term_colors = false,
--
-- })
-- cmd.colorscheme 'catppuccin'

-- github-themes
require("github-theme").setup({
  theme_style = "light",
  transparent = true, -- background
})


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
-- g.material_style = "lighter"
-- g.material_style = "oceanic"
-- require('material').setup({
--   disable = {
--         background = true, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
--     },
-- })
-- cmd.colorscheme 'material'
