-- Módulo `lua/core/plugins/init.lua`: catálogo central de plugins de BlindNvim.
-- Nota de mantenimiento:
-- - Este archivo no debe contener reglas de negocio de cada plugin;
--   solo declaración de specs, dependencias y condiciones de carga.
-- - La configuración detallada vive en `lua/<categoria>/<plugin>-config/init.lua`
--   (por ejemplo: `lua/tools/toggleterm-config/init.lua`).

-- Get platform dependant build script
local function tabnine_build_path()
  -- Replace vim.uv with vim.loop if using NVIM 0.9.0 or below
  if vim.uv.os_uname().sysname == "Windows_NT" then
    return "pwsh.exe -file .\\dl_binaries.ps1"
  else
    return "./dl_binaries.sh"
  end
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- Bootstrap lazy.nvim automatically if it is not installed yet.
if not vim.uv.fs_stat(lazypath) then
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

-- En modo VSCode, varios plugins usan `enabled = not vscode` para no cargar
-- integraciones que dependen de TUI nativa, floating windows o terminal embebida.
local vscode = vim.g.vscode ~= nil and vim.g.vscode ~= false and vim.g.vscode ~= 0
local lazy_ui = BlindReturn({
  size = { width = 1, height = 1 },
  wrap = false,
  border = "none",
  backdrop = 0,
  title = nil,
  title_pos = "center",
  pills = false,
  icons = {
    cmd = "cmd",
    config = "config",
    debug = "debug",
    event = "event",
    favorite = "fav",
    ft = "ft",
    init = "init",
    import = "import",
    keys = "keys",
    lazy = "lazy",
    loaded = "loaded",
    not_loaded = "not loaded",
    plugin = "plugin",
    runtime = "runtime",
    require = "require",
    source = "source",
    start = "start",
    task = "task",
    list = { "-", ">", "*", "-" },
  },
}, {
  size = { width = 0.8, height = 0.8 },
  wrap = true,
  border = "none",
  backdrop = 60,
  title = nil,
  title_pos = "center",
  pills = true,
  icons = {
    cmd = " ",
    config = "",
    debug = "● ",
    event = " ",
    favorite = " ",
    ft = " ",
    init = " ",
    import = " ",
    keys = " ",
    lazy = "󰒲 ",
    loaded = "●",
    not_loaded = "○",
    plugin = " ",
    runtime = " ",
    require = "󰢱 ",
    source = " ",
    start = " ",
    task = "✔ ",
    list = {
      "●",
      "➜",
      "★",
      "‒",
    },
  },
})

