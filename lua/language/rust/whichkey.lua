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

  -- RustLsp exposes many commands, so the map tree mirrors task categories.
  map('<leader>Lrac', ':RustLsp codeAction<CR>', 'Code action')
  map('<leader>Lrah', ':RustLsp hover actions<CR>', 'Hover actions')
  map('<leader>LraH', ':RustLsp hover range<CR>', 'Hover range')
  map('<leader>Lrax', ':RustLsp ssr<CR>', 'Structural search replace', { 'n', 'v' })

  -- Run
  map('<leader>Lrrr', ':RustLsp runnables<CR>', 'Runnables')
  map('<leader>Lrrt', ':RustLsp testables<CR>', 'Testables')
  map('<leader>Lrrd', ':RustLsp debuggables<CR>', 'Debuggables')
  map('<leader>Lrrf', ':RustLsp flyCheck<CR>', 'Fly check')

  -- Navigate
  map('<leader>Lrno', ':RustLsp openDocs<CR>', 'Open docs.rs')
  map('<leader>LrnC', ':RustLsp openCargo<CR>', 'Open Cargo.toml')
  map('<leader>LrnT', ':RustLsp relatedTests<CR>', 'Related tests')

  -- View
  map('<leader>Lrvg', ':RustLsp crateGraph<CR>', 'Crate graph')
  map('<leader>Lrvh', ':RustLsp view hir<CR>', 'View HIR')
  map('<leader>Lrvs', ':RustLsp syntaxTree<CR>', 'Syntax tree')
  map('<leader>Lrvb', ':Godbolt<CR>', 'Godbolt assembly')
  map('<leader>LrvB', ':Godbolt!<CR>', 'Godbolt assembly reuse window')
  map('<leader>Lrvc', ':GodboltCompiler telescope<CR>', 'Godbolt choose compiler')
  map('<leader>Lrvb', ':Godbolt<CR>', 'Godbolt assembly', 'v')
  map('<leader>Lrvc', ':GodboltCompiler telescope<CR>', 'Godbolt choose compiler', 'v')
end

local function register_which_key()
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>Lr', group = 'Rust' },
    { '<leader>Lra', group = 'Actions' },
    { '<leader>Lrac', desc = 'Code action' },
    { '<leader>Lrah', desc = 'Hover actions' },
    { '<leader>LraH', desc = 'Hover range' },
    { '<leader>Lrax', desc = 'Structural search replace' },
    { '<leader>Lrr', group = 'Run' },
    { '<leader>Lrrr', desc = 'Runnables' },
    { '<leader>Lrrt', desc = 'Testables' },
    { '<leader>Lrrd', desc = 'Debuggables' },
    { '<leader>Lrrf', desc = 'Fly check' },
    { '<leader>Lrn', group = 'Navigate' },
    { '<leader>Lrno', desc = 'Open docs.rs' },
    { '<leader>LrnC', desc = 'Open Cargo.toml' },
    { '<leader>LrnT', desc = 'Related tests' },
    { '<leader>Lrv', group = 'View' },
    { '<leader>Lrvg', desc = 'Crate graph' },
    { '<leader>Lrvh', desc = 'View HIR' },
    { '<leader>Lrvs', desc = 'Syntax tree' },
    { '<leader>Lrvb', desc = 'Godbolt assembly' },
    { '<leader>LrvB', desc = 'Godbolt assembly reuse window' },
    { '<leader>Lrvc', desc = 'Godbolt choose compiler' },
  }, { buffer = 0, mode = 'n' })

  wk.add({
    { '<leader>Lrax', desc = 'Structural search replace' },
    { '<leader>Lrvb', desc = 'Godbolt assembly' },
    { '<leader>Lrvc', desc = 'Godbolt choose compiler' },
  }, { buffer = 0, mode = 'v' })
end

function M.setup()
  set_keymaps()
  register_which_key()
end

return M
