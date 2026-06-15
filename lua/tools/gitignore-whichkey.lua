-- Which-key entries for gitignore.nvim.

local M = {}

local function register_which_key(desc_prefix)
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>ugi', '<cmd>Gitignore<cr>', desc = desc_prefix .. ' generate .gitignore' },
    { '<leader>ugI', '<cmd>Gitignore!<cr>', desc = desc_prefix .. ' overwrite .gitignore' },
  })
end

function M.setup(opts)
  opts = opts or {}
  local desc_prefix = opts.desc_prefix or 'Gitignore'

  register_which_key(desc_prefix)
end

return M
