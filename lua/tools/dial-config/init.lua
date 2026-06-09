-- Documentación: módulo `lua/tools/dial-config/init.lua`.
-- Propósito: define utilidades y herramientas de edición dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `local augend = require("dial.augend")`.
local augend = require("dial.augend")
-- Línea documentada: `require("dial.config").augends:register_group{`.
require("dial.config").augends:register_group{
-- Línea documentada: `default = {`.
  default = {
-- Línea documentada: `augend.integer.alias.decimal,`.
    augend.integer.alias.decimal,
-- Línea documentada: `augend.integer.alias.hex,`.
    augend.integer.alias.hex,
-- Línea documentada: `augend.constant.alias.bool,`.
    augend.constant.alias.bool,
-- Línea documentada: `augend.date.alias["%d/%m/%Y"],`.
    augend.date.alias["%d/%m/%Y"],
--    augend.date.alias["%d-%m-%Y"],
--    augend.constant.alias.ja_weekday_full,
-- Línea documentada: `},`.
  },
-- Línea documentada: `typescript = {`.
  typescript = {
-- Línea documentada: `augend.integer.alias.decimal,`.
    augend.integer.alias.decimal,
-- Línea documentada: `augend.integer.alias.hex,`.
    augend.integer.alias.hex,
-- Línea documentada: `augend.constant.new{ elements = {"let", "const"} },`.
    augend.constant.new{ elements = {"let", "const"} },
-- Línea documentada: `},`.
  },
-- Línea documentada: `visual = {`.
  visual = {
-- Línea documentada: `augend.integer.alias.decimal,`.
    augend.integer.alias.decimal,
-- Línea documentada: `augend.integer.alias.hex,`.
    augend.integer.alias.hex,
-- Línea documentada: `augend.date.alias["%Y/%m/%d"],`.
    augend.date.alias["%Y/%m/%d"],
-- Línea documentada: `augend.constant.alias.alpha,`.
    augend.constant.alias.alpha,
-- Línea documentada: `augend.constant.alias.Alpha,`.
    augend.constant.alias.Alpha,
-- Línea documentada: `},`.
  },
-- Línea documentada: `}`.
}

-- Línea documentada: `local map = vim.api.nvim_set_keymap`.
local map = vim.api.nvim_set_keymap
-- Línea documentada: `map("n", "<C-a>", "<cmd>:DialIncrement<CR>", {noremap = true})`.
map("n", "<C-a>", "<cmd>:DialIncrement<CR>", {noremap = true})
-- Línea documentada: `map("n", "<C-x>", "<cmd>:DialDecrement<CR>", {noremap = true})`.
map("n", "<C-x>", "<cmd>:DialDecrement<CR>", {noremap = true})
-- Línea documentada: `map("v", "<C-a>", "<cmd>:DialIncrement<CR>", {noremap = true})`.
map("v", "<C-a>", "<cmd>:DialIncrement<CR>", {noremap = true})
-- Línea documentada: `map("v", "<C-x>", "<cmd>:DialDecrement<CR>", {noremap = true})`.
map("v", "<C-x>", "<cmd>:DialDecrement<CR>", {noremap = true})
-- Línea documentada: `map("v", "g<C-a>", "<cmd>:DialIncrement<CR>", {noremap = true})`.
map("v", "g<C-a>", "<cmd>:DialIncrement<CR>", {noremap = true})
-- Línea documentada: `map("v", "g<C-x>", "<cmd>:DialDecrement<CR>", {noremap = true})`.
map("v", "g<C-x>", "<cmd>:DialDecrement<CR>", {noremap = true})
