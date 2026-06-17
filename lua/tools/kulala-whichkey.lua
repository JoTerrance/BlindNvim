-- Which-key entries for Kulala request buffers.

local M = {}

local function map(lhs, rhs, desc, mode)
  vim.keymap.set(mode or 'n', lhs, rhs, {
    buffer = true,
    silent = true,
    desc = desc,
  })
end

local function set_keymaps(desc_prefix)
  local kulala = require('kulala')

  -- Mirror the most useful Kulala actions with a consistent local prefix.
  map('<leader>Rs', function() kulala.run() end, desc_prefix .. ' send request', { 'n', 'v' })
  map('<leader>Ra', function() kulala.run_all() end, desc_prefix .. ' send all requests', { 'n', 'v' })
  map('<leader>Rr', function() kulala.replay() end, desc_prefix .. ' replay last request')
  map('<leader>Rb', function() kulala.scratchpad() end, desc_prefix .. ' scratchpad')
  map('<leader>Ro', function() kulala.open() end, desc_prefix .. ' open')
  map('<leader>Ri', function() kulala.inspect() end, desc_prefix .. ' inspect request')
  map('<leader>Rc', function() kulala.copy() end, desc_prefix .. ' copy as cURL')
  map('<leader>Rv', function() kulala.from_curl() end, desc_prefix .. ' paste from cURL')
  map('<leader>Re', function() kulala.set_selected_env() end, desc_prefix .. ' select environment')
  map('<leader>Rj', function() kulala.open_cookies_jar() end, desc_prefix .. ' cookies jar')
  map('<leader>Ru', function() require('kulala.ui.auth_manager').open_auth_config() end, desc_prefix .. ' auth config')
  map('<leader>Rn', function() kulala.jump_next() end, desc_prefix .. ' next request')
  map('<leader>Rp', function() kulala.jump_prev() end, desc_prefix .. ' previous request')
  map('<leader>Rf', function() kulala.search() end, desc_prefix .. ' find request')
  map('<leader>Rt', function() kulala.toggle_view() end, desc_prefix .. ' toggle headers/body')
  map('<leader>Rg', function() kulala.download_graphql_schema() end, desc_prefix .. ' download GraphQL schema')
  map('<leader>RS', function() kulala.show_stats() end, desc_prefix .. ' show stats')
end

local function register_which_key(desc_prefix)
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>R', group = desc_prefix },
    { '<leader>Rs', desc = 'Send request' },
    { '<leader>Ra', desc = 'Send all requests' },
    { '<leader>Rr', desc = 'Replay last request' },
    { '<leader>Rb', desc = 'Scratchpad' },
    { '<leader>Ro', desc = 'Open Kulala' },
    { '<leader>Ri', desc = 'Inspect request' },
    { '<leader>Rc', desc = 'Copy as cURL' },
    { '<leader>Rv', desc = 'Paste from cURL' },
    { '<leader>Re', desc = 'Select environment' },
    { '<leader>Rj', desc = 'Cookies jar' },
    { '<leader>Ru', desc = 'Auth config' },
    { '<leader>Rn', desc = 'Next request' },
    { '<leader>Rf', desc = 'Find request' },
    { '<leader>Rt', desc = 'Toggle headers/body' },
    { '<leader>Rg', desc = 'Download GraphQL schema' },
    { '<leader>RS', desc = 'Show stats' },
  }, { buffer = 0, mode = { 'n', 'v' } })
end

function M.setup(opts)
  opts = opts or {}
  local desc_prefix = opts.desc_prefix or 'Kulala'

  set_keymaps(desc_prefix)
  register_which_key(desc_prefix)
end

return M
