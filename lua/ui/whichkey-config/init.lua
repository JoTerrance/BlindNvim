-- Documentación: módulo `lua/ui/whichkey-config/init.lua`.
-- Propósito: define componentes de interfaz de usuario dentro de BlindNvim sin alterar lógica de ejecución.

local wk = require("which-key")

local icons = {
  save = BlindReturn("SAVE", ""),
  search = BlindReturn("SRCH", "󰍉"),
  comment = BlindReturn("COMM", "󰅺"),
  buffers = BlindReturn("BUFS", "󰓩"),
  navigation = BlindReturn("NAV", ""),
  telescope = BlindReturn("TEL", ""),
  tools = BlindReturn("TOOLS", ""),
  cmake = BlindReturn("CMAKE", ""),
  devcontainer = BlindReturn("DEV", ""),
  lazy = BlindReturn("LAZY", "󰒲"),
  database = BlindReturn("DB", "󰆼"),
  mason = BlindReturn("MASON", "󰏖"),
  kubectl = BlindReturn("K8S", ""),
  treesitter = BlindReturn("TS", ""),
  java = BlindReturn("JAVA", ""),
  git = BlindReturn("GIT", ""),
  github = BlindReturn("GH", ""),
  ai = BlindReturn("AI", "󰚩"),
  terminal = BlindReturn("TERM", ""),
  lsp = BlindReturn("LSP", ""),
  debug = BlindReturn("DBG", ""),
  edit = BlindReturn("EDIT", "󰏫"),
  workspace = BlindReturn("WS", "󰙅"),
  format = BlindReturn("FMT", "ﭧ"),
  compiler = BlindReturn("COMP", "󰢚"),
  bookmarks = BlindReturn("BMK", ""),
  open = BlindReturn("OPEN", ""),
  insert = BlindReturn("INS", "󰏪"),
  http = BlindReturn("HTTP", "󰖟"),
  clipboard = BlindReturn("CLIP", ""),
  utilities = BlindReturn("UTIL", "󰘥"),
  focus = BlindReturn("FOCUS", "󰍹"),
  refactor = BlindReturn("REFACTOR", "󰛿"),
  fzf = BlindReturn("FZF", ""),
  flash = BlindReturn("FLASH", ""),
  json = BlindReturn("JSON", "{}"),
  todo = BlindReturn("TODO", "󰄲"),
  undo = BlindReturn("UNDO", ""),
  translate = BlindReturn("TR", ""),
}

local conf = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = BlindReturn(40,20), -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = false, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  icons = {
    breadcrumb = BlindReturn(">", "»"), -- symbol used in the command line area that shows your active key combo
    separator = BlindReturn("->", "➜"), -- symbol used between a key and it's label
    group = BlindReturn("GROUP ", "+"), -- symbol prepended to a group
  },
  keys = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  win = {
    padding = BlindReturn({ 0, 0 }, { 1, 0 }), -- extra window padding [top, right, bottom, left]
    height = BlindReturn({ min = 0.9, max = 0.98 }, { min = 4, max = 25 }),
  },
  layout = {
    height = { min = 100, max = 125 }, -- min and max height of the columns
    width = BlindReturn({ min = 999 }, { min = 20, max = 50 }), -- min and max width of the columns
    spacing = BlindReturn(1, 2), -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  show_help = BlindReturn(false, true), -- show help message on the command line when the popup is visible
  -- Keep a single discoverable root menu: º expands <leader>.
  triggers = {
    { "<leader>", mode = "nxso" },
  },
}
wk.setup(conf)

local Terminal = require('toggleterm.terminal').Terminal
local toggle_float = function()
  local float = Terminal:new({direction = "float"})
  return float:toggle()
end
local toggle_lazygit = function()
  local lazygit = Terminal:new({cmd = 'lazygit', direction = "float"})
  return lazygit:toggle()
end
local dbee = require("dbee")
local devcontainer_commands = require("devcontainer.commands")

local function dbee_execute_query()
  local query = vim.fn.input("Dbee query: ")
  if query ~= "" then
    dbee.execute(query)
  end
end

local function devcontainer_build_attach()
  devcontainer_commands.docker_build_run_and_attach()
end

local function copilot_toggle_auto_trigger()
  require("copilot.suggestion").toggle_auto_trigger()
end

