-- Helper compartido para filetypes de Godot.
-- Centraliza atajos buffer-local y, si which-key está disponible, los registra.

local M = {}

local function set_keymaps(desc_prefix)
  local map = function(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, {
      buffer = true,
      silent = true,
      desc = desc,
    })
  end

  map('<leader>gdpr', ':GodotRun<CR>', desc_prefix .. ' run project')
  map('<leader>gdpl', ':GodotRunLast<CR>', desc_prefix .. ' run last scene')
  map('<leader>gdps', ':GodotStart<CR>', desc_prefix .. ' start editor')
end

local function register_which_key(desc_prefix)
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>gd', group = 'Godot' },
    { '<leader>gdp', group = 'Project' },
    { '<leader>gdpr', desc_prefix .. ' run project' },
    { '<leader>gdpl', desc_prefix .. ' run last scene' },
    { '<leader>gdps', desc_prefix .. ' start editor' },
  }, { buffer = 0, mode = 'n' })
end

function M.setup(opts)
  opts = opts or {}
  local commentstring = opts.commentstring or '// %s'
  local desc_prefix = opts.desc_prefix or 'Godot'

  vim.bo.commentstring = commentstring
  set_keymaps(desc_prefix)
  register_which_key(desc_prefix)
end

return M
