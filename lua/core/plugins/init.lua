local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local vscode = vim.g.vscode == 1
  -- Lazy can manage itself
require("lazy").setup({
  --'wbthomason/packer.nvim', -> Deprecated
  'ibhagwan/smartyank.nvim',
  'pteroctopus/faster.nvim',
  'gpanders/editorconfig.nvim',
  'mg979/vim-visual-multi',
  'Civitasv/cmake-tools.nvim',
  'debugloop/telescope-undo.nvim',
  'xiyaowong/telescope-emoji.nvim', 
  'HiPhish/rainbow-delimiters.nvim',
  'https://codeberg.org/esensar/nvim-dev-container',
  'lpoto/telescope-docker.nvim',
  'williamboman/mason.nvim',
  'nvimtools/none-ls.nvim',
  'smjonas/live-command.nvim',
{
  'stevearc/aerial.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
},
  {'stevearc/aerial.nvim',opts = {},},
  {
  "emmanueltouzery/decisive.nvim",
  config = function()
    require('decisive').setup{}
  end,
  lazy=true,
  ft = {'csv'},
  keys = {
    { '<leader>cca', ":lua require('decisive').align_csv({})<cr>",       { silent = true }, desc = "Align CSV",          mode = 'n' },
    { '<leader>ccA', ":lua require('decisive').align_csv_clear({})<cr>", { silent = true }, desc = "Align CSV clear",    mode = 'n' },
    { '[c', ":lua require('decisive').align_csv_prev_col()<cr>",         { silent = true }, desc = "Align CSV prev col", mode = 'n' },
    { ']c', ":lua require('decisive').align_csv_next_col()<cr>",         { silent = true }, desc = "Align CSV next col", mode = 'n' },
    }
  },
  {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
},
  "jay-babu/mason-null-ls.nvim",
  'mfussenegger/nvim-dap',
  'jayp0521/mason-nvim-dap.nvim',
  {'VonHeikemen/lsp-zero.nvim'},
  {'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim'},
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', lazy = false, enabled = not vscode},
  {'tamton-aquib/staline.nvim', dependencies = {'kyazdani42/nvim-web-devicons',lazy = true} },
  {"LinArcX/telescope-command-palette.nvim" },
  {"neanias/telescope-lines.nvim", dependencies = "nvim-telescope/telescope.nvim",},
  {'akinsho/bufferline.nvim',version="*", dependencies = 'kyazdani42/nvim-web-devicons'},
  -- {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' },
  {'windwp/nvim-ts-autotag', event = "InsertEnter", after = "nvim-treesitter" },
  {'windwp/nvim-autopairs', config = true, event="InsertEnter", after = "nvim-cmp", enabled = not vscode},
  {'folke/which-key.nvim', event = "BufWinEnter", config = function() require('ui.whichkey-config') end, enabled = not vscode },
  'nvim-telescope/telescope.nvim',
  'LinArcX/telescope-env.nvim',
  {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build = function()
    require("dbee").install()
  end,
  config = function()
    require("dbee").setup(--[[optional config]])
  end,
},
  'williamboman/mason-lspconfig.nvim',
  { 'neovim/nvim-lspconfig', requires = {'williamboman/mason.nvim','williamboman/mason-lspconfig.nvim','j-hui/fidget.nvim', }, },
  {"MattiasMTS/cmp-dbee",dependencies = {{"kndndrj/nvim-dbee"}},ft = "sql", opts = {}, },
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-nvim-lsp-document-symbol',
  'danielvolchek/tailiscope.nvim',
  'f3fora/cmp-spell',
  'uga-rosa/cmp-dictionary',
  {"Dosx001/cmp-commit", requires = "hrsh7th/nvim-cmp"},
  {"hrsh7th/nvim-cmp", requires = {"KadoBOT/cmp-plugins", config = function() require("cmp-plugins").setup({ files = { ".*\\.lua" }  }) end, }},
  {'quangnguyen30192/cmp-nvim-tags', ft = {'kotlin','java'} },
  'folke/lua-dev.nvim',
  'folke/trouble.nvim',
  {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {
    -- add any custom options here
  }},
  'monaqa/dial.nvim',
  'https://codeberg.org/andyg/leap.nvim',
  'ggandor/leap-ast.nvim',
  'ggandor/leap-spooky.nvim',
  'cwebster2/github-coauthors.nvim',
  { 'wet-sandwich/hyper.nvim', dependencies = { 'nvim-lua/plenary.nvim' }},
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("snacks").setup({
        input = { enabled = true },
        bigfile = { enabled = false },
        notifier = { enabled = true },
        quickfile = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
      })
    end,
  },
  
  {"MeanderingProgrammer/render-markdown.nvim", dependencies = {"nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons"}, ft = "markdown"},
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',
  'lukas-reineke/cmp-rg',
  'hrsh7th/vim-vsnip-integ',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  {'David-Kunz/cmp-npm', requires = {'nvim-lua/plenary.nvim' } },
  'tamago324/cmp-zsh',
  'norcalli/nvim-colorizer.lua',
  'lewis6991/gitsigns.nvim',
  {
    "f-person/git-blame.nvim",
    -- load the plugin at startup
    event = "VeryLazy",
    opts = {
        enabled = true,  -- if you want to enable the plugin
        message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
        date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
        virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options
    },
},
  'kdheepak/lazygit.nvim',
  {
    'SuperBo/fugit2.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
      {
        'chrisgrieser/nvim-tinygit', -- optional: for Github PR view
        dependencies = { 'stevearc/dressing.nvim' }
      },
    },
    cmd = { 'Fugit2', 'Fugit2Diff', 'Fugit2Graph' },
    keys = {
      { '<leader>F', '<cmd>Fugit2<cr>', desc = 'Open Fugit2', mode = 'n' }
    },
    config = function() require('git.fugit2-config') end,
  },
  'echasnovski/mini.nvim',
  {'lukas-reineke/indent-blankline.nvim', main = "ibl",},
  
  {'akinsho/toggleterm.nvim', branch = 'main', config = function() require('tools.toggleterm-config') end, enabled = not vscode },
  {'numToStr/Comment.nvim', config = function() require('Comment') end, enabled = not vscode },
  'jeffkreeftmeijer/vim-numbertoggle',
  {'glepnir/lspsaga.nvim', branch = "main" },
  {'folke/zen-mode.nvim', config = function() require("ui.zen-mode-config") end, enabled = not vscode },
  {'folke/twilight.nvim', config = function() require("ui.twilight-config") end, enabled = not vscode },
  'lambdalisue/suda.vim',
  'Shougo/vimproc.vim',
  'hashivim/vim-terraform',
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'kyazdani42/nvim-web-devicons',
  'scalameta/nvim-metals',
  'sudormrfbin/cheatsheet.nvim',
  {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  init = function()
    -- Disable entire built-in ftplugin mappings to avoid conflicts.
    -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
    vim.g.no_plugin_maps = true

    -- Or, disable per filetype (add as you like)
    -- vim.g.no_python_maps = true
    -- vim.g.no_ruby_maps = true
    -- vim.g.no_rust_maps = true
    -- vim.g.no_go_maps = true
  end,
  config = function()
    -- put your config here
  end,
  },
  {'nvimdev/dashboard-nvim', enabled = not vscode },
  {
  "zbirenbaum/copilot.lua",
  requires = {
    "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
  },
  cmd = "Copilot",
  event = "InsertEnter",
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    'robitx/gp.nvim',
    config = function()
      require('ai.mcphub-config')
    end,
  },
  'eandrju/cellular-automaton.nvim',
  {'tzachar/cmp-tabnine', build = './install.sh', dependencies = 'hrsh7th/nvim-cmp'},
--  { 'codota/tabnine-nvim', build = "./dl_binaries.sh", enabled = not vscode },
  'ray-x/cmp-treesitter',
  'ray-x/lsp_signature.nvim',
  'octaltree/cmp-look',
  'crispgm/telescope-heading.nvim',
  'nvim-telescope/telescope-packer.nvim',
  'nvim-telescope/telescope-vimspector.nvim',
  'fannheyward/telescope-coc.nvim',
  'axieax/urlview.nvim',
  'mfussenegger/nvim-lint',
  'nvim-neotest/nvim-nio',
  { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
  'rcarriga/nvim-notify',
  'rcarriga/cmp-dap',
  'theHamsta/nvim-dap-virtual-text',
  'nvim-telescope/telescope-dap.nvim',
  'ravenxrz/DAPInstall.nvim',
  'mbbill/undotree',
  'voldikss/vim-translator',
  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-ui',
  'kristijanhusak/vim-dadbod-completion',
  'mfussenegger/nvim-dap-python',
  'mfussenegger/nvim-jdtls',
  'nvim-telescope/telescope-media-files.nvim',
  {'nvim-telescope/telescope-z.nvim', requires = { { 'nvim-lua/plenary.nvim' }, { 'nvim-lua/popup.nvim' }, { 'nvim-telescope/telescope.nvim' } } },
  'softinio/scaladex.nvim',
  'onsails/lspkind-nvim',
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  'rafamadriz/friendly-snippets',
  'kitagry/vs-snippets',
  'petertriho/cmp-git',
  'TC72/telescope-tele-tabby.nvim',
  'tjdevries/complextras.nvim',
  'folke/tokyonight.nvim',
  'Mofiqul/vscode.nvim',
  { 'nvim-lualine/lualine.nvim', enabled = not vscode },
  'unblevable/quick-scope',
  'tamago324/telescope-openbrowser.nvim',
  'tyru/open-browser.vim',
  'camgraff/telescope-tmux.nvim',
  'norcalli/nvim-terminal.lua',
  'danielpieper/telescope-tmuxinator.nvim',
  'ThePrimeagen/refactoring.nvim',
  'fcying/telescope-ctags-outline.nvim',
  'jvgrootveld/telescope-zoxide',
  'dhruvmanila/telescope-bookmarks.nvim',
  'nvim-telescope/telescope-github.nvim',
  'cljoly/telescope-repo.nvim',
  'LinArcX/telescope-changes.nvim',
  {"kylechui/nvim-surround", version = "*" },
  {"AckslD/nvim-neoclip.lua", config = function() require('neoclip').setup() end, enabled = not vscode },
  'L3MON4D3/LuaSnip',
  { 'saadparwaiz1/cmp_luasnip' },
  'kristijanhusak/vim-carbon-now-sh',
  'pwntester/octo.nvim',
  {'https://git.sr.ht/~whynothugo/lsp_lines.nvim', config = true, enabled = not vscode},
  'sam4llis/nvim-lua-gf',
-- { 'anuvyklack/windows.nvim', dependencies = { 'anuvyklack/middleclass', 'anuvyklack/animation.nvim' },
--    config = function()  vim.o.winwidth = 20 vim.o.winminwidth = 10 vim.o.equalalways = false
--      require('windows').setup()  end, disable = vscode
--  },
  {'neoclide/coc.nvim', branch = 'release', disable = vscode, cond = function() return vim.g.vscode ~= nil end },
  { 'kevinhwang91/nvim-bqf' },
  { 'junegunn/fzf', build = function() vim.fn['fzf#install']() end },
  {'danymat/neogen', config = function() require('neogen').setup {} end, disable = vscode },
  -- Additional plugins
  {'ZWindL/orphans.nvim', config = function() require('tools.orphans-config') end, enabled = not vscode },
  {'chrisgrieser/nvim-puppeteer', enabled = not vscode },
  {'dundalek/bloat.nvim', cmd = bloat, enabled = not vscode },
  -- New plugins
  {'Ramilito/kubectl.nvim', config = function() require('kubectl').setup() end, enabled = not vscode },
  {'cshuaimin/ssr.nvim', config = function() require('ssr').setup() end },
  {'stevearc/conform.nvim', config = function() require('conform').setup() end },
  {'folke/todo-comments.nvim', dependencies = { "nvim-lua/plenary.nvim" }, config = function() require('todo-comments').setup() end },
  {'folke/flash.nvim', event = "VeryLazy", opts = {} },
  {'nvim-pack/nvim-spectre', dependencies = { "nvim-lua/plenary.nvim" }, config = function() require('spectre').setup() end },
  {
  "yetone/avante.nvim",
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = vim.fn.has("win32") ~= 0
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    -- add any opts here
    -- this file can contain specific instructions for your project
    instructions_file = "avante.md",
    -- for example
    provider = "copilot",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-mini/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "stevearc/dressing.nvim", -- for input provider dressing
    "folke/snacks.nvim", -- for input provider snacks
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}

})