wk.add({
  -- Core
  { "<leader>w", "<cmd>w!<CR>", desc = "Save", icon = { icon = icons.save, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>h", "<cmd>nohlsearch<CR>", desc = "Clear Search Highlight", icon = { icon = icons.search, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>/", "<Plug>(comment_toggle_linewise_current)", desc = "Toggle Comment", icon = { icon = icons.comment, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>/", "<Plug>(comment_toggle_linewise_visual)", desc = "Toggle Comment", mode = "v", icon = { icon = icons.comment, hl = BlindReturn("Normal", "@variable") } },

  -- Buffers
  { "<leader>b", group = "Buffers", icon = { icon = icons.buffers, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>bb", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous" },
  { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next" },
  { "<leader>bf", "<cmd>Telescope buffers<cr>", desc = "Find" },
  { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Jump" },
  { "<leader>bc", "<cmd>bd<cr>", desc = "Close" },
  { "<leader>be", "<cmd>BufferLinePickClose<cr>", desc = "Pick to Close" },
  { "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", desc = "Close Left" },
  { "<leader>bl", "<cmd>BufferLineCloseRight<cr>", desc = "Close Right" },
  { "<leader>bD", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort by Directory" },
  { "<leader>bL", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort by Language" },

  { "<leader>bS", group = "Snacks", icon = { icon = icons.buffers, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>bSb", function() Snacks.picker.buffers() end, desc = "Buffers" },
  { "<leader>bSe", function() Snacks.explorer() end, desc = "Explorer" },
  { "<leader>bSf", function() Snacks.picker.files() end, desc = "Files" },
  { "<leader>bSr", function() Snacks.picker.recent() end, desc = "Recent Files" },

  -- Navigation
  { "<leader>n", group = "Navigation", icon = { icon = icons.navigation, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>no", "<cmd>Oil<CR>", desc = "Oil" },
  { "<leader>nO", "<cmd>Oil --float<CR>", desc = "Oil Float" },
  { "<leader>na", "<cmd>AerialToggle!<CR>", desc = "Aerial Toggle" },
  { "<leader>nA", "<cmd>AerialOpen! right<CR>", desc = "Aerial Right" },
  { "<leader>nB", group = "Bookmarks", icon = { icon = icons.bookmarks, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>nBm", function() require('arrow.persist').toggle() end, desc = "Toggle Bookmark" },
  { "<leader>nBn", function() require('arrow.persist').next() end, desc = "Next Bookmark" },
  { "<leader>nBp", function() require('arrow.persist').previous() end, desc = "Prev Bookmark" },
  { "<leader>nd", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics" },
  { "<leader>nq", "<cmd>Trouble quickfix toggle<CR>", desc = "Quickfix" },
  { "<leader>nl", "<cmd>Trouble loclist toggle<CR>", desc = "Loclist" },
  { "<leader>nr", "<cmd>Trouble lsp_references toggle<CR>", desc = "References" },
  { "<leader>nD", "<cmd>Trouble lsp_definitions toggle<CR>", desc = "Definitions" },
  { "<leader>nu", "<cmd>UrlView<CR>", desc = "URLs" },
  { "<leader>nF", group = "Flash", icon = { icon = icons.flash, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>nFs", function() require('flash').jump() end, desc = "Jump", mode = { "n", "x", "o" } },
  { "<leader>nFT", function() require('flash').treesitter() end, desc = "Treesitter", mode = { "n", "x", "o" } },
  { "<leader>nFr", function() require('flash').remote() end, desc = "Remote", mode = "o" },
  { "<leader>nFR", function() require('flash').treesitter_search() end, desc = "TS Search", mode = { "o", "x" } },

  -- Search
  { "<leader>s", group = "Search", icon = { icon = icons.search, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>sa", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
  { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches" },
  { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
  { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
  { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Files" },
  { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
  { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Highlight Groups" },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
  { "<leader>sl", "<cmd>Telescope lines<cr>", desc = "Lines" },
  { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
  { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
  { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
  { "<leader>sp", "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", desc = "Colorscheme Preview" },
  { "<leader>sP", group = "Replace", icon = { icon = icons.refactor, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>sPt", "<cmd>lua require('spectre').toggle()<cr>", desc = "Toggle Panel" },
  { "<leader>sPw", "<cmd>lua require('spectre').open_visual({ select_word = true })<cr>", desc = "Current Word" },
  { "<leader>sPF", "<cmd>lua require('spectre').open_file_search({ select_word = true })<cr>", desc = "Current File" },
  { "<leader>sPr", "<cmd>lua require('spectre').open()<cr>", desc = "Project Replace" },
  { "<leader>sPv", "<cmd>lua require('spectre').open_visual()<cr>", desc = "Visual Selection", mode = "v" },
  { "<leader>sF", group = "FZF", icon = { icon = icons.fzf, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>sFf", "<cmd>FzfLua files<cr>", desc = "Files" },
  { "<leader>sFb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
  { "<leader>sFg", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep" },
  { "<leader>sFr", "<cmd>FzfLua resume<cr>", desc = "Resume" },
  { "<leader>sT", group = "TODO", icon = { icon = icons.todo, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>sTt", "<cmd>TodoTelescope<cr>", desc = "Telescope" },
  { "<leader>sTq", "<cmd>TodoQuickFix<cr>", desc = "Quickfix" },
  { "<leader>sTl", "<cmd>TodoLocList<cr>", desc = "Loclist" },
  { "<leader>sTn", "]t", desc = "Next" },
  { "<leader>sTp", "[t", desc = "Prev" },
  { "<leader>sX", group = "Telescope Extras", icon = { icon = icons.telescope, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>sXb", "<cmd>Telescope bookmarks<cr>", desc = "Bookmarks" },
  { "<leader>sXd", "<cmd>Telescope docker<cr>", desc = "Docker" },
  { "<leader>sXe", "<cmd>Telescope emoji<cr>", desc = "Emoji" },
  { "<leader>sXE", "<cmd>Telescope env<cr>", desc = "Env" },
  { "<leader>sXg", "<cmd>Telescope gh<cr>", desc = "GitHub" },
  { "<leader>sXh", "<cmd>Telescope heading<cr>", desc = "Headings" },
  { "<leader>sXl", "<cmd>Telescope lines<cr>", desc = "Lines" },
  { "<leader>sXm", "<cmd>Telescope media_files<cr>", desc = "Media Files" },
  { "<leader>sXn", "<cmd>Telescope notify<cr>", desc = "Notifications" },
  { "<leader>sXo", "<cmd>Telescope openbrowser<cr>", desc = "Open Browser" },
  { "<leader>sXt", "<cmd>Telescope tmux<cr>", desc = "Tmux" },
  { "<leader>sXT", "<cmd>Telescope tmuxinator<cr>", desc = "Tmuxinator" },
  { "<leader>sXu", "<cmd>Telescope undo<cr>", desc = "Undo" },
  { "<leader>sXv", "<cmd>Telescope vimspector<cr>", desc = "Vimspector" },
  { "<leader>sXx", "<cmd>Telescope changes<cr>", desc = "Changes" },
  { "<leader>sXz", "<cmd>Telescope z<cr>", desc = "Zoxide" },
  { "<leader>sXO", "<cmd>Telescope ctags_outline<cr>", desc = "CTags Outline" },

  { "<leader>sN", group = "Snacks", icon = { icon = icons.search, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>sNb", function() Snacks.picker.buffers() end, desc = "Buffers" },
  { "<leader>sNc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Config Files" },
  { "<leader>sNd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
  { "<leader>sNe", function() Snacks.explorer() end, desc = "Explorer" },
  { "<leader>sNf", function() Snacks.picker.files() end, desc = "Files" },
  { "<leader>sNg", function() Snacks.picker.grep() end, desc = "Live Grep" },
  { "<leader>sNh", function() Snacks.picker.help() end, desc = "Help Pages" },
  { "<leader>sNk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
  { "<leader>sNl", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
  { "<leader>sNp", function() Snacks.picker.projects() end, desc = "Projects" },
  { "<leader>sNr", function() Snacks.picker.recent() end, desc = "Recent Files" },
  { "<leader>sNs", function() Snacks.picker.search_history() end, desc = "Search History" },
  { "<leader>sNq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
  { "<leader>sNu", function() Snacks.picker.undo() end, desc = "Undo History" },
  { "<leader>sNw", function() Snacks.picker.grep_word() end, desc = "Word Search", mode = { "n", "x" } },

  -- Languages
  { "<leader>L", group = "Languages" },

  -- Tools
  { "<leader>t", group = "Tools", icon = { icon = icons.tools, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>tC", group = "CMake", icon = { icon = icons.cmake, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>tCb", "<cmd>CMakeBuild<cr>", desc = "Build" },
  { "<leader>tCc", "<cmd>CMakeClean<cr>", desc = "Clean" },
  { "<leader>tCd", "<cmd>CMakeDebug<cr>", desc = "Debug" },
  { "<leader>tCg", "<cmd>CMakeGenerate<cr>", desc = "Generate" },
  { "<leader>tCr", "<cmd>CMakeRun<cr>", desc = "Run" },
  { "<leader>tCs", "<cmd>CMakeSelectBuildTarget<cr>", desc = "Select Target" },
  { "<leader>tD", group = "DevContainer", icon = { icon = icons.devcontainer, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>tDa", "<cmd>DevcontainerAttach<cr>", desc = "Attach" },
  { "<leader>tDb", devcontainer_build_attach, desc = "Build & Attach" },
  { "<leader>tDc", "<cmd>DevcontainerStart<cr>", desc = "Start" },
  { "<leader>tDe", "<cmd>DevcontainerExec<cr>", desc = "Exec" },
  { "<leader>tDl", "<cmd>DevcontainerLogs<cr>", desc = "Logs" },
  { "<leader>tDo", "<cmd>DevcontainerEditNearestConfig<cr>", desc = "Open Config" },
  { "<leader>tDr", "<cmd>DevcontainerRemoveAll<cr>", desc = "Remove All" },
  { "<leader>tDS", "<cmd>DevcontainerStopAll<cr>", desc = "Stop All" },
  { "<leader>tDs", "<cmd>DevcontainerStop<cr>", desc = "Stop" },
  { "<leader>tDt", "<cmd>DevcontainerStart<cr>", desc = "Restart" },
  { "<leader>tL", group = "Lazy", icon = { icon = icons.lazy, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>tLo", "<cmd>Lazy<cr>", desc = "Open" },
  { "<leader>tLs", "<cmd>Lazy sync<cr>", desc = "Sync" },
  { "<leader>tLu", "<cmd>Lazy update<cr>", desc = "Update" },
  { "<leader>tLc", "<cmd>Lazy clean<cr>", desc = "Clean" },
  { "<leader>tLi", "<cmd>Lazy install<cr>", desc = "Install" },
  { "<leader>tR", group = "References", icon = { icon = icons.refactor, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>tRt", "<cmd>ReferencerToggle<cr>", desc = "Toggle Inline" },
  { "<leader>tRu", "<cmd>ReferencerUpdate<cr>", desc = "Update Inline" },
  { "<leader>tX", group = "Compiler", icon = { icon = icons.compiler, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>tXo", "<cmd>CompilerOpen<cr>", desc = "Open" },
  { "<leader>tXt", "<cmd>CompilerToggleResults<cr>", desc = "Toggle Results" },
  { "<leader>tXr", "<cmd>CompilerRedo<cr>", desc = "Redo" },
  { "<leader>tXs", "<cmd>CompilerStop<cr>", desc = "Stop Tasks" },
  { "<leader>tM", group = "Mason", icon = { icon = icons.mason, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>tMo", "<cmd>Mason<cr>", desc = "Open" },
  { "<leader>tMi", "<cmd>MasonInstall<cr>", desc = "Install" },
  { "<leader>tMu", "<cmd>MasonUpdate<cr>", desc = "Update" },
  { "<leader>tMl", "<cmd>MasonLog<cr>", desc = "Log" },
  { "<leader>tMc", "<cmd>MasonUninstall<cr>", desc = "Uninstall" },
  { "<leader>tK", group = "Kubectl", icon = { icon = icons.kubectl, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>tKm", "<cmd>Kubectl<cr>", desc = "Main Menu" },
  { "<leader>tKp", "<cmd>Kubectl pods<cr>", desc = "Pods" },
  { "<leader>tKs", "<cmd>Kubectl services<cr>", desc = "Services" },
  { "<leader>tKd", "<cmd>Kubectl deployments<cr>", desc = "Deployments" },
  { "<leader>tKn", "<cmd>Kubectl namespaces<cr>", desc = "Namespaces" },
  { "<leader>tH", group = "HTTP", icon = { icon = icons.http, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>tHa", "<cmd>Hyper<cr>", desc = "Open Request" },
  { "<leader>tHi", "<cmd>HyperJump<cr>", desc = "Jump Request" },

  -- Database
  { "<leader>td", group = "Database", icon = { icon = icons.database, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>tdb", "<cmd>DBUI<cr>", desc = "Dadbod UI" },
  { "<leader>tdi", "<cmd>Dbee<cr>", desc = "Toggle UI" },
  { "<leader>tdo", "<cmd>Dbee open<cr>", desc = "Open UI" },
  { "<leader>tdc", "<cmd>Dbee close<cr>", desc = "Close UI" },
  { "<leader>tdq", dbee_execute_query, desc = "Execute Query" },
  { "<leader>tds", "<cmd>Dbee store<cr>", desc = "Store Result" },

  -- Treesitter
  { "<leader>tt", group = "Treesitter", icon = { icon = icons.treesitter, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>tti", "<cmd>InspectTree<cr>", desc = "Inspect Tree" },
  { "<leader>ttp", "<cmd>Inspect<cr>", desc = "Inspect" },
  { "<leader>ttm", "<cmd>TSManager<cr>", desc = "Parser Manager" },
  { "<leader>ttr", "<cmd>TSInstall<cr>", desc = "Install Parser" },
  { "<leader>ttx", "<cmd>TSUninstall<cr>", desc = "Remove Parser" },

  -- Git
  { "<leader>tg", group = "Git", icon = icons.git },
  { "<leader>tgS", group = "Snacks", icon = { icon = icons.git, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>tgSb", function() Snacks.picker.git_branches() end, desc = "Branches" },
  { "<leader>tgSd", function() Snacks.picker.git_diff() end, desc = "Diff" },
  { "<leader>tgSf", function() Snacks.picker.git_files() end, desc = "Files" },
  { "<leader>tgSg", function() Snacks.picker.git_grep() end, desc = "Grep" },
  { "<leader>tgSl", function() Snacks.picker.git_log() end, desc = "Log" },
  { "<leader>tgSs", function() Snacks.picker.git_status() end, desc = "Status" },
  { "<leader>tgSt", function() Snacks.picker.git_stash() end, desc = "Stash" },
  { "<leader>tgb", "<cmd>Telescope git_branches<cr>", desc = "Checkout Branch" },
  { "<leader>tgc", "<cmd>Telescope git_commits<cr>", desc = "Checkout Commit" },
  { "<leader>tgC", "<cmd>Telescope git_bcommits<cr>", desc = "Current File Commit" },
  { "<leader>tgd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
  { "<leader>tgj", "<cmd>lua require('gitsigns').next_hunk()<cr>", desc = "Next Hunk" },
  { "<leader>tgk", "<cmd>lua require('gitsigns').prev_hunk()<cr>", desc = "Prev Hunk" },
  { "<leader>tgl", "<cmd>lua require('gitsigns').blame_line()<cr>", desc = "Blame" },
  { "<leader>tgp", "<cmd>lua require('gitsigns').preview_hunk()<cr>", desc = "Preview Hunk" },
  { "<leader>tgr", "<cmd>lua require('gitsigns').reset_hunk()<cr>", desc = "Reset Hunk" },
  { "<leader>tgR", "<cmd>lua require('gitsigns').reset_buffer()<cr>", desc = "Reset Buffer" },
  { "<leader>tgs", "<cmd>lua require('gitsigns').stage_hunk()<cr>", desc = "Stage Hunk" },
  { "<leader>tgu", "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", desc = "Undo Stage" },
  { "<leader>tgo", "<cmd>Telescope git_status<cr>", desc = "Changed Files" },
  { "<leader>tgF", group = "Fugit2", icon = icons.git },
  { "<leader>tgFo", "<cmd>Fugit2<cr>", desc = "Open" },
  { "<leader>tgFg", "<cmd>Fugit2Graph<cr>", desc = "Graph" },
  { "<leader>tgFd", "<cmd>Fugit2Diff<cr>", desc = "Diff" },
  { "<leader>tgI", "<cmd>Gitignore!<cr>", desc = "Overwrite .gitignore" },
  { "<leader>tgi", "<cmd>Gitignore<cr>", desc = "Generate .gitignore" },
  { "<leader>tgW", group = "Worktrees", icon = icons.git },
  { "<leader>tgWw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", desc = "List Worktrees" },
  { "<leader>tgWc", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", desc = "Create Worktree" },
  { "<leader>tgG", group = "Git Commands", icon = icons.git },
  { "<leader>tgGa", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage Hunk" },
  { "<leader>tgGb", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
  { "<leader>tgGc", "<cmd>Fugit2<cr>", desc = "Open Fugit2" },
  { "<leader>tgGd", "<cmd>DiffviewOpen<cr>", desc = "Diffview" },
  { "<leader>tgGh", "<cmd>DiffviewFileHistory<cr>", desc = "History" },
  { "<leader>tgO", group = "GitHub", icon = icons.github },
  { "<leader>tgOi", "<cmd>Octo issue list<cr>", desc = "Issues" },
  { "<leader>tgOp", "<cmd>Octo pr list<cr>", desc = "Pull Requests" },
  { "<leader>tgOc", "<cmd>Telescope githubcoauthors<cr>", desc = "Coauthors" },

  -- AI
  { "<leader>a", group = "AI", icon = icons.ai },
  { "<leader>aa", "<cmd>AvanteAsk<cr>", desc = "Ask" },
  { "<leader>ac", "<cmd>AvanteChat<cr>", desc = "Chat" },
  { "<leader>ae", "<cmd>AvanteEdit<cr>", desc = "Edit" },
  { "<leader>ah", "<cmd>AvanteHistory<cr>", desc = "History" },
  { "<leader>am", "<cmd>AvanteModels<cr>", desc = "Models" },
  { "<leader>aM", group = "MCPHub", icon = icons.ai },
  { "<leader>aMo", "<cmd>MCPHub<cr>", desc = "Open" },
  { "<leader>ai", group = "Copilot", icon = icons.ai },
  { "<leader>aip", "<cmd>Copilot panel<cr>", desc = "Panel" },
  { "<leader>aie", "<cmd>Copilot enable<cr>", desc = "Enable" },
  { "<leader>aid", "<cmd>Copilot disable<cr>", desc = "Disable" },
  { "<leader>ais", "<cmd>Copilot status<cr>", desc = "Status" },
  { "<leader>ait", copilot_toggle_auto_trigger, desc = "Toggle Auto Trigger" },

  -- Terminal
  { "<leader>T", group = "Terminal", icon = icons.terminal },
  { "<leader>Tf", toggle_float, desc = "Floating" },
  { "<leader>Tl", toggle_lazygit, desc = "LazyGit" },
  { "<leader>Tt", ":ToggleTerm<cr>", desc = "Split Below" },

  { "<leader>TS", group = "Snacks", icon = { icon = icons.terminal, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>TSt", function() Snacks.terminal.toggle() end, desc = "Toggle Terminal" },
  { "<leader>TSo", function() Snacks.terminal.open() end, desc = "Open Terminal" },
  { "<leader>TSf", function() Snacks.terminal.focus() end, desc = "Focus Terminal" },

  -- LSP
  { "<leader>l", group = "LSP", icon = icons.lsp },
  { "<leader>lS", group = "Snacks", icon = { icon = icons.lsp, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>lSd", function() Snacks.picker.lsp_definitions() end, desc = "Definitions" },
  { "<leader>lSi", function() Snacks.picker.lsp_implementations() end, desc = "Implementations" },
  { "<leader>lSl", function() Snacks.picker.lsp_declarations() end, desc = "Declarations" },
  { "<leader>lSr", function() Snacks.picker.lsp_references() end, desc = "References" },
  { "<leader>lSs", function() Snacks.picker.lsp_symbols() end, desc = "Document Symbols" },
  { "<leader>lSt", function() Snacks.picker.lsp_type_definitions() end, desc = "Type Definitions" },
  { "<leader>lSW", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Workspace Symbols" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
  { "<leader>lb", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", desc = "Buffer Diagnostics" },
  { "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Definition" },
  { "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Declaration" },
  { "<leader>le", vim.diagnostic.open_float, desc = "Line Diagnostics" },
  { "<leader>lf", "<cmd>Telescope quickfix<cr>", desc = "Quickfix" },
  { "<leader>lh", vim.lsp.buf.hover, desc = "Hover" },
  { "<leader>lI", "<cmd>LspInfo<cr>", desc = "Info" },
  { "<leader>lJ", vim.diagnostic.goto_next, desc = "Next Diagnostic" },
  { "<leader>lK", vim.diagnostic.goto_prev, desc = "Prev Diagnostic" },
  { "<leader>lk", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature Help" },
  { "<leader>lL", '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', desc = "Workspace Folders" },
  { "<leader>lM", "<cmd>Mason<cr>", desc = "Mason" },
  { "<leader>ln", vim.diagnostic.goto_next, desc = "Next Error" },
  { "<leader>lN", vim.diagnostic.goto_prev, desc = "Prev Error" },
  { "<leader>lq", vim.diagnostic.setloclist, desc = "Loclist" },
  { "<leader>lr", vim.lsp.buf.rename, desc = "Rename" },
  { "<leader>lR", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "References" },
  { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
  { "<leader>lW", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
  { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
  { "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Type Definition" },
  { "<leader>lv", "<cmd>lua require('lsp_lines').toggle()<cr>", desc = "Virtual Lines" },
  { "<leader>ll", vim.lsp.codelens.run, desc = "CodeLens" },
  { "<leader>lF", group = "Refactor", icon = icons.refactor },
  { "<leader>lFS", "<cmd>lua require('refactoring').select_refactor()<CR>", desc = "Select" },
  { "<leader>lFb", "<cmd>lua require('refactoring').refactor('Extract Block')<CR>", desc = "Extract Block" },
  { "<leader>lFB", "<cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", desc = "Extract Block File" },
  { "<leader>lFl", "<cmd>lua require('refactoring').refactor('Extract Local')<CR>", desc = "Extract Local" },
  { "<leader>lFm", "<cmd>lua require('refactoring').refactor('Extract Method')<CR>", desc = "Extract Method" },
  { "<leader>lFL", "<cmd>lua require('refactoring').refactor('Inline Local')<CR>", desc = "Inline Local" },
  { "<leader>lFV", "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", desc = "Inline Variable" },
  { "<leader>lFM", "<cmd>lua require('refactoring').refactor('Inline Method')<CR>", desc = "Inline Method" },
  { "<leader>lFR", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },

  -- Debug
  { "<leader>d", group = "Debug", icon = icons.debug },
  { "<leader>dS", group = "Snacks", icon = { icon = icons.debug, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>dSb", function() Snacks.debug.backtrace() end, desc = "Backtrace" },
  { "<leader>dSr", function() Snacks.debug.run() end, desc = "Run Buffer" },
  { "<leader>dSm", function() Snacks.debug.metrics() end, desc = "Metrics" },
  { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "Toggle Breakpoint" },
  { "<leader>dB", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", desc = "Conditional Breakpoint" },
  { "<leader>dc", "<cmd>lua require('dap').clear_breakpoints()<CR>", desc = "Clear Breakpoints" },
  { "<leader>dd", "<cmd>lua require('dap').continue()<CR>", desc = "Continue" },
  { "<leader>dl", "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", desc = "Log Point" },
  { "<leader>dn", "<cmd>lua require('dap').step_over()<CR>", desc = "Step Over" },
  { "<leader>do", "<cmd>lua require('dap').step_out()<CR>", desc = "Step Out" },
  { "<leader>dr", "<cmd>lua require('dap').repl.open()<CR>", desc = "Repl" },
  { "<leader>dR", "<cmd>lua require('dap').run_last()<CR>", desc = "Run Last" },
  { "<leader>ds", "<cmd>lua require('dap').stop()<CR>", desc = "Stop" },
  { "<leader>di", "<cmd>lua require('dap').step_into()<CR>", desc = "Step Into" },
  { "<leader>dv", "<cmd>DapVirtualTextToggle<cr>", desc = "Virtual Text" },
  { "<leader>dD", group = "DapUI", icon = icons.debug },
  { "<leader>dDb", "<cmd>lua require('dapui').float_element('breakpoints')<CR>", desc = "Breakpoints" },
  { "<leader>dDc", "<cmd>lua require('dapui').close()<CR>", desc = "Close" },
  { "<leader>dDf", "<cmd>lua require('dapui').float_element('frames')<CR>", desc = "Frames" },
  { "<leader>dDh", "<cmd>lua require('dapui').float_element('hover')<CR>", desc = "Hover" },
  { "<leader>dDl", "<cmd>lua require('dapui').float_element('locals')<CR>", desc = "Locals" },
  { "<leader>dDo", "<cmd>lua require('dapui').open()<CR>", desc = "Open" },
  { "<leader>dDS", "<cmd>lua require('dapui').float_element('stacks')<CR>", desc = "Stacks" },
  { "<leader>dDs", "<cmd>lua require('dapui').float_element('scopes')<CR>", desc = "Scopes" },
  { "<leader>dDT", "<cmd>lua require('dapui').float_element('threads')<CR>", desc = "Threads" },
  { "<leader>dDw", "<cmd>lua require('dapui').float_element('watch')<CR>", desc = "Watch" },
  { "<leader>dDt", "<cmd>lua require('dapui').toggle()<CR>", desc = "Toggle" },

  -- Edit
  { "<leader>e", group = "Edit", icon = icons.edit },
  { "<leader>ed", ":call DeleteTrailingWhitespace()<CR>", desc = "Trim Trailing Whitespace" },
  { "<leader>eh", ":move <left>", desc = "Move Char Left" },
  { "<leader>ej", ":move .+1<CR>==", desc = "Move Line Down" },
  { "<leader>ek", ":move .-2<CR>==", desc = "Move Line Up" },
  { "<leader>el", ":move <right>", desc = "Move Char Right" },
  { "<leader>eH", ":m <", desc = "Move Line Left" },
  { "<leader>eJ", ":m .+1<CR>==", desc = "Move Line Down" },
  { "<leader>eK", ":m .-2<CR>==", desc = "Move Line Up" },
  { "<leader>eL", ":m >", desc = "Move Line Right" },
  { "<leader>eu", "<cmd>UndotreeToggle<cr>", desc = "Undo Tree", icon = icons.undo },
  { "<leader>et", "<cmd>TranslateW<cr>", desc = "Translate Word", icon = icons.translate },
  { "<leader>eC", group = "Clipboard", icon = icons.clipboard },
  { "<leader>eCc", "<cmd>Telescope neoclip<cr>", desc = "Clipboard History" },
  { "<leader>eS", group = "Structural Replace", icon = icons.refactor },
  { "<leader>eSs", "<cmd>lua require('ssr').open()<cr>", desc = "Structural Replace" },
  { "<leader>eM", group = "Muren", icon = icons.refactor },
  { "<leader>eMo", "<cmd>MurenOpen<cr>", desc = "Open" },
  { "<leader>eMt", "<cmd>MurenToggle<cr>", desc = "Toggle" },
  { "<leader>eMf", "<cmd>MurenFresh<cr>", desc = "Fresh" },
  { "<leader>eMu", "<cmd>MurenUnique<cr>", desc = "Unique" },

  -- Workspace
  { "<leader>W", group = "Workspace", icon = icons.workspace },
  { "<leader>WA", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", desc = "Add Folder" },
  { "<leader>WR", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", desc = "Remove Folder" },
  { "<leader>Wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", desc = "List Folders" },

  -- Format
  { "<leader>f", group = "Format", icon = icons.format },
  { "<leader>ff", "<cmd>lua require('conform').format({ async = true, lsp_format = 'fallback' })<cr>", desc = "Format Buffer" },
  { "<leader>fi", "<cmd>ConformInfo<cr>", desc = "Conform Info" },

  -- Open
  { "<leader>o", group = "Open", icon = icons.open },
  { "<leader>oo", "<cmd>Oil<cr>", desc = "Open" },
  { "<leader>oa", "<cmd>Oil --float<cr>", desc = "Float" },
  { "<leader>oc", function() vim.cmd("Oil " .. vim.fn.fnameescape(vim.fn.expand("%:p:h"))) end, desc = "Current Dir" },
  { "<leader>oe", "<cmd>edit %<cr>", desc = "Open File" },
  { "<leader>os", "<cmd>split<cr>", desc = "Split" },
  { "<leader>ov", "<cmd>vsplit<cr>", desc = "Vertical Split" },
  { "<leader>ot", "<cmd>tabnew<cr>", desc = "Tab" },
  { "<leader>ow", "<cmd>new<cr>", desc = "Window" },

  { "<leader>oS", group = "Snacks", icon = { icon = icons.open, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>oSe", function() Snacks.explorer() end, desc = "Explorer" },
  { "<leader>oSf", function() Snacks.picker.files() end, desc = "Files" },
  { "<leader>oSc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Config Files" },
  { "<leader>oSr", function() Snacks.picker.recent() end, desc = "Recent Files" },

  -- Utilities
  { "<leader>tU", group = "Utilities", icon = icons.utilities },
  { "<leader>tUS", group = "Snacks", icon = { icon = icons.utilities, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>tUSa", function() Snacks.picker() end, desc = "All Pickers" },
  { "<leader>tUSh", function() Snacks.notifier.show_history() end, desc = "Notification History" },
  { "<leader>tUSs", function() Snacks.scratch() end, desc = "Scratch Buffer" },
  { "<leader>tUSS", function() Snacks.scratch.select() end, desc = "Select Scratch" },
  { "<leader>tUSt", function() Snacks.terminal.toggle() end, desc = "Terminal" },
  { "<leader>tUb", "<cmd>Bloat<cr>", desc = "Plugin Bloat" },
  { "<leader>tUj", group = "Jqx", icon = { icon = icons.json, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>tUjl", "<cmd>JqxList<cr>", desc = "List Keys" },
  { "<leader>tUjq", "<cmd>JqxQuery ", desc = "Query" },
  { "<leader>tUo", "<cmd>Orphans<cr>", desc = "Orphans" },

  -- Focus
  { "<leader>z", group = "Focus", icon = icons.focus },
  { "<leader>zt", ":Twilight<cr>", desc = "Toggle Twilight" },
  { "<leader>zz", ":ZenMode<cr>", desc = "Toggle Zen Mode" },

  -- Visual mode mappings
  { "<leader>l", group = "LSP", mode = "v", icon = icons.lsp },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", mode = "v" },
  { "<leader>lv", "<cmd>lua require('lsp_lines').toggle()<cr>", desc = "Virtual Lines", mode = "v" },
  { "<leader>/", "<Plug>(comment_toggle_linewise_visual)", desc = "Toggle Comment", mode = "v" },

  { "<leader>R", group = "Refactor", mode = "v", icon = icons.refactor },
  { "<leader>Rb", "<cmd>lua require('refactoring').refactor('Extract Block')<CR>", desc = "Extract Block", mode = "v" },
  { "<leader>RB", "<cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", desc = "Extract Block File", mode = "v" },
  { "<leader>Rf", "<cmd>lua require('refactoring').refactor('Extract Function')<CR>", desc = "Extract Function", mode = "v" },
  { "<leader>RF", "<cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", desc = "Extract Function File", mode = "v" },
  { "<leader>Rl", "<cmd>lua require('refactoring').refactor('Extract Local')<CR>", desc = "Extract Local", mode = "v" },
  { "<leader>Rm", "<cmd>lua require('refactoring').refactor('Extract Method')<CR>", desc = "Extract Method", mode = "v" },
  { "<leader>Rv", "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>", desc = "Extract Variable", mode = "v" },
  { "<leader>RL", "<cmd>lua require('refactoring').refactor('Inline Local')<CR>", desc = "Inline Local", mode = "v" },
  { "<leader>RM", "<cmd>lua require('refactoring').refactor('Inline Method')<CR>", desc = "Inline Method", mode = "v" },
  { "<leader>RS", "<cmd>lua require('refactoring').select_refactor()<CR>", desc = "Select", mode = "v" },
  { "<leader>RV", "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", desc = "Inline Variable", mode = "v" },
  { "<leader>RR", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename", mode = "v" },

})
