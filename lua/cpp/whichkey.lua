-- Helper local para herramientas C/C++.
-- Agrupa cppman, clangd_extensions y godbolt en which-key.

local M = {}

local function map(lhs, rhs, desc, mode)
  vim.keymap.set(mode or 'n', lhs, rhs, {
    buffer = true,
    silent = true,
    desc = desc,
  })
end

local function setup_cppman()
  map('<leader>ccm', ':CPPMan<CR>', 'Open cppman search')
  map('<leader>ccM', function()
    require('cppman').search()
  end, 'Search cppman')
end

local function setup_clangd_extensions()
  map('<leader>cxa', ':ClangdAST<CR>', 'AST')
  map('<leader>cxh', ':ClangdSwitchSourceHeader<CR>', 'Switch source/header')
  map('<leader>cxi', ':ClangdSymbolInfo<CR>', 'Symbol info')
  map('<leader>cxm', ':ClangdMemoryUsage<CR>', 'Memory usage')
  map('<leader>cxt', ':ClangdTypeHierarchy<CR>', 'Type hierarchy')
end

local function setup_godbolt()
  map('<leader>cga', ':Godbolt<CR>', 'Assembly')
  map('<leader>cgA', ':Godbolt!<CR>', 'Assembly reuse window')
  map('<leader>cgc', ':GodboltCompiler telescope<CR>', 'Choose compiler')
  map('<leader>cga', ':Godbolt<CR>', 'Assembly', 'v')
  map('<leader>cgc', ':GodboltCompiler telescope<CR>', 'Choose compiler', 'v')
end

local function register_which_key(opts)
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  local items = {
    { '<leader>c', group = 'C / C++' },
    { '<leader>cx', group = 'clangd extensions' },
    { '<leader>cxa', desc = 'AST' },
    { '<leader>cxh', desc = 'Switch source/header' },
    { '<leader>cxi', desc = 'Symbol info' },
    { '<leader>cxm', desc = 'Memory usage' },
    { '<leader>cxt', desc = 'Type hierarchy' },
    { '<leader>cg', group = 'Godbolt' },
    { '<leader>cga', desc = 'Assembly' },
    { '<leader>cgA', desc = 'Assembly reuse window' },
    { '<leader>cgc', desc = 'Choose compiler' },
  }

  if opts.cppman then
    vim.list_extend(items, {
      { '<leader>cc', group = 'cppman' },
      { '<leader>ccm', desc = 'Open cppman search' },
      { '<leader>ccM', desc = 'Search cppman' },
    })
  end

  wk.add(items, { buffer = 0, mode = 'n' })
  wk.add({
    { '<leader>cg', group = 'Godbolt' },
    { '<leader>cga', desc = 'Assembly' },
    { '<leader>cgc', desc = 'Choose compiler' },
  }, { buffer = 0, mode = 'v' })
end

function M.setup(opts)
  opts = opts or {}
  if opts.cppman then
    setup_cppman()
  end
  setup_clangd_extensions()
  setup_godbolt()
  register_which_key(opts)
end

return M
