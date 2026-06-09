-- Documentación: módulo `lua/navigation/nvim-tree-config/init.lua`.
-- Propósito: define herramientas de navegación y búsqueda dentro de BlindNvim sin alterar lógica de ejecución.

--
-- This function has been generated from your
--   view.mappings.list
--   view.mappings.custom_only
--   remove_keymaps
--
-- You should add this function to your configuration and set on_attach = on_attach in the nvim-tree setup call.
--
-- Although care was taken to ensure correctness and completeness, your review is required.
--
-- Please check for the following issues in auto generated content:
--   "Mappings removed" is as you expect
--   "Mappings migrated" are correct
--
-- Please see https://github.com/nvim-tree/nvim-tree.lua/wiki/Migrating-To-on_attach for assistance in migrating.
--

-- Línea documentada: `local function on_attach(bufnr)`.
local function on_attach(bufnr)
-- Línea documentada: `local api = require('nvim-tree.api')`.
  local api = require('nvim-tree.api')

-- Línea documentada: `local function opts(desc)`.
  local function opts(desc)
-- Línea documentada: `return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }`.
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
-- Línea documentada: `end`.
  end


  -- Default mappings. Feel free to modify or remove as you wish.
  --
  -- BEGIN_DEFAULT_ON_ATTACH
-- Línea documentada: `vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))`.
  vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
-- Línea documentada: `vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))`.
  vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'))
-- Línea documentada: `vim.keymap.set('n', '<C-k>', api.node.show_info_popup,              opts('Info'))`.
  vim.keymap.set('n', '<C-k>', api.node.show_info_popup,              opts('Info'))
-- Línea documentada: `vim.keymap.set('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'))`.
  vim.keymap.set('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'))
-- Línea documentada: `vim.keymap.set('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'))`.
  vim.keymap.set('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'))
-- Línea documentada: `vim.keymap.set('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))`.
  vim.keymap.set('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
-- Línea documentada: `vim.keymap.set('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))`.
  vim.keymap.set('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
-- Línea documentada: `vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'))`.
  vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'))
-- Línea documentada: `vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))`.
  vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
-- Línea documentada: `vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))`.
  vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))
-- Línea documentada: `vim.keymap.set('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'))`.
  vim.keymap.set('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'))
-- Línea documentada: `vim.keymap.set('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'))`.
  vim.keymap.set('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'))
-- Línea documentada: `vim.keymap.set('n', '.',     api.node.run.cmd,                      opts('Run Command'))`.
  vim.keymap.set('n', '.',     api.node.run.cmd,                      opts('Run Command'))
-- Línea documentada: `vim.keymap.set('n', '-',     api.tree.change_root_to_parent,        opts('Up'))`.
  vim.keymap.set('n', '-',     api.tree.change_root_to_parent,        opts('Up'))
-- Línea documentada: `vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))`.
  vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))
-- Línea documentada: `vim.keymap.set('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))`.
  vim.keymap.set('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'))
-- Línea documentada: `vim.keymap.set('n', 'B',     api.tree.toggle_no_buffer_filter,      opts('Toggle No Buffer'))`.
  vim.keymap.set('n', 'B',     api.tree.toggle_no_buffer_filter,      opts('Toggle No Buffer'))
-- Línea documentada: `vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))`.
  vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
-- Línea documentada: `vim.keymap.set('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))`.
  vim.keymap.set('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))
-- Línea documentada: `vim.keymap.set('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'))`.
  vim.keymap.set('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'))
-- Línea documentada: `vim.keymap.set('n', ']c',    api.node.navigate.git.next,            opts('Next Git'))`.
  vim.keymap.set('n', ']c',    api.node.navigate.git.next,            opts('Next Git'))
-- Línea documentada: `vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Delete'))`.
  vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Delete'))
-- Línea documentada: `vim.keymap.set('n', 'D',     api.fs.trash,                          opts('Trash'))`.
  vim.keymap.set('n', 'D',     api.fs.trash,                          opts('Trash'))
-- Línea documentada: `vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Expand All'))`.
  vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
-- Línea documentada: `vim.keymap.set('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'))`.
  vim.keymap.set('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'))
