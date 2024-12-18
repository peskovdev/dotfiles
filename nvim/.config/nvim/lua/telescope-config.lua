local map = vim.api.nvim_set_keymap
local noremap = {noremap = true}

require('telescope').load_extension('fzf')
-- require'telescope-lsp-handlers'.setup({
--   reference = {
--     picker = require('telescope.themes').get_dropdown({}),
--   },
-- })

-- Telescope files
map('n', '<leader>ff', "<cmd>Telescope find_files<cr>", noremap)
map('n', '<leader>fb', "<cmd>Telescope buffers<cr>", noremap)

map('n', '<leader>fg', "<cmd>Telescope grep_string<cr>", noremap)
map('v', '<leader>fg', "y:Telescope live_grep default_text=<c-r>0<cr>", noremap)
map('n', '<leader>fl', "<cmd>Telescope live_grep<cr>", noremap)

-- telescope + Todo
map('n', '<leader>ft', "<cmd>TodoTelescope<cr>", noremap)


-- Telescope arc
map('n', '<leader>ag', "<cmd>Telescope arc status<cr>", noremap)
map('n', '<leader>af', "<cmd>Telescope arc ls_files<cr>", noremap)
map('n', '<leader>ac', "<cmd>Telescope arc commits<cr>", noremap)
map('n', '<leader>ab', "<cmd>Telescope arc branches<cr>", noremap)
map('n', '<leader>as', "<cmd>Telescope arc stash<cr>", noremap)
map('n', '<leader>ap', "<cmd>Telescope arc pr_list<cr>", noremap)

-- Telescope git
-- map('n', '<leader>gg', "<cmd>Telescope git_status<cr>", noremap)
-- map('n', '<leader>gf', "<cmd>Telescope git_files<cr>", noremap)
-- map('n', '<leader>gc', "<cmd>Telescope git_commits<cr>", noremap)
-- map('n', '<leader>gb', "<cmd>Telescope git_branches<cr>", noremap)
-- map('n', '<leader>gs', "<cmd>Telescope git_stash<cr>", noremap)

-- Telescope history
map('n', '<leader>hc', "<cmd>Telescope command_history<cr>", noremap)
map('n', '<leader>hs', "<cmd>Telescope search_history<cr>", noremap)
