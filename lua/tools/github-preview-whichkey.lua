-- Which-key entries for github-preview.nvim in Markdown buffers.

local M = {}

local function call(fn)
  return function()
    require('github-preview').fns[fn]()
  end
end

function M.setup()
  local map = function(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, {
      buffer = true,
      silent = true,
      desc = desc,
    })
  end

  map('<leader>mpT', call('toggle'), 'Toggle preview')
  map('<leader>mpS', call('single_file_toggle'), 'Toggle single-file mode')
  map('<leader>mpD', call('details_tags_toggle'), 'Toggle details tags')

  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>m', group = 'Markdown' },
    { '<leader>mp', group = 'GitHub preview' },
    { '<leader>mpT', desc = 'Toggle preview' },
    { '<leader>mpS', desc = 'Toggle single-file mode' },
    { '<leader>mpD', desc = 'Toggle details tags' },
  }, { buffer = 0, mode = 'n' })
end

return M
