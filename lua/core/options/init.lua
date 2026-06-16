-- Documentación: módulo `lua/core/options/init.lua`.
-- Propósito: define opciones base del editor dentro de BlindNvim sin alterar lógica de ejecución.

-- Function to return different values based on the presence of a braille device
local accessibility = require("accessibility.check-braille")
vim.g.visual_impairing = accessibility.is_visual_impairing()
local has_braille = vim.g.visual_impairing
function BlindReturn(if_true, if_false)
  if has_braille then return if_true else return if_false end
end

-- [[ Setting options ]]
-- See `:help vim.o`

-- Space is the single global menu prefix; language helpers use <leader> too.
vim.g.mapleader = " "
vim.g.maplocalleader = "º"

-- Enable filetype detection and plugins
vim.cmd('filetype plugin indent on')

if has_braille then
  -- Keep the braille profile as close to plain text as possible.
  vim.g.loaded_matchparen = 1
  vim.o.showmatch = false
  vim.cmd('syntax manual')
end

-- Mouse and clipboard settings
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.fileencoding = 'utf-8'

-- Tab and indentation settings
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.breakindent = true

-- Color and visual settings
vim.opt.termguicolors = true
vim.o.background = 'dark'
vim.o.cursorline = BlindReturn(false, true)
vim.o.conceallevel = BlindReturn(0, 2)

-- Line numbers settings
vim.wo.number = true
vim.o.relativenumber = BlindReturn(false, true)

-- Scroll margins settings
vim.o.scrolloff = 3
vim.o.sidescrolloff = 5

-- Signs column settings
vim.wo.signcolumn = "yes"

-- Line wrap settings
vim.wo.wrap = BlindReturn(true, false)

-- Window split settings
vim.o.splitbelow = true
vim.o.splitright = BlindReturn(false, true)

-- Braille users benefit from a stable command line instead of transient UI.
vim.o.cmdheight = BlindReturn(1, 0)

-- Tab line settings
vim.o.showtabline = 2

-- Messages and modes settings
vim.o.showmode = false
vim.o.report = BlindReturn(999, 2)
vim.opt.shortmess:append(BlindReturn('Ic', 'c'))

-- Search settings
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false

-- Cursor movement settings when reaching line ends
vim.o.whichwrap = 'b,s,<,>,[,],h,l'

-- Suggestions and completions settings
vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" }
vim.o.pumheight = 10

-- File handling settings
vim.o.hidden = true
vim.o.undofile = true
vim.o.backup = false
vim.o.writebackup = false

-- Times of refresh settings
vim.o.updatetime = 300
vim.o.timeoutlen = 100

-- Diagnostic settings (LSP)
vim.diagnostic.config({ virtual_lines = false })

-- Visual Multi settings (specific plugin setting)
vim.g.VM_default_mappings = 0

-- Feedback Visual: Highlight what you copy (Yank Highlight)
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
