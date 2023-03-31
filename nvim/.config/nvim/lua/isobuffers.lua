local map = vim.api.nvim_set_keymap
local set = vim.opt

local noremap = {noremap = true}
local default_opts = {noremap = true, silent = true}

-----------------------------------------------------------
-- Tabs and Buffers
-----------------------------------------------------------
set.hidden = true
set.sessionoptions = set.sessionoptions + 'globals'

-- change focus windows
map('n', '<c-h>', '<c-w>h', noremap)
map('n', '<c-j>', '<c-w>j', noremap)
map('n', '<c-k>', '<c-w>k', noremap)
map('n', '<c-l>', '<c-w>l', noremap)

-- next/prev buffers
map('n', 'gn', ':bn<CR>', noremap)
map('n', 'gp', ':bp<CR>', noremap)
-- kill buffer
map('n', 'gw', ':WSbrm<CR>', noremap)
-- kill tab
map('n', '<c-w>k', ':WSc<CR>', noremap)

map('n', '<c-w>s', '<c-w>x', noremap)
map('n', '<c-w>x', '<c-w>s', noremap)

-- move current buffer to workspace to n
map('n', '<c-w>m1', ':WSbmv 1<CR>', noremap)
map('n', '<c-w>m2', ':WSbmv 2<CR>', noremap)
map('n', '<c-w>m3', ':WSbmv 3<CR>', noremap)
map('n', '<c-w>m4', ':WSbmv 4<CR>', noremap)
map('n', '<c-w>m5', ':WSbmv 5<CR>', noremap)
map('n', '<c-w>m6', ':WSbmv 6<CR>', noremap)
map('n', '<c-w>m7', ':WSbmv 7<CR>', noremap)
map('n', '<c-w>m8', ':WSbmv 8<CR>', noremap)
map('n', '<c-w>m9', ':WSbmv 9<CR>', noremap)

map('n', '<c-w><tab>', ':call WS_Backforth()<CR>', default_opts)
map('n', '<tab>', ':call WS_Backforth()<CR>', default_opts)

map('n', '<c-w>1', ':WS 1<CR>', default_opts)
map('n', '<c-w>2', ':WS 2<CR>', default_opts)
map('n', '<c-w>3', ':WS 3<CR>', default_opts)
map('n', '<c-w>4', ':WS 4<CR>', default_opts)
map('n', '<c-w>5', ':WS 5<CR>', default_opts)
map('n', '<c-w>6', ':WS 6<CR>', default_opts)
map('n', '<c-w>7', ':WS 7<CR>', default_opts)
map('n', '<c-w>8', ':WS 8<CR>', default_opts)
map('n', '<c-w>9', ':WS 9<CR>', default_opts)
-- with leader or <c-w>
map('n', '<leader>1', ':WS 1<CR>', default_opts)
map('n', '<leader>2', ':WS 2<CR>', default_opts)
map('n', '<leader>3', ':WS 3<CR>', default_opts)
map('n', '<leader>4', ':WS 4<CR>', default_opts)
map('n', '<leader>5', ':WS 5<CR>', default_opts)
map('n', '<leader>6', ':WS 6<CR>', default_opts)
map('n', '<leader>7', ':WS 7<CR>', default_opts)
map('n', '<leader>8', ':WS 8<CR>', default_opts)
map('n', '<leader>9', ':WS 9<CR>', default_opts)
