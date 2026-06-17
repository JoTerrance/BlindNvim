-- Which-key entries for Neogen in code buffers.

local M = {}

local function map(lhs, rhs, desc, mode)
  vim.keymap.set(mode or 'n', lhs, rhs, {
    buffer = true,
    silent = true,
    desc = desc,
  })
end

local function register_which_key(desc_prefix)
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>eN', group = desc_prefix },
    { '<leader>eNg', desc = desc_prefix .. ' generate docs' },
    { '<leader>eNf', desc = desc_prefix .. ' generate function docs' },
  }, { buffer = 0, mode = 'n' })
end

function M.setup(opts)
  opts = opts or {}
  local desc_prefix = opts.desc_prefix or 'Neogen'

  map('<leader>eNg', '<cmd>Neogen<cr>', desc_prefix .. ' generate docs')
  map('<leader>eNf', '<cmd>Neogen func<cr>', desc_prefix .. ' generate function docs')

  register_which_key(desc_prefix)
end

return M
