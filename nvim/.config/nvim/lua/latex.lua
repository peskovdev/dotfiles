local g = vim.g                 -- global variables

-- " VimTeX uses latexmk as the default compiler backend. If you use it, which is
-- " strongly recommended, you probably don't need to configure anything. If you
-- " want another compiler backend, you can change it as follows. The list of
-- " supported backends and further explanation is provided in the documentation,
-- " see ":help vimtex-compiler".
-- g.vimtex_compiler_method = 'latexrun'

g.vimtex_view_method = 'zathura'
g.vimtex_syntax_enabled = false
g.vimtex_syntax_conceal_disable = true
g.vimtex_mappings_prefix = '<leader>v'
g.qf_auto_open_quickfix = false
g.vimtex_quickfix_ignore_filters = {
--   default = 1,
--   general = 1,
--   references = 1,
--   overfull = 0,
--   underfull = 0,
  font = 1,
--   packages = {
--     default = 0,
--     general = 0,
--     babel = 1,
--     biblatex = 1,
--     fixltx2e = 1,
--     hyperref = 1,
--     natbib = 1,
--     scrreprt = 1,
--     titlesec = 0,
--   },
}
