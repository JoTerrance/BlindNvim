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
  -- Normal mode mappings
  { "<space>w", "<cmd>w!<CR>", desc = "Save" },
  { "<space>/", "<Plug>(comment_toggle_linewise_current)", desc = "Comment toggle current line" },
  { "<space>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
  
  -- Buffers
  { "<space>b", group = "Buffers" },
  { "<space>bj", "<cmd>BufferLinePick<cr>", desc = "Jump" },
  { "<space>bf", "<cmd>Telescope buffers<cr>", desc = "Find" },
  { "<space>bc", "<cmd>BufferKill<CR>", desc = "Close Buffer" },
  { "<space>bb", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous" },
  { "<space>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next" },
  { "<space>be", "<cmd>BufferLinePickClose<cr>", desc = "Pick which buffer to close" },
  { "<space>bh", "<cmd>BufferLineCloseLeft<cr>", desc = "Close all to the left" },
  { "<space>bl", "<cmd>BufferLineCloseRight<cr>", desc = "Close all to the right" },
  { "<space>bD", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort by directory" },
  { "<space>bL", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort by language" },
  
  -- Debug
  { "<space>d", group = "Debug" },
  { "<space>dd", "<cmd>lua require'dap'.continue()<CR>", desc = "Continue" },
  { "<space>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "Toggle Breakpoint" },
  { "<space>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", desc = "Set Breakpoint" },
  { "<space>dl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", desc = "Log Point" },
  { "<space>dp", "<cmd>lua require'dap'.step_over()<CR>", desc = "Step Over" },
  { "<space>dn", "<cmd>lua require'dap'.step_into()<CR>", desc = "Step Into" },
  { "<space>do", "<cmd>lua require'dap'.step_out()<CR>", desc = "Step Out" },
  { "<space>dr", "<cmd>lua require'dap'.repl.open()<CR>", desc = "Repl" },
  { "<space>dR", "<cmd>lua require'dap'.run_last()<CR>", desc = "Run Last" },
  { "<space>dc", "<cmd>lua require'dap'.continue()<CR>", desc = "Continue" },
  { "<space>ds", "<cmd>lua require'dap'.stop()<CR>", desc = "Stop" },
  { "<space>di", "<cmd>lua require'dap'.step_into()<CR>", desc = "Step Into" },
  { "<space>dD", group = "DapUI" },
  { "<space>dDt", "<cmd>lua require'dapui'.toggle()<CR>", desc = "Toggle" },
  { "<space>dDo", "<cmd>lua require'dapui'.open()<CR>", desc = "Open" },
  { "<space>dDh", "<cmd>lua require'dapui'.float_element('hover')<CR>", desc = "Hover" },
  { "<space>dDs", "<cmd>lua require'dapui'.float_element('scopes')<CR>", desc = "Scopes" },
  { "<space>dDb", "<cmd>lua require'dapui'.float_element('breakpoints')<CR>", desc = "Breakpoints" },
  { "<space>dDw", "<cmd>lua require'dapui'.float_element('watch')<CR>", desc = "Watch" },
  { "<space>dDS", "<cmd>lua require'dapui'.float_element('stacks')<CR>", desc = "Stacks" },
  { "<space>dDT", "<cmd>lua require'dapui'.float_element('threads')<CR>", desc = "Threads" },
  { "<space>dDf", "<cmd>lua require'dapui'.float_element('frames')<CR>", desc = "Frames" },
  { "<space>dDl", "<cmd>lua require'dapui'.float_element('locals')<CR>", desc = "Locals" },
  { "<space>dDc", "<cmd>lua require'dapui'.close()<CR>", desc = "Close" },
  
  -- DBEE
  { "<space>p", group = "DBEE" },
  { "<space>po", "<cmd>lua require'dbee'.open()<cr>", desc = "Open" },
  
  -- Java
  { "<space>j", group = "Java" },
  { "<space>ji", "<Cmd>lua require'jdtls'.organize_imports()<CR>", desc = "organize imports" },
  { "<space>jT", "<Cmd>lua require'jdtls'.test_class()<CR>", desc = "test class" },
  { "<space>jn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", desc = "text nearest method" },
  { "<space>je", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", desc = "extract variables" },
  { "<space>js", "<Cmd>lua require('telescope').extensions.scaladex.scaladex.search()<cr>", desc = "scaladex telescope" },
  
  -- Git
  { "<space>G", group = "Git" },
  { "<space>Gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },
  { "<space>Gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" },
  { "<space>Gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
  { "<space>Gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
  { "<space>Gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
  { "<space>GR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
  { "<space>Gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
  { "<space>Gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
  { "<space>Go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
  { "<space>Gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
  { "<space>Gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
  { "<space>GC", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout commit(for current file)" },
  { "<space>Gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git Diff" },
  { "<space>GG", group = "Git Advanced" },
  { "<space>GGg", ":GitGrep<cr>", desc = "Git Grep" },
  { "<space>GGs", ":GitStash<cr>", desc = "Git Stash" },
  { "<space>GGc", ":GitCommit<cr>", desc = "Git Commit" },
  { "<space>GGp", ":GitPush<cr>", desc = "Git Push" },
  { "<space>GGu", ":GitPull<cr>", desc = "Git Pull" },
  { "<space>GGd", ":GitDiff<cr>", desc = "Git Diff" },
  { "<space>GGa", ":GitAdd<cr>", desc = "Git Add" },
  { "<space>GGr", ":GitRevert<cr>", desc = "Git Revert" },
  { "<space>GGb", ":GitBranch<cr>", desc = "Git Branch" },
  { "<space>GGm", ":GitMerge<cr>", desc = "Git Merge" },
  { "<space>GGt", ":GitTag<cr>", desc = "Git Tag" },
  { "<space>GGy", ":GitShow<cr>", desc = "Git Show" },
  { "<space>GGn", ":GitNew<cr>", desc = "Git New" },
  { "<space>GGe", ":GitExport<cr>", desc = "Git Export" },
  { "<space>GGi", ":GitIgnore<cr>", desc = "Git Ignore" },
  
  -- Terminal
  { "<space>t", group = "Terminal" },
  { "<space>tt", ":ToggleTerm<cr>", desc = "Split Below" },
  { "<space>tf", toggle_float, desc = "Floating Terminal" },
  { "<space>tl", toggle_lazygit, desc = "LazyGit" },
  
  -- LSP
  { "<space>l", group = "LSP" },
  { "<space>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
  { "<space>lb", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", desc = "Buffer Diagnostics" },
  { "<space>lw", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
  { "<space>lI", "<cmd>LspInfo<cr>", desc = "Info" },
  { "<space>lM", "<cmd>Mason<cr>", desc = "Mason Info" },
  { "<space>lJ", vim.diagnostic.goto_next, desc = "Next Diagnostic" },
  { "<space>lK", vim.diagnostic.goto_prev, desc = "Prev Diagnostic" },
  { "<space>ll", vim.lsp.codelens.run, desc = "CodeLens Action" },
  { "<space>lp", group = "Peek" },
  { "<space>lq", vim.diagnostic.setloclist, desc = "Quickfix" },
  { "<space>lr", vim.lsp.buf.rename, desc = "Rename" },
  { "<space>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
  { "<space>lW", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
  { "<space>lf", "<cmd>Telescope quickfix<cr>", desc = "Telescope Quickfix" },
  { "<space>li", ":LspInfo<cr>", desc = "Connected Language Servers" },
  { "<space>lQ", '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', desc = "Show loclist" },
  { "<space>lk", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature Help" },
  { "<space>lh", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover Commands" },
  { "<space>lL", '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', desc = "List Workspace Folders" },
  { "<space>lt", '<cmd>lua vim.lsp.buf.type_definition()<cr>', desc = "Type Definition" },
  { "<space>ld", '<cmd>lua vim.lsp.buf.definition()<cr>', desc = "Go To Definition" },
  { "<space>lD", '<cmd>lua vim.lsp.buf.declaration()<cr>', desc = "Go To Declaration" },
  { "<space>lF", group = "Refactor" },
  { "<space>lFS", "<cmd>lua require('refactoring').select_refactor()<CR>", desc = "Select" },
  { "<space>lFb", "<cmd>lua require('refactoring').refactor('Extract Block')<CR>", desc = "Extract Block" },
  { "<space>lFB", "<cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", desc = "Extract Block to File" },
  { "<space>lFl", "<cmd>lua require('refactoring').refactor('Extract Local')<CR>", desc = "Extract Local" },
  { "<space>lFv", "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>", desc = "Extract Variable" },
  { "<space>lFm", "<cmd>lua require('refactoring').refactor('Extract Method')<CR>", desc = "Extract Method" },
  { "<space>lFL", "<cmd>lua require('refactoring').refactor('Inline Local')<CR>", desc = "Inline Local" },
  { "<space>lFV", "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", desc = "Inline Variable" },
  { "<space>lFM", "<cmd>lua require('refactoring').refactor('Inline Method')<CR>", desc = "Inline Method" },
  { "<space>lFR", '<cmd>Lspsaga rename<cr>', desc = "Rename" },
  { "<space>lR", '<cmd>lua vim.lsp.buf.references()<cr>', desc = "References" },
  { "<space>le", '<cmd>Lspsaga show_line_diagnostics<cr>', desc = "Show Line Diagnostics" },
  { "<space>lE", '<cmd>lua vim.diagnostic.open_float()<CR>', desc = "Show line diagnostics" },
  { "<space>ln", '<cmd>Lspsaga diagnostic_jump_next<cr>', desc = "Go To Next Diagnostic" },
  { "<space>lN", '<cmd>Lspsaga diagnostic_jump_prev<cr>', desc = "Go To Previous Diagnostic" },
  { "<space>lv", "<cmd>lua require('lsp_lines').toggle()<cr>", desc = "Virtual Lines Info Toggle" },
  
  -- Logs
  { "<space>L", group = "Logs" },
  { "<space>LN", "<cmd>edit $NVIM_LOG_FILE<cr>", desc = "Open the Neovim logfile" },
  { "<space>Ln", "<cmd>Telescope notify<cr>", desc = "View Notifications" },
  
  -- Search
  { "<space>s", group = "Search" },
  { "<space>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
  { "<space>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
  { "<space>sf", "<cmd>Telescope find_files<cr>", desc = "Find File" },
  { "<space>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
  { "<space>sH", "<cmd>Telescope highlights<cr>", desc = "Find highlight groups" },
  { "<space>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
  { "<space>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
  { "<space>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
  { "<space>st", "<cmd>Telescope live_grep<cr>", desc = "Text" },
  { "<space>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
  { "<space>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
  { "<space>sl", "<cmd>Telescope lines<cr>", desc = "Lines" },
  { "<space>sg", ":Telescope live_grep<cr>", desc = "Telescope Live Grep" },
  { "<space>sp", "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", desc = "Colorscheme with Preview" },
  
  -- Edit
  { "<space>e", group = "edit" },
  { "<space>ej", ':move .+1<CR>==', desc = 'move line down' },
  { "<space>ek", ':move .-2<CR>==', desc = 'move line up' },
  { "<space>eh", ':move <left>', desc = 'move char left' },
  { "<space>el", ':move <right>', desc = 'move char right' },
  { "<space>eJ", ':m .+1<CR>==', desc = 'move line down' },
  { "<space>eK", ':m .-2<CR>==', desc = 'move line up' },
  { "<space>eH", ':m <', desc = 'move line left' },
  { "<space>eL", ':m >', desc = 'move line right' },
  { "<space>ed", ':call DeleteTrailingWhitespace()<CR>', desc = 'delete trailing whitespace' },
  
  -- Workspace
  { "<space>W", group = "Workspace" },
  { "<space>WA", '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', desc = "Add workspace folder" },
  { "<space>WR", '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', desc = "Remove workspace folder" },
  { "<space>Wl", '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', desc = "List workspace folder" },
  { "<space>Ww", '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', desc = "Add Workspace Folder" },
  { "<space>WW", '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', desc = "Remove Workspace Folder" },
  
  -- Format
  { "<space>f", group = "Format" },
  { "<space>ff", '<cmd> lua vim.lsp.buf.format()<CR>', desc = "format file" },
  
  -- Treesitter
  { "<space>T", group = "Treesitter" },
  { "<space>Ti", ":TSConfigInfo<cr>", desc = "Treesitter info" },
  { "<space>Tp", ":TSPlaygroundToggle<cr>", desc = "Treesitter playground" },
  { "<space>Tr", ":TSBufEnable highlight<cr>", desc = "Treesitter highlight" },
  { "<space>TR", ":TSBufDisable highlight<cr>", desc = "Treesitter highlight" },
  
  -- Open
  { "<space>o", group = "Open" },
  { "<space>oo", ":Open<cr>", desc = "Open" },
  { "<space>oc", ":OpenCwd<cr>", desc = "Open Cwd" },
  { "<space>oC", ":OpenDir<cr>", desc = "Open Dir" },
  { "<space>of", ":OpenFile<cr>", desc = "Open File" },
  { "<space>os", ":OpenSplit<cr>", desc = "Open Split" },
  { "<space>ot", ":OpenTab<cr>", desc = "Open Tab" },
  { "<space>ow", ":OpenWin<cr>", desc = "Open Win" },
  { "<space>ov", ":OpenVertSplit<cr>", desc = "Open Vert Split" },
  { "<space>oh", ":OpenHorizSplit<cr>", desc = "Open Horiz Split" },
  { "<space>oa", ":OpenAll<cr>", desc = "Open All" },
  { "<space>op", ":OpenPane<cr>", desc = "Open Pane" },
  { "<space>or", ":OpenWinRight<cr>", desc = "Open Win Right" },
  { "<space>ol", ":OpenWinLeft<cr>", desc = "Open Win Left" },
  { "<space>ou", ":OpenWinUp<cr>", desc = "Open Win Up" },
  { "<space>od", ":OpenWinDown<cr>", desc = "Open Win Down" },
  { "<space>oj", ":OpenWinDown<cr>", desc = "Open Win Down" },
  { "<space>ok", ":OpenWinDown<cr>", desc = "Open Win Down" },
  { "<space>on", ":OpenNewTab<cr>", desc = "Open New Tab" },
  { "<space>oq", ":OpenNewWin<cr>", desc = "Open New Win" },
  { "<space>og", ":OpenNewVertSplit<cr>", desc = "Open New Vert Split" },
  { "<space>ob", ":OpenNewHorizSplit<cr>", desc = "Open New Horiz Split" },
  { "<space>om", ":OpenNewPane<cr>", desc = "Open New Pane" },
  
  -- Insert
  { "<space>i", group = "Insert" },
  { "<space>ii", ":Insert<cr>", desc = "Insert" },
  { "<space>ic", ":InsertCwd<cr>", desc = "Insert Cwd" },
  { "<space>iC", ":InsertDir<cr>", desc = "Insert Dir" },
  { "<space>if", ":InsertFile<cr>", desc = "Insert File" },
  { "<space>is", ":InsertSplit<cr>", desc = "Insert Split" },
  { "<space>it", ":InsertTab<cr>", desc = "Insert Tab" },
  { "<space>iw", ":InsertWin<cr>", desc = "Insert Win" },
  { "<space>iv", ":InsertVertSplit<cr>", desc = "Insert Vert Split" },
  { "<space>ih", ":InsertHorizSplit<cr>", desc = "Insert Horiz Split" },
  { "<space>ia", ":InsertAll<cr>", desc = "Insert All" },
  { "<space>ip", ":InsertPane<cr>", desc = "Insert Pane" },
  { "<space>ir", ":InsertWinRight<cr>", desc = "Insert Win Right" },
  { "<space>il", ":InsertWinLeft<cr>", desc = "Insert Win Left" },
  { "<space>iu", ":InsertWinUp<cr>", desc = "Insert Win Up" },
  { "<space>id", ":InsertWinDown<cr>", desc = "Insert Win Down" },
  
  -- SQL dadbod
  { "<space>S", group = "Sql dadbod" },
  { "<space>SC", ":DBUIConnect<cr>", desc = "DBUI Connect" },
  { "<space>SD", ":DBUIDisconnect<cr>", desc = "DBUI Disconnect" },
  { "<space>SE", ":DBUIExecute<cr>", desc = "DBUI Execute" },
  { "<space>Sf", ":DBUIFindBuffer<cr>", desc = "DBUI Find Buffer" },
  { "<space>Si", ":DBUI<cr>", desc = "DBUI" },
  { "<space>SI", ":DBUILastQueryInfo<cr>", desc = "DBUI Last Query Info" },
  { "<space>Sn", ":DBUINewQuery<cr>", desc = "DBUI New Query" },
  { "<space>So", ":DBUIOpen<cr>", desc = "DBUI Open" },
  { "<space>Sq", ":DBUIQuickQuery<cr>", desc = "DBUI Quick Query" },
  { "<space>Sr", ":DBUIRenameBuffer<cr>", desc = "DBUI Rename Buffer" },
  { "<space>Ss", ":DBUIShowHistory<cr>", desc = "DBUI Show History" },
  { "<space>St", ":DBUIToggleResults<cr>", desc = "DBUI Toggle Results" },
  { "<space>Su", ":DBUIUseConnection<cr>", desc = "DBUI Use Connection" },
  { "<space>Sw", ":DBUIWhereAmI<cr>", desc = "DBUI Where Am I" },
  { "<space>Sa", ":DBUIAddConnection<cr>", desc = "DBUI Add Connection" },
  { "<space>Sd", ":DBUIDeleteConnection<cr>", desc = "DBUI Delete Connection" },
  { "<space>Se", ":DBUIEditConnection<cr>", desc = "DBUI Edit Connection" },
  { "<space>Sl", ":DBUIListConnections<cr>", desc = "DBUI List Connections" },
  { "<space>SR", ":DBUIRenameConnection<cr>", desc = "DBUI Rename Connection" },
  
  -- Focus
  { "<space>z", group = "Focus" },
  { "<space>zz", ":ZenMode<cr>", desc = "Toggle Zen Mode" },
  { "<space>zt", ":Twilight<cr>", desc = "Toggle Twilight" },
  
  -- DevContainer
  { "<space>D", group = "DevContainer" },
  { "<space>Da", "<cmd>DevcontainerAttach<cr>", desc = "Attach to Container" },
  { "<space>Db", "<cmd>DevcontainerBuild<cr>", desc = "Build Container" },
  { "<space>Dc", "<cmd>DevcontainerConnect<cr>", desc = "Connect to Container" },
  { "<space>De", "<cmd>DevcontainerExec<cr>", desc = "Execute in Container" },
  { "<space>Dl", "<cmd>DevcontainerLogs<cr>", desc = "Show Container Logs" },
  { "<space>Do", "<cmd>DevcontainerOpen<cr>", desc = "Open Container Config" },
  { "<space>Dr", "<cmd>DevcontainerRemove<cr>", desc = "Remove Container" },
  { "<space>Ds", "<cmd>DevcontainerStart<cr>", desc = "Start Container" },
  { "<space>DS", "<cmd>DevcontainerStop<cr>", desc = "Stop Container" },
  { "<space>Dt", "<cmd>DevcontainerToggle<cr>", desc = "Toggle Container Terminal" },
  
  -- Visual mode mappings
  { "<space>/", "<Plug>(comment_toggle_linewise_visual)", desc = "Comment toggle linewise (visual)", mode = "v" },
  
  { "<space>l", group = "LSP", mode = "v" },
  { "<space>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", mode = "v" },
  { "<space>lv", "<cmd>lua require('lsp_lines').toggle()<cr>", desc = "Virtual Lines Info Toggle", mode = "v" },
  
  { "<space>R", group = "Refactor", mode = "v" },
  { "<space>Rf", "<cmd>lua require('refactoring').refactor('Extract Function')<CR>", desc = "Extract Function", mode = "v" },
  { "<space>RF", "<cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", desc = "Extract to File", mode = "v" },
  { "<space>Rb", "<cmd>lua require('refactoring').refactor('Extract Block')<CR>", desc = "Extract Block", mode = "v" },
  { "<space>RB", "<cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", desc = "Extract Block to File", mode = "v" },
  { "<space>Rl", "<cmd>lua require('refactoring').refactor('Extract Local')<CR>", desc = "Extract Local", mode = "v" },
  { "<space>Rv", "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>", desc = "Extract Variable", mode = "v" },
  { "<space>Rm", "<cmd>lua require('refactoring').refactor('Extract Method')<CR>", desc = "Extract Method", mode = "v" },
  { "<space>RL", "<cmd>lua require('refactoring').refactor('Inline Local')<CR>", desc = "Inline Local", mode = "v" },
  { "<space>RV", "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", desc = "Inline Variable", mode = "v" },
  { "<space>RM", "<cmd>lua require('refactoring').refactor('Inline Method')<CR>", desc = "Inline Method", mode = "v" },
  { "<space>RS", "<cmd>lua require('refactoring').select_refactor()<CR>", desc = "Select", mode = "v" },
  { "<space>RR", '<cmd>Lspsaga rename<cr>', desc = "Rename", mode = "v" },
  
  { "<space>j", group = "Java", mode = "v" },
  { "<space>je", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", desc = "extract variables", mode = "v" },
  { "<space>jE", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", desc = "extract method", mode = "v" },
})
