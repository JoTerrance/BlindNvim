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
  map('<leader>Ltia', ':TSToolsAddMissingImports<CR>', desc_prefix .. ' add missing imports')
  map('<leader>Ltif', ':TSToolsFixAll<CR>', desc_prefix .. ' fix all')
  map('<leader>Ltio', ':TSToolsOrganizeImports<CR>', desc_prefix .. ' organize imports')
  map('<leader>Ltis', ':TSToolsSortImports<CR>', desc_prefix .. ' sort imports')
  map('<leader>Ltiu', ':TSToolsRemoveUnusedImports<CR>', desc_prefix .. ' remove unused imports')
  map('<leader>Ltrf', ':TSToolsRenameFile<CR>', desc_prefix .. ' rename file')
  map('<leader>Ltnf', ':TSToolsFileReferences<CR>', desc_prefix .. ' file references')
  map('<leader>Ltnd', ':TSToolsGoToSourceDefinition<CR>', desc_prefix .. ' source definition')
end

local function register_which_key(desc_prefix)
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>Lt', group = 'TypeScript' },
    { '<leader>Lti', group = 'Imports / fixes' },
    { '<leader>Ltia', desc = desc_prefix .. ' add missing imports' },
    { '<leader>Ltif', desc = desc_prefix .. ' fix all' },
    { '<leader>Ltio', desc = desc_prefix .. ' organize imports' },
    { '<leader>Ltis', desc = desc_prefix .. ' sort imports' },
    { '<leader>Ltiu', desc = desc_prefix .. ' remove unused imports' },
    { '<leader>Ltr', group = 'Refactor' },
    { '<leader>Ltrf', desc = desc_prefix .. ' rename file' },
    { '<leader>Ltn', group = 'Navigate' },
    { '<leader>Ltnf', desc = desc_prefix .. ' file references' },
    { '<leader>Ltnd', desc = desc_prefix .. ' source definition' },
  }, { buffer = 0, mode = 'n' })
end

function M.setup(opts)
  opts = opts or {}
  local desc_prefix = opts.desc_prefix or 'TypeScript'

  set_keymaps(desc_prefix)
  register_which_key(desc_prefix)
end

return M
