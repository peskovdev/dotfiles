-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Documentation on any of the below functions `:help vim.lsp.*` 
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<space>k', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local servers = {
  -- backend
  pylsp = {
    pylsp = {
      plugins = {
        pycodestyle = {
          maxLineLength = 100
        },
        -- pylint = { enabled = true },
        black = { enabled = true },
        isort = { enabled = true },
        pyls_mypy = { enabled = true, live_mode = true },
        -- -- Other settings
        -- configurationSources = {"pylint"},
        -- flake8 = { enabled = false },
        -- pyflakes = { enabled = false },
      }
    }
  },
  gopls = {},
  -- js
  tsserver = {},
  vuels = {},
  -- volar = {}, -- vue
  html = {},
  emmet_ls = {},
  cssls = {},
  -- tailwindcss = {},
  -- bash, json, toml
  bashls = {},
  jsonls = {},
  taplo = {},
  -- docker
  dockerls = {},
  docker_compose_language_service = {},
  lua_ls = {
    Lua = {
      diagnostics = {
        globals = {'vim', 'use'},
      },
    },
  },
}

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- Write list with server_name for ensure_installed
local server_names = {}
for server_name, _ in pairs(servers) do
  table.insert(server_names, server_name)
end
require("mason-lspconfig").setup({
  ensure_installed = server_names
})

require("mason-lspconfig").setup_handlers {
    function (server_name)
        require('lspconfig')[server_name].setup {
          on_attach = on_attach,
          settings = servers[server_name],
        }
    end,
}
