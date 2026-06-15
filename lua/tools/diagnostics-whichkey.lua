-- Which-key entries for global diagnostic display helpers.

local M = {}

function M.setup()
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>ud', group = 'Diagnostics' },
    { '<leader>ude', '<cmd>TinyInlineDiag enable<cr>', desc = 'Enable inline diagnostics' },
    { '<leader>udd', '<cmd>TinyInlineDiag disable<cr>', desc = 'Disable inline diagnostics' },
    { '<leader>udt', '<cmd>TinyInlineDiag toggle<cr>', desc = 'Toggle inline diagnostics' },
    { '<leader>udc', '<cmd>TinyInlineDiag toggle_cursor_only<cr>', desc = 'Toggle cursor-only diagnostics' },
    { '<leader>udr', '<cmd>TinyInlineDiag reset<cr>', desc = 'Reset inline diagnostics' },
  })
end

return M
