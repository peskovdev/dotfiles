local map = vim.api.nvim_set_keymap
local noremap = {noremap = true}
local default_opts = {noremap = true, silent = true}

-- System clipboard --
-- yank to system
map('n', 'y', '"+y', noremap)
map('n', 'Y', '"+Y', noremap)
map('v', 'y', '"+y', noremap)
map('v', 'Y', '"+Y', noremap)
-- cut
map('n', 'd', '"+d', noremap)
map('n', 'D', '"+D', noremap)
map('v', 'd', '"+d', noremap)
map('v', 'D', '"+D', noremap)
map('n', '<C-x>', '"+x', noremap)
map('v', 'x', '"+x', noremap)
-- paste from system clipboard
vim.o.timeoutlen = 10000 -- timeout need for waiting for continue of p-commands
-- <Nop>: after timeout do nothing
map('n', 'p', '<Nop>', noremap)
map('n', 'pi', '<Nop>', noremap)
map('n', 'pp', '"+p', noremap)
map('n', 'pP', '"+P', noremap)
map('n', 'piw', 'ciw<C-r>+<Esc>', noremap)
map('n', 'piW', 'ciW<C-r>+<Esc>', noremap)
map('n', 'pi(', 'ci(<C-r>+<Esc>', noremap)
map('n', 'pi)', 'ci)<C-r>+<Esc>', noremap)
map('n', 'pi[', 'ci[<C-r>+<Esc>', noremap)
map('n', 'pi]', 'ci]<C-r>+<Esc>', noremap)
map('n', 'pi{', 'ci{<C-r>+<Esc>', noremap)
map('n', 'pi}', 'ci}<C-r>+<Esc>', noremap)
map('n', 'pi<', 'ci`<C-r>+<Esc>', noremap)
map('n', 'pi>', 'ci`<C-r>+<Esc>', noremap)
map('n', 'pi`', 'ci`<C-r>+<Esc>', noremap)
map('n', 'pi"', 'ci"<C-r>+<Esc>', noremap)
map('n', 'pi\'', 'ci\'<C-r>+<Esc>', noremap)
map('v', 'p', '"+p', noremap)
map('v', 'P', '"+P', noremap)

-- paste from local clipboard
map('n', '<leader>p', 'p', noremap)
map('v', '<leader>p', 'p', noremap)
map('n', '<leader>P', 'P', noremap)
map('v', '<leader>P', 'P', noremap)

map('n', '<leader>dD', '<esc>gg"+dGi', noremap)
map('n', 'dD', '<esc>ggdGi', noremap)

-- Super-puper insert mode
-- hjkl in insert mode
map('i', '<A-h>', '<Left>', default_opts)
map('i', '<A-j>', '<Down>', default_opts)
map('i', '<A-k>', '<Up>', default_opts)
map('i', '<A-l>', '<Right>', default_opts)
map('i', '<A-u>', '<Home>', default_opts)
map('i', '<A-o>', '<End>', default_opts)
map('i', '<A-;>', '<Backspace>', default_opts)
map('i', '<A-p>', '<Delete>', default_opts)
map('i', "<A-'>", '<Delete>', default_opts)
-- paste & undo
map('i', '<c-v>', '<esc>"+pa', default_opts)
map('i', '<c-z>', '<esc>ua', default_opts)

-- clear last search highlight
map('n', ',<space>', ':nohl<CR>', default_opts)

-- deprecate skip selection after indenting
map('v', '<', '<gv', default_opts)
map('v', '>', '>gv', default_opts)

-- nvim-tree
map('n', '<leader>df', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', default_opts)

-- Neovim motions on speed! 
map('n', 'f', '<cmd>:HopWord<CR>', default_opts)
map('v', 'f', '<cmd>:HopWord<CR>', default_opts)
map('n', 'F', '<cmd>:HopWordCurrentLine<CR>', default_opts)

-- LSP
map('n', '<leader>lr', ':LspRestart<CR>', default_opts) -- r=restart
map('n', '<leader>ll', ':LspStart<CR>', default_opts) -- l=launch
map('n', '<leader>ls', ':LspStop<CR>', default_opts) -- s=stop
map('n', '<leader>m', ':Mason<CR>', default_opts)
-- MarkDown
map('n', '<leader>t', ':TableFormat<CR>', default_opts)
-- <F11> Проверка орфографии  для русского и английского языка
map('n', '<F11>', ':set spell!<CR>', default_opts)
map('i', '<F11>', '<C-O>:set spell!<CR>', default_opts)

map('n', '<F5>', ':65vsplit | term python %<CR>i', default_opts)
-- map('n', '<leader>e', ':15split | term python %<CR>i', default_opts)

-- <F8>  Показ дерева классов и функций, плагин majutsushi/tagbar
-- map('n', '<F8>', ':TagbarToggle<CR>', default_opts)

-- config reloading
map('n', '<c-w>r', ':source $MYVIMRC<CR>', noremap)
