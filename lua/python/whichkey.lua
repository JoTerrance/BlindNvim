-- Helper local para uv.nvim.
-- Añade atajos buffer-local y entradas which-key para proyectos Python.

local M = {}

local function set_keymaps()
  local map = function(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, {
      buffer = true,
      silent = true,
      desc = desc,
    })
  end

  map('<leader>up', ':UVRunFile<CR>', 'Run current file')
  map('<leader>us', ':UVRunSelection<CR>', 'Run selection')
  map('<leader>uf', ':UVRunFunction<CR>', 'Run function')
  map('<leader>ui', ':UVInit<CR>', 'Init project')
  map('<leader>ua', ':UVAutoActivateToggle<CR>', 'Toggle auto-activate')
end

local function register_which_key()
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>u', group = 'Python UV' },
    { '<leader>up', desc = 'Run current file' },
    { '<leader>us', desc = 'Run selection' },
    { '<leader>uf', desc = 'Run function' },
    { '<leader>ui', desc = 'Init project' },
    { '<leader>ua', desc = 'Toggle auto-activate' },
  }, { buffer = 0, mode = 'n' })
end

function M.setup()
  set_keymaps()
  register_which_key()
end

return M
