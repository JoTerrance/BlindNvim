-- Simple plugin manager using vim.pack (Neovim's built-in package system)
-- This replaces Lazy.nvim with a minimal implementation using vim.fn.system for git operations

local pack_path = vim.fn.stdpath("data") .. "/site/pack/plugins/start"
local vscode = vim.g.vscode == 1

-- Helper function to clone a plugin if it doesn't exist
local function ensure_plugin(plugin_url, plugin_name)
  local plugin_path = pack_path .. "/" .. plugin_name
  if not vim.loop.fs_stat(plugin_path) then
    vim.fn.mkdir(pack_path, "p")
    print("Installing " .. plugin_name .. "...")
    vim.fn.system({
      "git",
      "clone",
      "--depth=1",
      plugin_url,
      plugin_path,
    })
  end
end

-- Helper function to ensure GitHub plugin
local function ensure_github_plugin(repo)
  local plugin_name = repo:match("^[^/]+/(.+)$")
  ensure_plugin("https://github.com/" .. repo .. ".git", plugin_name)
end

-- Install essential plugins
ensure_github_plugin('wbthomason/packer.nvim')
ensure_github_plugin('ibhagwan/smartyank.nvim')
ensure_github_plugin('pteroctopus/faster.nvim')
ensure_github_plugin('mg979/vim-visual-multi')
ensure_github_plugin('Civitasv/cmake-tools.nvim')
ensure_github_plugin('debugloop/telescope-undo.nvim')
ensure_github_plugin('xiyaowong/telescope-emoji.nvim')
ensure_github_plugin('HiPhish/rainbow-delimiters.nvim')
ensure_plugin('https://codeberg.org/esensar/nvim-dev-container.git', 'nvim-dev-container')
ensure_github_plugin('lpoto/telescope-docker.nvim')
ensure_github_plugin('williamboman/mason.nvim')
ensure_github_plugin('nvimtools/none-ls.nvim')
ensure_github_plugin('smjonas/live-command.nvim')
ensure_github_plugin('stevearc/aerial.nvim')
ensure_github_plugin('nvim-treesitter/nvim-treesitter')
ensure_github_plugin('nvim-tree/nvim-web-devicons')
ensure_github_plugin('emmanueltouzery/decisive.nvim')
ensure_github_plugin('stevearc/oil.nvim')
ensure_github_plugin('echasnovski/mini.icons')
ensure_github_plugin('jay-babu/mason-null-ls.nvim')
ensure_github_plugin('mfussenegger/nvim-dap')
ensure_github_plugin('jayp0521/mason-nvim-dap.nvim')
ensure_github_plugin('VonHeikemen/lsp-zero.nvim')
ensure_github_plugin('sindrets/diffview.nvim')
ensure_github_plugin('nvim-lua/plenary.nvim')
ensure_github_plugin('tamton-aquib/staline.nvim')
ensure_github_plugin('kyazdani42/nvim-web-devicons')
ensure_github_plugin('LinArcX/telescope-command-palette.nvim')
ensure_github_plugin('nat-418/telescope-color-names.nvim')
ensure_github_plugin('neanias/telescope-lines.nvim')
ensure_github_plugin('nvim-telescope/telescope.nvim')
ensure_github_plugin('akinsho/bufferline.nvim')
ensure_github_plugin('windwp/nvim-ts-autotag')
ensure_github_plugin('windwp/nvim-autopairs')
ensure_github_plugin('folke/which-key.nvim')
ensure_github_plugin('LinArcX/telescope-env.nvim')
ensure_github_plugin('kndndrj/nvim-dbee')
ensure_github_plugin('MunifTanjim/nui.nvim')
ensure_github_plugin('williamboman/mason-lspconfig.nvim')
ensure_github_plugin('neovim/nvim-lspconfig')
ensure_github_plugin('j-hui/fidget.nvim')
ensure_github_plugin('MattiasMTS/cmp-dbee')
ensure_github_plugin('hrsh7th/cmp-nvim-lsp')
ensure_github_plugin('hrsh7th/cmp-nvim-lsp-signature-help')
ensure_github_plugin('hrsh7th/cmp-nvim-lsp-document-symbol')
ensure_github_plugin('danielvolchek/tailiscope.nvim')
ensure_github_plugin('f3fora/cmp-spell')
ensure_github_plugin('uga-rosa/cmp-dictionary')
ensure_github_plugin('Dosx001/cmp-commit')
ensure_github_plugin('hrsh7th/nvim-cmp')
ensure_github_plugin('KadoBOT/cmp-plugins')
ensure_github_plugin('quangnguyen30192/cmp-nvim-tags')
ensure_github_plugin('folke/lua-dev.nvim')
ensure_github_plugin('folke/trouble.nvim')
ensure_github_plugin('folke/persistence.nvim')
ensure_github_plugin('monaqa/dial.nvim')
ensure_github_plugin('ggandor/leap.nvim')
ensure_github_plugin('ggandor/leap-ast.nvim')
ensure_github_plugin('ggandor/leap-spooky.nvim')
ensure_github_plugin('cwebster2/github-coauthors.nvim')
ensure_github_plugin('wet-sandwich/hyper.nvim')
ensure_github_plugin('folke/noice.nvim')
ensure_github_plugin('rcarriga/nvim-notify')
ensure_github_plugin('epwalsh/obsidian.nvim')
ensure_github_plugin('MeanderingProgrammer/render-markdown.nvim')
ensure_github_plugin('hrsh7th/cmp-buffer')
ensure_github_plugin('hrsh7th/cmp-vsnip')
ensure_github_plugin('hrsh7th/vim-vsnip')
ensure_github_plugin('lukas-reineke/cmp-rg')
ensure_github_plugin('hrsh7th/vim-vsnip-integ')
ensure_github_plugin('hrsh7th/cmp-path')
ensure_github_plugin('hrsh7th/cmp-cmdline')
ensure_github_plugin('David-Kunz/cmp-npm')
ensure_github_plugin('tamago324/cmp-zsh')
ensure_github_plugin('norcalli/nvim-colorizer.lua')
ensure_github_plugin('lewis6991/gitsigns.nvim')
ensure_github_plugin('f-person/git-blame.nvim')
ensure_github_plugin('kdheepak/lazygit.nvim')
ensure_github_plugin('echasnovski/mini.nvim')
ensure_github_plugin('lukas-reineke/indent-blankline.nvim')
ensure_github_plugin('akinsho/toggleterm.nvim')
ensure_github_plugin('numToStr/Comment.nvim')
ensure_github_plugin('jeffkreeftmeijer/vim-numbertoggle')
ensure_github_plugin('glepnir/lspsaga.nvim')
ensure_github_plugin('folke/zen-mode.nvim')
ensure_github_plugin('folke/twilight.nvim')
ensure_github_plugin('lambdalisue/suda.vim')
ensure_github_plugin('Shougo/vimproc.vim')
ensure_github_plugin('hashivim/vim-terraform')
ensure_github_plugin('nvim-lua/popup.nvim')
ensure_github_plugin('nvim-treesitter/playground')
ensure_github_plugin('scalameta/nvim-metals')
ensure_github_plugin('sudormrfbin/cheatsheet.nvim')
ensure_github_plugin('romgrk/nvim-treesitter-context')
ensure_github_plugin('nvim-treesitter/nvim-treesitter-textobjects')
ensure_github_plugin('RRethy/nvim-treesitter-textsubjects')
ensure_github_plugin('yetone/avante.nvim')
ensure_github_plugin('stevearc/dressing.nvim')
ensure_github_plugin('zbirenbaum/copilot.lua')
ensure_github_plugin('HakonHarnes/img-clip.nvim')
ensure_github_plugin('zbirenbaum/copilot-cmp')
ensure_github_plugin('robitx/gp.nvim')
ensure_github_plugin('eandrju/cellular-automaton.nvim')
ensure_github_plugin('tzachar/cmp-tabnine')
ensure_github_plugin('ray-x/cmp-treesitter')
ensure_github_plugin('ray-x/lsp_signature.nvim')
ensure_github_plugin('octaltree/cmp-look')
ensure_github_plugin('crispgm/telescope-heading.nvim')
ensure_github_plugin('nvim-telescope/telescope-packer.nvim')
ensure_github_plugin('nvim-telescope/telescope-vimspector.nvim')
ensure_github_plugin('fannheyward/telescope-coc.nvim')
ensure_github_plugin('axieax/urlview.nvim')
ensure_github_plugin('mfussenegger/nvim-lint')
ensure_github_plugin('nvim-neotest/nvim-nio')
ensure_github_plugin('rcarriga/nvim-dap-ui')
ensure_github_plugin('rcarriga/cmp-dap')
ensure_github_plugin('theHamsta/nvim-dap-virtual-text')
ensure_github_plugin('nvim-telescope/telescope-dap.nvim')
ensure_github_plugin('ravenxrz/DAPInstall.nvim')
ensure_github_plugin('mbbill/undotree')
ensure_github_plugin('voldikss/vim-translator')
ensure_github_plugin('tpope/vim-dadbod')
ensure_github_plugin('kristijanhusak/vim-dadbod-ui')
ensure_github_plugin('kristijanhusak/vim-dadbod-completion')
ensure_github_plugin('chipsenkbeil/distant.nvim')
ensure_github_plugin('mfussenegger/nvim-dap-python')
ensure_github_plugin('mfussenegger/nvim-jdtls')
ensure_github_plugin('nvim-telescope/telescope-media-files.nvim')
ensure_github_plugin('nvim-telescope/telescope-z.nvim')
ensure_github_plugin('softinio/scaladex.nvim')
ensure_github_plugin('onsails/lspkind-nvim')
ensure_github_plugin('WhoIsSethDaniel/mason-tool-installer.nvim')
ensure_github_plugin('rafamadriz/friendly-snippets')
ensure_github_plugin('kitagry/vs-snippets')
ensure_github_plugin('petertriho/cmp-git')
ensure_github_plugin('TC72/telescope-tele-tabby.nvim')
ensure_github_plugin('tjdevries/complextras.nvim')
ensure_github_plugin('folke/tokyonight.nvim')
ensure_github_plugin('Mofiqul/vscode.nvim')
ensure_github_plugin('nvim-lualine/lualine.nvim')
ensure_github_plugin('unblevable/quick-scope')
ensure_github_plugin('tamago324/telescope-openbrowser.nvim')
ensure_github_plugin('tyru/open-browser.vim')
ensure_github_plugin('camgraff/telescope-tmux.nvim')
ensure_github_plugin('norcalli/nvim-terminal.lua')
ensure_github_plugin('danielpieper/telescope-tmuxinator.nvim')
ensure_github_plugin('ThePrimeagen/refactoring.nvim')
ensure_github_plugin('fcying/telescope-ctags-outline.nvim')
ensure_github_plugin('jvgrootveld/telescope-zoxide')
ensure_github_plugin('dhruvmanila/telescope-bookmarks.nvim')
ensure_github_plugin('nvim-telescope/telescope-github.nvim')
ensure_github_plugin('cljoly/telescope-repo.nvim')
ensure_github_plugin('LinArcX/telescope-changes.nvim')
ensure_github_plugin('kylechui/nvim-surround')
ensure_github_plugin('AckslD/nvim-neoclip.lua')
ensure_github_plugin('L3MON4D3/LuaSnip')
ensure_github_plugin('saadparwaiz1/cmp_luasnip')
ensure_github_plugin('kristijanhusak/vim-carbon-now-sh')
ensure_github_plugin('pwntester/octo.nvim')
ensure_plugin('https://git.sr.ht/~whynothugo/lsp_lines.nvim', 'lsp_lines.nvim')
ensure_github_plugin('sam4llis/nvim-lua-gf')
ensure_github_plugin('neoclide/coc.nvim')
ensure_github_plugin('kevinhwang91/nvim-bqf')
ensure_github_plugin('junegunn/fzf')
ensure_github_plugin('danymat/neogen')
ensure_github_plugin('ZWindL/orphans.nvim')
ensure_github_plugin('chrisgrieser/nvim-puppeteer')
ensure_github_plugin('dundalek/bloat.nvim')
ensure_github_plugin('bennypowers/splitjoin.nvim')
ensure_github_plugin('Ramilito/kubectl.nvim')
ensure_github_plugin('cshuaimin/ssr.nvim')
ensure_github_plugin('stevearc/conform.nvim')
ensure_github_plugin('folke/todo-comments.nvim')
ensure_github_plugin('folke/flash.nvim')
ensure_github_plugin('nvim-pack/nvim-spectre')

-- Add the pack directory to runtimepath
vim.opt.rtp:prepend(pack_path)

-- Run post-install setup for plugins that need it
vim.cmd('helptags ALL')

-- Setup plugins that require configuration
if not vscode then
  -- Load treesitter
  pcall(require, 'treesitter-config')
  
  -- Load whichkey
  pcall(require, 'whichkey-config')
  
  -- Load toggleterm
  pcall(require, 'toggleterm-config')
  
  -- Load zen-mode
  pcall(require, 'zen-mode-config')
  
  -- Load twilight
  pcall(require, 'twilight-config')
  
  -- Load orphans
  pcall(require, 'orphans-config')
  
  -- Load puppeteer
  pcall(require, 'puppeteer-config')
  
  -- Load bloat
  pcall(require, 'bloat-config')
  
  -- Load splitjoin
  pcall(require, 'splitjoin-config')
end

-- Setup plugins that work in both environments
pcall(function() require('Comment').setup() end)
pcall(function() require('decisive').setup{} end)
pcall(function() require('nvim-autopairs').setup() end)
pcall(function() require('neoclip').setup() end)
pcall(function() require('lsp_lines').setup() end)
pcall(function() require('neogen').setup{} end)
pcall(function() require('kubectl').setup() end)
pcall(function() require('ssr').setup() end)
pcall(function() require('conform').setup() end)
pcall(function() require('todo-comments').setup() end)
pcall(function() require('spectre').setup() end)
pcall(function() require('mcphub-config') end)
pcall(function() require("cmp-plugins").setup({ files = { ".*\\.lua" } }) end)
pcall(function() 
  require("copilot").setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
  })
end)
pcall(function() require("copilot_cmp").setup() end)
pcall(function() require('telescope').load_extension('color_names') end)

-- Handle special plugin builds
pcall(function()
  vim.fn['fzf#install']()
end)

-- Setup dbee if needed
pcall(function()
  require("dbee").setup()
end)

