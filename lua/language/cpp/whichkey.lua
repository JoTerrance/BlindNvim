-- Helper local para herramientas C/C++.
-- Sigue el mismo patrón de setup y registro que Godot.

local M = {}

local function set_keymaps(desc_prefix, include_cppman)
  local map = function(lhs, rhs, desc, mode)
    vim.keymap.set(mode or 'n', lhs, rhs, {
      buffer = true,
      silent = true,
      desc = desc,
    })
  end

  if include_cppman then
    map('<leader>ccm', ':CPPMan<CR>', desc_prefix .. ' open cppman search')
    map('<leader>ccM', function()
      require('cppman').search()
    end, desc_prefix .. ' search cppman')
  end

  map('<leader>cxa', ':ClangdAST<CR>', desc_prefix .. ' AST')
  map('<leader>cxh', ':ClangdSwitchSourceHeader<CR>', desc_prefix .. ' switch source/header')
  map('<leader>cxi', ':ClangdSymbolInfo<CR>', desc_prefix .. ' symbol info')
  map('<leader>cxm', ':ClangdMemoryUsage<CR>', desc_prefix .. ' memory usage')
  map('<leader>cxt', ':ClangdTypeHierarchy<CR>', desc_prefix .. ' type hierarchy')
  map('<leader>cga', ':Godbolt<CR>', desc_prefix .. ' assembly')
  map('<leader>cgA', ':Godbolt!<CR>', desc_prefix .. ' assembly reuse window')
  map('<leader>cgc', ':GodboltCompiler telescope<CR>', desc_prefix .. ' choose compiler')
  map('<leader>cga', ':Godbolt<CR>', desc_prefix .. ' assembly', 'v')
  map('<leader>cgc', ':GodboltCompiler telescope<CR>', desc_prefix .. ' choose compiler', 'v')
end

local function register_which_key(desc_prefix, include_cppman)
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  local items = {
    { '<leader>c', group = desc_prefix },
    { '<leader>cx', group = 'clangd extensions' },
    { '<leader>cxa', desc = desc_prefix .. ' AST' },
    { '<leader>cxh', desc = desc_prefix .. ' switch source/header' },
    { '<leader>cxi', desc = desc_prefix .. ' symbol info' },
    { '<leader>cxm', desc = desc_prefix .. ' memory usage' },
    { '<leader>cxt', desc = desc_prefix .. ' type hierarchy' },
    { '<leader>cg', group = 'Godbolt' },
    { '<leader>cga', desc = desc_prefix .. ' assembly' },
    { '<leader>cgA', desc = desc_prefix .. ' assembly reuse window' },
    { '<leader>cgc', desc = desc_prefix .. ' choose compiler' },
  }

  if include_cppman then
    vim.list_extend(items, {
      { '<leader>cc', group = 'cppman' },
      { '<leader>ccm', desc = desc_prefix .. ' open cppman search' },
      { '<leader>ccM', desc = desc_prefix .. ' search cppman' },
    })
  end

  wk.add(items, { buffer = 0, mode = 'n' })
  wk.add({
    { '<leader>cg', group = 'Godbolt' },
    { '<leader>cga', desc = desc_prefix .. ' assembly' },
    { '<leader>cgc', desc = desc_prefix .. ' choose compiler' },
  }, { buffer = 0, mode = 'v' })
end

function M.setup(opts)
  opts = opts or {}
  local desc_prefix = opts.desc_prefix or 'C / C++'
  local include_cppman = opts.cppman == true

  set_keymaps(desc_prefix, include_cppman)
  register_which_key(desc_prefix, include_cppman)
end

return M
