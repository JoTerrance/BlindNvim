-- Helper local para typescript-tools.nvim.
-- Agrupa acciones TS/JS buffer-local en which-key.

local M = {}

local function set_keymaps()
  local map = function(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, {
      buffer = true,
      silent = true,
      desc = desc,
    })
  end

  map('<leader>tia', ':TSToolsAddMissingImports<CR>', 'Add missing imports')
  map('<leader>tif', ':TSToolsFixAll<CR>', 'Fix all')
  map('<leader>tio', ':TSToolsOrganizeImports<CR>', 'Organize imports')
  map('<leader>tis', ':TSToolsSortImports<CR>', 'Sort imports')
  map('<leader>tiu', ':TSToolsRemoveUnusedImports<CR>', 'Remove unused imports')
  map('<leader>trf', ':TSToolsRenameFile<CR>', 'Rename file')
  map('<leader>tnf', ':TSToolsFileReferences<CR>', 'File references')
  map('<leader>tnd', ':TSToolsGoToSourceDefinition<CR>', 'Source definition')
end

local function register_which_key()
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>t', group = 'TypeScript' },
    { '<leader>ti', group = 'Imports / fixes' },
    { '<leader>tia', desc = 'Add missing imports' },
    { '<leader>tif', desc = 'Fix all' },
    { '<leader>tio', desc = 'Organize imports' },
    { '<leader>tis', desc = 'Sort imports' },
    { '<leader>tiu', desc = 'Remove unused imports' },
    { '<leader>tr', group = 'Refactor' },
    { '<leader>trf', desc = 'Rename file' },
    { '<leader>tn', group = 'Navigate' },
    { '<leader>tnf', desc = 'File references' },
    { '<leader>tnd', desc = 'Source definition' },
  }, { buffer = 0, mode = 'n' })
end

function M.setup()
  set_keymaps()
  register_which_key()
end

return M
