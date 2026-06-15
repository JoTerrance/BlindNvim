-- Helper local para cppman.
-- Agrupa accesos C/C++ en which-key y mantiene atajos buffer-local.

local M = {}

local function set_keymaps()
  local map = function(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, {
      buffer = true,
      silent = true,
      desc = desc,
    })
  end

  map('<leader>ccm', ':CPPMan<CR>', 'Open cppman search')
  map('<leader>ccM', function()
    require('cppman').search()
  end, 'Search cppman')
end

local function register_which_key()
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>c', group = 'C / C++' },
    { '<leader>cc', group = 'cppman' },
    { '<leader>ccm', desc = 'Open cppman search' },
    { '<leader>ccM', desc = 'Search cppman' },
  }, { buffer = 0, mode = 'n' })
end

function M.setup()
  set_keymaps()
  register_which_key()
end

return M
