local cmd = vim.cmd             -- execute Vim commands
local g = vim.g                 -- global variables
local opt = vim.opt             -- global/buffer/windows-scoped options


-----------------------------------------------------------
-- Главные
-----------------------------------------------------------
opt.mouse = 'a'                       -- Enable mouse
opt.encoding='utf-8'                  -- Encoding
opt.relativenumber = true             -- Относительная нумерация строк
opt.number = true                     -- Абсолютный номер строки под курсором
opt.swapfile = false                  -- Отключение swap-файлов
opt.splitright = true                 -- Vertical split вправо
opt.splitbelow = true                 -- Horizontal split вниз
opt.spelllang= {'en_us', 'ru'}        -- Словари рус eng
opt.colorcolumn = '100'               -- Разделитель на 100 символах
opt.ic = true                         -- Отключение регистра при поиске
opt.scs = true                        -- Добавление умного регистра для апперкейса
g.XkbSwitchEnabled = true             -- Автоматическая смена языков
g.auto_save = true
g.vim_markdown_folding_disabled = true
g.vim_markdown_new_list_item_indent = false
g.vim_markdown_fenced_languages = {'py=python', 'js=javascript'}
-- g.vim_markdown_toc_autofit = true
-- g.tabular_loaded = true

-----------------------------------------------------------
-- Identation
-----------------------------------------------------------
cmd([[
filetype indent plugin on
syntax enable
]])
-- uses 4 spaces in .py
-- uses 1 tab in .go which expressed as 3 spaces
cmd([[
au FileType python setl et sw=4 ts=4 colorcolumn=80
au FileType go setl noet sw=3 ts=3
]])
opt.expandtab = true            -- uses spaces instead of tabs

opt.shiftwidth = 2              -- shift 2 spaces when tab
opt.softtabstop = 2             -- 1 tab = 2 spaces

opt.smartindent = true          -- autoindent new lines
-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

