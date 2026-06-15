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

  map('<leader>Lpvu', ':UVRunFile<CR>', desc_prefix .. ' UV run current file')
  -- Visual mappings use <Esc><Cmd> so Neovim does not prepend a range to plugin commands.
  map('<leader>Lpvs', ':UVRunSelection<CR>', desc_prefix .. ' UV run selection')
  map('<leader>Lpvs', '<Esc><Cmd>UVRunSelection<CR>', desc_prefix .. ' UV run selection', 'v')
  map('<leader>Lpvf', ':UVRunFunction<CR>', desc_prefix .. ' UV run function')
  map('<leader>Lpvi', ':UVInit<CR>', desc_prefix .. ' UV init project')
  map('<leader>Lpva', ':UVAutoActivateToggle<CR>', desc_prefix .. ' UV toggle auto-activate')

  map('<leader>Lpdm', "<Cmd>lua require('dap-python').test_method()<CR>", desc_prefix .. ' debug nearest method')
  map('<leader>Lpdc', "<Cmd>lua require('dap-python').test_class()<CR>", desc_prefix .. ' debug class')
  map('<leader>Lpds', "<Esc><Cmd>lua require('dap-python').debug_selection()<CR>", desc_prefix .. ' debug selection', 'v')

  map('<leader>Lppt', ':PuppeteerToggle<CR>', desc_prefix .. ' puppeteer toggle')
  map('<leader>Lppe', ':PuppeteerEnable<CR>', desc_prefix .. ' puppeteer enable')
  map('<leader>Lppd', ':PuppeteerDisable<CR>', desc_prefix .. ' puppeteer disable')
end

local function register_which_key(desc_prefix)
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>Lp', group = 'Python' },
    { '<leader>Lpv', group = 'UV' },
    { '<leader>Lpvu', desc = desc_prefix .. ' UV run current file' },
    { '<leader>Lpvs', desc = desc_prefix .. ' UV run selection' },
    { '<leader>Lpvf', desc = desc_prefix .. ' UV run function' },
    { '<leader>Lpvi', desc = desc_prefix .. ' UV init project' },
    { '<leader>Lpva', desc = desc_prefix .. ' UV toggle auto-activate' },
    { '<leader>Lpd', group = 'Debug' },
    { '<leader>Lpdm', desc = desc_prefix .. ' debug nearest method' },
    { '<leader>Lpdc', desc = desc_prefix .. ' debug class' },
    { '<leader>Lpp', group = 'Puppeteer' },
    { '<leader>Lppt', desc = desc_prefix .. ' puppeteer toggle' },
    { '<leader>Lppe', desc = desc_prefix .. ' puppeteer enable' },
    { '<leader>Lppd', desc = desc_prefix .. ' puppeteer disable' },
  }, { buffer = 0, mode = 'n' })

  wk.add({
    { '<leader>Lp', group = 'Python' },
    { '<leader>Lpv', group = 'UV' },
    { '<leader>Lpvs', desc = desc_prefix .. ' UV run selection' },
    { '<leader>Lpd', group = 'Debug' },
    { '<leader>Lpds', desc = desc_prefix .. ' debug selection' },
  }, { buffer = 0, mode = 'v' })
end

function M.setup(opts)
  opts = opts or {}
  local desc_prefix = opts.desc_prefix or 'Python'

  set_keymaps(desc_prefix)
  register_which_key(desc_prefix)
end

return M
