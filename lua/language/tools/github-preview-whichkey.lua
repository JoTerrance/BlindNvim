-- Which-key entries for github-preview.nvim in Markdown buffers.

local M = {}

local function call(fn)
  return function()
    require('github-preview').fns[fn]()
  end
end

local function set_keymaps(desc_prefix)
  -- GitHub Preview exposes Lua functions rather than commands, so wrap calls for keymaps.
  local map = function(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, {
      buffer = true,
      silent = true,
      desc = desc,
    })
  end

  map('<leader>LmpT', call('toggle'), desc_prefix .. ' toggle preview')
  map('<leader>LmpS', call('single_file_toggle'), desc_prefix .. ' toggle single-file mode')
  map('<leader>LmpD', call('details_tags_toggle'), desc_prefix .. ' toggle details tags')
end

local function register_which_key(desc_prefix)
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>Lm', group = 'Markdown' },
    { '<leader>Lmp', group = desc_prefix },
    { '<leader>LmpT', desc = desc_prefix .. ' toggle preview' },
    { '<leader>LmpS', desc = desc_prefix .. ' toggle single-file mode' },
    { '<leader>LmpD', desc = desc_prefix .. ' toggle details tags' },
  }, { buffer = 0, mode = 'n' })
end

function M.setup(opts)
  opts = opts or {}
  local desc_prefix = opts.desc_prefix or 'GitHub preview'

  set_keymaps(desc_prefix)
  register_which_key(desc_prefix)
end

return M
