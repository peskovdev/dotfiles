local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
local g = vim.g                 -- global variables

-- Autoformat
map('n', '<leader>ag', ":! go fmt %<CR><CR>", default_opts) -- imports
map('n', '<leader>aa', ':Black<CR>:Isort<CR>', default_opts) -- imports
map('n', '<leader>ai', ':Isort<CR>', default_opts) -- imports
map('n', '<leader>af', ':Black<CR>', default_opts) -- pep8

g.vim_isort_map = ''
