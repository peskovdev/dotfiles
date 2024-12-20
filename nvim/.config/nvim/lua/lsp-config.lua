-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Documentation on any of the below functions `:help vim.lsp.*`
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  local telescope = require('telescope.builtin')
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', "<cmd>Telescope lsp_implementations show_line=false<cr>", bufopts)
  vim.keymap.set('n', '<space>k', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', "<cmd>Telescope lsp_references show_line=false<cr>", bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)
end

local servers = {
  -- backend
  pylsp = {
    settings = {
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
    }
  },
  gopls = {
    -- cmd = { "ya", "tool", "gopls" },
    -- root_dir = function(fname)
    --  return lspconfig_util.root_pattern("ya.make", "go.mod", "go.work", ".git",
    --   "authorize.go")(fname)
    -- end,

    settings = {
      directoryFilters = {'-', '+psp', '+trust'},
      gopls = {
        expandWorkspaceToModule = false,
        hints = {
          parameterNames = true,
        },
      },
    },
  },
  -- js
  -- tsserver = {},
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
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim', 'use' },
        },
      },
    }
  },
  texlab = {},
}

-- vim.g.go_gopls_local = 'a.yandex-team.ru'
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
  function(server_name)
    require('lspconfig')[server_name].setup {
      on_attach = on_attach,
      cmd = servers[server_name]["cmd"],
      settings = servers[server_name]["settings"],
    }
  end,
}

-- Autoformats
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.go",
--   callback = function()
--     vim.lsp.buf.format({ timeout_ms = 200 })
--   end
-- })
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.go",
--   callback = function()
--     local params = vim.lsp.util.make_range_params()
--     params.context = {only = {"source.organizeImports"}}
--     -- local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
--     local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
--     for cid, res in pairs(result or {}) do
--       for _, r in pairs(res.result or {}) do
--         if r.edit then
--           local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
--           vim.lsp.util.apply_workspace_edit(r.edit, enc)
--         end
--       end
--     end
--     vim.lsp.buf.format({async = false})
--   end
-- })
-- Utility functions shared between progress reports for LSP and DAP


require('lsp-notifications')
