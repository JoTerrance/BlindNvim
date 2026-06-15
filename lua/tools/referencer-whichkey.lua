-- Which-key entries for referencer.nvim.

local M = {}

function M.setup()
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>ur', group = 'References' },
    { '<leader>urt', '<cmd>ReferencerToggle<cr>', desc = 'Toggle inline references' },
    { '<leader>uru', '<cmd>ReferencerUpdate<cr>', desc = 'Update inline references' },
  })
end

return M
