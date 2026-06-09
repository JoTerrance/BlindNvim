-- Documentación: módulo `lua/core/plugins/init.lua`.
-- Propósito: define registro y carga de plugins dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"`.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- Bootstrap lazy.nvim automatically if it is not installed yet.
-- Línea documentada: `if not vim.loop.fs_stat(lazypath) then`.
if not vim.loop.fs_stat(lazypath) then
-- Línea documentada: `vim.fn.system({`.
  vim.fn.system({
-- Línea documentada: `"git",`.
    "git",
-- Línea documentada: `"clone",`.
    "clone",
-- Línea documentada: `"--filter=blob:none",`.
    "--filter=blob:none",
-- Línea documentada: `"https://github.com/folke/lazy.nvim.git",`.
    "https://github.com/folke/lazy.nvim.git",
-- Línea documentada: `"--branch=stable", -- latest stable release`.
    "--branch=stable", -- latest stable release
-- Línea documentada: `lazypath,`.
    lazypath,
-- Línea documentada: `})`.
  })
-- Línea documentada: `end`.
end
-- Línea documentada: `vim.opt.rtp:prepend(lazypath)`.
vim.opt.rtp:prepend(lazypath)

-- In VSCode mode some UI/terminal-heavy plugins are disabled in their specs.
-- Línea documentada: `local vscode = vim.g.vscode == 1`.
local vscode = vim.g.vscode == 1

