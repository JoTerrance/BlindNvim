-- Which-key entries for global diagnostic display helpers.

local M = {}

local function register_which_key(desc_prefix)
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>uI', group = desc_prefix },
    { '<leader>uIe', '<cmd>TinyInlineDiag enable<cr>', desc = desc_prefix .. ' enable inline diagnostics' },
    { '<leader>uId', '<cmd>TinyInlineDiag disable<cr>', desc = desc_prefix .. ' disable inline diagnostics' },
    { '<leader>uIt', '<cmd>TinyInlineDiag toggle<cr>', desc = desc_prefix .. ' toggle inline diagnostics' },
    { '<leader>uIc', '<cmd>TinyInlineDiag toggle_cursor_only<cr>', desc = desc_prefix .. ' toggle cursor-only diagnostics' },
    { '<leader>uIr', '<cmd>TinyInlineDiag reset<cr>', desc = desc_prefix .. ' reset inline diagnostics' },
  })
end

function M.setup(opts)
  opts = opts or {}
  local desc_prefix = opts.desc_prefix or 'Diagnostics'

  register_which_key(desc_prefix)
end

return M
