-- Which-key entries for splitjoin.nvim.

local M = {}

local function register_which_key(desc_prefix)
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>eJ', group = desc_prefix },
    { '<leader>eJt', function() require('splitjoin').toggle() end, desc = desc_prefix .. ' toggle split/join' },
    { '<leader>eJs', '<Plug>(SplitjoinSplit)', desc = desc_prefix .. ' split construct' },
    { '<leader>eJj', '<Plug>(SplitjoinJoin)', desc = desc_prefix .. ' join construct' },
  }, { buffer = 0, mode = 'n' })

  wk.add({
    { '<leader>eJ', group = desc_prefix },
    { '<leader>eJt', function() require('splitjoin').toggle() end, desc = desc_prefix .. ' toggle split/join' },
  }, { buffer = 0, mode = 'v' })
end

function M.setup(opts)
  opts = opts or {}
  local desc_prefix = opts.desc_prefix or 'Split/Join'

  register_which_key(desc_prefix)
end

return M
