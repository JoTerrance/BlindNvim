-- Python buffer-local which-key entries.
-- Sigue el mismo patrón de setup y registro que Godot.

local M = {}

local function set_keymaps(desc_prefix)
  local map = function(lhs, rhs, desc, mode)
    vim.keymap.set(mode or 'n', lhs, rhs, {
      buffer = true,
      silent = true,
      desc = desc,
    })
  end

  map('<leader>upvu', ':UVRunFile<CR>', desc_prefix .. ' UV run current file')
  map('<leader>upvs', ':UVRunSelection<CR>', desc_prefix .. ' UV run selection')
  map('<leader>upvs', '<Esc><Cmd>UVRunSelection<CR>', desc_prefix .. ' UV run selection', 'v')
  map('<leader>upvf', ':UVRunFunction<CR>', desc_prefix .. ' UV run function')
  map('<leader>upvi', ':UVInit<CR>', desc_prefix .. ' UV init project')
  map('<leader>upva', ':UVAutoActivateToggle<CR>', desc_prefix .. ' UV toggle auto-activate')

  map('<leader>updm', "<Cmd>lua require('dap-python').test_method()<CR>", desc_prefix .. ' debug nearest method')
  map('<leader>updc', "<Cmd>lua require('dap-python').test_class()<CR>", desc_prefix .. ' debug class')
  map('<leader>upds', "<Esc><Cmd>lua require('dap-python').debug_selection()<CR>", desc_prefix .. ' debug selection', 'v')

  map('<leader>uppt', ':PuppeteerToggle<CR>', desc_prefix .. ' puppeteer toggle')
  map('<leader>uppe', ':PuppeteerEnable<CR>', desc_prefix .. ' puppeteer enable')
  map('<leader>uppd', ':PuppeteerDisable<CR>', desc_prefix .. ' puppeteer disable')
end

local function register_which_key(desc_prefix)
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>up', group = 'Python' },
    { '<leader>upv', group = 'UV' },
    { '<leader>upvu', desc = desc_prefix .. ' UV run current file' },
    { '<leader>upvs', desc = desc_prefix .. ' UV run selection' },
    { '<leader>upvf', desc = desc_prefix .. ' UV run function' },
    { '<leader>upvi', desc = desc_prefix .. ' UV init project' },
    { '<leader>upva', desc = desc_prefix .. ' UV toggle auto-activate' },
    { '<leader>upd', group = 'Debug' },
    { '<leader>updm', desc = desc_prefix .. ' debug nearest method' },
    { '<leader>updc', desc = desc_prefix .. ' debug class' },
    { '<leader>upp', group = 'Puppeteer' },
    { '<leader>uppt', desc = desc_prefix .. ' puppeteer toggle' },
    { '<leader>uppe', desc = desc_prefix .. ' puppeteer enable' },
    { '<leader>uppd', desc = desc_prefix .. ' puppeteer disable' },
  }, { buffer = 0, mode = 'n' })

  wk.add({
    { '<leader>up', group = 'Python' },
    { '<leader>upv', group = 'UV' },
    { '<leader>upvs', desc = desc_prefix .. ' UV run selection' },
    { '<leader>upd', group = 'Debug' },
    { '<leader>upds', desc = desc_prefix .. ' debug selection' },
  }, { buffer = 0, mode = 'v' })
end

function M.setup(opts)
  opts = opts or {}
  local desc_prefix = opts.desc_prefix or 'Python'

  set_keymaps(desc_prefix)
  register_which_key(desc_prefix)
end

return M
