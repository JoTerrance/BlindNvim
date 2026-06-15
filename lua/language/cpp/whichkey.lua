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

  -- cppman is C++-only, while clangd and Godbolt also apply to C buffers.
  if include_cppman then
    map('<leader>Lccm', ':CPPMan<CR>', desc_prefix .. ' open cppman search')
    map('<leader>LccM', function()
      require('cppman').search()
    end, desc_prefix .. ' search cppman')
  end

  map('<leader>Lcxa', ':ClangdAST<CR>', desc_prefix .. ' AST')
  map('<leader>Lcxh', ':ClangdSwitchSourceHeader<CR>', desc_prefix .. ' switch source/header')
  map('<leader>Lcxi', ':ClangdSymbolInfo<CR>', desc_prefix .. ' symbol info')
  map('<leader>Lcxm', ':ClangdMemoryUsage<CR>', desc_prefix .. ' memory usage')
  map('<leader>Lcxt', ':ClangdTypeHierarchy<CR>', desc_prefix .. ' type hierarchy')
  map('<leader>Lcga', ':Godbolt<CR>', desc_prefix .. ' assembly')
  map('<leader>LcgA', ':Godbolt!<CR>', desc_prefix .. ' assembly reuse window')
  map('<leader>Lcgc', ':GodboltCompiler telescope<CR>', desc_prefix .. ' choose compiler')
  map('<leader>Lcga', ':Godbolt<CR>', desc_prefix .. ' assembly', 'v')
  map('<leader>Lcgc', ':GodboltCompiler telescope<CR>', desc_prefix .. ' choose compiler', 'v')
end

local function register_which_key(desc_prefix, include_cppman)
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  -- Build one list so optional C++ entries stay in the same which-key group.
  local items = {
    { '<leader>Lc', group = desc_prefix },
    { '<leader>Lcx', group = 'clangd extensions' },
    { '<leader>Lcxa', desc = desc_prefix .. ' AST' },
    { '<leader>Lcxh', desc = desc_prefix .. ' switch source/header' },
    { '<leader>Lcxi', desc = desc_prefix .. ' symbol info' },
    { '<leader>Lcxm', desc = desc_prefix .. ' memory usage' },
    { '<leader>Lcxt', desc = desc_prefix .. ' type hierarchy' },
    { '<leader>Lcg', group = 'Godbolt' },
    { '<leader>Lcga', desc = desc_prefix .. ' assembly' },
    { '<leader>LcgA', desc = desc_prefix .. ' assembly reuse window' },
    { '<leader>Lcgc', desc = desc_prefix .. ' choose compiler' },
  }

  if include_cppman then
    vim.list_extend(items, {
      { '<leader>Lcc', group = 'cppman' },
      { '<leader>Lccm', desc = desc_prefix .. ' open cppman search' },
      { '<leader>LccM', desc = desc_prefix .. ' search cppman' },
    })
  end

  wk.add(items, { buffer = 0, mode = 'n' })
  wk.add({
    { '<leader>Lcg', group = 'Godbolt' },
    { '<leader>Lcga', desc = desc_prefix .. ' assembly' },
    { '<leader>Lcgc', desc = desc_prefix .. ' choose compiler' },
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
