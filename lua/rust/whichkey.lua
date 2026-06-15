-- Helper local para rustaceanvim.
-- Organiza acciones Rust en subgrupos which-key y mantiene atajos buffer-local.

local M = {}

local function set_keymaps()
  local map = function(lhs, rhs, desc, mode)
    vim.keymap.set(mode or 'n', lhs, rhs, {
      buffer = true,
      silent = true,
      desc = desc,
    })
  end

  -- Actions
  map('<leader>rac', ':RustLsp codeAction<CR>', 'Code action')
  map('<leader>rah', ':RustLsp hover actions<CR>', 'Hover actions')
  map('<leader>raH', ':RustLsp hover range<CR>', 'Hover range')
  map('<leader>rax', ':RustLsp ssr<CR>', 'Structural search replace', { 'n', 'v' })

  -- Run
  map('<leader>rrr', ':RustLsp runnables<CR>', 'Runnables')
  map('<leader>rrt', ':RustLsp testables<CR>', 'Testables')
  map('<leader>rrd', ':RustLsp debuggables<CR>', 'Debuggables')
  map('<leader>rrf', ':RustLsp flyCheck<CR>', 'Fly check')

  -- Navigate
  map('<leader>rno', ':RustLsp openDocs<CR>', 'Open docs.rs')
  map('<leader>rnC', ':RustLsp openCargo<CR>', 'Open Cargo.toml')
  map('<leader>rnT', ':RustLsp relatedTests<CR>', 'Related tests')

  -- View
  map('<leader>rvg', ':RustLsp crateGraph<CR>', 'Crate graph')
  map('<leader>rvh', ':RustLsp view hir<CR>', 'View HIR')
  map('<leader>rvs', ':RustLsp syntaxTree<CR>', 'Syntax tree')
  map('<leader>rvb', ':Godbolt<CR>', 'Godbolt assembly')
  map('<leader>rvB', ':Godbolt!<CR>', 'Godbolt assembly reuse window')
  map('<leader>rvc', ':GodboltCompiler telescope<CR>', 'Godbolt choose compiler')
  map('<leader>rvb', ':Godbolt<CR>', 'Godbolt assembly', 'v')
  map('<leader>rvc', ':GodboltCompiler telescope<CR>', 'Godbolt choose compiler', 'v')
end

local function register_which_key()
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>r', group = 'Rust' },
    { '<leader>ra', group = 'Actions' },
    { '<leader>rac', desc = 'Code action' },
    { '<leader>rah', desc = 'Hover actions' },
    { '<leader>raH', desc = 'Hover range' },
    { '<leader>rax', desc = 'Structural search replace' },
    { '<leader>rr', group = 'Run' },
    { '<leader>rrr', desc = 'Runnables' },
    { '<leader>rrt', desc = 'Testables' },
    { '<leader>rrd', desc = 'Debuggables' },
    { '<leader>rrf', desc = 'Fly check' },
    { '<leader>rn', group = 'Navigate' },
    { '<leader>rno', desc = 'Open docs.rs' },
    { '<leader>rnC', desc = 'Open Cargo.toml' },
    { '<leader>rnT', desc = 'Related tests' },
    { '<leader>rv', group = 'View' },
    { '<leader>rvg', desc = 'Crate graph' },
    { '<leader>rvh', desc = 'View HIR' },
    { '<leader>rvs', desc = 'Syntax tree' },
    { '<leader>rvb', desc = 'Godbolt assembly' },
    { '<leader>rvB', desc = 'Godbolt assembly reuse window' },
    { '<leader>rvc', desc = 'Godbolt choose compiler' },
  }, { buffer = 0, mode = 'n' })

  wk.add({
    { '<leader>rax', desc = 'Structural search replace' },
    { '<leader>rvb', desc = 'Godbolt assembly' },
    { '<leader>rvc', desc = 'Godbolt choose compiler' },
  }, { buffer = 0, mode = 'v' })
end

function M.setup()
  set_keymaps()
  register_which_key()
end

return M
