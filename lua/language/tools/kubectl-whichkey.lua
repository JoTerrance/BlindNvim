-- Which-key entries for kubectl.nvim.

local M = {}

local function register_which_key(desc_prefix)
  -- These are global tool commands, but which-key registration is still isolated here.
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>uK', group = desc_prefix },
    { '<leader>uKt', function() require('kubectl').toggle({ tab = false }) end, desc = desc_prefix .. ' toggle' },
    { '<leader>uKT', function() require('kubectl').toggle({ tab = true }) end, desc = desc_prefix .. ' toggle tab' },
    { '<leader>uKm', '<cmd>Kubectl<cr>', desc = desc_prefix .. ' main menu' },
    { '<leader>uKv', '<cmd>Kubectl view<cr>', desc = desc_prefix .. ' view resource' },
    { '<leader>uKx', '<cmd>Kubectx<cr>', desc = desc_prefix .. ' context' },
    { '<leader>uKn', '<cmd>Kubens<cr>', desc = desc_prefix .. ' namespace' },
    { '<leader>uKd', '<cmd>Kubectl diff<cr>', desc = desc_prefix .. ' diff' },
    { '<leader>uKo', '<cmd>Kubectl top<cr>', desc = desc_prefix .. ' top' },
  })
end

function M.setup(opts)
  opts = opts or {}
  local desc_prefix = opts.desc_prefix or 'Kubectl'

  register_which_key(desc_prefix)
end

return M
