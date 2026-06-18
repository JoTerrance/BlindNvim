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

  -- Languages
  { "<leader>L", group = "Languages" },

  -- Tools
  { "<leader>u", group = "Tools", icon = { icon = icons.tools, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>uC", group = "CMake", icon = { icon = icons.cmake, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>uCb", "<cmd>CMakeBuild<cr>", desc = "Build" },
  { "<leader>uCc", "<cmd>CMakeClean<cr>", desc = "Clean" },
  { "<leader>uCd", "<cmd>CMakeDebug<cr>", desc = "Debug" },
  { "<leader>uCg", "<cmd>CMakeGenerate<cr>", desc = "Generate" },
  { "<leader>uCr", "<cmd>CMakeRun<cr>", desc = "Run" },
  { "<leader>uCs", "<cmd>CMakeSelectBuildTarget<cr>", desc = "Select Target" },
  { "<leader>uD", group = "DevContainer", icon = { icon = icons.devcontainer, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>uDa", "<cmd>DevcontainerAttach<cr>", desc = "Attach" },
  { "<leader>uDb", devcontainer_build_attach, desc = "Build & Attach" },
  { "<leader>uDc", "<cmd>DevcontainerStart<cr>", desc = "Start" },
  { "<leader>uDe", "<cmd>DevcontainerExec<cr>", desc = "Exec" },
  { "<leader>uDl", "<cmd>DevcontainerLogs<cr>", desc = "Logs" },
  { "<leader>uDo", "<cmd>DevcontainerEditNearestConfig<cr>", desc = "Open Config" },
  { "<leader>uDr", "<cmd>DevcontainerRemoveAll<cr>", desc = "Remove All" },
  { "<leader>uDS", "<cmd>DevcontainerStopAll<cr>", desc = "Stop All" },
  { "<leader>uDs", "<cmd>DevcontainerStop<cr>", desc = "Stop" },
  { "<leader>uDt", "<cmd>DevcontainerStart<cr>", desc = "Restart" },
  { "<leader>uL", group = "Lazy", icon = { icon = icons.lazy, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>uLo", "<cmd>Lazy<cr>", desc = "Open" },
  { "<leader>uLs", "<cmd>Lazy sync<cr>", desc = "Sync" },
  { "<leader>uLu", "<cmd>Lazy update<cr>", desc = "Update" },
  { "<leader>uLc", "<cmd>Lazy clean<cr>", desc = "Clean" },
  { "<leader>uLi", "<cmd>Lazy install<cr>", desc = "Install" },
  { "<leader>uR", group = "References", icon = { icon = icons.refactor, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>uRt", "<cmd>ReferencerToggle<cr>", desc = "Toggle Inline" },
  { "<leader>uRu", "<cmd>ReferencerUpdate<cr>", desc = "Update Inline" },
  { "<leader>uX", group = "Compiler", icon = { icon = icons.compiler, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>uXo", "<cmd>CompilerOpen<cr>", desc = "Open" },
  { "<leader>uXt", "<cmd>CompilerToggleResults<cr>", desc = "Toggle Results" },
  { "<leader>uXr", "<cmd>CompilerRedo<cr>", desc = "Redo" },
  { "<leader>uXs", "<cmd>CompilerStop<cr>", desc = "Stop Tasks" },
  { "<leader>uM", group = "Mason", icon = { icon = icons.mason, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>uMo", "<cmd>Mason<cr>", desc = "Open" },
  { "<leader>uMi", "<cmd>MasonInstall<cr>", desc = "Install" },
  { "<leader>uMu", "<cmd>MasonUpdate<cr>", desc = "Update" },
  { "<leader>uMl", "<cmd>MasonLog<cr>", desc = "Log" },
  { "<leader>uMc", "<cmd>MasonUninstall<cr>", desc = "Uninstall" },
  { "<leader>uK", group = "Kubectl", icon = { icon = icons.kubectl, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>uKm", "<cmd>Kubectl<cr>", desc = "Main Menu" },
  { "<leader>uKp", "<cmd>Kubectl pods<cr>", desc = "Pods" },
  { "<leader>uKs", "<cmd>Kubectl services<cr>", desc = "Services" },
  { "<leader>uKd", "<cmd>Kubectl deployments<cr>", desc = "Deployments" },
  { "<leader>uKn", "<cmd>Kubectl namespaces<cr>", desc = "Namespaces" },
  { "<leader>uH", group = "HTTP", icon = { icon = icons.http, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>uHa", "<cmd>Hyper<cr>", desc = "Open Request" },
  { "<leader>uHi", "<cmd>HyperJump<cr>", desc = "Jump Request" },

  -- Database
  { "<leader>ud", group = "Database", icon = { icon = icons.database, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>udb", "<cmd>DBUI<cr>", desc = "Dadbod UI" },
  { "<leader>udi", "<cmd>Dbee<cr>", desc = "Toggle UI" },
  { "<leader>udo", "<cmd>Dbee open<cr>", desc = "Open UI" },
  { "<leader>udc", "<cmd>Dbee close<cr>", desc = "Close UI" },
  { "<leader>udq", dbee_execute_query, desc = "Execute Query" },
  { "<leader>uds", "<cmd>Dbee store<cr>", desc = "Store Result" },

  -- Treesitter
  { "<leader>ut", group = "Treesitter", icon = { icon = icons.treesitter, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>uti", "<cmd>InspectTree<cr>", desc = "Inspect Tree" },
  { "<leader>utp", "<cmd>Inspect<cr>", desc = "Inspect" },
  { "<leader>utm", "<cmd>TSManager<cr>", desc = "Parser Manager" },
  { "<leader>utr", "<cmd>TSInstall<cr>", desc = "Install Parser" },
  { "<leader>utx", "<cmd>TSUninstall<cr>", desc = "Remove Parser" },

  -- Git
  { "<leader>ug", group = "Git", icon = icons.git },
  { "<leader>ugb", "<cmd>Telescope git_branches<cr>", desc = "Checkout Branch" },
  { "<leader>ugc", "<cmd>Telescope git_commits<cr>", desc = "Checkout Commit" },
  { "<leader>ugC", "<cmd>Telescope git_bcommits<cr>", desc = "Current File Commit" },
  { "<leader>ugd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
  { "<leader>ugj", "<cmd>lua require('gitsigns').next_hunk()<cr>", desc = "Next Hunk" },
  { "<leader>ugk", "<cmd>lua require('gitsigns').prev_hunk()<cr>", desc = "Prev Hunk" },
  { "<leader>ugl", "<cmd>lua require('gitsigns').blame_line()<cr>", desc = "Blame" },
  { "<leader>ugp", "<cmd>lua require('gitsigns').preview_hunk()<cr>", desc = "Preview Hunk" },
  { "<leader>ugr", "<cmd>lua require('gitsigns').reset_hunk()<cr>", desc = "Reset Hunk" },
  { "<leader>ugR", "<cmd>lua require('gitsigns').reset_buffer()<cr>", desc = "Reset Buffer" },
  { "<leader>ugs", "<cmd>lua require('gitsigns').stage_hunk()<cr>", desc = "Stage Hunk" },
  { "<leader>ugu", "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", desc = "Undo Stage" },
  { "<leader>ugo", "<cmd>Telescope git_status<cr>", desc = "Changed Files" },
  { "<leader>ugF", group = "Fugit2", icon = icons.git },
  { "<leader>ugFo", "<cmd>Fugit2<cr>", desc = "Open" },
  { "<leader>ugFg", "<cmd>Fugit2Graph<cr>", desc = "Graph" },
  { "<leader>ugFd", "<cmd>Fugit2Diff<cr>", desc = "Diff" },
  { "<leader>ugI", "<cmd>Gitignore!<cr>", desc = "Overwrite .gitignore" },
  { "<leader>ugi", "<cmd>Gitignore<cr>", desc = "Generate .gitignore" },
  { "<leader>ugW", group = "Worktrees", icon = icons.git },
  { "<leader>ugWw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", desc = "List Worktrees" },
  { "<leader>ugWc", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", desc = "Create Worktree" },
  { "<leader>ugG", group = "Git Commands", icon = icons.git },
  { "<leader>ugGa", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage Hunk" },
  { "<leader>ugGb", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
  { "<leader>ugGc", "<cmd>Fugit2<cr>", desc = "Open Fugit2" },
  { "<leader>ugGd", "<cmd>DiffviewOpen<cr>", desc = "Diffview" },
  { "<leader>ugGh", "<cmd>DiffviewFileHistory<cr>", desc = "History" },
  { "<leader>ugO", group = "GitHub", icon = icons.github },
  { "<leader>ugOi", "<cmd>Octo issue list<cr>", desc = "Issues" },
  { "<leader>ugOp", "<cmd>Octo pr list<cr>", desc = "Pull Requests" },
  { "<leader>ugOc", "<cmd>Telescope githubcoauthors<cr>", desc = "Coauthors" },

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
  { "<leader>t", group = "Terminal", icon = icons.terminal },
  { "<leader>tf", toggle_float, desc = "Floating" },
  { "<leader>tl", toggle_lazygit, desc = "LazyGit" },
  { "<leader>tt", ":ToggleTerm<cr>", desc = "Split Below" },

  -- LSP
  { "<leader>l", group = "LSP", icon = icons.lsp },
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

  -- Utilities
  { "<leader>U", group = "Utilities", icon = icons.utilities },
  { "<leader>Ub", "<cmd>Bloat<cr>", desc = "Plugin Bloat" },
  { "<leader>Uj", group = "Jqx", icon = { icon = icons.json, hl = BlindReturn("Normal", "@variable") } },
  { "<leader>Ujl", "<cmd>JqxList<cr>", desc = "List Keys" },
  { "<leader>Ujq", "<cmd>JqxQuery ", desc = "Query" },
  { "<leader>Uo", "<cmd>Orphans<cr>", desc = "Orphans" },

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
