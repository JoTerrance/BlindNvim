-- Which-key entries for referencer.nvim.

local M = {}

local function register_which_key(desc_prefix)
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>ur', group = desc_prefix },
    { '<leader>urt', '<cmd>ReferencerToggle<cr>', desc = desc_prefix .. ' toggle inline references' },
    { '<leader>uru', '<cmd>ReferencerUpdate<cr>', desc = desc_prefix .. ' update inline references' },
  })
end

function M.setup(opts)
  opts = opts or {}
  local desc_prefix = opts.desc_prefix or 'References'

  register_which_key(desc_prefix)
end

return M
