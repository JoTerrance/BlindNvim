-- Documentación: módulo `lua/navigation/telescope-config/init.lua`.
-- Propósito: define herramientas de navegación y búsqueda dentro de BlindNvim sin alterar lógica de ejecución.

local actions = require('telescope.actions')
local defaults = {
    layout_config = {
      width = BlindReturn(0.99, 0.75),
      height = BlindReturn(0.99, 0.75),
      prompt_position = "top",
      preview_cutoff = BlindReturn(999, 50),
      horizontal = {mirror = false},
      vertical = {mirror = false},
    },
    previewer = BlindReturn(false, true),
    find_command = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
    prompt_prefix = BlindReturn("query: ", " "),
    selection_caret = BlindReturn(">", " "),
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "vertical",
    file_sorter = require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =require'telescope.sorters'.get_generic_fuzzy_sorter,
    path_display = {},
    winblend = 0,
    border = {},
    borderchars = BlindReturn({'', '', '', '', '', '', '', ''}, {'─', '│', '─', '│', '╭', '╮', '╯', '╰'}),
    color_devicons = BlindReturn(false, true),
    use_less = true,
    set_env = {['COLORTERM'] = 'truecolor'},
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    mappings = {
        i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            ["<esc>"] = actions.close,
            ["<CR>"] = actions.select_default + actions.center
        },
        n = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        }
    }
}

require('telescope').setup {
    defaults = defaults,
    extensions = {
    arecibo = {
    ["selected_engine"]   = 'npmjs',
    ["url_open_command"]  = 'xdg-open',
    ["show_http_headers"] = false,
    ["show_domain_icons"] = false,
  },
       docker = {
      theme = "ivy",
      binary = "docker", -- in case you want  to use podman or something
      log_level = vim.log.levels.INFO,
      init_term = function(command)
        -- Function used to initialize the terminal with the provided command
        -- by default a new tab with `'term ' .. command` is used.
        -- Example for using Floaterm instead:
        vim.cmd("FloatermNew")
        vim.cmd("FloatermSend " .. command)
      end
    },

    command_palette = {
      {"File",
        { "entire selection (C-a)", ':call feedkeys("GVgg")' },
        { "save current file (C-s)", ':w' },
        { "save all files (C-A-s)", ':wa' },
        { "quit (C-q)", ':qa' },
        { "file browser (C-i)", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
        { "search word (A-w)", ":lua require('telescope.builtin').live_grep()", 1 },
        { "git files (A-f)", ":lua require('telescope.builtin').git_files()", 1 },
        { "files (C-f)",     ":lua require('telescope.builtin').find_files()", 1 },
      },
      {"Help",
        { "tips", ":help tips" },
        { "cheatsheet", ":help index" },
        { "tutorial", ":help tutor" },
        { "summary", ":help summary" },
        { "quick reference", ":help quickref" },
        { "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
      },
      {"Vim",
        { "reload vimrc", ":source $MYVIMRC" },
        { 'check health', ":checkhealth" },
        { "jumps (Alt-j)", ":lua require('telescope.builtin').jumplist()" },
        { "commands", ":lua require('telescope.builtin').commands()" },
        { "command history", ":lua require('telescope.builtin').command_history()" },
        { "registers (A-e)", ":lua require('telescope.builtin').registers()" },
        { "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
        { "vim options", ":lua require('telescope.builtin').vim_options()" },
        { "keymaps", ":lua require('telescope.builtin').keymaps()" },
        { "buffers", ":Telescope buffers" },
        { "search history (C-h)", ":lua require('telescope.builtin').search_history()" },
        { "paste mode", ':set paste!' },
        { 'cursor line', ':set cursorline!' },
        { 'cursor column', ':set cursorcolumn!' },
        { "spell checker", ':set spell!' },
        { "relative number", ':set relativenumber!' },
        { "search highlighting (F12)", ':set hlsearch!' },
      }
    }
  }
}

local function load_telescope_extensions()
  local telescope = require('telescope')
  local extensions = {
    'zoxide',
    'bookmarks',
    'heading',
    'vimspector',
    'coc',
    'openbrowser',
    'command_palette',
    'tmuxinator',
    'media_files',
    'dap',
    'changes',
    'ctags_outline',
    'env',
    'notify',
    'lines',
    'undo',
    'neoclip',
  }

  for _, extension in ipairs(extensions) do
    telescope.load_extension(extension)
  end

  if vim.fn.executable('gh') == 1 then
    for _, extension in ipairs({ 'gh', 'githubcoauthors' }) do
      pcall(telescope.load_extension, extension)
    end
  end
end

load_telescope_extensions()
require('browser_bookmarks').setup({
  selected_browser = "google_chrome",
  url_open_command = "xdg-open",
  url_open_plugin = "open_browser"
})
require("telescope").load_extension("docker")
require("telescope").load_extension("emoji")
require('telescope').load_extension('tailiscope')
