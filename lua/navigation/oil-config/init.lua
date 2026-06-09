-- Documentación: módulo `lua/navigation/oil-config/init.lua`.
-- Propósito: define herramientas de navegación y búsqueda dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `require("oil").setup({`.
require("oil").setup({
  -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
  -- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
-- Línea documentada: `default_file_explorer = true,`.
  default_file_explorer = true,
  -- Id is automatically added at the beginning, and name at the end
  -- See :help oil-columns
-- Línea documentada: `columns = {`.
  columns = {
-- Línea documentada: `"icon",`.
    "icon",
    -- "permissions",
    -- "size",
    -- "mtime",
-- Línea documentada: `},`.
  },
  -- Buffer-local options to use for oil buffers
-- Línea documentada: `buf_options = {`.
  buf_options = {
-- Línea documentada: `buflisted = false,`.
    buflisted = false,
-- Línea documentada: `bufhidden = "hide",`.
    bufhidden = "hide",
-- Línea documentada: `},`.
  },
  -- Window-local options to use for oil buffers
-- Línea documentada: `win_options = {`.
  win_options = {
-- Línea documentada: `wrap = false,`.
    wrap = false,
-- Línea documentada: `signcolumn = "no",`.
    signcolumn = "no",
-- Línea documentada: `cursorcolumn = false,`.
    cursorcolumn = false,
-- Línea documentada: `foldcolumn = "0",`.
    foldcolumn = "0",
-- Línea documentada: `spell = false,`.
    spell = false,
-- Línea documentada: `list = false,`.
    list = false,
-- Línea documentada: `conceallevel = 3,`.
    conceallevel = 3,
-- Línea documentada: `concealcursor = "nvic",`.
    concealcursor = "nvic",
-- Línea documentada: `},`.
  },
  -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
-- Línea documentada: `delete_to_trash = false,`.
  delete_to_trash = false,
  -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
-- Línea documentada: `skip_confirm_for_simple_edits = false,`.
  skip_confirm_for_simple_edits = false,
  -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
  -- (:help prompt_save_on_select_new_entry)
-- Línea documentada: `prompt_save_on_select_new_entry = true,`.
  prompt_save_on_select_new_entry = true,
  -- Oil will automatically delete hidden buffers after this delay
  -- You can set the delay to false to disable cleanup entirely
  -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
-- Línea documentada: `cleanup_delay_ms = 2000,`.
  cleanup_delay_ms = 2000,
-- Línea documentada: `lsp_file_methods = {`.
  lsp_file_methods = {
    -- Enable or disable LSP file operations
-- Línea documentada: `enabled = true,`.
    enabled = true,
    -- Time to wait for LSP file operations to complete before skipping
-- Línea documentada: `timeout_ms = 1000,`.
    timeout_ms = 1000,
    -- Set to true to autosave buffers that are updated with LSP willRenameFiles
    -- Set to "unmodified" to only save unmodified buffers
-- Línea documentada: `autosave_changes = false,`.
    autosave_changes = false,
-- Línea documentada: `},`.
  },
  -- Constrain the cursor to the editable parts of the oil buffer
  -- Set to `false` to disable, or "name" to keep it on the file names
-- Línea documentada: `constrain_cursor = "editable",`.
  constrain_cursor = "editable",
  -- Set to true to watch the filesystem for changes and reload oil
-- Línea documentada: `watch_for_changes = false,`.
  watch_for_changes = false,
  -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
  -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
  -- Additionally, if it is a string that matches "actions.<name>",
  -- it will use the mapping at require("oil.actions").<name>
  -- Set to `false` to remove a keymap
  -- See :help oil-actions for a list of all available actions
-- Línea documentada: `keymaps = {`.
  keymaps = {
-- Línea documentada: `["g?"] = "actions.show_help",`.
  ["g?"] = "actions.show_help",
-- Línea documentada: `["<CR>"] = "actions.select",`.
  ["<CR>"] = "actions.select",
-- Línea documentada: `["<2-LeftMouse>"] = "actions.select",`.
  ["<2-LeftMouse>"] = "actions.select",
-- Línea documentada: `["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },`.
    ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
-- Línea documentada: `["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },`.
    ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
-- Línea documentada: `["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },`.
    ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
-- Línea documentada: `["<C-p>"] = "actions.preview",`.
    ["<C-p>"] = "actions.preview",
-- Línea documentada: `["<C-c>"] = "actions.close",`.
    ["<C-c>"] = "actions.close",
-- Línea documentada: `["<C-l>"] = "actions.refresh",`.
    ["<C-l>"] = "actions.refresh",
-- Línea documentada: `["-"] = "actions.parent",`.
    ["-"] = "actions.parent",
-- Línea documentada: `["<BS>"] = "actions.parent",`.
    ["<BS>"] = "actions.parent",
-- Línea documentada: `["_"] = "actions.open_cwd",`.
    ["_"] = "actions.open_cwd",
-- Línea documentada: `["`"] = "actions.cd",`.
    ["`"] = "actions.cd",
-- Línea documentada: `["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory", mode = "n" },`.
    ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory", mode = "n" },
-- Línea documentada: `["gs"] = "actions.change_sort",`.
    ["gs"] = "actions.change_sort",
-- Línea documentada: `["gx"] = "actions.open_external",`.
    ["gx"] = "actions.open_external",
-- Línea documentada: `["g."] = "actions.toggle_hidden",`.
    ["g."] = "actions.toggle_hidden",
-- Línea documentada: `["g\\"] = "actions.toggle_trash",`.
    ["g\\"] = "actions.toggle_trash",
-- Línea documentada: `},`.
  },
  -- Set to false to disable all of the above keymaps
-- Línea documentada: `use_default_keymaps = true,`.
  use_default_keymaps = true,
-- Línea documentada: `view_options = {`.
  view_options = {
    -- Show files and directories that start with "."
-- Línea documentada: `show_hidden = false,`.
    show_hidden = false,
    -- This function defines what is considered a "hidden" file
-- Línea documentada: `is_hidden_file = function(name, bufnr)`.
    is_hidden_file = function(name, bufnr)
-- Línea documentada: `return vim.startswith(name, ".")`.
      return vim.startswith(name, ".")
-- Línea documentada: `end,`.
    end,
    -- This function defines what will never be shown, even when `show_hidden` is set
-- Línea documentada: `is_always_hidden = function(name, bufnr)`.
    is_always_hidden = function(name, bufnr)
-- Línea documentada: `return false`.
      return false
-- Línea documentada: `end,`.
    end,
    -- Sort file names in a more intuitive order for humans. Is less performant,
    -- so you may want to set to false if you work with large directories.
-- Línea documentada: `natural_order = true,`.
    natural_order = true,
    -- Sort file and directory names case insensitive
-- Línea documentada: `case_insensitive = false,`.
    case_insensitive = false,
-- Línea documentada: `sort = {`.
    sort = {
      -- sort order can be "asc" or "desc"
      -- see :help oil-columns to see which columns are sortable
-- Línea documentada: `{ "type", "asc" },`.
      { "type", "asc" },
-- Línea documentada: `{ "name", "asc" },`.
      { "name", "asc" },
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
  -- Extra arguments to pass to SCP when moving/copying files over SSH
-- Línea documentada: `extra_scp_args = {},`.
  extra_scp_args = {},
  -- EXPERIMENTAL support for performing file operations with git
-- Línea documentada: `git = {`.
  git = {
    -- Return true to automatically git add/mv/rm files
-- Línea documentada: `add = function(path)`.
    add = function(path)
-- Línea documentada: `return false`.
      return false
-- Línea documentada: `end,`.
    end,
-- Línea documentada: `mv = function(src_path, dest_path)`.
    mv = function(src_path, dest_path)
-- Línea documentada: `return false`.
      return false
-- Línea documentada: `end,`.
    end,
-- Línea documentada: `rm = function(path)`.
    rm = function(path)
-- Línea documentada: `return false`.
      return false
-- Línea documentada: `end,`.
    end,
-- Línea documentada: `},`.
  },
  -- Configuration for the floating window in oil.open_float
-- Línea documentada: `float = {`.
  float = {
    -- Padding around the floating window
-- Línea documentada: `padding = 2,`.
    padding = 2,
-- Línea documentada: `max_width = 0,`.
    max_width = 0,
-- Línea documentada: `max_height = 0,`.
    max_height = 0,
-- Línea documentada: `border = "rounded",`.
    border = "rounded",
-- Línea documentada: `win_options = {`.
    win_options = {
-- Línea documentada: `winblend = 0,`.
      winblend = 0,
-- Línea documentada: `},`.
    },
    -- preview_split: Split direction: "auto", "left", "right", "above", "below".
-- Línea documentada: `preview_split = "auto",`.
    preview_split = "auto",
    -- This is the config that will be passed to nvim_open_win.
    -- Change values here to customize the layout
-- Línea documentada: `override = function(conf)`.
    override = function(conf)
-- Línea documentada: `return conf`.
      return conf
-- Línea documentada: `end,`.
    end,
-- Línea documentada: `},`.
  },
  -- Configuration for the actions floating preview window
-- Línea documentada: `preview = {`.
  preview = {
    -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_width and max_width can be a single value or a list of mixed integer/float types.
    -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
-- Línea documentada: `max_width = 0.9,`.
    max_width = 0.9,
    -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
-- Línea documentada: `min_width = { 40, 0.4 },`.
    min_width = { 40, 0.4 },
    -- optionally define an integer/float for the exact width of the preview window
-- Línea documentada: `width = nil,`.
    width = nil,
    -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_height and max_height can be a single value or a list of mixed integer/float types.
    -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
-- Línea documentada: `max_height = 0.9,`.
    max_height = 0.9,
    -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
-- Línea documentada: `min_height = { 5, 0.1 },`.
    min_height = { 5, 0.1 },
    -- optionally define an integer/float for the exact height of the preview window
-- Línea documentada: `height = nil,`.
    height = nil,
-- Línea documentada: `border = "rounded",`.
    border = "rounded",
-- Línea documentada: `win_options = {`.
    win_options = {
-- Línea documentada: `winblend = 0,`.
      winblend = 0,
-- Línea documentada: `},`.
    },
    -- Whether the preview window is automatically updated when the cursor is moved
-- Línea documentada: `update_on_cursor_moved = true,`.
    update_on_cursor_moved = true,
-- Línea documentada: `},`.
  },
  -- Configuration for the floating progress window
-- Línea documentada: `progress = {`.
  progress = {
-- Línea documentada: `max_width = 0.9,`.
    max_width = 0.9,
-- Línea documentada: `min_width = { 40, 0.4 },`.
    min_width = { 40, 0.4 },
-- Línea documentada: `width = nil,`.
    width = nil,
-- Línea documentada: `max_height = { 10, 0.9 },`.
    max_height = { 10, 0.9 },
-- Línea documentada: `min_height = { 5, 0.1 },`.
    min_height = { 5, 0.1 },
-- Línea documentada: `height = nil,`.
    height = nil,
-- Línea documentada: `border = "rounded",`.
    border = "rounded",
-- Línea documentada: `minimized_border = "none",`.
    minimized_border = "none",
-- Línea documentada: `win_options = {`.
    win_options = {
-- Línea documentada: `winblend = 0,`.
      winblend = 0,
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
  -- Configuration for the floating SSH window
-- Línea documentada: `ssh = {`.
  ssh = {
-- Línea documentada: `border = "rounded",`.
    border = "rounded",
-- Línea documentada: `},`.
  },
  -- Configuration for the floating keymaps help window
-- Línea documentada: `keymaps_help = {`.
  keymaps_help = {
-- Línea documentada: `border = "rounded",`.
    border = "rounded",
-- Línea documentada: `},`.
  },
-- Línea documentada: `})`.
})
