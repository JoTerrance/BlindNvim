-- Which-key entries for global diagnostic display helpers.

local M = {}
local registered = false

local function safe_require(name)
  local ok, mod = pcall(require, name)
  if not ok then
    return nil
  end

  return mod
end

local unpack_fn = table.unpack or unpack

local function register_which_key(desc_prefix)
  if registered then
    return
  end

  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  local function diagflow_action(method, ...)
    local args = { ... }
    return function()
      local diagflow = safe_require('ui.diagflow-config')
      if diagflow and type(diagflow[method]) == 'function' then
        diagflow[method](unpack_fn(args))
      end
    end
  end

  wk.add({
    { '<leader>tI', group = desc_prefix },
    { '<leader>tIe', '<cmd>TinyInlineDiag enable<cr>', desc = desc_prefix .. ' enable inline diagnostics' },
    { '<leader>tId', '<cmd>TinyInlineDiag disable<cr>', desc = desc_prefix .. ' disable inline diagnostics' },
    { '<leader>tIt', '<cmd>TinyInlineDiag toggle<cr>', desc = desc_prefix .. ' toggle inline diagnostics' },
    { '<leader>tIc', '<cmd>TinyInlineDiag toggle_cursor_only<cr>', desc = desc_prefix .. ' toggle cursor-only diagnostics' },
    { '<leader>tIr', '<cmd>TinyInlineDiag reset<cr>', desc = desc_prefix .. ' reset inline diagnostics' },
    { '<leader>tIF', group = 'Diagflow' },
    { '<leader>tIFe', diagflow_action('enable'), desc = 'Enable floating diagnostics' },
    { '<leader>tIFd', diagflow_action('disable'), desc = 'Disable floating diagnostics' },
    { '<leader>tIFt', diagflow_action('toggle'), desc = 'Toggle floating diagnostics' },
    { '<leader>tIFc', diagflow_action('set_scope', 'cursor'), desc = 'Cursor scope' },
    { '<leader>tIFl', diagflow_action('set_scope', 'line'), desc = 'Line scope' },
    { '<leader>tIFs', diagflow_action('toggle_scope'), desc = 'Toggle scope' },
  })
  registered = true
end

function M.setup(opts)
  opts = opts or {}
  local desc_prefix = opts.desc_prefix or 'Diagnostics'

  register_which_key(desc_prefix)
end

return M
