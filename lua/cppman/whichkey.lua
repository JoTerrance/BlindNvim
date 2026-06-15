-- Helper local para cppman.
-- Añade atajos buffer-local y entradas which-key para C/C++.

local M = {}

local function set_keymaps()
  local map = function(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, {
      buffer = true,
      silent = true,
      desc = desc,
    })
  end

  map('<leader>cm', ':CPPMan<CR>', 'Open cppman search')
  map('<leader>cM', function()
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
    { '<leader>cm', desc = 'Open cppman search' },
    { '<leader>cM', desc = 'Search cppman' },
  }, { buffer = 0, mode = 'n' })
end

function M.setup()
  set_keymaps()
  register_which_key()
end

return M