-- Registro único de plugins para todo el setup.
-- Si una funcionalidad "no aparece", primero revisar si su spec está aquí y
-- luego validar su módulo `*-config` correspondiente.
require("lazy").setup({
  ui = lazy_ui,
  spec = {
  -- Core editing quality-of-life plugins.
  'ibhagwan/smartyank.nvim',
  'pteroctopus/faster.nvim',
  'gpanders/editorconfig.nvim',
  'mg979/vim-visual-multi',
  'Civitasv/cmake-tools.nvim',
  'debugloop/telescope-undo.nvim',
  'xiyaowong/telescope-emoji.nvim', 
  {
    'HiPhish/rainbow-delimiters.nvim',
    enabled = not vim.g.visual_impairing,
  },
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
  {'stevearc/oil.nvim',opts = {}, dependencies = { { "echasnovski/mini.icons", opts = {} } },},
  -- LSP, DAP, and language tooling foundation.
  "jay-babu/mason-null-ls.nvim",
  'jayp0521/mason-nvim-dap.nvim',
  {'VonHeikemen/lsp-zero.nvim'},
  {'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim'},
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', lazy = false, enabled = not vscode},
  {'tamton-aquib/staline.nvim', dependencies = {'nvim-tree/nvim-web-devicons'} },
  {"LinArcX/telescope-command-palette.nvim" },
  {"neanias/telescope-lines.nvim", dependencies = "nvim-telescope/telescope.nvim",},
  -- UI navigation and editing helpers.
  {'akinsho/bufferline.nvim',version="*", dependencies = 'nvim-tree/nvim-web-devicons'},
  {'windwp/nvim-ts-autotag', event = "InsertEnter", dependencies = "nvim-treesitter/nvim-treesitter" },
  {'windwp/nvim-autopairs', config = true, event="InsertEnter", dependencies = "hrsh7th/nvim-cmp", enabled = not vscode},
  {'folke/which-key.nvim', event = "BufWinEnter", config = function() require('ui.whichkey-config') end, enabled = not vscode },
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
    require("tools.dbee-config")
  end,
},
  -- Completion, diagnostics, and session helpers.
  'williamboman/mason-lspconfig.nvim',
  { 'neovim/nvim-lspconfig', dependencies = {'williamboman/mason.nvim','williamboman/mason-lspconfig.nvim','j-hui/fidget.nvim', }, },
  {"MattiasMTS/cmp-dbee",dependencies = {{"kndndrj/nvim-dbee"}},ft = "sql", opts = {}, },
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-nvim-lsp-document-symbol',
  'danielvolchek/tailiscope.nvim',
  'f3fora/cmp-spell',
  'uga-rosa/cmp-dictionary',
  {"Dosx001/cmp-commit", dependencies = "hrsh7th/nvim-cmp"},
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "KadoBOT/cmp-plugins",
        config = function()
          require("cmp-plugins").setup({ files = { ".*\\.lua" } })
        end,
      },
    },
  },
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
      }, {
        ui = BlindReturn({
          fullscreen = true,
          border = "none",
          size = {
            width = 1,
            height = 1,
          },
        }, {}),
      })
    end,
  },
  
  -- Additional markdown, completion, and git workflow plugins.
  {"MeanderingProgrammer/render-markdown.nvim", dependencies = {"nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons"}, ft = "markdown"},
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',
  'lukas-reineke/cmp-rg',
  'hrsh7th/vim-vsnip-integ',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  {'David-Kunz/cmp-npm', dependencies = {'nvim-lua/plenary.nvim' } },
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
  {'nvimdev/lspsaga.nvim', branch = "main" },
  {'folke/zen-mode.nvim', config = function() require("ui.zen-mode-config") end, enabled = not vscode },
  {'folke/twilight.nvim', config = function() require("ui.twilight-config") end, enabled = not vscode },
  'lambdalisue/suda.vim',
  'Shougo/vimproc.vim',
  'hashivim/vim-terraform',
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
  dependencies = {
    "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
  },
  cmd = "Copilot enable",
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
  { 'codota/tabnine-nvim', build = tabnine_build_path(), enabled = not vscode },
  'ray-x/cmp-treesitter',
  'ray-x/lsp_signature.nvim',
  'octaltree/cmp-look',
  'crispgm/telescope-heading.nvim',
  'nvim-telescope/telescope-vimspector.nvim',
  'fannheyward/telescope-coc.nvim',
  'axieax/urlview.nvim',
  -- Linting, debugger UI, and run-time inspection tools.
  'mfussenegger/nvim-lint',
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
  'rcarriga/nvim-notify',
  'rcarriga/cmp-dap',
  'theHamsta/nvim-dap-virtual-text',
  'nvim-telescope/telescope-dap.nvim',
  'ravenxrz/DAPInstall.nvim',
  'mbbill/undotree',
  'voldikss/vim-translator',
  'tpope/vim-dadbod',
  {
    'kristijanhusak/vim-dadbod-ui',
    cmd = { 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIFindBuffer' },
    config = function()
      require('tools.dadbod-ui-config')
    end,
  },
  'kristijanhusak/vim-dadbod-completion',
  { 'mfussenegger/nvim-dap-python', ft = { 'python' } },
  { 'mfussenegger/nvim-jdtls', ft = { 'java' } },
  'nvim-telescope/telescope-media-files.nvim',
  {'nvim-telescope/telescope-z.nvim', dependencies = { { 'nvim-lua/plenary.nvim' }, { 'nvim-lua/popup.nvim' }, { 'nvim-telescope/telescope.nvim' } } },
  { 'softinio/scaladex.nvim', ft = { 'scala', 'sbt' } },
  'onsails/lspkind-nvim',
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  'rafamadriz/friendly-snippets',
  'kitagry/vs-snippets',
  'petertriho/cmp-git',
  'TC72/telescope-tele-tabby.nvim',
  'tjdevries/complextras.nvim',
  'folke/tokyonight.nvim',
  {
    'idr4n/github-monochrome.nvim',
    priority = 1000,
    lazy = false,
    enabled = not vscode,
  },
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
  {
    'simonwinther/cppman.nvim',
    ft = { 'cpp' },
    enabled = not vscode,
  },
  {
    'dchinmay2/clangd_extensions.nvim',
    ft = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
    opts = {},
    enabled = not vscode,
  },
  {
    'dchinmay2/godbolt.nvim',
    ft = { 'c', 'cpp', 'rust' },
    opts = {},
    dependencies = { 'nvim-telescope/telescope.nvim' },
    enabled = not vscode,
  },
  { 'chrisgrieser/nvim-puppeteer', ft = { 'python' }, enabled = not vscode },
  {
    'Teatek/gdscript-extended-lsp.nvim',
    ft = { 'gdscript' },
    opts = {},
    enabled = not vscode,
  },
  {
    'QuickGD/quickgd.nvim',
    ft = { 'gdshader', 'gdshaderinc' },
    init = function()
      vim.filetype.add({
        extension = {
          gdshaderinc = 'gdshaderinc',
        },
      })
    end,
    opts = {},
    enabled = not vscode,
  },
  {
    'benomahony/uv.nvim',
    ft = { 'python' },
    opts = {
      picker_integration = true,
    },
    enabled = not vscode,
  },
  {
    'pmizio/typescript-tools.nvim',
    ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
    enabled = not vscode,
  },
  {
    'mrcjkb/rustaceanvim',
    ft = { 'rust' },
    version = '^9',
    enabled = not vscode,
  },
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'LspAttach',
    priority = 1000,
    config = function()
      require('tiny-inline-diagnostic').setup()
      vim.diagnostic.config({ virtual_text = false })
      require('language.tools.diagnostics-whichkey').setup()
    end,
    enabled = not vscode,
  },
  {
    'romus204/referencer.nvim',
    event = 'LspAttach',
    opts = { enable = false },
    config = function(_, opts)
      require('referencer').setup(opts)
      require('language.tools.referencer-whichkey').setup()
    end,
    enabled = not vscode,
  },
  {
    'wintermute-cell/gitignore.nvim',
    cmd = 'Gitignore',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require('gitignore')
      require('language.tools.gitignore-whichkey').setup()
    end,
    enabled = not vscode,
  },
  {
    'wallpants/github-preview.nvim',
    ft = { 'markdown' },
    build = 'cd app && bun install',
    opts = {},
    config = function(_, opts)
      require('github-preview').setup(opts)
    end,
    enabled = not vscode,
  },
  {'dundalek/bloat.nvim', cmd = bloat, enabled = not vscode },
  -- New plugins
  {
    'Ramilito/kubectl.nvim',
    version = '2.*',
    cmd = { 'Kubectl', 'Kubens', 'Kubectx' },
    dependencies = { 'saghen/blink.download' },
    config = function()
      require('kubectl').setup()
      require('language.tools.kubectl-whichkey').setup()
    end,
    enabled = not vscode,
  },
  {'cshuaimin/ssr.nvim', config = function() require('ssr').setup() end },
  {'stevearc/conform.nvim', config = function() require('conform').setup() end },
  {'folke/todo-comments.nvim', dependencies = { "nvim-lua/plenary.nvim" }, config = function() require('todo-comments').setup() end },
  {'folke/flash.nvim', event = "VeryLazy", opts = {} },
  {'nvim-pack/nvim-spectre', dependencies = { "nvim-lua/plenary.nvim" }, config = function() require('spectre').setup() end },
  {
  "yetone/avante.nvim",
  -- AI assistant plugin with multi-provider and markdown/chat integrations.
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = vim.fn.has("win32") ~= 0
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
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
},
},
})
