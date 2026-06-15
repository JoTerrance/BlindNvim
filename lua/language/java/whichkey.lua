-- Which-key entries for nvim-jdtls in Java buffers.

local M = {}

local function set_keymaps(desc_prefix)
  -- jdtls extraction commands need normal and visual mappings; imports and tests are normal-only.
  local map = function(lhs, rhs, desc, mode)
    vim.keymap.set(mode or 'n', lhs, rhs, {
      buffer = true,
      silent = true,
      desc = string.format('%s: %s', desc_prefix, desc),
    })
  end

  map('<leader>Ljae', "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", 'extract variable', { 'n', 'v' })
  map('<leader>LjaE', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", 'extract method', { 'n', 'v' })
  map('<leader>Ljci', "<Cmd>lua require('jdtls').organize_imports()<CR>", 'organize imports')
  map('<leader>Ljtn', "<Cmd>lua require('jdtls').test_nearest_method()<CR>", 'test nearest method')
  map('<leader>Ljtc', "<Cmd>lua require('jdtls').test_class()<CR>", 'test class')
end

local function register_which_key(desc_prefix)
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>Lj', group = desc_prefix },
    { '<leader>Lja', group = 'Actions' },
    { '<leader>Ljae', desc = 'Extract variable' },
    { '<leader>LjaE', desc = 'Extract method' },
    { '<leader>Ljc', group = 'Code' },
    { '<leader>Ljci', desc = 'Organize imports' },
    { '<leader>Ljt', group = 'Test' },
    { '<leader>Ljtn', desc = 'Test nearest method' },
    { '<leader>Ljtc', desc = 'Test class' },
  }, { buffer = 0, mode = 'n' })

  wk.add({
    { '<leader>Lj', group = desc_prefix },
    { '<leader>Lja', group = 'Actions' },
    { '<leader>Ljae', desc = 'Extract variable' },
    { '<leader>LjaE', desc = 'Extract method' },
  }, { buffer = 0, mode = 'v' })
end

function M.setup(opts)
  opts = opts or {}
  local desc_prefix = opts.desc_prefix or 'Java'

  set_keymaps(desc_prefix)
  register_which_key(desc_prefix)
end

return M