-- Línea documentada: `vim.keymap.set('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))`.
  vim.keymap.set('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
-- Línea documentada: `vim.keymap.set('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))`.
  vim.keymap.set('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
-- Línea documentada: `vim.keymap.set('n', 'F',     api.live_filter.clear,                 opts('Clean Filter'))`.
  vim.keymap.set('n', 'F',     api.live_filter.clear,                 opts('Clean Filter'))
-- Línea documentada: `vim.keymap.set('n', 'f',     api.live_filter.start,                 opts('Filter'))`.
  vim.keymap.set('n', 'f',     api.live_filter.start,                 opts('Filter'))
-- Línea documentada: `vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'))`.
  vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'))
-- Línea documentada: `vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))`.
  vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
-- Línea documentada: `vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))`.
  vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
-- Línea documentada: `vim.keymap.set('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))`.
  vim.keymap.set('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))
-- Línea documentada: `vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))`.
  vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
-- Línea documentada: `vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))`.
  vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
-- Línea documentada: `vim.keymap.set('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'))`.
  vim.keymap.set('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'))
-- Línea documentada: `vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))`.
  vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
-- Línea documentada: `vim.keymap.set('n', 'O',     api.node.open.no_window_picker,        opts('Open: No Window Picker'))`.
  vim.keymap.set('n', 'O',     api.node.open.no_window_picker,        opts('Open: No Window Picker'))
-- Línea documentada: `vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))`.
  vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))
-- Línea documentada: `vim.keymap.set('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))`.
  vim.keymap.set('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))
-- Línea documentada: `vim.keymap.set('n', 'q',     api.tree.close,                        opts('Close'))`.
  vim.keymap.set('n', 'q',     api.tree.close,                        opts('Close'))
-- Línea documentada: `vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'))`.
  vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'))
-- Línea documentada: `vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))`.
  vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))
-- Línea documentada: `vim.keymap.set('n', 's',     api.node.run.system,                   opts('Run System'))`.
  vim.keymap.set('n', 's',     api.node.run.system,                   opts('Run System'))
-- Línea documentada: `vim.keymap.set('n', 'S',     api.tree.search_node,                  opts('Search'))`.
  vim.keymap.set('n', 'S',     api.tree.search_node,                  opts('Search'))
-- Línea documentada: `vim.keymap.set('n', 'U',     api.tree.toggle_custom_filter,         opts('Toggle Hidden'))`.
  vim.keymap.set('n', 'U',     api.tree.toggle_custom_filter,         opts('Toggle Hidden'))
-- Línea documentada: `vim.keymap.set('n', 'W',     api.tree.collapse_all,                 opts('Collapse'))`.
  vim.keymap.set('n', 'W',     api.tree.collapse_all,                 opts('Collapse'))
-- Línea documentada: `vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))`.
  vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
-- Línea documentada: `vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))`.
  vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
-- Línea documentada: `vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))`.
  vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
-- Línea documentada: `vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))`.
  vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))
-- Línea documentada: `vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))`.
  vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
  -- END_DEFAULT_ON_ATTACH


  -- Mappings removed via:
  --   remove_keymaps
  --   OR
  --   view.mappings.list..action = ""
  --
  -- The dummy set before del is done for safety, in case a default mapping does not exist.
  --
  -- You might tidy things by removing these along with their default mapping.
-- Línea documentada: `vim.keymap.set('n', 'O', '', { buffer = bufnr })`.
  vim.keymap.set('n', 'O', '', { buffer = bufnr })
-- Línea documentada: `vim.keymap.del('n', 'O', { buffer = bufnr })`.
  vim.keymap.del('n', 'O', { buffer = bufnr })
-- Línea documentada: `vim.keymap.set('n', '<2-RightMouse>', '', { buffer = bufnr })`.
  vim.keymap.set('n', '<2-RightMouse>', '', { buffer = bufnr })
-- Línea documentada: `vim.keymap.del('n', '<2-RightMouse>', { buffer = bufnr })`.
  vim.keymap.del('n', '<2-RightMouse>', { buffer = bufnr })
-- Línea documentada: `vim.keymap.set('n', 'D', '', { buffer = bufnr })`.
  vim.keymap.set('n', 'D', '', { buffer = bufnr })
-- Línea documentada: `vim.keymap.del('n', 'D', { buffer = bufnr })`.
  vim.keymap.del('n', 'D', { buffer = bufnr })
-- Línea documentada: `vim.keymap.set('n', 'E', '', { buffer = bufnr })`.
  vim.keymap.set('n', 'E', '', { buffer = bufnr })
