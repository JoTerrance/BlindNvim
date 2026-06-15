-- Which-key entries for kubectl.nvim.

local M = {}

function M.setup()
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<space>uK', group = 'Kubectl' },
    { '<space>uKt', function() require('kubectl').toggle({ tab = false }) end, desc = 'Toggle' },
    { '<space>uKT', function() require('kubectl').toggle({ tab = true }) end, desc = 'Toggle tab' },
    { '<space>uKm', '<cmd>Kubectl<cr>', desc = 'Main menu' },
    { '<space>uKv', '<cmd>Kubectl view<cr>', desc = 'View resource' },
    { '<space>uKx', '<cmd>Kubectx<cr>', desc = 'Context' },
    { '<space>uKn', '<cmd>Kubens<cr>', desc = 'Namespace' },
    { '<space>uKd', '<cmd>Kubectl diff<cr>', desc = 'Diff' },
    { '<space>uKo', '<cmd>Kubectl top<cr>', desc = 'Top' },
  })
end

return M
