-- Documentación: módulo `lua/tools/fasterbigfile-config/init.lua`.
-- Propósito: define utilidades y herramientas de edición dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `opts = {`.
opts = {
  -- Behaviour table contains configuration for behaviours faster.nvim uses
-- Línea documentada: `behaviours = {`.
  behaviours = {
    -- Bigfile configuration controls disabling and enabling of features when
    -- big file is opened 
-- Línea documentada: `bigfile = {`.
    bigfile = {
      -- Behaviour can be turned on or off. To turn on set to true, otherwise
      -- set to false
-- Línea documentada: `on = true,`.
      on = true,
      -- Table which contains names of features that will be disabled when
      -- bigfile is opened. Feature names can be seen in features table below.
      -- features_disabled can also be set to "all" and then all features that
      -- are on (on=true) are going to be disabled for this behaviour
-- Línea documentada: `features_disabled = {`.
      features_disabled = {
-- Línea documentada: `"illuminate", "matchparen", "lsp", "treesitter",`.
        "illuminate", "matchparen", "lsp", "treesitter",
-- Línea documentada: `"indent_blankline", "vimopts", "syntax", "filetype"`.
        "indent_blankline", "vimopts", "syntax", "filetype"
-- Línea documentada: `},`.
      },
      -- Files larger than `filesize` are considered big files. Value is in MB.
-- Línea documentada: `filesize = 2,`.
      filesize = 2,
      -- Autocmd pattern that controls on which files behaviour will be applied.
      -- `*` means any file.
-- Línea documentada: `pattern = "*",`.
      pattern = "*",
      -- Optional extra patterns and sizes for which bigfile behaviour will apply.
      -- Note! that when multiple patterns (including the main one) and filesizes
      -- are defined: bigfile behaviour will be applied for minimum filesize of
      -- those defined in all applicable patterns for that file.
      -- extra_pattern example in multi line comment is bellow:
      --[[
-- Línea documentada: `extra_patterns = {`.
      extra_patterns = {
        -- If this is used than bigfile behaviour for *.md files will be
        -- triggered for filesize of 1.1MiB
-- Línea documentada: `{ filesize = 1.1, pattern = "*.md" },`.
        { filesize = 1.1, pattern = "*.md" },
        -- If this is used than bigfile behaviour for *.log file will be
        -- triggered for the value in `behaviours.bigfile.filesize`
-- Línea documentada: `{ pattern  = "*.log" },`.
        { pattern  = "*.log" },
        -- Next line is invalid without the pattern and will be ignored
-- Línea documentada: `{ filesize = 3 },`.
        { filesize = 3 },
-- Línea documentada: `},`.
      },
-- Línea documentada: `]]`.
      ]]
      -- By default `extra_patterns` is an empty table: {}.
-- Línea documentada: `extra_patterns = {},`.
      extra_patterns = {},
-- Línea documentada: `},`.
    },
    -- Fast macro configuration controls disabling and enabling features when
    -- macro is executed
-- Línea documentada: `fastmacro = {`.
    fastmacro = {
      -- Behaviour can be turned on or off. To turn on set to true, otherwise
      -- set to false
-- Línea documentada: `on = true,`.
      on = true,
      -- Table which contains names of features that will be disabled when
      -- macro is executed. Feature names can be seen in features table below.
      -- features_disabled can also be set to "all" and then all features that
      -- are on (on=true) are going to be disabled for this behaviour.
      -- Specificaly: lualine plugin is disabled when macros are executed because
      -- if a recursive macro opens a buffer on every iteration this error will
      -- happen after 300-400 hundred iterations:
      -- `E5108: Error executing lua Vim:E903: Process failed to start: too many open files: "/usr/bin/git"`
-- Línea documentada: `features_disabled = { "lualine" },`.
      features_disabled = { "lualine" },
-- Línea documentada: `}`.
    }
-- Línea documentada: `},`.
  },
  -- Feature table contains configuration for features faster.nvim will disable
  -- and enable according to rules defined in behaviours.
  -- Defined feature will be used by faster.nvim only if it is on (`on=true`).
  -- Defer will be used if some features need to be disabled after others.
  -- defer=false features will be disabled first and defer=true features last.
-- Línea documentada: `features = {`.
  features = {
    -- Neovim filetype plugin
    -- https://neovim.io/doc/user/filetype.html
-- Línea documentada: `filetype = {`.
    filetype = {
-- Línea documentada: `on = true,`.
      on = true,
-- Línea documentada: `defer = true,`.
      defer = true,
-- Línea documentada: `},`.
    },
    -- Illuminate plugin
    -- https://github.com/RRethy/vim-illuminate
-- Línea documentada: `illuminate = {`.
    illuminate = {
-- Línea documentada: `on = true,`.
      on = true,
-- Línea documentada: `defer = false,`.
      defer = false,
-- Línea documentada: `},`.
    },
    -- Indent Blankline
    -- https://github.com/lukas-reineke/indent-blankline.nvim
-- Línea documentada: `indent_blankline = {`.
    indent_blankline = {
-- Línea documentada: `on = true,`.
      on = true,
-- Línea documentada: `defer = false,`.
      defer = false,
-- Línea documentada: `},`.
    },
    -- Neovim LSP
    -- https://neovim.io/doc/user/lsp.html
-- Línea documentada: `lsp = {`.
    lsp = {
-- Línea documentada: `on = true,`.
      on = true,
-- Línea documentada: `defer = false,`.
      defer = false,
-- Línea documentada: `},`.
    },
    -- Lualine
    -- https://github.com/nvim-lualine/lualine.nvim
-- Línea documentada: `lualine = {`.
    lualine = {
-- Línea documentada: `on = true,`.
      on = true,
-- Línea documentada: `defer = false,`.
      defer = false,
-- Línea documentada: `},`.
    },
    -- Neovim Pi_paren plugin
    -- https://neovim.io/doc/user/pi_paren.html
-- Línea documentada: `matchparen = {`.
    matchparen = {
-- Línea documentada: `on = true,`.
      on = true,
-- Línea documentada: `defer = false,`.
      defer = false,
-- Línea documentada: `},`.
    },
    -- Neovim syntax
    -- https://neovim.io/doc/user/syntax.html
-- Línea documentada: `syntax = {`.
    syntax = {
-- Línea documentada: `on = true,`.
      on = true,
-- Línea documentada: `defer = true,`.
      defer = true,
-- Línea documentada: `},`.
    },
    -- Neovim treesitter
    -- https://neovim.io/doc/user/treesitter.html
-- Línea documentada: `treesitter = {`.
    treesitter = {
-- Línea documentada: `on = true,`.
      on = true,
-- Línea documentada: `defer = false,`.
      defer = false,
-- Línea documentada: `},`.
    },
    -- Neovim options that affect speed when big file is opened:
    -- swapfile, foldmethod, undolevels, undoreload, list
-- Línea documentada: `vimopts = {`.
    vimopts = {
-- Línea documentada: `on = true,`.
      on = true,
-- Línea documentada: `defer = false,`.
      defer = false,
-- Línea documentada: `}`.
    }
-- Línea documentada: `}`.
  }
-- Línea documentada: `}`.
}

-- Línea documentada: `require('faster').setup(opts)`.
require('faster').setup(opts)
