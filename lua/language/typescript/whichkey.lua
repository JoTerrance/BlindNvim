-- Helper local para typescript-tools.nvim.
-- Sigue el mismo patrón de setup y registro que Godot.

local M = {}

local function set_keymaps(desc_prefix)
  local map = function(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, {
      buffer = true,
      silent = true,
      desc = desc,
    })
  end

  -- Keep imports/fixes separate from navigation so which-key remains scannable.
  map('<leader>tia', ':TSToolsAddMissingImports<CR>', desc_prefix .. ' add missing imports')
  map('<leader>tif', ':TSToolsFixAll<CR>', desc_prefix .. ' fix all')
  map('<leader>tio', ':TSToolsOrganizeImports<CR>', desc_prefix .. ' organize imports')
  map('<leader>tis', ':TSToolsSortImports<CR>', desc_prefix .. ' sort imports')
  map('<leader>tiu', ':TSToolsRemoveUnusedImports<CR>', desc_prefix .. ' remove unused imports')
  map('<leader>trf', ':TSToolsRenameFile<CR>', desc_prefix .. ' rename file')
  map('<leader>tnf', ':TSToolsFileReferences<CR>', desc_prefix .. ' file references')
  map('<leader>tnd', ':TSToolsGoToSourceDefinition<CR>', desc_prefix .. ' source definition')
end

local function register_which_key(desc_prefix)
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>t', group = 'TypeScript' },
    { '<leader>ti', group = 'Imports / fixes' },
    { '<leader>tia', desc = desc_prefix .. ' add missing imports' },
    { '<leader>tif', desc = desc_prefix .. ' fix all' },
    { '<leader>tio', desc = desc_prefix .. ' organize imports' },
    { '<leader>tis', desc = desc_prefix .. ' sort imports' },
    { '<leader>tiu', desc = desc_prefix .. ' remove unused imports' },
    { '<leader>tr', group = 'Refactor' },
    { '<leader>trf', desc = desc_prefix .. ' rename file' },
    { '<leader>tn', group = 'Navigate' },
    { '<leader>tnf', desc = desc_prefix .. ' file references' },
    { '<leader>tnd', desc = desc_prefix .. ' source definition' },
  }, { buffer = 0, mode = 'n' })
end

function M.setup(opts)
  opts = opts or {}
  local desc_prefix = opts.desc_prefix or 'TypeScript'

  set_keymaps(desc_prefix)
  register_which_key(desc_prefix)
end

return M