-- Línea documentada: `vim.keymap.del('n', 'E', { buffer = bufnr })`.
  vim.keymap.del('n', 'E', { buffer = bufnr })


  -- Mappings migrated from view.mappings.list
  --
  -- You will need to insert "your code goes here" for any mappings with a custom action_cb
-- Línea documentada: `vim.keymap.set('n', 'A', api.tree.expand_all, opts('Expand All'))`.
  vim.keymap.set('n', 'A', api.tree.expand_all, opts('Expand All'))
-- Línea documentada: `vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))`.
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
-- Línea documentada: `vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts('CD'))`.
  vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts('CD'))
-- Línea documentada: `vim.keymap.set('n', 'P', function()`.
  vim.keymap.set('n', 'P', function()
-- Línea documentada: `local node = api.tree.get_node_under_cursor()`.
    local node = api.tree.get_node_under_cursor()
-- Línea documentada: `print(node.absolute_path)`.
    print(node.absolute_path)
-- Línea documentada: `end, opts('Print Node Path'))`.
  end, opts('Print Node Path'))

-- Línea documentada: `vim.keymap.set('n', 'Z', api.node.run.system, opts('Run System'))`.
  vim.keymap.set('n', 'Z', api.node.run.system, opts('Run System'))

-- Línea documentada: `end`.
end

-- Línea documentada: `if (vim.g.visual_impairing) then`.
if (vim.g.visual_impairing) then
-- Línea documentada: `vim.g.nvim_tree_show_icons = {`.
vim.g.nvim_tree_show_icons = {
-- Línea documentada: `folders = 0,`.
  folders = 0,
-- Línea documentada: `files = 0,`.
  files = 0,
-- Línea documentada: `git = 0,`.
  git = 0,
-- Línea documentada: `folder_arrows = 0,`.
  folder_arrows = 0,
-- Línea documentada: `}`.
}
-- Línea documentada: `end`.
end
-- Línea documentada: `local function open_nvim_tree()`.
local function open_nvim_tree()

  -- open the tree
-- Línea documentada: `require("nvim-tree.api").tree.open()`.
  require("nvim-tree.api").tree.open()
-- Línea documentada: `end`.
end
-- Línea documentada: `vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })`.
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- Línea documentada: `local blind={`.
local blind={
-- Línea documentada: `disable_netrw       = true,`.
  disable_netrw       = true,
-- Línea documentada: `hijack_netrw        = true,`.
  hijack_netrw        = true,
-- Línea documentada: `open_on_tab         = true,`.
  open_on_tab         = true,
-- Línea documentada: `hijack_cursor       = false,`.
  hijack_cursor       = false,
-- Línea documentada: `update_cwd          = false,`.
  update_cwd          = false,
-- Línea documentada: `diagnostics = {`.
  diagnostics = {
-- Línea documentada: `enable = false,`.
    enable = false,
-- Línea documentada: `icons = {`.
    icons = {
-- Línea documentada: `hint ="?",`.
      hint ="?",
-- Línea documentada: `info ="I",`.
      info ="I",
-- Línea documentada: `warning ="W",`.
      warning ="W",
-- Línea documentada: `error ="E",`.
      error ="E",
-- Línea documentada: `}`.
    }
-- Línea documentada: `},`.
  },
-- Línea documentada: `update_focused_file = {`.
  update_focused_file = {
-- Línea documentada: `enable      = false,`.
    enable      = false,
-- Línea documentada: `update_cwd  = false,`.
    update_cwd  = false,
-- Línea documentada: `ignore_list = {}`.
    ignore_list = {}
-- Línea documentada: `},`.
  },
-- Línea documentada: `system_open = {`.
  system_open = {
-- Línea documentada: `cmd  = nil,`.
    cmd  = nil,
-- Línea documentada: `args = {}`.
    args = {}
-- Línea documentada: `},`.
  },
-- Línea documentada: `filters = {`.
  filters = {
-- Línea documentada: `dotfiles = false,`.
    dotfiles = false,
-- Línea documentada: `custom = {}`.
    custom = {}
-- Línea documentada: `},`.
  },
-- Línea documentada: `git = {`.
  git = {
-- Línea documentada: `enable = true,`.
    enable = true,
-- Línea documentada: `ignore = true,`.
    ignore = true,
-- Línea documentada: `timeout = 500,`.
    timeout = 500,
-- Línea documentada: `},`.
  },
-- Línea documentada: `view = {`.
  view = {
-- Línea documentada: `width = 25,`.
    width = 25,
-- Línea documentada: `preserve_window_proportions = true,`.
    preserve_window_proportions = true,
-- Línea documentada: `side = 'right',`.
    side = 'right',
-- Línea documentada: `float = {`.
    float = {
-- Línea documentada: `enable =true,`.
          enable =true,
-- Línea documentada: `open_win_config = {`.
          open_win_config = {
-- Línea documentada: `relative = "editor",`.
            relative = "editor",
-- Línea documentada: `border = "none",`.
            border = "none",
-- Línea documentada: `width = 100,`.
            width = 100,
-- Línea documentada: `height = 30,`.
            height = 30,
-- Línea documentada: `row = 1,`.
            row = 1,
-- Línea documentada: `col = 1,`.
            col = 1,
-- Línea documentada: `},`.
          },
-- Línea documentada: `},`.
        },
-- Línea documentada: `number = false,`.
    number = false,
-- Línea documentada: `relativenumber = false`.
    relativenumber = false
-- Línea documentada: `},`.
  },
-- Línea documentada: `trash = {`.
  trash = {
-- Línea documentada: `cmd = "trash",`.
    cmd = "trash",
-- Línea documentada: `require_confirm = true`.
    require_confirm = true
-- Línea documentada: `},`.
  },
-- Línea documentada: `}`.
}

