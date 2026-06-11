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
  database = BlindReturn("DB", "󰆼"),
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
  open = BlindReturn("OPEN", ""),
  insert = BlindReturn("INS", "󰏪"),
  utilities = BlindReturn("UTIL", "󰘥"),
  focus = BlindReturn("FOCUS", "󰍹"),
  refactor = BlindReturn("REFACTOR", "󰛿"),
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
    group = "+", -- symbol prepended to a group
  },
  keys = {
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
  },
  win = {
    padding = { 1, 0 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 100, max = 125 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 2, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  show_help = true, -- show help message on the command line when the popup is visible
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers = {
    { "<auto>", mode = "nxso" },
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

wk.add({
  -- Core
  { "<space>w", "<cmd>w!<CR>", desc = "Save", icon = icons.save },
  { "<space>h", "<cmd>nohlsearch<CR>", desc = "Clear Search Highlight", icon = icons.search },
  { "<space>/", "<Plug>(comment_toggle_linewise_current)", desc = "Toggle Comment", icon = icons.comment },
  { "<space>/", "<Plug>(comment_toggle_linewise_visual)", desc = "Toggle Comment", mode = "v", icon = icons.comment },

  -- Buffers
  { "<space>b", group = "Buffers", icon = icons.buffers },
  { "<space>bb", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous" },
  { "<space>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next" },
  { "<space>bf", "<cmd>Telescope buffers<cr>", desc = "Find" },
  { "<space>bj", "<cmd>BufferLinePick<cr>", desc = "Jump" },
  { "<space>bc", "<cmd>BufferKill<CR>", desc = "Close" },
  { "<space>be", "<cmd>BufferLinePickClose<cr>", desc = "Pick to Close" },
  { "<space>bh", "<cmd>BufferLineCloseLeft<cr>", desc = "Close Left" },
  { "<space>bl", "<cmd>BufferLineCloseRight<cr>", desc = "Close Right" },
  { "<space>bD", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort by Directory" },
  { "<space>bL", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort by Language" },

  -- Navigation
  { "<space>n", group = "Navigation", icon = icons.navigation },
  { "<space>no", "<cmd>Oil<CR>", desc = "Oil" },
  { "<space>nO", "<cmd>Oil --float<CR>", desc = "Oil Float" },
  { "<space>na", "<cmd>AerialToggle!<CR>", desc = "Aerial Toggle" },
  { "<space>nA", "<cmd>AerialOpen! right<CR>", desc = "Aerial Right" },
  { "<space>nd", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics" },
  { "<space>nq", "<cmd>Trouble quickfix toggle<CR>", desc = "Quickfix" },
  { "<space>nl", "<cmd>Trouble loclist toggle<CR>", desc = "Loclist" },
  { "<space>nr", "<cmd>Trouble lsp_references toggle<CR>", desc = "References" },
  { "<space>nD", "<cmd>Trouble lsp_definitions toggle<CR>", desc = "Definitions" },
  { "<space>nu", "<cmd>UrlView<CR>", desc = "URLs" },

  -- Search
  { "<space>s", group = "Search", icon = icons.search },
  { "<space>sa", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
  { "<space>sb", "<cmd>Telescope git_branches<cr>", desc = "Git Branches" },
  { "<space>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
  { "<space>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
  { "<space>sf", "<cmd>Telescope find_files<cr>", desc = "Files" },
  { "<space>sg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
  { "<space>sh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
  { "<space>sH", "<cmd>Telescope highlights<cr>", desc = "Highlight Groups" },
  { "<space>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
  { "<space>sl", "<cmd>Telescope lines<cr>", desc = "Lines" },
  { "<space>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
  { "<space>sr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
  { "<space>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
  { "<space>sp", "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", desc = "Colorscheme Preview" },
  { "<space>st", "<cmd>Telescope live_grep<cr>", desc = "Text" },
  { "<space>sx", group = "Telescope Extras", icon = icons.telescope },
  { "<space>sxb", "<cmd>Telescope bookmarks<cr>", desc = "Bookmarks" },
  { "<space>sxd", "<cmd>Telescope docker<cr>", desc = "Docker" },
  { "<space>sxe", "<cmd>Telescope emoji<cr>", desc = "Emoji" },
  { "<space>sxE", "<cmd>Telescope env<cr>", desc = "Env" },
  { "<space>sxg", "<cmd>Telescope gh<cr>", desc = "GitHub" },
  { "<space>sxh", "<cmd>Telescope heading<cr>", desc = "Headings" },
  { "<space>sxl", "<cmd>Telescope lines<cr>", desc = "Lines" },
  { "<space>sxm", "<cmd>Telescope media_files<cr>", desc = "Media Files" },
  { "<space>sxn", "<cmd>Telescope notify<cr>", desc = "Notifications" },
  { "<space>sxo", "<cmd>Telescope openbrowser<cr>", desc = "Open Browser" },
  { "<space>sxt", "<cmd>Telescope tmux<cr>", desc = "Tmux" },
  { "<space>sxT", "<cmd>Telescope tmuxinator<cr>", desc = "Tmuxinator" },
  { "<space>sxu", "<cmd>Telescope undo<cr>", desc = "Undo" },
  { "<space>sxv", "<cmd>Telescope vimspector<cr>", desc = "Vimspector" },
  { "<space>sxx", "<cmd>Telescope changes<cr>", desc = "Changes" },
  { "<space>sxz", "<cmd>Telescope z<cr>", desc = "Zoxide" },
  { "<space>sxO", "<cmd>Telescope ctags_outline<cr>", desc = "CTags Outline" },
  { "<space>sxG", "<cmd>Telescope githubcoauthors<cr>", desc = "Git Coauthors" },

  -- Tools
  { "<space>u", group = "Tools", icon = icons.tools },
  { "<space>uC", group = "CMake", icon = icons.cmake },
  { "<space>uCb", "<cmd>CMakeBuild<cr>", desc = "Build" },
  { "<space>uCc", "<cmd>CMakeClean<cr>", desc = "Clean" },
  { "<space>uCd", "<cmd>CMakeDebug<cr>", desc = "Debug" },
  { "<space>uCg", "<cmd>CMakeGenerate<cr>", desc = "Generate" },
  { "<space>uCr", "<cmd>CMakeRun<cr>", desc = "Run" },
  { "<space>uCs", "<cmd>CMakeSelectBuildTarget<cr>", desc = "Select Target" },
  { "<space>uD", group = "DevContainer", icon = icons.devcontainer },
  { "<space>uDa", "<cmd>DevcontainerAttach<cr>", desc = "Attach" },
  { "<space>uDb", "<cmd>DevcontainerBuild<cr>", desc = "Build" },
  { "<space>uDc", "<cmd>DevcontainerConnect<cr>", desc = "Connect" },
  { "<space>uDe", "<cmd>DevcontainerExec<cr>", desc = "Exec" },
  { "<space>uDl", "<cmd>DevcontainerLogs<cr>", desc = "Logs" },
  { "<space>uDo", "<cmd>DevcontainerOpen<cr>", desc = "Open Config" },
  { "<space>uDr", "<cmd>DevcontainerRemove<cr>", desc = "Remove" },
  { "<space>uDS", "<cmd>DevcontainerStop<cr>", desc = "Stop" },
  { "<space>uDs", "<cmd>DevcontainerStart<cr>", desc = "Start" },
  { "<space>uDt", "<cmd>DevcontainerToggle<cr>", desc = "Toggle Terminal" },

  -- Database
  { "<space>ud", group = "Database", icon = icons.database },
  { "<space>udC", ":DBUIConnect<cr>", desc = "Connect" },
  { "<space>udD", ":DBUIDisconnect<cr>", desc = "Disconnect" },
  { "<space>udE", ":DBUIExecute<cr>", desc = "Execute" },
  { "<space>uda", ":DBUIAddConnection<cr>", desc = "Add Connection" },
  { "<space>udp", "<cmd>Dbee<cr>", desc = "Dbee" },
  { "<space>ude", ":DBUIEditConnection<cr>", desc = "Edit Connection" },
  { "<space>udf", ":DBUIFindBuffer<cr>", desc = "Find Buffer" },
  { "<space>udi", ":DBUI<cr>", desc = "Open UI" },
  { "<space>udI", ":DBUILastQueryInfo<cr>", desc = "Last Query Info" },
  { "<space>udl", ":DBUIListConnections<cr>", desc = "List Connections" },
  { "<space>udn", ":DBUINewQuery<cr>", desc = "New Query" },
  { "<space>udo", ":DBUIOpen<cr>", desc = "Open" },
  { "<space>udq", ":DBUIQuickQuery<cr>", desc = "Quick Query" },
  { "<space>udr", ":DBUIRenameBuffer<cr>", desc = "Rename Buffer" },
  { "<space>udR", ":DBUIRenameConnection<cr>", desc = "Rename Connection" },
  { "<space>uds", ":DBUIShowHistory<cr>", desc = "History" },
  { "<space>udt", ":DBUIToggleResults<cr>", desc = "Toggle Results" },
  { "<space>udu", ":DBUIUseConnection<cr>", desc = "Use Connection" },
  { "<space>udw", ":DBUIWhereAmI<cr>", desc = "Where Am I" },
  { "<space>udd", ":DBUIDeleteConnection<cr>", desc = "Delete Connection" },

  -- Treesitter
  { "<space>ut", group = "Treesitter", icon = icons.treesitter },
  { "<space>uti", ":TSConfigInfo<cr>", desc = "Info" },
  { "<space>utp", ":TSPlaygroundToggle<cr>", desc = "Playground" },
  { "<space>utR", ":TSBufDisable highlight<cr>", desc = "Disable Highlight" },
  { "<space>utr", ":TSBufEnable highlight<cr>", desc = "Enable Highlight" },

  -- Java
  { "<space>uj", group = "Java", icon = icons.java },
  { "<space>uje", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", desc = "Extract Variable" },
  { "<space>ujE", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", desc = "Extract Method" },
  { "<space>uji", "<Cmd>lua require'jdtls'.organize_imports()<CR>", desc = "Organize Imports" },
  { "<space>ujn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", desc = "Test Nearest Method" },
  { "<space>ujT", "<Cmd>lua require'jdtls'.test_class()<CR>", desc = "Test Class" },
  { "<space>ujs", "<Cmd>lua require('telescope').extensions.scaladex.scaladex.search()<cr>", desc = "Scaladex Search" },

  -- Git
  { "<space>ug", group = "Git", icon = icons.git },
  { "<space>ugb", "<cmd>Telescope git_branches<cr>", desc = "Checkout Branch" },
  { "<space>ugc", "<cmd>Telescope git_commits<cr>", desc = "Checkout Commit" },
  { "<space>ugC", "<cmd>Telescope git_bcommits<cr>", desc = "Current File Commit" },
  { "<space>ugd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
  { "<space>ugj", "<cmd>lua require('gitsigns').next_hunk()<cr>", desc = "Next Hunk" },
  { "<space>ugk", "<cmd>lua require('gitsigns').prev_hunk()<cr>", desc = "Prev Hunk" },
  { "<space>ugl", "<cmd>lua require('gitsigns').blame_line()<cr>", desc = "Blame" },
  { "<space>ugp", "<cmd>lua require('gitsigns').preview_hunk()<cr>", desc = "Preview Hunk" },
  { "<space>ugr", "<cmd>lua require('gitsigns').reset_hunk()<cr>", desc = "Reset Hunk" },
  { "<space>ugR", "<cmd>lua require('gitsigns').reset_buffer()<cr>", desc = "Reset Buffer" },
  { "<space>ugs", "<cmd>lua require('gitsigns').stage_hunk()<cr>", desc = "Stage Hunk" },
  { "<space>ugu", "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", desc = "Undo Stage" },
  { "<space>ugo", "<cmd>Telescope git_status<cr>", desc = "Changed Files" },
  { "<space>ugF", group = "Fugit2", icon = icons.git },
  { "<space>ugFo", "<cmd>Fugit2<cr>", desc = "Open" },
  { "<space>ugFg", "<cmd>Fugit2Graph<cr>", desc = "Graph" },
  { "<space>ugFd", "<cmd>Fugit2Diff<cr>", desc = "Diff" },
  { "<space>ugG", group = "Git Commands", icon = icons.git },
  { "<space>ugGa", ":GitAdd<cr>", desc = "Add" },
  { "<space>ugGb", ":GitBranch<cr>", desc = "Branch" },
  { "<space>ugGc", ":GitCommit<cr>", desc = "Commit" },
  { "<space>ugGd", ":GitDiff<cr>", desc = "Diff" },
  { "<space>ugGe", ":GitExport<cr>", desc = "Export" },
  { "<space>ugGg", ":GitGrep<cr>", desc = "Grep" },
  { "<space>ugGi", ":GitIgnore<cr>", desc = "Ignore" },
  { "<space>ugGm", ":GitMerge<cr>", desc = "Merge" },
  { "<space>ugGn", ":GitNew<cr>", desc = "New" },
  { "<space>ugGp", ":GitPush<cr>", desc = "Push" },
  { "<space>ugGr", ":GitRevert<cr>", desc = "Revert" },
  { "<space>ugGs", ":GitStash<cr>", desc = "Stash" },
  { "<space>ugGt", ":GitTag<cr>", desc = "Tag" },
  { "<space>ugGu", ":GitPull<cr>", desc = "Pull" },
  { "<space>ugGy", ":GitShow<cr>", desc = "Show" },
  { "<space>ugO", group = "GitHub", icon = icons.github },
  { "<space>ugOi", "<cmd>Octo issue list<cr>", desc = "Issues" },
  { "<space>ugOp", "<cmd>Octo pr list<cr>", desc = "Pull Requests" },

  -- AI
  { "<space>a", group = "AI", icon = icons.ai },
  { "<space>aa", "<cmd>AvanteAsk<cr>", desc = "Ask" },
  { "<space>ac", "<cmd>AvanteChat<cr>", desc = "Chat" },
  { "<space>ae", "<cmd>AvanteEdit<cr>", desc = "Edit" },
  { "<space>ah", "<cmd>AvanteHistory<cr>", desc = "History" },
  { "<space>am", "<cmd>AvanteModels<cr>", desc = "Models" },

  -- Terminal
  { "<space>t", group = "Terminal", icon = icons.terminal },
  { "<space>tf", toggle_float, desc = "Floating" },
  { "<space>tl", toggle_lazygit, desc = "LazyGit" },
  { "<space>tt", ":ToggleTerm<cr>", desc = "Split Below" },

  -- LSP
  { "<space>l", group = "LSP", icon = icons.lsp },
  { "<space>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
  { "<space>lb", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", desc = "Buffer Diagnostics" },
  { "<space>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Definition" },
  { "<space>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Declaration" },
  { "<space>le", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Line Diagnostics" },
  { "<space>lf", "<cmd>Telescope quickfix<cr>", desc = "Quickfix" },
  { "<space>lh", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover" },
  { "<space>lI", "<cmd>LspInfo<cr>", desc = "Info" },
  { "<space>lJ", vim.diagnostic.goto_next, desc = "Next Diagnostic" },
  { "<space>lK", vim.diagnostic.goto_prev, desc = "Prev Diagnostic" },
  { "<space>lk", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature Help" },
  { "<space>lL", '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', desc = "Workspace Folders" },
  { "<space>lM", "<cmd>Mason<cr>", desc = "Mason" },
  { "<space>ln", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next Error" },
  { "<space>lN", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Prev Error" },
  { "<space>lq", vim.diagnostic.setloclist, desc = "Loclist" },
  { "<space>lr", vim.lsp.buf.rename, desc = "Rename" },
  { "<space>lR", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "References" },
  { "<space>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
  { "<space>lW", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
  { "<space>lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
  { "<space>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Type Definition" },
  { "<space>lv", "<cmd>lua require('lsp_lines').toggle()<cr>", desc = "Virtual Lines" },
  { "<space>ll", vim.lsp.codelens.run, desc = "CodeLens" },
  { "<space>lF", group = "Refactor", icon = icons.refactor },
  { "<space>lFS", "<cmd>lua require('refactoring').select_refactor()<CR>", desc = "Select" },
  { "<space>lFb", "<cmd>lua require('refactoring').refactor('Extract Block')<CR>", desc = "Extract Block" },
  { "<space>lFB", "<cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", desc = "Extract Block File" },
  { "<space>lFl", "<cmd>lua require('refactoring').refactor('Extract Local')<CR>", desc = "Extract Local" },
  { "<space>lFm", "<cmd>lua require('refactoring').refactor('Extract Method')<CR>", desc = "Extract Method" },
  { "<space>lFL", "<cmd>lua require('refactoring').refactor('Inline Local')<CR>", desc = "Inline Local" },
  { "<space>lFV", "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", desc = "Inline Variable" },
  { "<space>lFM", "<cmd>lua require('refactoring').refactor('Inline Method')<CR>", desc = "Inline Method" },
  { "<space>lFR", "<cmd>Lspsaga rename<cr>", desc = "Rename" },

  -- Debug
  { "<space>d", group = "Debug", icon = icons.debug },
  { "<space>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "Toggle Breakpoint" },
  { "<space>dB", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", desc = "Conditional Breakpoint" },
  { "<space>dc", "<cmd>lua require('dap').clear_breakpoints()<CR>", desc = "Clear Breakpoints" },
  { "<space>dd", "<cmd>lua require('dap').continue()<CR>", desc = "Continue" },
  { "<space>dl", "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", desc = "Log Point" },
  { "<space>dn", "<cmd>lua require('dap').step_over()<CR>", desc = "Step Over" },
  { "<space>do", "<cmd>lua require('dap').step_out()<CR>", desc = "Step Out" },
  { "<space>dr", "<cmd>lua require('dap').repl.open()<CR>", desc = "Repl" },
  { "<space>dR", "<cmd>lua require('dap').run_last()<CR>", desc = "Run Last" },
  { "<space>ds", "<cmd>lua require('dap').stop()<CR>", desc = "Stop" },
  { "<space>di", "<cmd>lua require('dap').step_into()<CR>", desc = "Step Into" },
  { "<space>dv", "<cmd>DapVirtualTextToggle<cr>", desc = "Virtual Text" },
  { "<space>dD", group = "DapUI", icon = icons.debug },
  { "<space>dDb", "<cmd>lua require('dapui').float_element('breakpoints')<CR>", desc = "Breakpoints" },
  { "<space>dDc", "<cmd>lua require('dapui').close()<CR>", desc = "Close" },
  { "<space>dDf", "<cmd>lua require('dapui').float_element('frames')<CR>", desc = "Frames" },
  { "<space>dDh", "<cmd>lua require('dapui').float_element('hover')<CR>", desc = "Hover" },
  { "<space>dDl", "<cmd>lua require('dapui').float_element('locals')<CR>", desc = "Locals" },
  { "<space>dDo", "<cmd>lua require('dapui').open()<CR>", desc = "Open" },
  { "<space>dDS", "<cmd>lua require('dapui').float_element('stacks')<CR>", desc = "Stacks" },
  { "<space>dDs", "<cmd>lua require('dapui').float_element('scopes')<CR>", desc = "Scopes" },
  { "<space>dDT", "<cmd>lua require('dapui').float_element('threads')<CR>", desc = "Threads" },
  { "<space>dDw", "<cmd>lua require('dapui').float_element('watch')<CR>", desc = "Watch" },
  { "<space>dDt", "<cmd>lua require('dapui').toggle()<CR>", desc = "Toggle" },

  -- Edit
  { "<space>e", group = "Edit", icon = icons.edit },
  { "<space>ed", ":call DeleteTrailingWhitespace()<CR>", desc = "Trim Trailing Whitespace" },
  { "<space>eh", ":move <left>", desc = "Move Char Left" },
  { "<space>ej", ":move .+1<CR>==", desc = "Move Line Down" },
  { "<space>ek", ":move .-2<CR>==", desc = "Move Line Up" },
  { "<space>el", ":move <right>", desc = "Move Char Right" },
  { "<space>eH", ":m <", desc = "Move Line Left" },
  { "<space>eJ", ":m .+1<CR>==", desc = "Move Line Down" },
  { "<space>eK", ":m .-2<CR>==", desc = "Move Line Up" },
  { "<space>eL", ":m >", desc = "Move Line Right" },

  -- Workspace
  { "<space>W", group = "Workspace", icon = icons.workspace },
  { "<space>WA", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", desc = "Add Folder" },
  { "<space>WR", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", desc = "Remove Folder" },
  { "<space>Wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", desc = "List Folders" },

  -- Format
  { "<space>f", group = "Format", icon = icons.format },
  { "<space>ff", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "Format Buffer" },
  { "<space>fi", "<cmd>ConformInfo<cr>", desc = "Conform Info" },

  -- Open
  { "<space>o", group = "Open", icon = icons.open },
  { "<space>oo", ":Open<cr>", desc = "Open" },
  { "<space>oa", ":OpenAll<cr>", desc = "Open All" },
  { "<space>ob", ":OpenNewHorizSplit<cr>", desc = "New Horizontal Split" },
  { "<space>oc", ":OpenCwd<cr>", desc = "Open Cwd" },
  { "<space>oC", ":OpenDir<cr>", desc = "Open Directory" },
  { "<space>od", ":OpenWinDown<cr>", desc = "Open Down" },
  { "<space>oe", ":OpenFile<cr>", desc = "Open File" },
  { "<space>oh", ":OpenHorizSplit<cr>", desc = "Horizontal Split" },
  { "<space>oj", ":OpenWinDown<cr>", desc = "Open Down" },
  { "<space>ok", ":OpenWinUp<cr>", desc = "Open Up" },
  { "<space>ol", ":OpenWinLeft<cr>", desc = "Open Left" },
  { "<space>om", ":OpenNewPane<cr>", desc = "New Pane" },
  { "<space>on", ":OpenNewTab<cr>", desc = "New Tab" },
  { "<space>op", ":OpenPane<cr>", desc = "Pane" },
  { "<space>oq", ":OpenNewWin<cr>", desc = "New Window" },
  { "<space>or", ":OpenWinRight<cr>", desc = "Open Right" },
  { "<space>os", ":OpenSplit<cr>", desc = "Split" },
  { "<space>ot", ":OpenTab<cr>", desc = "Tab" },
  { "<space>ou", ":OpenWinUp<cr>", desc = "Open Up" },
  { "<space>ov", ":OpenVertSplit<cr>", desc = "Vertical Split" },
  { "<space>ow", ":OpenWin<cr>", desc = "Window" },

  -- Insert
  { "<space>i", group = "Insert", icon = icons.insert },
  { "<space>ia", ":InsertAll<cr>", desc = "Insert All" },
  { "<space>ic", ":InsertCwd<cr>", desc = "Insert Cwd" },
  { "<space>iC", ":InsertDir<cr>", desc = "Insert Directory" },
  { "<space>id", ":InsertWinDown<cr>", desc = "Insert Down" },
  { "<space>if", ":InsertFile<cr>", desc = "Insert File" },
  { "<space>ih", ":InsertHorizSplit<cr>", desc = "Insert Horizontal Split" },
  { "<space>ii", ":Insert<cr>", desc = "Insert" },
  { "<space>il", ":InsertWinLeft<cr>", desc = "Insert Left" },
  { "<space>ip", ":InsertPane<cr>", desc = "Insert Pane" },
  { "<space>ir", ":InsertWinRight<cr>", desc = "Insert Right" },
  { "<space>is", ":InsertSplit<cr>", desc = "Insert Split" },
  { "<space>it", ":InsertTab<cr>", desc = "Insert Tab" },
  { "<space>iu", ":InsertWinUp<cr>", desc = "Insert Up" },
  { "<space>iv", ":InsertVertSplit<cr>", desc = "Insert Vertical Split" },
  { "<space>iw", ":InsertWin<cr>", desc = "Insert Window" },

  -- Utilities
  { "<space>U", group = "Utilities", icon = icons.utilities },
  { "<space>Ub", "<cmd>Bloat<cr>", desc = "Plugin Bloat" },
  { "<space>Uo", "<cmd>Orphans<cr>", desc = "Orphans" },

  -- Focus
  { "<space>z", group = "Focus", icon = icons.focus },
  { "<space>zt", ":Twilight<cr>", desc = "Toggle Twilight" },
  { "<space>zz", ":ZenMode<cr>", desc = "Toggle Zen Mode" },

  -- Visual mode mappings
  { "<space>l", group = "LSP", mode = "v", icon = icons.lsp },
  { "<space>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", mode = "v" },
  { "<space>lv", "<cmd>lua require('lsp_lines').toggle()<cr>", desc = "Virtual Lines", mode = "v" },
  { "<space>/", "<Plug>(comment_toggle_linewise_visual)", desc = "Toggle Comment", mode = "v" },

  { "<space>R", group = "Refactor", mode = "v", icon = icons.refactor },
  { "<space>Rb", "<cmd>lua require('refactoring').refactor('Extract Block')<CR>", desc = "Extract Block", mode = "v" },
  { "<space>RB", "<cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", desc = "Extract Block File", mode = "v" },
  { "<space>Rf", "<cmd>lua require('refactoring').refactor('Extract Function')<CR>", desc = "Extract Function", mode = "v" },
  { "<space>RF", "<cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", desc = "Extract Function File", mode = "v" },
  { "<space>Rl", "<cmd>lua require('refactoring').refactor('Extract Local')<CR>", desc = "Extract Local", mode = "v" },
  { "<space>Rm", "<cmd>lua require('refactoring').refactor('Extract Method')<CR>", desc = "Extract Method", mode = "v" },
  { "<space>Rv", "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>", desc = "Extract Variable", mode = "v" },
  { "<space>RL", "<cmd>lua require('refactoring').refactor('Inline Local')<CR>", desc = "Inline Local", mode = "v" },
  { "<space>RM", "<cmd>lua require('refactoring').refactor('Inline Method')<CR>", desc = "Inline Method", mode = "v" },
  { "<space>RS", "<cmd>lua require('refactoring').select_refactor()<CR>", desc = "Select", mode = "v" },
  { "<space>RV", "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", desc = "Inline Variable", mode = "v" },
  { "<space>RR", "<cmd>Lspsaga rename<cr>", desc = "Rename", mode = "v" },

  { "<space>uj", group = "Java", mode = "v", icon = icons.java },
  { "<space>uje", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", desc = "Extract Variable", mode = "v" },
  { "<space>ujE", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", desc = "Extract Method", mode = "v" },
})
