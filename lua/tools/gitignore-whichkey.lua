-- Which-key entries for gitignore.nvim.

local M = {}

function M.setup()
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>ugi', '<cmd>Gitignore<cr>', desc = 'Generate .gitignore' },
    { '<leader>ugI', '<cmd>Gitignore!<cr>', desc = 'Overwrite .gitignore' },
  })
end

return M
