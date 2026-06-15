-- Which-key entries for kubectl.nvim.

local M = {}

local function register_which_key(desc_prefix)
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<space>uK', group = desc_prefix },
    { '<space>uKt', function() require('kubectl').toggle({ tab = false }) end, desc = desc_prefix .. ' toggle' },
    { '<space>uKT', function() require('kubectl').toggle({ tab = true }) end, desc = desc_prefix .. ' toggle tab' },
    { '<space>uKm', '<cmd>Kubectl<cr>', desc = desc_prefix .. ' main menu' },
    { '<space>uKv', '<cmd>Kubectl view<cr>', desc = desc_prefix .. ' view resource' },
    { '<space>uKx', '<cmd>Kubectx<cr>', desc = desc_prefix .. ' context' },
    { '<space>uKn', '<cmd>Kubens<cr>', desc = desc_prefix .. ' namespace' },
    { '<space>uKd', '<cmd>Kubectl diff<cr>', desc = desc_prefix .. ' diff' },
    { '<space>uKo', '<cmd>Kubectl top<cr>', desc = desc_prefix .. ' top' },
  })
end

function M.setup(opts)
  opts = opts or {}
  local desc_prefix = opts.desc_prefix or 'Kubectl'

  register_which_key(desc_prefix)
end

return M
