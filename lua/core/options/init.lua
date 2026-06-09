-- Documentación: módulo `lua/core/options/init.lua`.
-- Propósito: define opciones base del editor dentro de BlindNvim sin alterar lógica de ejecución.

-- Function to return different values based on the presence of a braille device
-- Línea documentada: `local has_braille = require("accessibility.check-braille").has_braille_device()`.
local has_braille = require("accessibility.check-braille").has_braille_device()
-- Línea documentada: `function BlindReturn(if_true, if_false)`.
function BlindReturn(if_true, if_false)
-- Línea documentada: `if has_braille then return if_true else return if_false end`.
  if has_braille then return if_true else return if_false end
-- Línea documentada: `end`.
end

-- [[ Setting options ]]
-- See `:help vim.o`

-- Key for general shortcuts
-- Línea documentada: `vim.g.mapleader = "º"`.
vim.g.mapleader = "º"
-- Línea documentada: `vim.g.maplocalleader = "º"`.
vim.g.maplocalleader = "º"

-- Enable filetype detection and plugins
-- Línea documentada: `vim.cmd('filetype plugin indent on')`.
vim.cmd('filetype plugin indent on')

-- Mouse and clipboard settings
-- Línea documentada: `vim.o.mouse = "a"`.
vim.o.mouse = "a"
-- Línea documentada: `vim.o.clipboard = "unnamedplus"`.
vim.o.clipboard = "unnamedplus"
-- Línea documentada: `vim.o.fileencoding = 'utf-8'`.
vim.o.fileencoding = 'utf-8'

-- Tab and indentation settings
-- Línea documentada: `vim.o.expandtab = true`.
vim.o.expandtab = true
-- Línea documentada: `vim.bo.expandtab = true`.
vim.bo.expandtab = true
-- Línea documentada: `vim.o.tabstop = 2`.
vim.o.tabstop = 2
-- Línea documentada: `vim.bo.tabstop = 2`.
vim.bo.tabstop = 2
-- Línea documentada: `vim.o.softtabstop = 2`.
vim.o.softtabstop = 2
-- Línea documentada: `vim.o.shiftwidth = 2`.
vim.o.shiftwidth = 2
-- Línea documentada: `vim.bo.shiftwidth = 2`.
vim.bo.shiftwidth = 2
-- Línea documentada: `vim.o.autoindent = true`.
vim.o.autoindent = true
-- Línea documentada: `vim.bo.autoindent = true`.
vim.bo.autoindent = true
-- Línea documentada: `vim.o.breakindent = true`.
vim.o.breakindent = true

-- Color and visual settings
-- Línea documentada: `vim.opt.termguicolors = true`.
vim.opt.termguicolors = true
-- Línea documentada: `vim.o.background = 'dark'`.
vim.o.background = 'dark'
-- Línea documentada: `vim.o.cursorline = true`.
vim.o.cursorline = true
-- Línea documentada: `vim.o.conceallevel = 0`.
vim.o.conceallevel = 0
-- Línea documentada: `vim.opt_local.conceallevel = 2`.
vim.opt_local.conceallevel = 2

-- Line numbers settings
-- Línea documentada: `vim.wo.number = true`.
vim.wo.number = true
-- Línea documentada: `vim.o.relativenumber = true`.
vim.o.relativenumber = true

-- Scroll margins settings
-- Línea documentada: `vim.o.scrolloff = 3`.
vim.o.scrolloff = 3
-- Línea documentada: `vim.o.sidescrolloff = 5`.
vim.o.sidescrolloff = 5

-- Signs column settings
-- Línea documentada: `vim.wo.signcolumn = "yes"`.
vim.wo.signcolumn = "yes"

-- Line wrap settings
-- Línea documentada: `vim.wo.wrap = BlindReturn(true, false)`.
vim.wo.wrap = BlindReturn(true, false)

-- Window split settings
-- Línea documentada: `vim.o.splitbelow = true`.
vim.o.splitbelow = true
-- Línea documentada: `vim.o.splitright = BlindReturn(false, true)`.
vim.o.splitright = BlindReturn(false, true)

-- Command line height settings
-- Línea documentada: `vim.o.cmdheight = 0`.
vim.o.cmdheight = 0

-- Tab line settings
-- Línea documentada: `vim.o.showtabline = 2`.
vim.o.showtabline = 2

-- Messages and modes settings
-- Línea documentada: `vim.o.showmode = false`.
vim.o.showmode = false
-- Línea documentada: `vim.opt.shortmess:append "c"`.
vim.opt.shortmess:append "c"

-- Search settings
-- Línea documentada: `vim.o.ignorecase = true`.
vim.o.ignorecase = true
-- Línea documentada: `vim.o.smartcase = true`.
vim.o.smartcase = true
-- Línea documentada: `vim.o.hlsearch = false`.
vim.o.hlsearch = false

-- Cursor movement settings when reaching line ends
-- Línea documentada: `vim.o.whichwrap = 'b,s,<,>,[,],h,l'`.
vim.o.whichwrap = 'b,s,<,>,[,],h,l'

-- Suggestions and completions settings
-- Línea documentada: `vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" }`.
vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" }
-- Línea documentada: `vim.o.pumheight = 10`.
vim.o.pumheight = 10

-- File handling settings
-- Línea documentada: `vim.o.hidden = true`.
vim.o.hidden = true
-- Línea documentada: `vim.o.undofile = true`.
vim.o.undofile = true
-- Línea documentada: `vim.o.backup = false`.
vim.o.backup = false
-- Línea documentada: `vim.o.writebackup = false`.
vim.o.writebackup = false

-- Times of refresh settings
-- Línea documentada: `vim.o.updatetime = 300`.
vim.o.updatetime = 300
-- Línea documentada: `vim.o.timeoutlen = 100`.
vim.o.timeoutlen = 100

-- Diagnostic settings (LSP)
-- Línea documentada: `vim.diagnostic.config({ virtual_lines = false })`.
vim.diagnostic.config({ virtual_lines = false })

-- Visual Multi settings (specific plugin setting)
-- Línea documentada: `vim.g.VM_default_mappings = 0`.
vim.g.VM_default_mappings = 0

-- Feedback Visual: Highlight what you copy (Yank Highlight)
-- Línea documentada: `local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })`.
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
-- Línea documentada: `vim.api.nvim_create_autocmd('TextYankPost', {`.
vim.api.nvim_create_autocmd('TextYankPost', {
-- Línea documentada: `callback = function()`.
  callback = function()
-- Línea documentada: `vim.highlight.on_yank()`.
    vim.highlight.on_yank()
-- Línea documentada: `end,`.
  end,
-- Línea documentada: `group = highlight_group,`.
  group = highlight_group,
-- Línea documentada: `pattern = '*',`.
  pattern = '*',
-- Línea documentada: `})`.
})