local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

map('n', '<C-t>', ':1ToggleTerm direction=float<CR>', default_opts)

local Terminal  = require('toggleterm.terminal').Terminal

function _RUN_TOGGLE()
  local filetype = vim.bo.filetype
  if filetype == "python" then
    _pyrun_toggle()
  elseif filetype == "go" then
    _gorun_toggle()
  else
    print("Unknown file type: " .. filetype)
  end
end
function _pyrun_toggle()
  Terminal:new({
    cmd = "python "..vim.api.nvim_buf_get_name(0),
    -- direction = "horizontal",
    direction = "float",
    float_opts = {
      border = "double",
      col = 85,
      width = 90,
      height = 30,
    },
    close_on_exit = false,
    count = 9,
  }):toggle()
end
function _gorun_toggle()
  Terminal:new({
    cmd = "go run .",
    -- direction = "horizontal",
    direction = "float",
    float_opts = {
      border = "double",
      col = 85,
      width = 90,
      height = 30,
    },
    close_on_exit = false,
    count = 9,
  }):toggle()
end

map("n", "<leader>e", "<cmd>lua _RUN_TOGGLE()<CR>", default_opts)

function _RANGER_TOGGLE()
  Terminal:new({
    cmd = "ranger",
    direction = "float",
    count = 4,
  }):toggle()
end
map("n", "<leader>r", "<cmd>lua _RANGER_TOGGLE()<CR>", default_opts)

function _LAZYGIT_TOGGLE()
  Terminal:new({
    cmd = "lazygit",
    direction = "float",
    count = 5,
  }):toggle()
end
map("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", default_opts)

function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    vim.keymap.set('t', '<C-t>', [[<Cmd>ToggleTerm<CR>]], opts)
    -- needed for horizontal & vertical state
    -- vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    -- vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    -- vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    -- vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
