vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer сам себя
  use 'wbthomason/packer.nvim'

  -----------------------------------------------------------
  -- LSP & Autocomplete
  -----------------------------------------------------------
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Автодополнялка
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
  -- Snippets plugin
  use 'L3MON4D3/LuaSnip'


  -----------------------------------------------------------
  -- Navigation
  -----------------------------------------------------------
  -- Tabs & Buffers
  -- Head-panel
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons',
  config = function()
      require("bufferline").setup{}
  end, }
  -- Isolated buffers to tab (can broke something)
  use 'dosimple/workspace.vim'

  -- File manager
  use { 'nvim-tree/nvim-tree.lua',
  requires = 'nvim-tree/nvim-web-devicons',
  config = function() require'nvim-tree'.setup {} end, }

  -- EasyMotion
  use {'phaazon/hop.nvim',
  branch = 'v2',
  config = function()
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  end, }

  -- Telescope
  use {'nvim-telescope/telescope.nvim', tag = '0.1.0',
  requires = { {'nvim-lua/plenary.nvim'} }}
  -- Telescope-FZF
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }


  -----------------------------------------------------------
  -- PYTHON
  -----------------------------------------------------------
  -- Шапка с импортами приводим в порядок
  use 'fisadev/vim-isort'
  -- AutoFormatter
  use {'psf/black', branch = 'stable'}

  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
  end}

  -----------------------------------------------------------
  -- HTML, CSS & MarkDown
  -----------------------------------------------------------
  -- Обрамляет строку в теги по <c-y>,
  use 'mattn/emmet-vim'
  -- Подсвечивает закрывающий и открый тэг. Если, где-то что-то не закрыто, то не подсвечивает.
  use 'idanarye/breeze.vim'
  -- Закрывает автоматом html и xml тэги + rename.
  use 'windwp/nvim-ts-autotag'
  -- Подсвечивает #ffffff
  use {"norcalli/nvim-colorizer.lua",
    config = function() require("colorizer").setup() end
  }

  -- Превью файлов .md. Install without yarn or npm
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })
  -- markdown as snippets
  use 'preservim/vim-markdown'
  -- Tabular
  use 'godlygeek/tabular'


  -----------------------------------------------------------
  -- РАЗНОЕ
  -----------------------------------------------------------
  -- Язык
  use 'lyokha/vim-xkbswitch'
  -- Автосохранение
  use '907th/vim-auto-save'
  -- Ввод :w !sudo tee %
  use 'lambdalisue/suda.vim'
  -- ]p - вставить на строку выше, [p - ниже
  use 'tpope/vim-unimpaired'
  -- Комментирует по gc\gcc все, вне зависимости от языка программирования
  use { 'numToStr/Comment.nvim',
  config = function() require('Comment').setup() end }
  -- Обрамляет строку в теги, кавычки, скобки итд 
  use {"kylechui/nvim-surround", tag = "*",
    config = function() require("nvim-surround").setup() end
  }
  -- Закрывает автоматом скобки
  use 'cohama/lexima.vim'
  -- Pretty screenshot of code
  use 'segeljakt/vim-silicon'
  -- Todo-comments
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup({
        search = {
          command = "rg",
          args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--glob=!bootstrap",
            "--glob=!node_modules",
          },
          pattern = [[\b(KEYWORDS):]],
        },

      })
    end
  }


  -----------------------------------------------------------
  -- ПЛАГИНЫ ВНЕШНЕГО ВИДА
  -----------------------------------------------------------
  -- Иконки
  use 'nvim-tree/nvim-web-devicons'

  -- Информационная строка внизу
  use {'nvim-lualine/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true},
  config = function()
      require('lualine').setup()
  end, }

  -- Notifier
  use {"vigoux/notifier.nvim",
  config = function()
    require'notifier'.setup()
  end, }

  -- Цветовые схемы
  use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
  use 'marko-cerovac/material.nvim'
  use 'joshdick/onedark.vim'
  use 'ayu-theme/ayu-vim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use { 'projekt0n/github-nvim-theme', tag = 'v0.0.7' }

end)
