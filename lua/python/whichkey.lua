-- Helper local para uv.nvim.
-- Agrupa accesos Python UV en which-key y mantiene atajos buffer-local.

local M = {}

local function set_keymaps()
  local map = function(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, {
      buffer = true,
      silent = true,
      desc = desc,
    })
  end

  map('<leader>upu', ':UVRunFile<CR>', 'Run current file')
  map('<leader>ups', ':UVRunSelection<CR>', 'Run selection')
  map('<leader>upf', ':UVRunFunction<CR>', 'Run function')
  map('<leader>upi', ':UVInit<CR>', 'Init project')
  map('<leader>upa', ':UVAutoActivateToggle<CR>', 'Toggle auto-activate')
end

local function register_which_key()
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>u', group = 'Python' },
    { '<leader>up', group = 'UV' },
    { '<leader>upu', desc = 'Run current file' },
    { '<leader>ups', desc = 'Run selection' },
    { '<leader>upf', desc = 'Run function' },
    { '<leader>upi', desc = 'Init project' },
    { '<leader>upa', desc = 'Toggle auto-activate' },
  }, { buffer = 0, mode = 'n' })
end

function M.setup()
  set_keymaps()
  register_which_key()
end

return M
