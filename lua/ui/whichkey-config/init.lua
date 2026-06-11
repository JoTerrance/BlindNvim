-- Documentación: módulo `lua/ui/whichkey-config/init.lua`.
-- Propósito: define componentes de interfaz de usuario dentro de BlindNvim sin alterar lógica de ejecución.

local wk = require("which-key")

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
  { "<space>w", "<cmd>w!<CR>", desc = "Save" },
  { "<space>h", "<cmd>nohlsearch<CR>", desc = "Clear Search Highlight" },
  { "<space>/", "<Plug>(comment_toggle_linewise_current)", desc = "Toggle Comment" },
  { "<space>/", "<Plug>(comment_toggle_linewise_visual)", desc = "Toggle Comment", mode = "v" },

  -- Buffers
  { "<space>b", group = "Buffers" },
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
  { "<space>n", group = "Navigation" },
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
  { "<space>s", group = "Search" },
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
  { "<space>sx", group = "Telescope Extras" },
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

  -- Git
  { "<space>G", group = "Git" },
  { "<space>Gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout Branch" },
  { "<space>Gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout Commit" },
  { "<space>GC", "<cmd>Telescope git_bcommits<cr>", desc = "Current File Commit" },
  { "<space>Gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
  { "<space>Gj", "<cmd>lua require('gitsigns').next_hunk()<cr>", desc = "Next Hunk" },
  { "<space>Gk", "<cmd>lua require('gitsigns').prev_hunk()<cr>", desc = "Prev Hunk" },
  { "<space>Gl", "<cmd>lua require('gitsigns').blame_line()<cr>", desc = "Blame" },
  { "<space>Gp", "<cmd>lua require('gitsigns').preview_hunk()<cr>", desc = "Preview Hunk" },
  { "<space>Gr", "<cmd>lua require('gitsigns').reset_hunk()<cr>", desc = "Reset Hunk" },
  { "<space>GR", "<cmd>lua require('gitsigns').reset_buffer()<cr>", desc = "Reset Buffer" },
  { "<space>Gs", "<cmd>lua require('gitsigns').stage_hunk()<cr>", desc = "Stage Hunk" },
  { "<space>Gu", "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", desc = "Undo Stage" },
  { "<space>Go", "<cmd>Telescope git_status<cr>", desc = "Changed Files" },
  { "<space>GF", group = "Fugit2" },
  { "<space>GFo", "<cmd>Fugit2<cr>", desc = "Open" },
  { "<space>GFg", "<cmd>Fugit2Graph<cr>", desc = "Graph" },
  { "<space>GFd", "<cmd>Fugit2Diff<cr>", desc = "Diff" },
  { "<space>GG", group = "Git Commands" },
  { "<space>GGa", ":GitAdd<cr>", desc = "Add" },
  { "<space>GGb", ":GitBranch<cr>", desc = "Branch" },
  { "<space>GGc", ":GitCommit<cr>", desc = "Commit" },
  { "<space>GGd", ":GitDiff<cr>", desc = "Diff" },
  { "<space>GGe", ":GitExport<cr>", desc = "Export" },
  { "<space>GGg", ":GitGrep<cr>", desc = "Grep" },
  { "<space>GGi", ":GitIgnore<cr>", desc = "Ignore" },
  { "<space>GGm", ":GitMerge<cr>", desc = "Merge" },
  { "<space>GGn", ":GitNew<cr>", desc = "New" },
  { "<space>GGp", ":GitPush<cr>", desc = "Push" },
  { "<space>GGr", ":GitRevert<cr>", desc = "Revert" },
  { "<space>GGs", ":GitStash<cr>", desc = "Stash" },
  { "<space>GGt", ":GitTag<cr>", desc = "Tag" },
  { "<space>GGu", ":GitPull<cr>", desc = "Pull" },
  { "<space>GGy", ":GitShow<cr>", desc = "Show" },
  { "<space>GO", group = "GitHub" },
  { "<space>GOi", "<cmd>Octo issue list<cr>", desc = "Issues" },
  { "<space>GOp", "<cmd>Octo pr list<cr>", desc = "Pull Requests" },

  -- AI
  { "<space>a", group = "AI" },
  { "<space>aa", "<cmd>AvanteAsk<cr>", desc = "Ask" },
  { "<space>ac", "<cmd>AvanteChat<cr>", desc = "Chat" },
  { "<space>ae", "<cmd>AvanteEdit<cr>", desc = "Edit" },
  { "<space>ah", "<cmd>AvanteHistory<cr>", desc = "History" },
  { "<space>am", "<cmd>AvanteModels<cr>", desc = "Models" },

  -- Terminal
  { "<space>t", group = "Terminal" },
  { "<space>tf", toggle_float, desc = "Floating" },
  { "<space>tl", toggle_lazygit, desc = "LazyGit" },
  { "<space>tt", ":ToggleTerm<cr>", desc = "Split Below" },

  -- LSP
  { "<space>l", group = "LSP" },
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
  { "<space>lF", group = "Refactor" },
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
  { "<space>d", group = "Debug" },
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
  { "<space>dD", group = "DapUI" },
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

  -- Database
  { "<space>S", group = "Database" },
  { "<space>SC", ":DBUIConnect<cr>", desc = "Connect" },
  { "<space>SD", ":DBUIDisconnect<cr>", desc = "Disconnect" },
  { "<space>SE", ":DBUIExecute<cr>", desc = "Execute" },
  { "<space>Sa", ":DBUIAddConnection<cr>", desc = "Add Connection" },
  { "<space>Sp", "<cmd>Dbee<cr>", desc = "Dbee" },
  { "<space>Se", ":DBUIEditConnection<cr>", desc = "Edit Connection" },
  { "<space>Sf", ":DBUIFindBuffer<cr>", desc = "Find Buffer" },
  { "<space>Si", ":DBUI<cr>", desc = "Open UI" },
  { "<space>SI", ":DBUILastQueryInfo<cr>", desc = "Last Query Info" },
  { "<space>Sl", ":DBUIListConnections<cr>", desc = "List Connections" },
  { "<space>Sn", ":DBUINewQuery<cr>", desc = "New Query" },
  { "<space>So", ":DBUIOpen<cr>", desc = "Open" },
  { "<space>Sq", ":DBUIQuickQuery<cr>", desc = "Quick Query" },
  { "<space>Sr", ":DBUIRenameBuffer<cr>", desc = "Rename Buffer" },
  { "<space>SR", ":DBUIRenameConnection<cr>", desc = "Rename Connection" },
  { "<space>Ss", ":DBUIShowHistory<cr>", desc = "History" },
  { "<space>St", ":DBUIToggleResults<cr>", desc = "Toggle Results" },
  { "<space>Su", ":DBUIUseConnection<cr>", desc = "Use Connection" },
  { "<space>Sw", ":DBUIWhereAmI<cr>", desc = "Where Am I" },
  { "<space>Sd", ":DBUIDeleteConnection<cr>", desc = "Delete Connection" },

  -- Edit
  { "<space>e", group = "Edit" },
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
  { "<space>W", group = "Workspace" },
  { "<space>WA", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", desc = "Add Folder" },
  { "<space>WR", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", desc = "Remove Folder" },
  { "<space>Wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", desc = "List Folders" },

  -- Format
  { "<space>f", group = "Format" },
  { "<space>ff", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "Format Buffer" },
  { "<space>fi", "<cmd>ConformInfo<cr>", desc = "Conform Info" },

  -- Build
  { "<space>C", group = "CMake" },
  { "<space>Cb", "<cmd>CMakeBuild<cr>", desc = "Build" },
  { "<space>Cc", "<cmd>CMakeClean<cr>", desc = "Clean" },
  { "<space>Cd", "<cmd>CMakeDebug<cr>", desc = "Debug" },
  { "<space>Cg", "<cmd>CMakeGenerate<cr>", desc = "Generate" },
  { "<space>Cr", "<cmd>CMakeRun<cr>", desc = "Run" },
  { "<space>Cs", "<cmd>CMakeSelectBuildTarget<cr>", desc = "Select Target" },

  -- Treesitter
  { "<space>T", group = "Treesitter" },
  { "<space>Ti", ":TSConfigInfo<cr>", desc = "Info" },
  { "<space>Tp", ":TSPlaygroundToggle<cr>", desc = "Playground" },
  { "<space>TR", ":TSBufDisable highlight<cr>", desc = "Disable Highlight" },
  { "<space>Tr", ":TSBufEnable highlight<cr>", desc = "Enable Highlight" },

  -- Open
  { "<space>o", group = "Open" },
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
  { "<space>i", group = "Insert" },
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
  { "<space>U", group = "Utilities" },
  { "<space>Ub", "<cmd>Bloat<cr>", desc = "Plugin Bloat" },
  { "<space>Uo", "<cmd>Orphans<cr>", desc = "Orphans" },

  -- Focus
  { "<space>z", group = "Focus" },
  { "<space>zt", ":Twilight<cr>", desc = "Toggle Twilight" },
  { "<space>zz", ":ZenMode<cr>", desc = "Toggle Zen Mode" },

  -- DevContainer
  { "<space>D", group = "DevContainer" },
  { "<space>Da", "<cmd>DevcontainerAttach<cr>", desc = "Attach" },
  { "<space>Db", "<cmd>DevcontainerBuild<cr>", desc = "Build" },
  { "<space>Dc", "<cmd>DevcontainerConnect<cr>", desc = "Connect" },
  { "<space>De", "<cmd>DevcontainerExec<cr>", desc = "Exec" },
  { "<space>Dl", "<cmd>DevcontainerLogs<cr>", desc = "Logs" },
  { "<space>Do", "<cmd>DevcontainerOpen<cr>", desc = "Open Config" },
  { "<space>Dr", "<cmd>DevcontainerRemove<cr>", desc = "Remove" },
  { "<space>DS", "<cmd>DevcontainerStop<cr>", desc = "Stop" },
  { "<space>Ds", "<cmd>DevcontainerStart<cr>", desc = "Start" },
  { "<space>Dt", "<cmd>DevcontainerToggle<cr>", desc = "Toggle Terminal" },

  -- Java
  { "<space>j", group = "Java" },
  { "<space>je", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", desc = "Extract Variable" },
  { "<space>jE", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", desc = "Extract Method" },
  { "<space>ji", "<Cmd>lua require'jdtls'.organize_imports()<CR>", desc = "Organize Imports" },
  { "<space>jn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", desc = "Test Nearest Method" },
  { "<space>jT", "<Cmd>lua require'jdtls'.test_class()<CR>", desc = "Test Class" },
  { "<space>js", "<Cmd>lua require('telescope').extensions.scaladex.scaladex.search()<cr>", desc = "Scaladex Search" },

  -- Visual mode mappings
  { "<space>l", group = "LSP", mode = "v" },
  { "<space>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", mode = "v" },
  { "<space>lv", "<cmd>lua require('lsp_lines').toggle()<cr>", desc = "Virtual Lines", mode = "v" },
  { "<space>/", "<Plug>(comment_toggle_linewise_visual)", desc = "Toggle Comment", mode = "v" },

  { "<space>R", group = "Refactor", mode = "v" },
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

  { "<space>j", group = "Java", mode = "v" },
  { "<space>je", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", desc = "Extract Variable", mode = "v" },
  { "<space>jE", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", desc = "Extract Method", mode = "v" },
})
