return {
  -----------------------------------------------------------
  -- LSP & Autocomplete
  -----------------------------------------------------------
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  -- show declarations/references
  {
    'VidocqH/lsp-lens.nvim',
    opts = {
      enable = true,
      include_declaration = false, -- Reference include declaration
      sections = {                 -- Enable / Disable specific request, formatter example looks 'Format Requests'
        definition = false,
        references = true,
        implements = true,
        git_authors = false,
      },
      ignore_filetype = {
        "prisma",
      },
    },
  },
  -- notify all lsp processes
  -- {
  --   "j-hui/fidget.nvim",
  --   opts = {
  --                         -- Conditionally redirect notifications to another backend
  --     notification = {
  --       -- configs = {
  --       --   default = require("vim.notify")
  --       -- },
  --       redirect = function(msg, level, opts)
  --         if opts and opts.on_open then
  --           return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
  --         end
  --       end,
  --     },
  --   }
  -- },
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  { 'nvim-treesitter/nvim-treesitter' },
  -- Автодополнялка
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'saadparwaiz1/cmp_luasnip' },
  -- Snippets plugin
  { 'L3MON4D3/LuaSnip' },


  -----------------------------------------------------------
  -- Navigation
  -----------------------------------------------------------
  -- Tabs & Buffers
  -- Head-panel
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = { options = { themable = false } },
  },
  -- Isolated buffers to tab (can broke something)
  { 'dosimple/workspace.vim' },

  -- File manager
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      filesystem_watchers = true,
      open_on_setup = true,
      view = {
        side = "left",
        width = 50,
        auto_resize = true
      }
    },
  },

  -- EasyMotion
  {
    'smoka7/hop.nvim',
    version = "*",
    opts = {
      keys = 'etovxqpdygfblzhckisuran'
    }
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      defaults = {
        path_display = {
          truncate = 1
        },
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            width = { padding = 2 },
            height = { padding = 1 },
            preview_width = 0.6,
          },
          vertical = {
            width = { padding = 2 },
            height = { padding = 1 },
            preview_width = 0.8,
            preview_height = 0.7,
          },

        },
      },
    },
  },
  -- Telescope-FZF
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
  },
  -- {
  --   'Slotos/telescope-lsp-handlers.nvim',
  --   opts = {
  --     declaration      = { picker = { layout_strategy = "vertical" }, entry = { show_line = false, trim_text = false, fname_width = 90 } },
  --     definition       = { picker = { layout_strategy = "vertical" }, entry = { show_line = false, trim_text = false, fname_width = 90 } },
  --     implementation   = { picker = { layout_strategy = "vertical" }, entry = { show_line = false, trim_text = false, fname_width = 90 } },
  --     type_definition  = { picker = { layout_strategy = "vertical" }, entry = { show_line = false, trim_text = false, fname_width = 90 } },
  --     reference        = { picker = { layout_strategy = "vertical", show_line = false }, show_line = false, entry = { show_line = false, trim_text = false, fname_width = 90 } },
  --     document_symbol  = { picker = { layout_strategy = "vertical" }, entry = { show_line = false, trim_text = false, fname_width = 90 } },
  --     workspace_symbol = { picker = { layout_strategy = "vertical" }, entry = { show_line = false, trim_text = false, fname_width = 90 } },
  --     incoming_calls   = { picker = { layout_strategy = "vertical" }, entry = { show_line = false, trim_text = false, fname_width = 90 } },
  --     outgoing_calls   = { picker = { layout_strategy = "vertical" }, entry = { show_line = false, trim_text = false, fname_width = 90 } },
  --     show_line = false,
  --   }
  -- },


  -----------------------------------------------------------
  -- PYTHON
  -----------------------------------------------------------
  -- Шапка с импортами приводим в порядок
  -- {'fisadev/vim-isort'},
  -- AutoFormatter
  -- {'psf/black', branch = 'stable'},

  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {},
  },
  -- right indentation
  { 'Vimjas/vim-python-pep8-indent' },

  -----------------------------------------------------------
  -- HTML, CSS & MarkDown
  -----------------------------------------------------------
  -- Обрамляет строку в теги по <c-y>,
  { 'mattn/emmet-vim' },
  -- Подсвечивает закрывающий и открый тэг. Если, где-то что-то не закрыто, то не подсвечивает.
  { 'idanarye/breeze.vim' },
  -- Закрывает автоматом html и xml тэги + rename.
  -- {'windwp/nvim-ts-autoversion'},
  -- Подсвечивает #ffffff
  { "norcalli/nvim-colorizer.lua" },

  -- Превью файлов .md. Install without yarn or npm
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  -- markdown as snippets
  { 'preservim/vim-markdown' },
  -- Tabular
  { 'godlygeek/tabular' },
  { 'lervag/vimtex' },


  -----------------------------------------------------------
  -- РАЗНОЕ
  -----------------------------------------------------------
  -- Язык
  -- {'lyokha/vim-xkbswitch'},
  -- Автосохранение
  { '907th/vim-auto-save' },
  -- Ввод :w !sudo tee %
  { 'lambdalisue/suda.vim' },
  -- ]p - вставить на строку выше, [p - ниже
  { 'tpope/vim-unimpaired' },
  -- Комментирует по gc\gcc все, вне зависимости от языка программирования
  {
    'numToStr/Comment.nvim',
    opts = {},
  },
  -- Обрамляет строку в теги, кавычки, скобки итд
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {},
  },
  -- Закрывает автоматом скобки
  { 'cohama/lexima.vim' },
  -- Pretty screenshot of code
  { 'segeljakt/vim-silicon' },
  -- Todo-comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },


  -----------------------------------------------------------
  -- ПЛАГИНЫ ВНЕШНЕГО ВИДА
  -----------------------------------------------------------
  -- MY PETS
  -- 'tamton-aquib/duck.nvim'

  -- Arcade Game
  { 'seandewar/killersheep.nvim' },
  -- Иконки
  { 'nvim-tree/nvim-web-devicons' },

  -- Информационная строка внизу
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
    opts = {
      sections = {
        lualine_a = {
          {
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
          }
        }
      },
    },
  },

  -- Git changes
  {'airblade/vim-gitgutter'},

  -- Notifier
  {
    'rcarriga/nvim-notify',
    config = function()
      require("notify").setup {
        stages = 'fade_in_slide_out',
        background_colour = 'FloatShadow',
        timeout = 3000,
      }
      vim.notify = require('notify')
    end
  },

  -- Indent blankline
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = { scope = { enabled = false } },
  },

  -- Цветовые схемы
  { "ellisonleao/gruvbox.nvim",   dependencies = { "rktjmp/lush.nvim" } },
  { 'marko-cerovac/material.nvim' },
  { 'joshdick/onedark.vim' },
  { 'ayu-theme/ayu-vim' },
  { "catppuccin/nvim",            name = "catppuccin" },
  { 'projekt0n/github-nvim-theme' },
}
