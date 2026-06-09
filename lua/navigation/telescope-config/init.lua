-- Documentación: módulo `lua/navigation/telescope-config/init.lua`.
-- Propósito: define herramientas de navegación y búsqueda dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `local actions = require('telescope.actions')`.
local actions = require('telescope.actions')
-- Línea documentada: `require('telescope').setup {`.
require('telescope').setup {
-- Línea documentada: `defaults = {`.
    defaults = {
-- Línea documentada: `layout_config = {`.
        layout_config = {
-- Línea documentada: `width = BlindReturn( 0.99 , 0.75),`.
          width = BlindReturn( 0.99 , 0.75),
-- Línea documentada: `prompt_position = "top",`.
          prompt_position = "top",
-- Línea documentada: `preview_cutoff = 50,`.
          preview_cutoff = 50,
-- Línea documentada: `horizontal = {mirror = false},`.
          horizontal = {mirror = false},
-- Línea documentada: `vertical = {mirror = false},`.
          vertical = {mirror = false},
-- Línea documentada: `},`.
        },
-- Línea documentada: `find_command = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},`.
        find_command = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
-- Línea documentada: `prompt_prefix = BlindReturn( "query: ", " " ),`.
        prompt_prefix = BlindReturn( "query: ", " " ),
-- Línea documentada: `selection_caret = BlindReturn( ">", " "),`.
        selection_caret = BlindReturn( ">", " "),
-- Línea documentada: `entry_prefix = "  ",`.
        entry_prefix = "  ",
-- Línea documentada: `initial_mode = "insert",`.
        initial_mode = "insert",
-- Línea documentada: `selection_strategy = "reset",`.
        selection_strategy = "reset",
-- Línea documentada: `sorting_strategy = "descending",`.
        sorting_strategy = "descending",
-- Línea documentada: `layout_strategy = "vertical",`.
        layout_strategy = "vertical",
-- Línea documentada: `file_sorter = require'telescope.sorters'.get_fuzzy_file,`.
        file_sorter = require'telescope.sorters'.get_fuzzy_file,
-- Línea documentada: `file_ignore_patterns = {},`.
        file_ignore_patterns = {},
-- Línea documentada: `generic_sorter =require'telescope.sorters'.get_generic_fuzzy_sorter,`.
        generic_sorter =require'telescope.sorters'.get_generic_fuzzy_sorter,
-- Línea documentada: `path_display = {},`.
        path_display = {},
-- Línea documentada: `winblend = 0,`.
        winblend = 0,
-- Línea documentada: `border = {},`.
        border = {},
-- Línea documentada: `borderchars = BlindReturn( {'', '', '', '', '', '', '', ''}, {'─', '│', '─', '│', '╭', '╮', '╯', '╰'} ),`.
        borderchars = BlindReturn( {'', '', '', '', '', '', '', ''}, {'─', '│', '─', '│', '╭', '╮', '╯', '╰'} ),
-- Línea documentada: `color_devicons = true,`.
        color_devicons = true,
-- Línea documentada: `use_less = true,`.
        use_less = true,
-- Línea documentada: `set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,`.
        set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
-- Línea documentada: `file_previewer = require'telescope.previewers'.vim_buffer_cat.new,`.
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
-- Línea documentada: `grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,`.
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
-- Línea documentada: `qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,`.
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
-- Línea documentada: `buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,`.
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
-- Línea documentada: `mappings = {`.
        mappings = {
-- Línea documentada: `i = {`.
            i = {
-- Línea documentada: `["<C-j>"] = actions.move_selection_next,`.
                ["<C-j>"] = actions.move_selection_next,
-- Línea documentada: `["<C-k>"] = actions.move_selection_previous,`.
                ["<C-k>"] = actions.move_selection_previous,
-- Línea documentada: `["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,`.
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
-- Línea documentada: `["<esc>"] = actions.close,`.
                ["<esc>"] = actions.close,
-- Línea documentada: `["<CR>"] = actions.select_default + actions.center`.
                ["<CR>"] = actions.select_default + actions.center
-- Línea documentada: `},`.
            },
-- Línea documentada: `n = {`.
            n = {
-- Línea documentada: `["<C-j>"] = actions.move_selection_next,`.
                ["<C-j>"] = actions.move_selection_next,
-- Línea documentada: `["<C-k>"] = actions.move_selection_previous,`.
                ["<C-k>"] = actions.move_selection_previous,
-- Línea documentada: `["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,`.
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
-- Línea documentada: `}`.
            }
-- Línea documentada: `}`.
        }
-- Línea documentada: `},`.
    },
-- Línea documentada: `extensions = {`.
    extensions = {
-- Línea documentada: `arecibo = {`.
    arecibo = {
-- Línea documentada: `["selected_engine"]   = 'npmjs',`.
    ["selected_engine"]   = 'npmjs',
-- Línea documentada: `["url_open_command"]  = 'xdg-open',`.
    ["url_open_command"]  = 'xdg-open',
-- Línea documentada: `["show_http_headers"] = false,`.
    ["show_http_headers"] = false,
-- Línea documentada: `["show_domain_icons"] = false,`.
    ["show_domain_icons"] = false,
-- Línea documentada: `},`.
  },
-- Línea documentada: `docker = {`.
       docker = {
-- Línea documentada: `theme = "ivy",`.
      theme = "ivy",
-- Línea documentada: `binary = "docker", -- in case you want  to use podman or something`.
      binary = "docker", -- in case you want  to use podman or something
-- Línea documentada: `log_level = vim.log.levels.INFO,`.
      log_level = vim.log.levels.INFO,
-- Línea documentada: `init_term = function(command)`.
      init_term = function(command)
        -- Function used to initialize the terminal with the provided command
        -- by default a new tab with `'term ' .. command` is used.
        -- Example for using Floaterm instead:
-- Línea documentada: `vim.cmd("FloatermNew")`.
        vim.cmd("FloatermNew")
-- Línea documentada: `vim.cmd("FloatermSend " .. command)`.
        vim.cmd("FloatermSend " .. command)
-- Línea documentada: `end`.
      end
-- Línea documentada: `},`.
    },

-- Línea documentada: `command_palette = {`.
    command_palette = {
-- Línea documentada: `{"File",`.
      {"File",
-- Línea documentada: `{ "entire selection (C-a)", ':call feedkeys("GVgg")' },`.
        { "entire selection (C-a)", ':call feedkeys("GVgg")' },
-- Línea documentada: `{ "save current file (C-s)", ':w' },`.
        { "save current file (C-s)", ':w' },
-- Línea documentada: `{ "save all files (C-A-s)", ':wa' },`.
        { "save all files (C-A-s)", ':wa' },
-- Línea documentada: `{ "quit (C-q)", ':qa' },`.
        { "quit (C-q)", ':qa' },
-- Línea documentada: `{ "file browser (C-i)", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },`.
        { "file browser (C-i)", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
-- Línea documentada: `{ "search word (A-w)", ":lua require('telescope.builtin').live_grep()", 1 },`.
        { "search word (A-w)", ":lua require('telescope.builtin').live_grep()", 1 },
-- Línea documentada: `{ "git files (A-f)", ":lua require('telescope.builtin').git_files()", 1 },`.
        { "git files (A-f)", ":lua require('telescope.builtin').git_files()", 1 },
-- Línea documentada: `{ "files (C-f)",     ":lua require('telescope.builtin').find_files()", 1 },`.
        { "files (C-f)",     ":lua require('telescope.builtin').find_files()", 1 },
-- Línea documentada: `},`.
      },
-- Línea documentada: `{"Help",`.
      {"Help",
-- Línea documentada: `{ "tips", ":help tips" },`.
        { "tips", ":help tips" },
-- Línea documentada: `{ "cheatsheet", ":help index" },`.
        { "cheatsheet", ":help index" },
-- Línea documentada: `{ "tutorial", ":help tutor" },`.
        { "tutorial", ":help tutor" },
-- Línea documentada: `{ "summary", ":help summary" },`.
        { "summary", ":help summary" },
-- Línea documentada: `{ "quick reference", ":help quickref" },`.
        { "quick reference", ":help quickref" },
-- Línea documentada: `{ "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },`.
        { "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
-- Línea documentada: `},`.
      },
-- Línea documentada: `{"Vim",`.
      {"Vim",
-- Línea documentada: `{ "reload vimrc", ":source $MYVIMRC" },`.
        { "reload vimrc", ":source $MYVIMRC" },
-- Línea documentada: `{ 'check health', ":checkhealth" },`.
        { 'check health', ":checkhealth" },
-- Línea documentada: `{ "jumps (Alt-j)", ":lua require('telescope.builtin').jumplist()" },`.
        { "jumps (Alt-j)", ":lua require('telescope.builtin').jumplist()" },
-- Línea documentada: `{ "commands", ":lua require('telescope.builtin').commands()" },`.
        { "commands", ":lua require('telescope.builtin').commands()" },
-- Línea documentada: `{ "command history", ":lua require('telescope.builtin').command_history()" },`.
        { "command history", ":lua require('telescope.builtin').command_history()" },
-- Línea documentada: `{ "registers (A-e)", ":lua require('telescope.builtin').registers()" },`.
        { "registers (A-e)", ":lua require('telescope.builtin').registers()" },
-- Línea documentada: `{ "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },`.
        { "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
-- Línea documentada: `{ "vim options", ":lua require('telescope.builtin').vim_options()" },`.
        { "vim options", ":lua require('telescope.builtin').vim_options()" },
-- Línea documentada: `{ "keymaps", ":lua require('telescope.builtin').keymaps()" },`.
        { "keymaps", ":lua require('telescope.builtin').keymaps()" },
-- Línea documentada: `{ "buffers", ":Telescope buffers" },`.
        { "buffers", ":Telescope buffers" },
-- Línea documentada: `{ "search history (C-h)", ":lua require('telescope.builtin').search_history()" },`.
        { "search history (C-h)", ":lua require('telescope.builtin').search_history()" },
-- Línea documentada: `{ "paste mode", ':set paste!' },`.
        { "paste mode", ':set paste!' },
-- Línea documentada: `{ 'cursor line', ':set cursorline!' },`.
        { 'cursor line', ':set cursorline!' },
-- Línea documentada: `{ 'cursor column', ':set cursorcolumn!' },`.
        { 'cursor column', ':set cursorcolumn!' },
-- Línea documentada: `{ "spell checker", ':set spell!' },`.
        { "spell checker", ':set spell!' },
-- Línea documentada: `{ "relative number", ':set relativenumber!' },`.
        { "relative number", ':set relativenumber!' },
-- Línea documentada: `{ "search highlighting (F12)", ':set hlsearch!' },`.
        { "search highlighting (F12)", ':set hlsearch!' },
-- Línea documentada: `}`.
      }
-- Línea documentada: `}`.
    }
-- Línea documentada: `}`.
  }
-- Línea documentada: `}`.
}

-- Línea documentada: `require('telescope').load_extension('gh')`.
require('telescope').load_extension('gh')
-- Línea documentada: `require'telescope'.load_extension('zoxide')`.
require'telescope'.load_extension('zoxide')
-- Línea documentada: `require('telescope').load_extension('bookmarks')`.
require('telescope').load_extension('bookmarks')
-- Línea documentada: `require('telescope').load_extension('heading')`.
require('telescope').load_extension('heading')
-- Línea documentada: `require("telescope").load_extension("vimspector")`.
require("telescope").load_extension("vimspector")
-- Línea documentada: `require('telescope').load_extension('coc')`.
require('telescope').load_extension('coc')
-- Línea documentada: `require'telescope'.load_extension('openbrowser')`.
require'telescope'.load_extension('openbrowser')
-- Línea documentada: `require('telescope').load_extension('command_palette')`.
require('telescope').load_extension('command_palette')
-- Línea documentada: `require('telescope').load_extension('tmuxinator')`.
require('telescope').load_extension('tmuxinator')
-- Línea documentada: `require('telescope').load_extension('media_files')`.
require('telescope').load_extension('media_files')
-- Línea documentada: `require'telescope'.load_extension'z'`.
require'telescope'.load_extension'z'
-- Línea documentada: `require('telescope').load_extension('dap')`.
require('telescope').load_extension('dap')
-- Línea documentada: `require('telescope').load_extension('scaladex')`.
require('telescope').load_extension('scaladex')
-- Línea documentada: `require('telescope').load_extension('changes')`.
require('telescope').load_extension('changes')
-- Línea documentada: `require('telescope').load_extension('ctags_outline')`.
require('telescope').load_extension('ctags_outline')
-- Línea documentada: `require('telescope').load_extension('command_palette')`.
require('telescope').load_extension('command_palette')
-- Línea documentada: `require('telescope').load_extension('env')`.
require('telescope').load_extension('env')
-- require("telescope").load_extension("refactoring")
-- Línea documentada: `require("telescope").load_extension("notify")`.
require("telescope").load_extension("notify")
-- Línea documentada: `require("telescope").load_extension("githubcoauthors")`.
require("telescope").load_extension("githubcoauthors")
-- Línea documentada: `require("telescope").load_extension("lines")`.
require("telescope").load_extension("lines")
-- Línea documentada: `require("telescope").load_extension("undo")`.
require("telescope").load_extension("undo")
-- Línea documentada: `require('browser_bookmarks').setup({`.
require('browser_bookmarks').setup({
-- Línea documentada: `selected_browser = "google_chrome",`.
  selected_browser = "google_chrome",
-- Línea documentada: `url_open_command = "xdg-open",`.
  url_open_command = "xdg-open",
-- Línea documentada: `url_open_plugin = "open_browser"`.
  url_open_plugin = "open_browser"
-- Línea documentada: `})`.
})
-- Línea documentada: `require("telescope").load_extension("docker")`.
require("telescope").load_extension("docker")
-- Línea documentada: `require("telescope").load_extension("emoji")`.
require("telescope").load_extension("emoji")
-- Línea documentada: `require('telescope').load_extension('tailiscope')`.
require('telescope').load_extension('tailiscope')
