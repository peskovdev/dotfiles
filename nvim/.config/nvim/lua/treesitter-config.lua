require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    -- Other languages
    "rust",
    "solidity",
    "go",
    -- WEB
    "python",
    "typescript",
    "javascript",
    "vue",
    "json5",
    "json",
    "hjson",
    "jsonc",
    "html",
    "css",
    "scss",
    -- Doc
    -- "markdown-inline",
    "markdown",
    "jsdoc",
    "make",
    -- Configs
    "lua",
    "dockerfile",
    "toml",
    "yaml",
    "query",
    -- linux
    "bash",
    "cmake",
    "vim",
    "gitignore",
    "sxhkdrc",
    -- Other
    "http",
    "sql",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    disable = { "markdown" },
    additional_vim_regex_highlighting = false
  },
  autotag = {
    enable = true,
  }
}
