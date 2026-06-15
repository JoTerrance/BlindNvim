-- Helper local para uv.nvim.
-- Sigue el mismo patrón de setup y registro que Godot.

local M = {}

local function set_keymaps(desc_prefix)
  local map = function(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, {
      buffer = true,
      silent = true,
      desc = desc,
    })
  end

  map('<leader>upu', ':UVRunFile<CR>', desc_prefix .. ' run current file')
  map('<leader>ups', ':UVRunSelection<CR>', desc_prefix .. ' run selection')
  map('<leader>upf', ':UVRunFunction<CR>', desc_prefix .. ' run function')
  map('<leader>upi', ':UVInit<CR>', desc_prefix .. ' init project')
  map('<leader>upa', ':UVAutoActivateToggle<CR>', desc_prefix .. ' toggle auto-activate')
end

local function register_which_key(desc_prefix)
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>u', group = 'Python' },
    { '<leader>up', group = 'UV' },
    { '<leader>upu', desc = desc_prefix .. ' run current file' },
    { '<leader>ups', desc = desc_prefix .. ' run selection' },
    { '<leader>upf', desc = desc_prefix .. ' run function' },
    { '<leader>upi', desc = desc_prefix .. ' init project' },
    { '<leader>upa', desc = desc_prefix .. ' toggle auto-activate' },
  }, { buffer = 0, mode = 'n' })
end

function M.setup(opts)
  opts = opts or {}
  local desc_prefix = opts.desc_prefix or 'Python UV'

  set_keymaps(desc_prefix)
  register_which_key(desc_prefix)
end

return M
