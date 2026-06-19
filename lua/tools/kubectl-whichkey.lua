-- Which-key entries for kubectl.nvim.

local M = {}

local function register_which_key(desc_prefix)
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>tK', group = desc_prefix },
    { '<leader>tKt', function() require('kubectl').toggle({ tab = false }) end, desc = desc_prefix .. ' toggle' },
    { '<leader>tKT', function() require('kubectl').toggle({ tab = true }) end, desc = desc_prefix .. ' toggle tab' },
    { '<leader>tKm', '<cmd>Kubectl<cr>', desc = desc_prefix .. ' main menu' },
    { '<leader>tKp', '<cmd>Kubectl pods<cr>', desc = desc_prefix .. ' pods' },
    { '<leader>tKs', '<cmd>Kubectl services<cr>', desc = desc_prefix .. ' services' },
    { '<leader>tKd', '<cmd>Kubectl diff<cr>', desc = desc_prefix .. ' diff' },
    { '<leader>tKn', '<cmd>Kubens<cr>', desc = desc_prefix .. ' namespaces' },
    { '<leader>tKD', '<cmd>Kubectl deployments<cr>', desc = desc_prefix .. ' deployments' },
    { '<leader>tKv', '<cmd>Kubectl view<cr>', desc = desc_prefix .. ' view resource' },
    { '<leader>tKx', '<cmd>Kubectx<cr>', desc = desc_prefix .. ' context' },
    { '<leader>tKo', '<cmd>Kubectl top<cr>', desc = desc_prefix .. ' top' },
  })
end

function M.setup(opts)
  opts = opts or {}
  local desc_prefix = opts.desc_prefix or 'Kubectl'

  register_which_key(desc_prefix)
end

return M