-- Línea documentada: `local normal ={`.
local normal ={
-- Línea documentada: `disable_netrw       = true,`.
  disable_netrw       = true,
-- Línea documentada: `hijack_netrw        = true,`.
  hijack_netrw        = true,
-- Línea documentada: `open_on_tab         = true,`.
  open_on_tab         = true,
-- Línea documentada: `hijack_cursor       = false,`.
  hijack_cursor       = false,
-- Línea documentada: `update_cwd          = false,`.
  update_cwd          = false,
-- Línea documentada: `diagnostics = {`.
  diagnostics = {
-- Línea documentada: `enable = false,`.
    enable = false,
-- Línea documentada: `icons = {`.
    icons = {
-- Línea documentada: `hint ="",`.
      hint ="",
-- Línea documentada: `info ="",`.
      info ="",
-- Línea documentada: `warning ="",`.
      warning ="",
-- Línea documentada: `error ="",`.
      error ="",
-- Línea documentada: `}`.
    }
-- Línea documentada: `},`.
  },
-- Línea documentada: `update_focused_file = {`.
  update_focused_file = {
-- Línea documentada: `enable      = false,`.
    enable      = false,
-- Línea documentada: `update_cwd  = false,`.
    update_cwd  = false,
-- Línea documentada: `ignore_list = {}`.
    ignore_list = {}
-- Línea documentada: `},`.
  },
-- Línea documentada: `system_open = {`.
  system_open = {
-- Línea documentada: `cmd  = nil,`.
    cmd  = nil,
-- Línea documentada: `args = {}`.
    args = {}
-- Línea documentada: `},`.
  },
-- Línea documentada: `filters = {`.
  filters = {
-- Línea documentada: `dotfiles = false,`.
    dotfiles = false,
-- Línea documentada: `custom = {}`.
    custom = {}
-- Línea documentada: `},`.
  },
-- Línea documentada: `git = {`.
  git = {
-- Línea documentada: `enable = true,`.
    enable = true,
-- Línea documentada: `ignore = true,`.
    ignore = true,
-- Línea documentada: `timeout = 500,`.
    timeout = 500,
-- Línea documentada: `},`.
  },
-- Línea documentada: `view = {`.
  view = {
-- Línea documentada: `width =25,`.
    width =25,
-- Línea documentada: `preserve_window_proportions = true,`.
    preserve_window_proportions = true,
-- Línea documentada: `side ='left',`.
    side ='left',
-- Línea documentada: `number = false,`.
    number = false,
-- Línea documentada: `relativenumber = false`.
    relativenumber = false
-- Línea documentada: `},`.
  },
-- Línea documentada: `trash = {`.
  trash = {
-- Línea documentada: `cmd = "trash",`.
    cmd = "trash",
-- Línea documentada: `require_confirm = true`.
    require_confirm = true
-- Línea documentada: `},`.
  },
-- Línea documentada: `}`.
}

-- Línea documentada: `require'nvim-tree'.setup(BlindReturn(blind ,normal))`.
require'nvim-tree'.setup(BlindReturn(blind ,normal))