-- Central plugin registry for this Neovim setup.
-- Keep this list as the single source of truth for enabled integrations.
-- Línea documentada: `require("lazy").setup({`.
require("lazy").setup({
  --'wbthomason/packer.nvim', -> Deprecated
  -- Core editing quality-of-life plugins.
-- Línea documentada: `'ibhagwan/smartyank.nvim',`.
  'ibhagwan/smartyank.nvim',
-- Línea documentada: `'pteroctopus/faster.nvim',`.
  'pteroctopus/faster.nvim',
-- Línea documentada: `'gpanders/editorconfig.nvim',`.
  'gpanders/editorconfig.nvim',
-- Línea documentada: `'mg979/vim-visual-multi',`.
  'mg979/vim-visual-multi',
-- Línea documentada: `'Civitasv/cmake-tools.nvim',`.
  'Civitasv/cmake-tools.nvim',
-- Línea documentada: `'debugloop/telescope-undo.nvim',`.
  'debugloop/telescope-undo.nvim',
-- Línea documentada: `'xiyaowong/telescope-emoji.nvim',`.
  'xiyaowong/telescope-emoji.nvim', 
-- Línea documentada: `'HiPhish/rainbow-delimiters.nvim',`.
  'HiPhish/rainbow-delimiters.nvim',
-- Línea documentada: `'https://codeberg.org/esensar/nvim-dev-container',`.
  'https://codeberg.org/esensar/nvim-dev-container',
-- Línea documentada: `'lpoto/telescope-docker.nvim',`.
  'lpoto/telescope-docker.nvim',
-- Línea documentada: `'williamboman/mason.nvim',`.
  'williamboman/mason.nvim',
-- Línea documentada: `'nvimtools/none-ls.nvim',`.
  'nvimtools/none-ls.nvim',
-- Línea documentada: `'smjonas/live-command.nvim',`.
  'smjonas/live-command.nvim',
-- Línea documentada: `{`.
{
-- Línea documentada: `'stevearc/aerial.nvim',`.
  'stevearc/aerial.nvim',
-- Línea documentada: `opts = {},`.
  opts = {},
  -- Optional dependencies
-- Línea documentada: `dependencies = {`.
  dependencies = {
-- Línea documentada: `"nvim-treesitter/nvim-treesitter",`.
     "nvim-treesitter/nvim-treesitter",
-- Línea documentada: `"nvim-tree/nvim-web-devicons"`.
     "nvim-tree/nvim-web-devicons"
-- Línea documentada: `},`.
  },
-- Línea documentada: `},`.
},
-- Línea documentada: `{'stevearc/aerial.nvim',opts = {},},`.
  {'stevearc/aerial.nvim',opts = {},},
-- Línea documentada: `{`.
  {
-- Línea documentada: `"emmanueltouzery/decisive.nvim",`.
  "emmanueltouzery/decisive.nvim",
-- Línea documentada: `config = function()`.
  config = function()
-- Línea documentada: `require('decisive').setup{}`.
    require('decisive').setup{}
-- Línea documentada: `end,`.
  end,
-- Línea documentada: `lazy=true,`.
  lazy=true,
-- Línea documentada: `ft = {'csv'},`.
  ft = {'csv'},
-- Línea documentada: `keys = {`.
  keys = {
-- Línea documentada: `{ '<leader>cca', ":lua require('decisive').align_csv({})<cr>",       { silent = true }, desc = "Align CSV",          mode = 'n' },`.
    { '<leader>cca', ":lua require('decisive').align_csv({})<cr>",       { silent = true }, desc = "Align CSV",          mode = 'n' },
-- Línea documentada: `{ '<leader>ccA', ":lua require('decisive').align_csv_clear({})<cr>", { silent = true }, desc = "Align CSV clear",    mode = 'n' },`.
    { '<leader>ccA', ":lua require('decisive').align_csv_clear({})<cr>", { silent = true }, desc = "Align CSV clear",    mode = 'n' },
-- Línea documentada: `{ '[c', ":lua require('decisive').align_csv_prev_col()<cr>",         { silent = true }, desc = "Align CSV prev col", mode = 'n' },`.
    { '[c', ":lua require('decisive').align_csv_prev_col()<cr>",         { silent = true }, desc = "Align CSV prev col", mode = 'n' },
-- Línea documentada: `{ ']c', ":lua require('decisive').align_csv_next_col()<cr>",         { silent = true }, desc = "Align CSV next col", mode = 'n' },`.
    { ']c', ":lua require('decisive').align_csv_next_col()<cr>",         { silent = true }, desc = "Align CSV next col", mode = 'n' },
-- Línea documentada: `}`.
    }
-- Línea documentada: `},`.
  },
-- Línea documentada: `{`.
  {
-- Línea documentada: `'stevearc/oil.nvim',`.
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
-- Línea documentada: `opts = {},`.
  opts = {},
  -- Optional dependencies
-- Línea documentada: `dependencies = { { "echasnovski/mini.icons", opts = {} } },`.
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
-- Línea documentada: `},`.
},
  -- LSP, DAP, and language tooling foundation.
-- Línea documentada: `"jay-babu/mason-null-ls.nvim",`.
  "jay-babu/mason-null-ls.nvim",
-- Línea documentada: `'mfussenegger/nvim-dap',`.
  'mfussenegger/nvim-dap',
-- Línea documentada: `'jayp0521/mason-nvim-dap.nvim',`.
  'jayp0521/mason-nvim-dap.nvim',
-- Línea documentada: `{'VonHeikemen/lsp-zero.nvim'},`.
  {'VonHeikemen/lsp-zero.nvim'},
-- Línea documentada: `{'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim'},`.
  {'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim'},
-- Línea documentada: `{'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', lazy = false, enabled = not vscode},`.
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', lazy = false, enabled = not vscode},
-- Línea documentada: `{'tamton-aquib/staline.nvim', dependencies = {'kyazdani42/nvim-web-devicons',lazy = true} },`.
  {'tamton-aquib/staline.nvim', dependencies = {'kyazdani42/nvim-web-devicons',lazy = true} },
-- Línea documentada: `{"LinArcX/telescope-command-palette.nvim" },`.
  {"LinArcX/telescope-command-palette.nvim" },
-- Línea documentada: `{"neanias/telescope-lines.nvim", dependencies = "nvim-telescope/telescope.nvim",},`.
  {"neanias/telescope-lines.nvim", dependencies = "nvim-telescope/telescope.nvim",},
  -- UI navigation and editing helpers.
-- Línea documentada: `{'akinsho/bufferline.nvim',version="*", dependencies = 'kyazdani42/nvim-web-devicons'},`.
  {'akinsho/bufferline.nvim',version="*", dependencies = 'kyazdani42/nvim-web-devicons'},
  -- {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' },
-- Línea documentada: `{'windwp/nvim-ts-autotag', event = "InsertEnter", after = "nvim-treesitter" },`.
  {'windwp/nvim-ts-autotag', event = "InsertEnter", after = "nvim-treesitter" },
-- Línea documentada: `{'windwp/nvim-autopairs', config = true, event="InsertEnter", after = "nvim-cmp", enabled = not vscode},`.
  {'windwp/nvim-autopairs', config = true, event="InsertEnter", after = "nvim-cmp", enabled = not vscode},
-- Línea documentada: `{'folke/which-key.nvim', event = "BufWinEnter", config = function() require('ui.whichkey-config') end, enabled = not vscode },`.
  {'folke/which-key.nvim', event = "BufWinEnter", config = function() require('ui.whichkey-config') end, enabled = not vscode },
-- Línea documentada: `'nvim-telescope/telescope.nvim',`.
  'nvim-telescope/telescope.nvim',
-- Línea documentada: `'LinArcX/telescope-env.nvim',`.
  'LinArcX/telescope-env.nvim',
-- Línea documentada: `{`.
  {
-- Línea documentada: `"kndndrj/nvim-dbee",`.
  "kndndrj/nvim-dbee",
-- Línea documentada: `dependencies = {`.
  dependencies = {
-- Línea documentada: `"MunifTanjim/nui.nvim",`.
    "MunifTanjim/nui.nvim",
-- Línea documentada: `},`.
  },
-- Línea documentada: `build = function()`.
  build = function()
-- Línea documentada: `require("dbee").install()`.
    require("dbee").install()
-- Línea documentada: `end,`.
  end,
-- Línea documentada: `config = function()`.
  config = function()
-- Línea documentada: `require("dbee").setup(--[[optional config]])`.
    require("dbee").setup(--[[optional config]])
-- Línea documentada: `end,`.
  end,
-- Línea documentada: `},`.
},
  -- Completion, diagnostics, and session helpers.
-- Línea documentada: `'williamboman/mason-lspconfig.nvim',`.
  'williamboman/mason-lspconfig.nvim',
-- Línea documentada: `{ 'neovim/nvim-lspconfig', requires = {'williamboman/mason.nvim','williamboman/mason-lspconfig.nvim','j-hui/fidget.nvim', }, },`.
  { 'neovim/nvim-lspconfig', requires = {'williamboman/mason.nvim','williamboman/mason-lspconfig.nvim','j-hui/fidget.nvim', }, },
-- Línea documentada: `{"MattiasMTS/cmp-dbee",dependencies = {{"kndndrj/nvim-dbee"}},ft = "sql", opts = {}, },`.
  {"MattiasMTS/cmp-dbee",dependencies = {{"kndndrj/nvim-dbee"}},ft = "sql", opts = {}, },
-- Línea documentada: `'hrsh7th/cmp-nvim-lsp',`.
  'hrsh7th/cmp-nvim-lsp',
-- Línea documentada: `'hrsh7th/cmp-nvim-lsp-signature-help',`.
  'hrsh7th/cmp-nvim-lsp-signature-help',
-- Línea documentada: `'hrsh7th/cmp-nvim-lsp-document-symbol',`.
  'hrsh7th/cmp-nvim-lsp-document-symbol',
-- Línea documentada: `'danielvolchek/tailiscope.nvim',`.
  'danielvolchek/tailiscope.nvim',
-- Línea documentada: `'f3fora/cmp-spell',`.
  'f3fora/cmp-spell',
-- Línea documentada: `'uga-rosa/cmp-dictionary',`.
  'uga-rosa/cmp-dictionary',
-- Línea documentada: `{"Dosx001/cmp-commit", requires = "hrsh7th/nvim-cmp"},`.
  {"Dosx001/cmp-commit", requires = "hrsh7th/nvim-cmp"},
-- Línea documentada: `{"hrsh7th/nvim-cmp", requires = {"KadoBOT/cmp-plugins", config = function() require("cmp-plugins").setup({ files = { ".*\\.lua" }  }) end, }},`.
  {"hrsh7th/nvim-cmp", requires = {"KadoBOT/cmp-plugins", config = function() require("cmp-plugins").setup({ files = { ".*\\.lua" }  }) end, }},
-- Línea documentada: `{'quangnguyen30192/cmp-nvim-tags', ft = {'kotlin','java'} },`.
  {'quangnguyen30192/cmp-nvim-tags', ft = {'kotlin','java'} },
-- Línea documentada: `'folke/lua-dev.nvim',`.
  'folke/lua-dev.nvim',
-- Línea documentada: `'folke/trouble.nvim',`.
  'folke/trouble.nvim',
-- Línea documentada: `{`.
  {
-- Línea documentada: `"folke/persistence.nvim",`.
  "folke/persistence.nvim",
-- Línea documentada: `event = "BufReadPre", -- this will only start session saving when an actual file was opened`.
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
-- Línea documentada: `opts = {`.
  opts = {
    -- add any custom options here
-- Línea documentada: `}},`.
  }},
-- Línea documentada: `'monaqa/dial.nvim',`.
  'monaqa/dial.nvim',
-- Línea documentada: `'https://codeberg.org/andyg/leap.nvim',`.
  'https://codeberg.org/andyg/leap.nvim',
-- Línea documentada: `'ggandor/leap-ast.nvim',`.
  'ggandor/leap-ast.nvim',
-- Línea documentada: `'ggandor/leap-spooky.nvim',`.
  'ggandor/leap-spooky.nvim',
-- Línea documentada: `'cwebster2/github-coauthors.nvim',`.
  'cwebster2/github-coauthors.nvim',
-- Línea documentada: `{ 'wet-sandwich/hyper.nvim', dependencies = { 'nvim-lua/plenary.nvim' }},`.
  { 'wet-sandwich/hyper.nvim', dependencies = { 'nvim-lua/plenary.nvim' }},
-- Línea documentada: `{`.
  {
-- Línea documentada: `"folke/snacks.nvim",`.
    "folke/snacks.nvim",
-- Línea documentada: `priority = 1000,`.
    priority = 1000,
-- Línea documentada: `lazy = false,`.
    lazy = false,
-- Línea documentada: `config = function()`.
    config = function()
-- Línea documentada: `require("snacks").setup({`.
      require("snacks").setup({
-- Línea documentada: `input = { enabled = true },`.
        input = { enabled = true },
-- Línea documentada: `bigfile = { enabled = false },`.
        bigfile = { enabled = false },
-- Línea documentada: `notifier = { enabled = true },`.
        notifier = { enabled = true },
-- Línea documentada: `quickfile = { enabled = false },`.
        quickfile = { enabled = false },
-- Línea documentada: `statuscolumn = { enabled = false },`.
        statuscolumn = { enabled = false },
-- Línea documentada: `words = { enabled = false },`.
        words = { enabled = false },
-- Línea documentada: `})`.
      })
-- Línea documentada: `end,`.
    end,
-- Línea documentada: `},`.
  },
  
  -- Additional markdown, completion, and git workflow plugins.
-- Línea documentada: `{"MeanderingProgrammer/render-markdown.nvim", dependencies = {"nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons"}, ft = "markdown"},`.
  {"MeanderingProgrammer/render-markdown.nvim", dependencies = {"nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons"}, ft = "markdown"},
-- Línea documentada: `'hrsh7th/cmp-buffer',`.
  'hrsh7th/cmp-buffer',
-- Línea documentada: `'hrsh7th/cmp-vsnip',`.
  'hrsh7th/cmp-vsnip',
-- Línea documentada: `'hrsh7th/vim-vsnip',`.
  'hrsh7th/vim-vsnip',
-- Línea documentada: `'lukas-reineke/cmp-rg',`.
  'lukas-reineke/cmp-rg',
-- Línea documentada: `'hrsh7th/vim-vsnip-integ',`.
  'hrsh7th/vim-vsnip-integ',
-- Línea documentada: `'hrsh7th/cmp-path',`.
  'hrsh7th/cmp-path',
-- Línea documentada: `'hrsh7th/cmp-cmdline',`.
  'hrsh7th/cmp-cmdline',
-- Línea documentada: `{'David-Kunz/cmp-npm', requires = {'nvim-lua/plenary.nvim' } },`.
  {'David-Kunz/cmp-npm', requires = {'nvim-lua/plenary.nvim' } },
-- Línea documentada: `'tamago324/cmp-zsh',`.
  'tamago324/cmp-zsh',
-- Línea documentada: `'norcalli/nvim-colorizer.lua',`.
  'norcalli/nvim-colorizer.lua',
-- Línea documentada: `'lewis6991/gitsigns.nvim',`.
  'lewis6991/gitsigns.nvim',
-- Línea documentada: `{`.
  {
-- Línea documentada: `"f-person/git-blame.nvim",`.
    "f-person/git-blame.nvim",
    -- load the plugin at startup
-- Línea documentada: `event = "VeryLazy",`.
    event = "VeryLazy",
-- Línea documentada: `opts = {`.
    opts = {
-- Línea documentada: `enabled = true,  -- if you want to enable the plugin`.
        enabled = true,  -- if you want to enable the plugin
-- Línea documentada: `message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options`.
        message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
-- Línea documentada: `date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options`.
        date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
-- Línea documentada: `virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options`.
        virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
},
-- Línea documentada: `'kdheepak/lazygit.nvim',`.
  'kdheepak/lazygit.nvim',
-- Línea documentada: `{`.
  {
-- Línea documentada: `'SuperBo/fugit2.nvim',`.
    'SuperBo/fugit2.nvim',
-- Línea documentada: `dependencies = {`.
    dependencies = {
-- Línea documentada: `'nvim-tree/nvim-web-devicons',`.
      'nvim-tree/nvim-web-devicons',
-- Línea documentada: `'nvim-lua/plenary.nvim',`.
      'nvim-lua/plenary.nvim',
-- Línea documentada: `{`.
      {
-- Línea documentada: `'chrisgrieser/nvim-tinygit', -- optional: for Github PR view`.
        'chrisgrieser/nvim-tinygit', -- optional: for Github PR view
-- Línea documentada: `dependencies = { 'stevearc/dressing.nvim' }`.
        dependencies = { 'stevearc/dressing.nvim' }
-- Línea documentada: `},`.
      },
-- Línea documentada: `},`.
    },
-- Línea documentada: `cmd = { 'Fugit2', 'Fugit2Diff', 'Fugit2Graph' },`.
    cmd = { 'Fugit2', 'Fugit2Diff', 'Fugit2Graph' },
-- Línea documentada: `keys = {`.
    keys = {
-- Línea documentada: `{ '<leader>F', '<cmd>Fugit2<cr>', desc = 'Open Fugit2', mode = 'n' }`.
      { '<leader>F', '<cmd>Fugit2<cr>', desc = 'Open Fugit2', mode = 'n' }
-- Línea documentada: `},`.
    },
-- Línea documentada: `config = function() require('git.fugit2-config') end,`.
    config = function() require('git.fugit2-config') end,
-- Línea documentada: `},`.
  },
-- Línea documentada: `'echasnovski/mini.nvim',`.
  'echasnovski/mini.nvim',
-- Línea documentada: `{'lukas-reineke/indent-blankline.nvim', main = "ibl",},`.
  {'lukas-reineke/indent-blankline.nvim', main = "ibl",},
  
-- Línea documentada: `{'akinsho/toggleterm.nvim', branch = 'main', config = function() require('tools.toggleterm-config') end, enabled = not vscode },`.
  {'akinsho/toggleterm.nvim', branch = 'main', config = function() require('tools.toggleterm-config') end, enabled = not vscode },
-- Línea documentada: `{'numToStr/Comment.nvim', config = function() require('Comment') end, enabled = not vscode },`.
  {'numToStr/Comment.nvim', config = function() require('Comment') end, enabled = not vscode },
-- Línea documentada: `'jeffkreeftmeijer/vim-numbertoggle',`.
  'jeffkreeftmeijer/vim-numbertoggle',
-- Línea documentada: `{'glepnir/lspsaga.nvim', branch = "main" },`.
  {'glepnir/lspsaga.nvim', branch = "main" },
-- Línea documentada: `{'folke/zen-mode.nvim', config = function() require("ui.zen-mode-config") end, enabled = not vscode },`.
  {'folke/zen-mode.nvim', config = function() require("ui.zen-mode-config") end, enabled = not vscode },
-- Línea documentada: `{'folke/twilight.nvim', config = function() require("ui.twilight-config") end, enabled = not vscode },`.
  {'folke/twilight.nvim', config = function() require("ui.twilight-config") end, enabled = not vscode },
-- Línea documentada: `'lambdalisue/suda.vim',`.
  'lambdalisue/suda.vim',
-- Línea documentada: `'Shougo/vimproc.vim',`.
  'Shougo/vimproc.vim',
-- Línea documentada: `'hashivim/vim-terraform',`.
  'hashivim/vim-terraform',
-- Línea documentada: `'nvim-lua/popup.nvim',`.
  'nvim-lua/popup.nvim',
-- Línea documentada: `'nvim-lua/plenary.nvim',`.
  'nvim-lua/plenary.nvim',
-- Línea documentada: `'kyazdani42/nvim-web-devicons',`.
  'kyazdani42/nvim-web-devicons',
-- Línea documentada: `'scalameta/nvim-metals',`.
  'scalameta/nvim-metals',
-- Línea documentada: `'sudormrfbin/cheatsheet.nvim',`.
  'sudormrfbin/cheatsheet.nvim',
-- Línea documentada: `{`.
  {
-- Línea documentada: `"nvim-treesitter/nvim-treesitter-textobjects",`.
  "nvim-treesitter/nvim-treesitter-textobjects",
-- Línea documentada: `branch = "main",`.
  branch = "main",
-- Línea documentada: `init = function()`.
  init = function()
    -- Disable entire built-in ftplugin mappings to avoid conflicts.
    -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
-- Línea documentada: `vim.g.no_plugin_maps = true`.
    vim.g.no_plugin_maps = true

    -- Or, disable per filetype (add as you like)
    -- vim.g.no_python_maps = true
    -- vim.g.no_ruby_maps = true
    -- vim.g.no_rust_maps = true
    -- vim.g.no_go_maps = true
-- Línea documentada: `end,`.
  end,
-- Línea documentada: `config = function()`.
  config = function()
    -- put your config here
-- Línea documentada: `end,`.
  end,
-- Línea documentada: `},`.
  },
-- Línea documentada: `{'nvimdev/dashboard-nvim', enabled = not vscode },`.
  {'nvimdev/dashboard-nvim', enabled = not vscode },
-- Línea documentada: `{`.
  {
-- Línea documentada: `"zbirenbaum/copilot.lua",`.
  "zbirenbaum/copilot.lua",
-- Línea documentada: `requires = {`.
  requires = {
-- Línea documentada: `"copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality`.
    "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
-- Línea documentada: `},`.
  },
-- Línea documentada: `cmd = "Copilot",`.
  cmd = "Copilot",
-- Línea documentada: `event = "InsertEnter",`.
  event = "InsertEnter",
-- Línea documentada: `},`.
  },
-- Línea documentada: `{`.
  {
-- Línea documentada: `"zbirenbaum/copilot-cmp",`.
    "zbirenbaum/copilot-cmp",
-- Línea documentada: `dependencies = { "zbirenbaum/copilot.lua" },`.
    dependencies = { "zbirenbaum/copilot.lua" },
-- Línea documentada: `config = function()`.
    config = function()
-- Línea documentada: `require("copilot_cmp").setup()`.
      require("copilot_cmp").setup()
-- Línea documentada: `end,`.
    end,
-- Línea documentada: `},`.
  },
-- Línea documentada: `{`.
  {
-- Línea documentada: `'robitx/gp.nvim',`.
    'robitx/gp.nvim',
-- Línea documentada: `config = function()`.
    config = function()
-- Línea documentada: `require('ai.mcphub-config')`.
      require('ai.mcphub-config')
-- Línea documentada: `end,`.
    end,
-- Línea documentada: `},`.
  },
-- Línea documentada: `'eandrju/cellular-automaton.nvim',`.
  'eandrju/cellular-automaton.nvim',
-- Línea documentada: `{'tzachar/cmp-tabnine', build = './install.sh', dependencies = 'hrsh7th/nvim-cmp'},`.
  {'tzachar/cmp-tabnine', build = './install.sh', dependencies = 'hrsh7th/nvim-cmp'},
--  { 'codota/tabnine-nvim', build = "./dl_binaries.sh", enabled = not vscode },
-- Línea documentada: `'ray-x/cmp-treesitter',`.
  'ray-x/cmp-treesitter',
-- Línea documentada: `'ray-x/lsp_signature.nvim',`.
  'ray-x/lsp_signature.nvim',
-- Línea documentada: `'octaltree/cmp-look',`.
  'octaltree/cmp-look',
-- Línea documentada: `'crispgm/telescope-heading.nvim',`.
  'crispgm/telescope-heading.nvim',
-- Línea documentada: `'nvim-telescope/telescope-packer.nvim',`.
  'nvim-telescope/telescope-packer.nvim',
-- Línea documentada: `'nvim-telescope/telescope-vimspector.nvim',`.
  'nvim-telescope/telescope-vimspector.nvim',
-- Línea documentada: `'fannheyward/telescope-coc.nvim',`.
  'fannheyward/telescope-coc.nvim',
-- Línea documentada: `'axieax/urlview.nvim',`.
  'axieax/urlview.nvim',
  -- Linting, debugger UI, and run-time inspection tools.
-- Línea documentada: `'mfussenegger/nvim-lint',`.
  'mfussenegger/nvim-lint',
-- Línea documentada: `'nvim-neotest/nvim-nio',`.
  'nvim-neotest/nvim-nio',
-- Línea documentada: `{ "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },`.
  { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
-- Línea documentada: `'rcarriga/nvim-notify',`.
  'rcarriga/nvim-notify',
-- Línea documentada: `'rcarriga/cmp-dap',`.
  'rcarriga/cmp-dap',
-- Línea documentada: `'theHamsta/nvim-dap-virtual-text',`.
  'theHamsta/nvim-dap-virtual-text',
-- Línea documentada: `'nvim-telescope/telescope-dap.nvim',`.
  'nvim-telescope/telescope-dap.nvim',
-- Línea documentada: `'ravenxrz/DAPInstall.nvim',`.
  'ravenxrz/DAPInstall.nvim',
-- Línea documentada: `'mbbill/undotree',`.
  'mbbill/undotree',
-- Línea documentada: `'voldikss/vim-translator',`.
  'voldikss/vim-translator',
-- Línea documentada: `'tpope/vim-dadbod',`.
  'tpope/vim-dadbod',
-- Línea documentada: `'kristijanhusak/vim-dadbod-ui',`.
  'kristijanhusak/vim-dadbod-ui',
-- Línea documentada: `'kristijanhusak/vim-dadbod-completion',`.
  'kristijanhusak/vim-dadbod-completion',
-- Línea documentada: `'mfussenegger/nvim-dap-python',`.
  'mfussenegger/nvim-dap-python',
-- Línea documentada: `'mfussenegger/nvim-jdtls',`.
  'mfussenegger/nvim-jdtls',
-- Línea documentada: `'nvim-telescope/telescope-media-files.nvim',`.
  'nvim-telescope/telescope-media-files.nvim',
-- Línea documentada: `{'nvim-telescope/telescope-z.nvim', requires = { { 'nvim-lua/plenary.nvim' }, { 'nvim-lua/popup.nvim' }, { 'nvim-telescope/telescope.nvim' } } },`.
  {'nvim-telescope/telescope-z.nvim', requires = { { 'nvim-lua/plenary.nvim' }, { 'nvim-lua/popup.nvim' }, { 'nvim-telescope/telescope.nvim' } } },
-- Línea documentada: `'softinio/scaladex.nvim',`.
  'softinio/scaladex.nvim',
-- Línea documentada: `'onsails/lspkind-nvim',`.
  'onsails/lspkind-nvim',
-- Línea documentada: `'WhoIsSethDaniel/mason-tool-installer.nvim',`.
  'WhoIsSethDaniel/mason-tool-installer.nvim',
-- Línea documentada: `'rafamadriz/friendly-snippets',`.
  'rafamadriz/friendly-snippets',
-- Línea documentada: `'kitagry/vs-snippets',`.
  'kitagry/vs-snippets',
-- Línea documentada: `'petertriho/cmp-git',`.
  'petertriho/cmp-git',
-- Línea documentada: `'TC72/telescope-tele-tabby.nvim',`.
  'TC72/telescope-tele-tabby.nvim',
-- Línea documentada: `'tjdevries/complextras.nvim',`.
  'tjdevries/complextras.nvim',
-- Línea documentada: `'folke/tokyonight.nvim',`.
  'folke/tokyonight.nvim',
-- Línea documentada: `'Mofiqul/vscode.nvim',`.
  'Mofiqul/vscode.nvim',
-- Línea documentada: `{ 'nvim-lualine/lualine.nvim', enabled = not vscode },`.
  { 'nvim-lualine/lualine.nvim', enabled = not vscode },
-- Línea documentada: `'unblevable/quick-scope',`.
  'unblevable/quick-scope',
-- Línea documentada: `'tamago324/telescope-openbrowser.nvim',`.
  'tamago324/telescope-openbrowser.nvim',
-- Línea documentada: `'tyru/open-browser.vim',`.
  'tyru/open-browser.vim',
-- Línea documentada: `'camgraff/telescope-tmux.nvim',`.
  'camgraff/telescope-tmux.nvim',
-- Línea documentada: `'norcalli/nvim-terminal.lua',`.
  'norcalli/nvim-terminal.lua',
-- Línea documentada: `'danielpieper/telescope-tmuxinator.nvim',`.
  'danielpieper/telescope-tmuxinator.nvim',
-- Línea documentada: `'ThePrimeagen/refactoring.nvim',`.
  'ThePrimeagen/refactoring.nvim',
-- Línea documentada: `'fcying/telescope-ctags-outline.nvim',`.
  'fcying/telescope-ctags-outline.nvim',
-- Línea documentada: `'jvgrootveld/telescope-zoxide',`.
  'jvgrootveld/telescope-zoxide',
-- Línea documentada: `'dhruvmanila/telescope-bookmarks.nvim',`.
  'dhruvmanila/telescope-bookmarks.nvim',
-- Línea documentada: `'nvim-telescope/telescope-github.nvim',`.
  'nvim-telescope/telescope-github.nvim',
-- Línea documentada: `'cljoly/telescope-repo.nvim',`.
  'cljoly/telescope-repo.nvim',
-- Línea documentada: `'LinArcX/telescope-changes.nvim',`.
  'LinArcX/telescope-changes.nvim',
-- Línea documentada: `{"kylechui/nvim-surround", version = "*" },`.
  {"kylechui/nvim-surround", version = "*" },
-- Línea documentada: `{"AckslD/nvim-neoclip.lua", config = function() require('neoclip').setup() end, enabled = not vscode },`.
  {"AckslD/nvim-neoclip.lua", config = function() require('neoclip').setup() end, enabled = not vscode },
-- Línea documentada: `'L3MON4D3/LuaSnip',`.
  'L3MON4D3/LuaSnip',
-- Línea documentada: `{ 'saadparwaiz1/cmp_luasnip' },`.
  { 'saadparwaiz1/cmp_luasnip' },
-- Línea documentada: `'kristijanhusak/vim-carbon-now-sh',`.
  'kristijanhusak/vim-carbon-now-sh',
-- Línea documentada: `'pwntester/octo.nvim',`.
  'pwntester/octo.nvim',
-- Línea documentada: `{'https://git.sr.ht/~whynothugo/lsp_lines.nvim', config = true, enabled = not vscode},`.
  {'https://git.sr.ht/~whynothugo/lsp_lines.nvim', config = true, enabled = not vscode},
-- Línea documentada: `'sam4llis/nvim-lua-gf',`.
  'sam4llis/nvim-lua-gf',
-- { 'anuvyklack/windows.nvim', dependencies = { 'anuvyklack/middleclass', 'anuvyklack/animation.nvim' },
--    config = function()  vim.o.winwidth = 20 vim.o.winminwidth = 10 vim.o.equalalways = false
--      require('windows').setup()  end, disable = vscode
--  },
-- Línea documentada: `{'neoclide/coc.nvim', branch = 'release', disable = vscode, cond = function() return vim.g.vscode ~= nil end },`.
  {'neoclide/coc.nvim', branch = 'release', disable = vscode, cond = function() return vim.g.vscode ~= nil end },
-- Línea documentada: `{ 'kevinhwang91/nvim-bqf' },`.
  { 'kevinhwang91/nvim-bqf' },
-- Línea documentada: `{ 'junegunn/fzf', build = function() vim.fn['fzf#install']() end },`.
  { 'junegunn/fzf', build = function() vim.fn['fzf#install']() end },
-- Línea documentada: `{'danymat/neogen', config = function() require('neogen').setup {} end, disable = vscode },`.
  {'danymat/neogen', config = function() require('neogen').setup {} end, disable = vscode },
  -- Additional plugins
-- Línea documentada: `{'ZWindL/orphans.nvim', config = function() require('tools.orphans-config') end, enabled = not vscode },`.
  {'ZWindL/orphans.nvim', config = function() require('tools.orphans-config') end, enabled = not vscode },
-- Línea documentada: `{'chrisgrieser/nvim-puppeteer', enabled = not vscode },`.
  {'chrisgrieser/nvim-puppeteer', enabled = not vscode },
-- Línea documentada: `{'dundalek/bloat.nvim', cmd = bloat, enabled = not vscode },`.
  {'dundalek/bloat.nvim', cmd = bloat, enabled = not vscode },
  -- New plugins
-- Línea documentada: `{'Ramilito/kubectl.nvim', config = function() require('kubectl').setup() end, enabled = not vscode },`.
  {'Ramilito/kubectl.nvim', config = function() require('kubectl').setup() end, enabled = not vscode },
-- Línea documentada: `{'cshuaimin/ssr.nvim', config = function() require('ssr').setup() end },`.
  {'cshuaimin/ssr.nvim', config = function() require('ssr').setup() end },
-- Línea documentada: `{'stevearc/conform.nvim', config = function() require('conform').setup() end },`.
  {'stevearc/conform.nvim', config = function() require('conform').setup() end },
-- Línea documentada: `{'folke/todo-comments.nvim', dependencies = { "nvim-lua/plenary.nvim" }, config = function() require('todo-comments').setup() end },`.
  {'folke/todo-comments.nvim', dependencies = { "nvim-lua/plenary.nvim" }, config = function() require('todo-comments').setup() end },
-- Línea documentada: `{'folke/flash.nvim', event = "VeryLazy", opts = {} },`.
  {'folke/flash.nvim', event = "VeryLazy", opts = {} },
-- Línea documentada: `{'nvim-pack/nvim-spectre', dependencies = { "nvim-lua/plenary.nvim" }, config = function() require('spectre').setup() end },`.
  {'nvim-pack/nvim-spectre', dependencies = { "nvim-lua/plenary.nvim" }, config = function() require('spectre').setup() end },
-- Línea documentada: `{`.
  {
-- Línea documentada: `"yetone/avante.nvim",`.
  "yetone/avante.nvim",
  -- AI assistant plugin with multi-provider and markdown/chat integrations.
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
-- Línea documentada: `build = vim.fn.has("win32") ~= 0`.
  build = vim.fn.has("win32") ~= 0
-- Línea documentada: `and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"`.
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
-- Línea documentada: `or "make",`.
      or "make",
-- Línea documentada: `event = "VeryLazy",`.
  event = "VeryLazy",
-- Línea documentada: `version = false, -- Never set this value to "*"! Never!`.
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
-- Línea documentada: `opts = {`.
  opts = {
    -- add any opts here
    -- this file can contain specific instructions for your project
-- Línea documentada: `instructions_file = "avante.md",`.
    instructions_file = "avante.md",
    -- for example
-- Línea documentada: `provider = "copilot",`.
    provider = "copilot",
-- Línea documentada: `},`.
  },
-- Línea documentada: `dependencies = {`.
  dependencies = {
-- Línea documentada: `"nvim-lua/plenary.nvim",`.
    "nvim-lua/plenary.nvim",
-- Línea documentada: `"MunifTanjim/nui.nvim",`.
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
-- Línea documentada: `"nvim-mini/mini.pick", -- for file_selector provider mini.pick`.
    "nvim-mini/mini.pick", -- for file_selector provider mini.pick
-- Línea documentada: `"nvim-telescope/telescope.nvim", -- for file_selector provider telescope`.
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
-- Línea documentada: `"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions`.
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
-- Línea documentada: `"ibhagwan/fzf-lua", -- for file_selector provider fzf`.
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
-- Línea documentada: `"stevearc/dressing.nvim", -- for input provider dressing`.
    "stevearc/dressing.nvim", -- for input provider dressing
-- Línea documentada: `"folke/snacks.nvim", -- for input provider snacks`.
    "folke/snacks.nvim", -- for input provider snacks
-- Línea documentada: `"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons`.
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
-- Línea documentada: `"zbirenbaum/copilot.lua", -- for providers='copilot'`.
    "zbirenbaum/copilot.lua", -- for providers='copilot'
-- Línea documentada: `{`.
    {
      -- support for image pasting
-- Línea documentada: `"HakonHarnes/img-clip.nvim",`.
      "HakonHarnes/img-clip.nvim",
-- Línea documentada: `event = "VeryLazy",`.
      event = "VeryLazy",
-- Línea documentada: `opts = {`.
      opts = {
        -- recommended settings
-- Línea documentada: `default = {`.
        default = {
-- Línea documentada: `embed_image_as_base64 = false,`.
          embed_image_as_base64 = false,
-- Línea documentada: `prompt_for_file_name = false,`.
          prompt_for_file_name = false,
-- Línea documentada: `drag_and_drop = {`.
          drag_and_drop = {
-- Línea documentada: `insert_mode = true,`.
            insert_mode = true,
-- Línea documentada: `},`.
          },
          -- required for Windows users
-- Línea documentada: `use_absolute_path = true,`.
          use_absolute_path = true,
-- Línea documentada: `},`.
        },
-- Línea documentada: `},`.
      },
-- Línea documentada: `},`.
    },
-- Línea documentada: `{`.
    {
      -- Make sure to set this up properly if you have lazy=true
-- Línea documentada: `'MeanderingProgrammer/render-markdown.nvim',`.
      'MeanderingProgrammer/render-markdown.nvim',
-- Línea documentada: `opts = {`.
      opts = {
-- Línea documentada: `file_types = { "markdown", "Avante" },`.
        file_types = { "markdown", "Avante" },
-- Línea documentada: `},`.
      },
-- Línea documentada: `ft = { "markdown", "Avante" },`.
      ft = { "markdown", "Avante" },
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
-- Línea documentada: `}`.
}

-- Línea documentada: `})`.
})
