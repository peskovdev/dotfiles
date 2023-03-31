local map = vim.api.nvim_set_keymap
local noremap = {noremap = true}
local g = vim.g
local cmd = vim.cmd             -- execute Vim commands

-- markdown
map('n', '<c-m>', ':MarkdownPreview<CR>', noremap)
cmd([[
function OpenMarkdownPreview (url)
    execute "silent ! firefox --new-window " . a:url
  endfunction
]])
-- g.mkdp_browser = 'qutebrowser'
g.mkdp_browserfunc = 'OpenMarkdownPreview'
