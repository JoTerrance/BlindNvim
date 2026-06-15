-- Which-key entries for Scala buffers.

local M = {}

-- Load the Telescope extension lazily from Scala buffers instead of during Telescope startup.
local function scaladex_search()
  local telescope = require('telescope')
  pcall(telescope.load_extension, 'scaladex')
  telescope.extensions.scaladex.scaladex.search()
end

local function set_keymaps(desc_prefix)
  vim.keymap.set('n', '<leader>Lss', scaladex_search, {
    buffer = true,
    silent = true,
    desc = string.format('%s: search Scaladex', desc_prefix),
  })
end

local function register_which_key(desc_prefix)
  local ok, wk = pcall(require, 'which-key')
  if not ok then
    return
  end

  wk.add({
    { '<leader>Ls', group = desc_prefix },
    { '<leader>Lss', desc = 'Search Scaladex' },
  }, { buffer = 0, mode = 'n' })
end

function M.setup(opts)
  opts = opts or {}
  local desc_prefix = opts.desc_prefix or 'Scala'

  set_keymaps(desc_prefix)
  register_which_key(desc_prefix)
end

return M
