-- Documentación: módulo `lua/ui/whichkey-config/init.lua`.
-- Propósito: define componentes de interfaz de usuario dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `local wk = require("which-key")`.
local wk = require("which-key")

-- Línea documentada: `local conf = {`.
local conf = {
-- Línea documentada: `plugins = {`.
  plugins = {
-- Línea documentada: `marks = true, -- shows a list of your marks on ' and ``.
    marks = true, -- shows a list of your marks on ' and `
-- Línea documentada: `registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode`.
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
-- Línea documentada: `spelling = {`.
    spelling = {
-- Línea documentada: `enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions`.
      enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
-- Línea documentada: `suggestions = BlindReturn(40,20), -- how many suggestions should be shown in the list?`.
      suggestions = BlindReturn(40,20), -- how many suggestions should be shown in the list?
-- Línea documentada: `},`.
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
-- Línea documentada: `presets = {`.
    presets = {
-- Línea documentada: `operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion`.
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
-- Línea documentada: `motions = true, -- adds help for motions`.
      motions = true, -- adds help for motions
-- Línea documentada: `text_objects = true, -- help for text objects triggered after entering an operator`.
      text_objects = true, -- help for text objects triggered after entering an operator
-- Línea documentada: `windows = true, -- default bindings on <c-w>`.
      windows = true, -- default bindings on <c-w>
-- Línea documentada: `nav = true, -- misc bindings to work with windows`.
      nav = true, -- misc bindings to work with windows
-- Línea documentada: `z = true, -- bindings for folds, spelling and others prefixed with z`.
      z = true, -- bindings for folds, spelling and others prefixed with z
-- Línea documentada: `g = false, -- bindings for prefixed with g`.
      g = false, -- bindings for prefixed with g
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
-- Línea documentada: `icons = {`.
  icons = {
-- Línea documentada: `breadcrumb = BlindReturn(">", "»"), -- symbol used in the command line area that shows your active key combo`.
    breadcrumb = BlindReturn(">", "»"), -- symbol used in the command line area that shows your active key combo
-- Línea documentada: `separator = BlindReturn("->", "➜"), -- symbol used between a key and it's label`.
    separator = BlindReturn("->", "➜"), -- symbol used between a key and it's label
-- Línea documentada: `group = "+", -- symbol prepended to a group`.
    group = "+", -- symbol prepended to a group
-- Línea documentada: `},`.
  },
-- Línea documentada: `keys = {`.
  keys = {
-- Línea documentada: `scroll_down = '<c-d>', -- binding to scroll down inside the popup`.
    scroll_down = '<c-d>', -- binding to scroll down inside the popup
-- Línea documentada: `scroll_up = '<c-u>', -- binding to scroll up inside the popup`.
    scroll_up = '<c-u>', -- binding to scroll up inside the popup
-- Línea documentada: `},`.
  },
-- Línea documentada: `win = {`.
  win = {
-- Línea documentada: `padding = { 1, 0 }, -- extra window padding [top, right, bottom, left]`.
    padding = { 1, 0 }, -- extra window padding [top, right, bottom, left]
-- Línea documentada: `},`.
  },
-- Línea documentada: `layout = {`.
  layout = {
-- Línea documentada: `height = { min = 100, max = 125 }, -- min and max height of the columns`.
    height = { min = 100, max = 125 }, -- min and max height of the columns
-- Línea documentada: `width = { min = 20, max = 50 }, -- min and max width of the columns`.
    width = { min = 20, max = 50 }, -- min and max width of the columns
-- Línea documentada: `spacing = 2, -- spacing between columns`.
    spacing = 2, -- spacing between columns
-- Línea documentada: `align = "left", -- align columns left, center or right`.
    align = "left", -- align columns left, center or right
-- Línea documentada: `},`.
  },
-- Línea documentada: `show_help = true, -- show help message on the command line when the popup is visible`.
  show_help = true, -- show help message on the command line when the popup is visible
  -- triggers = {"<leader>"} -- or specify a list manually
-- Línea documentada: `triggers = {`.
  triggers = {
-- Línea documentada: `{ "<auto>", mode = "nxso" },`.
    { "<auto>", mode = "nxso" },
-- Línea documentada: `},`.
  },
-- Línea documentada: `}`.
}
-- Línea documentada: `wk.setup(conf)`.
wk.setup(conf)

-- Línea documentada: `local Terminal = require('toggleterm.terminal').Terminal`.
local Terminal = require('toggleterm.terminal').Terminal
-- Línea documentada: `local toggle_float = function()`.
local toggle_float = function()
-- Línea documentada: `local float = Terminal:new({direction = "float"})`.
  local float = Terminal:new({direction = "float"})
-- Línea documentada: `return float:toggle()`.
  return float:toggle()
-- Línea documentada: `end`.
end
-- Línea documentada: `local toggle_lazygit = function()`.
local toggle_lazygit = function()
-- Línea documentada: `local lazygit = Terminal:new({cmd = 'lazygit', direction = "float"})`.
  local lazygit = Terminal:new({cmd = 'lazygit', direction = "float"})
-- Línea documentada: `return lazygit:toggle()`.
  return lazygit:toggle()
-- Línea documentada: `end`.
end
-- Línea documentada: `wk.add({`.
wk.add({
  -- Normal mode mappings
-- Línea documentada: `{ "<space>w", "<cmd>w!<CR>", desc = "Save" },`.
  { "<space>w", "<cmd>w!<CR>", desc = "Save" },
-- Línea documentada: `{ "<space>/", "<Plug>(comment_toggle_linewise_current)", desc = "Comment toggle current line" },`.
  { "<space>/", "<Plug>(comment_toggle_linewise_current)", desc = "Comment toggle current line" },
-- Línea documentada: `{ "<space>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },`.
  { "<space>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
  
  -- Buffers
-- Línea documentada: `{ "<space>b", group = "Buffers" },`.
  { "<space>b", group = "Buffers" },
-- Línea documentada: `{ "<space>bj", "<cmd>BufferLinePick<cr>", desc = "Jump" },`.
  { "<space>bj", "<cmd>BufferLinePick<cr>", desc = "Jump" },
-- Línea documentada: `{ "<space>bf", "<cmd>Telescope buffers<cr>", desc = "Find" },`.
  { "<space>bf", "<cmd>Telescope buffers<cr>", desc = "Find" },
-- Línea documentada: `{ "<space>bc", "<cmd>BufferKill<CR>", desc = "Close Buffer" },`.
  { "<space>bc", "<cmd>BufferKill<CR>", desc = "Close Buffer" },
-- Línea documentada: `{ "<space>bb", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous" },`.
  { "<space>bb", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous" },
-- Línea documentada: `{ "<space>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next" },`.
  { "<space>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next" },
-- Línea documentada: `{ "<space>be", "<cmd>BufferLinePickClose<cr>", desc = "Pick which buffer to close" },`.
  { "<space>be", "<cmd>BufferLinePickClose<cr>", desc = "Pick which buffer to close" },
-- Línea documentada: `{ "<space>bh", "<cmd>BufferLineCloseLeft<cr>", desc = "Close all to the left" },`.
  { "<space>bh", "<cmd>BufferLineCloseLeft<cr>", desc = "Close all to the left" },
-- Línea documentada: `{ "<space>bl", "<cmd>BufferLineCloseRight<cr>", desc = "Close all to the right" },`.
  { "<space>bl", "<cmd>BufferLineCloseRight<cr>", desc = "Close all to the right" },
-- Línea documentada: `{ "<space>bD", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort by directory" },`.
  { "<space>bD", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort by directory" },
-- Línea documentada: `{ "<space>bL", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort by language" },`.
  { "<space>bL", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort by language" },
  
  -- Debug
-- Línea documentada: `{ "<space>d", group = "Debug" },`.
  { "<space>d", group = "Debug" },
-- Línea documentada: `{ "<space>dd", "<cmd>lua require'dap'.continue()<CR>", desc = "Continue" },`.
  { "<space>dd", "<cmd>lua require'dap'.continue()<CR>", desc = "Continue" },
-- Línea documentada: `{ "<space>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "Toggle Breakpoint" },`.
  { "<space>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "Toggle Breakpoint" },
-- Línea documentada: `{ "<space>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", desc = "Set Breakpoint" },`.
  { "<space>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", desc = "Set Breakpoint" },
-- Línea documentada: `{ "<space>dl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", desc = "Log Point" },`.
  { "<space>dl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", desc = "Log Point" },
-- Línea documentada: `{ "<space>dp", "<cmd>lua require'dap'.step_over()<CR>", desc = "Step Over" },`.
  { "<space>dp", "<cmd>lua require'dap'.step_over()<CR>", desc = "Step Over" },
-- Línea documentada: `{ "<space>dn", "<cmd>lua require'dap'.step_into()<CR>", desc = "Step Into" },`.
  { "<space>dn", "<cmd>lua require'dap'.step_into()<CR>", desc = "Step Into" },
-- Línea documentada: `{ "<space>do", "<cmd>lua require'dap'.step_out()<CR>", desc = "Step Out" },`.
  { "<space>do", "<cmd>lua require'dap'.step_out()<CR>", desc = "Step Out" },
-- Línea documentada: `{ "<space>dr", "<cmd>lua require'dap'.repl.open()<CR>", desc = "Repl" },`.
  { "<space>dr", "<cmd>lua require'dap'.repl.open()<CR>", desc = "Repl" },
-- Línea documentada: `{ "<space>dR", "<cmd>lua require'dap'.run_last()<CR>", desc = "Run Last" },`.
  { "<space>dR", "<cmd>lua require'dap'.run_last()<CR>", desc = "Run Last" },
-- Línea documentada: `{ "<space>dc", "<cmd>lua require'dap'.continue()<CR>", desc = "Continue" },`.
  { "<space>dc", "<cmd>lua require'dap'.continue()<CR>", desc = "Continue" },
-- Línea documentada: `{ "<space>ds", "<cmd>lua require'dap'.stop()<CR>", desc = "Stop" },`.
  { "<space>ds", "<cmd>lua require'dap'.stop()<CR>", desc = "Stop" },
-- Línea documentada: `{ "<space>di", "<cmd>lua require'dap'.step_into()<CR>", desc = "Step Into" },`.
  { "<space>di", "<cmd>lua require'dap'.step_into()<CR>", desc = "Step Into" },
-- Línea documentada: `{ "<space>dD", group = "DapUI" },`.
  { "<space>dD", group = "DapUI" },
-- Línea documentada: `{ "<space>dDt", "<cmd>lua require'dapui'.toggle()<CR>", desc = "Toggle" },`.
  { "<space>dDt", "<cmd>lua require'dapui'.toggle()<CR>", desc = "Toggle" },
-- Línea documentada: `{ "<space>dDo", "<cmd>lua require'dapui'.open()<CR>", desc = "Open" },`.
  { "<space>dDo", "<cmd>lua require'dapui'.open()<CR>", desc = "Open" },
-- Línea documentada: `{ "<space>dDh", "<cmd>lua require'dapui'.float_element('hover')<CR>", desc = "Hover" },`.
  { "<space>dDh", "<cmd>lua require'dapui'.float_element('hover')<CR>", desc = "Hover" },
-- Línea documentada: `{ "<space>dDs", "<cmd>lua require'dapui'.float_element('scopes')<CR>", desc = "Scopes" },`.
  { "<space>dDs", "<cmd>lua require'dapui'.float_element('scopes')<CR>", desc = "Scopes" },
-- Línea documentada: `{ "<space>dDb", "<cmd>lua require'dapui'.float_element('breakpoints')<CR>", desc = "Breakpoints" },`.
  { "<space>dDb", "<cmd>lua require'dapui'.float_element('breakpoints')<CR>", desc = "Breakpoints" },
-- Línea documentada: `{ "<space>dDw", "<cmd>lua require'dapui'.float_element('watch')<CR>", desc = "Watch" },`.
  { "<space>dDw", "<cmd>lua require'dapui'.float_element('watch')<CR>", desc = "Watch" },
-- Línea documentada: `{ "<space>dDS", "<cmd>lua require'dapui'.float_element('stacks')<CR>", desc = "Stacks" },`.
  { "<space>dDS", "<cmd>lua require'dapui'.float_element('stacks')<CR>", desc = "Stacks" },
-- Línea documentada: `{ "<space>dDT", "<cmd>lua require'dapui'.float_element('threads')<CR>", desc = "Threads" },`.
  { "<space>dDT", "<cmd>lua require'dapui'.float_element('threads')<CR>", desc = "Threads" },
-- Línea documentada: `{ "<space>dDf", "<cmd>lua require'dapui'.float_element('frames')<CR>", desc = "Frames" },`.
  { "<space>dDf", "<cmd>lua require'dapui'.float_element('frames')<CR>", desc = "Frames" },
-- Línea documentada: `{ "<space>dDl", "<cmd>lua require'dapui'.float_element('locals')<CR>", desc = "Locals" },`.
  { "<space>dDl", "<cmd>lua require'dapui'.float_element('locals')<CR>", desc = "Locals" },
-- Línea documentada: `{ "<space>dDc", "<cmd>lua require'dapui'.close()<CR>", desc = "Close" },`.
  { "<space>dDc", "<cmd>lua require'dapui'.close()<CR>", desc = "Close" },
  
  -- DBEE
-- Línea documentada: `{ "<space>p", group = "DBEE" },`.
  { "<space>p", group = "DBEE" },
-- Línea documentada: `{ "<space>po", "<cmd>lua require'dbee'.open()<cr>", desc = "Open" },`.
  { "<space>po", "<cmd>lua require'dbee'.open()<cr>", desc = "Open" },
  
  -- Java
-- Línea documentada: `{ "<space>j", group = "Java" },`.
  { "<space>j", group = "Java" },
-- Línea documentada: `{ "<space>ji", "<Cmd>lua require'jdtls'.organize_imports()<CR>", desc = "organize imports" },`.
  { "<space>ji", "<Cmd>lua require'jdtls'.organize_imports()<CR>", desc = "organize imports" },
-- Línea documentada: `{ "<space>jT", "<Cmd>lua require'jdtls'.test_class()<CR>", desc = "test class" },`.
  { "<space>jT", "<Cmd>lua require'jdtls'.test_class()<CR>", desc = "test class" },
-- Línea documentada: `{ "<space>jn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", desc = "text nearest method" },`.
  { "<space>jn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", desc = "text nearest method" },
-- Línea documentada: `{ "<space>je", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", desc = "extract variables" },`.
  { "<space>je", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", desc = "extract variables" },
-- Línea documentada: `{ "<space>js", "<Cmd>lua require('telescope').extensions.scaladex.scaladex.search()<cr>", desc = "scaladex telescope" },`.
  { "<space>js", "<Cmd>lua require('telescope').extensions.scaladex.scaladex.search()<cr>", desc = "scaladex telescope" },
  
  -- Git
-- Línea documentada: `{ "<space>G", group = "Git" },`.
  { "<space>G", group = "Git" },
-- Línea documentada: `{ "<space>Gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },`.
  { "<space>Gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },
-- Línea documentada: `{ "<space>Gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" },`.
  { "<space>Gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" },
-- Línea documentada: `{ "<space>Gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },`.
  { "<space>Gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
-- Línea documentada: `{ "<space>Gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },`.
  { "<space>Gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
-- Línea documentada: `{ "<space>Gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },`.
  { "<space>Gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
-- Línea documentada: `{ "<space>GR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },`.
  { "<space>GR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
-- Línea documentada: `{ "<space>Gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },`.
  { "<space>Gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
-- Línea documentada: `{ "<space>Gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },`.
  { "<space>Gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
-- Línea documentada: `{ "<space>Go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },`.
  { "<space>Go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
-- Línea documentada: `{ "<space>Gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },`.
  { "<space>Gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
-- Línea documentada: `{ "<space>Gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },`.
  { "<space>Gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
-- Línea documentada: `{ "<space>GC", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout commit(for current file)" },`.
  { "<space>GC", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout commit(for current file)" },
-- Línea documentada: `{ "<space>Gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git Diff" },`.
  { "<space>Gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git Diff" },
-- Línea documentada: `{ "<space>GG", group = "Git Advanced" },`.
  { "<space>GG", group = "Git Advanced" },
-- Línea documentada: `{ "<space>GGg", ":GitGrep<cr>", desc = "Git Grep" },`.
  { "<space>GGg", ":GitGrep<cr>", desc = "Git Grep" },
-- Línea documentada: `{ "<space>GGs", ":GitStash<cr>", desc = "Git Stash" },`.
  { "<space>GGs", ":GitStash<cr>", desc = "Git Stash" },
-- Línea documentada: `{ "<space>GGc", ":GitCommit<cr>", desc = "Git Commit" },`.
  { "<space>GGc", ":GitCommit<cr>", desc = "Git Commit" },
-- Línea documentada: `{ "<space>GGp", ":GitPush<cr>", desc = "Git Push" },`.
  { "<space>GGp", ":GitPush<cr>", desc = "Git Push" },
-- Línea documentada: `{ "<space>GGu", ":GitPull<cr>", desc = "Git Pull" },`.
  { "<space>GGu", ":GitPull<cr>", desc = "Git Pull" },
-- Línea documentada: `{ "<space>GGd", ":GitDiff<cr>", desc = "Git Diff" },`.
  { "<space>GGd", ":GitDiff<cr>", desc = "Git Diff" },
-- Línea documentada: `{ "<space>GGa", ":GitAdd<cr>", desc = "Git Add" },`.
  { "<space>GGa", ":GitAdd<cr>", desc = "Git Add" },
-- Línea documentada: `{ "<space>GGr", ":GitRevert<cr>", desc = "Git Revert" },`.
  { "<space>GGr", ":GitRevert<cr>", desc = "Git Revert" },
-- Línea documentada: `{ "<space>GGb", ":GitBranch<cr>", desc = "Git Branch" },`.
  { "<space>GGb", ":GitBranch<cr>", desc = "Git Branch" },
-- Línea documentada: `{ "<space>GGm", ":GitMerge<cr>", desc = "Git Merge" },`.
  { "<space>GGm", ":GitMerge<cr>", desc = "Git Merge" },
-- Línea documentada: `{ "<space>GGt", ":GitTag<cr>", desc = "Git Tag" },`.
  { "<space>GGt", ":GitTag<cr>", desc = "Git Tag" },
-- Línea documentada: `{ "<space>GGy", ":GitShow<cr>", desc = "Git Show" },`.
  { "<space>GGy", ":GitShow<cr>", desc = "Git Show" },
-- Línea documentada: `{ "<space>GGn", ":GitNew<cr>", desc = "Git New" },`.
  { "<space>GGn", ":GitNew<cr>", desc = "Git New" },
-- Línea documentada: `{ "<space>GGe", ":GitExport<cr>", desc = "Git Export" },`.
  { "<space>GGe", ":GitExport<cr>", desc = "Git Export" },
-- Línea documentada: `{ "<space>GGi", ":GitIgnore<cr>", desc = "Git Ignore" },`.
  { "<space>GGi", ":GitIgnore<cr>", desc = "Git Ignore" },
  
  -- Terminal
-- Línea documentada: `{ "<space>t", group = "Terminal" },`.
  { "<space>t", group = "Terminal" },
-- Línea documentada: `{ "<space>tt", ":ToggleTerm<cr>", desc = "Split Below" },`.
  { "<space>tt", ":ToggleTerm<cr>", desc = "Split Below" },
-- Línea documentada: `{ "<space>tf", toggle_float, desc = "Floating Terminal" },`.
  { "<space>tf", toggle_float, desc = "Floating Terminal" },
-- Línea documentada: `{ "<space>tl", toggle_lazygit, desc = "LazyGit" },`.
  { "<space>tl", toggle_lazygit, desc = "LazyGit" },
  
  -- LSP
-- Línea documentada: `{ "<space>l", group = "LSP" },`.
  { "<space>l", group = "LSP" },
-- Línea documentada: `{ "<space>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },`.
  { "<space>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
-- Línea documentada: `{ "<space>lb", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", desc = "Buffer Diagnostics" },`.
  { "<space>lb", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", desc = "Buffer Diagnostics" },
-- Línea documentada: `{ "<space>lw", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },`.
  { "<space>lw", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
-- Línea documentada: `{ "<space>lI", "<cmd>LspInfo<cr>", desc = "Info" },`.
  { "<space>lI", "<cmd>LspInfo<cr>", desc = "Info" },
-- Línea documentada: `{ "<space>lM", "<cmd>Mason<cr>", desc = "Mason Info" },`.
  { "<space>lM", "<cmd>Mason<cr>", desc = "Mason Info" },
-- Línea documentada: `{ "<space>lJ", vim.diagnostic.goto_next, desc = "Next Diagnostic" },`.
  { "<space>lJ", vim.diagnostic.goto_next, desc = "Next Diagnostic" },
-- Línea documentada: `{ "<space>lK", vim.diagnostic.goto_prev, desc = "Prev Diagnostic" },`.
  { "<space>lK", vim.diagnostic.goto_prev, desc = "Prev Diagnostic" },
-- Línea documentada: `{ "<space>ll", vim.lsp.codelens.run, desc = "CodeLens Action" },`.
  { "<space>ll", vim.lsp.codelens.run, desc = "CodeLens Action" },
-- Línea documentada: `{ "<space>lp", group = "Peek" },`.
  { "<space>lp", group = "Peek" },
-- Línea documentada: `{ "<space>lq", vim.diagnostic.setloclist, desc = "Quickfix" },`.
  { "<space>lq", vim.diagnostic.setloclist, desc = "Quickfix" },
-- Línea documentada: `{ "<space>lr", vim.lsp.buf.rename, desc = "Rename" },`.
  { "<space>lr", vim.lsp.buf.rename, desc = "Rename" },
-- Línea documentada: `{ "<space>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },`.
  { "<space>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
-- Línea documentada: `{ "<space>lW", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },`.
  { "<space>lW", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
-- Línea documentada: `{ "<space>lf", "<cmd>Telescope quickfix<cr>", desc = "Telescope Quickfix" },`.
  { "<space>lf", "<cmd>Telescope quickfix<cr>", desc = "Telescope Quickfix" },
-- Línea documentada: `{ "<space>li", ":LspInfo<cr>", desc = "Connected Language Servers" },`.
  { "<space>li", ":LspInfo<cr>", desc = "Connected Language Servers" },
-- Línea documentada: `{ "<space>lQ", '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', desc = "Show loclist" },`.
  { "<space>lQ", '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', desc = "Show loclist" },
-- Línea documentada: `{ "<space>lk", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature Help" },`.
  { "<space>lk", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Signature Help" },
-- Línea documentada: `{ "<space>lh", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover Commands" },`.
  { "<space>lh", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover Commands" },
-- Línea documentada: `{ "<space>lL", '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', desc = "List Workspace Folders" },`.
  { "<space>lL", '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', desc = "List Workspace Folders" },
-- Línea documentada: `{ "<space>lt", '<cmd>lua vim.lsp.buf.type_definition()<cr>', desc = "Type Definition" },`.
  { "<space>lt", '<cmd>lua vim.lsp.buf.type_definition()<cr>', desc = "Type Definition" },
-- Línea documentada: `{ "<space>ld", '<cmd>lua vim.lsp.buf.definition()<cr>', desc = "Go To Definition" },`.
  { "<space>ld", '<cmd>lua vim.lsp.buf.definition()<cr>', desc = "Go To Definition" },
-- Línea documentada: `{ "<space>lD", '<cmd>lua vim.lsp.buf.declaration()<cr>', desc = "Go To Declaration" },`.
  { "<space>lD", '<cmd>lua vim.lsp.buf.declaration()<cr>', desc = "Go To Declaration" },
-- Línea documentada: `{ "<space>lF", group = "Refactor" },`.
  { "<space>lF", group = "Refactor" },
-- Línea documentada: `{ "<space>lFS", "<cmd>lua require('refactoring').select_refactor()<CR>", desc = "Select" },`.
  { "<space>lFS", "<cmd>lua require('refactoring').select_refactor()<CR>", desc = "Select" },
-- Línea documentada: `{ "<space>lFb", "<cmd>lua require('refactoring').refactor('Extract Block')<CR>", desc = "Extract Block" },`.
  { "<space>lFb", "<cmd>lua require('refactoring').refactor('Extract Block')<CR>", desc = "Extract Block" },
-- Línea documentada: `{ "<space>lFB", "<cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", desc = "Extract Block to File" },`.
  { "<space>lFB", "<cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", desc = "Extract Block to File" },
-- Línea documentada: `{ "<space>lFl", "<cmd>lua require('refactoring').refactor('Extract Local')<CR>", desc = "Extract Local" },`.
  { "<space>lFl", "<cmd>lua require('refactoring').refactor('Extract Local')<CR>", desc = "Extract Local" },
-- Línea documentada: `{ "<space>lFv", "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>", desc = "Extract Variable" },`.
  { "<space>lFv", "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>", desc = "Extract Variable" },
-- Línea documentada: `{ "<space>lFm", "<cmd>lua require('refactoring').refactor('Extract Method')<CR>", desc = "Extract Method" },`.
  { "<space>lFm", "<cmd>lua require('refactoring').refactor('Extract Method')<CR>", desc = "Extract Method" },
-- Línea documentada: `{ "<space>lFL", "<cmd>lua require('refactoring').refactor('Inline Local')<CR>", desc = "Inline Local" },`.
  { "<space>lFL", "<cmd>lua require('refactoring').refactor('Inline Local')<CR>", desc = "Inline Local" },
-- Línea documentada: `{ "<space>lFV", "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", desc = "Inline Variable" },`.
  { "<space>lFV", "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", desc = "Inline Variable" },
-- Línea documentada: `{ "<space>lFM", "<cmd>lua require('refactoring').refactor('Inline Method')<CR>", desc = "Inline Method" },`.
  { "<space>lFM", "<cmd>lua require('refactoring').refactor('Inline Method')<CR>", desc = "Inline Method" },
-- Línea documentada: `{ "<space>lFR", '<cmd>Lspsaga rename<cr>', desc = "Rename" },`.
  { "<space>lFR", '<cmd>Lspsaga rename<cr>', desc = "Rename" },
-- Línea documentada: `{ "<space>lR", '<cmd>lua vim.lsp.buf.references()<cr>', desc = "References" },`.
  { "<space>lR", '<cmd>lua vim.lsp.buf.references()<cr>', desc = "References" },
-- Línea documentada: `{ "<space>le", '<cmd>Lspsaga show_line_diagnostics<cr>', desc = "Show Line Diagnostics" },`.
  { "<space>le", '<cmd>Lspsaga show_line_diagnostics<cr>', desc = "Show Line Diagnostics" },
-- Línea documentada: `{ "<space>lE", '<cmd>lua vim.diagnostic.open_float()<CR>', desc = "Show line diagnostics" },`.
  { "<space>lE", '<cmd>lua vim.diagnostic.open_float()<CR>', desc = "Show line diagnostics" },
-- Línea documentada: `{ "<space>ln", '<cmd>Lspsaga diagnostic_jump_next<cr>', desc = "Go To Next Diagnostic" },`.
  { "<space>ln", '<cmd>Lspsaga diagnostic_jump_next<cr>', desc = "Go To Next Diagnostic" },
-- Línea documentada: `{ "<space>lN", '<cmd>Lspsaga diagnostic_jump_prev<cr>', desc = "Go To Previous Diagnostic" },`.
  { "<space>lN", '<cmd>Lspsaga diagnostic_jump_prev<cr>', desc = "Go To Previous Diagnostic" },
-- Línea documentada: `{ "<space>lv", "<cmd>lua require('lsp_lines').toggle()<cr>", desc = "Virtual Lines Info Toggle" },`.
  { "<space>lv", "<cmd>lua require('lsp_lines').toggle()<cr>", desc = "Virtual Lines Info Toggle" },
  
  -- Logs
-- Línea documentada: `{ "<space>L", group = "Logs" },`.
  { "<space>L", group = "Logs" },
-- Línea documentada: `{ "<space>LN", "<cmd>edit $NVIM_LOG_FILE<cr>", desc = "Open the Neovim logfile" },`.
  { "<space>LN", "<cmd>edit $NVIM_LOG_FILE<cr>", desc = "Open the Neovim logfile" },
-- Línea documentada: `{ "<space>Ln", "<cmd>Telescope notify<cr>", desc = "View Notifications" },`.
  { "<space>Ln", "<cmd>Telescope notify<cr>", desc = "View Notifications" },
  
  -- Search
-- Línea documentada: `{ "<space>s", group = "Search" },`.
  { "<space>s", group = "Search" },
-- Línea documentada: `{ "<space>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },`.
  { "<space>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
-- Línea documentada: `{ "<space>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },`.
  { "<space>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
-- Línea documentada: `{ "<space>sf", "<cmd>Telescope find_files<cr>", desc = "Find File" },`.
  { "<space>sf", "<cmd>Telescope find_files<cr>", desc = "Find File" },
-- Línea documentada: `{ "<space>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },`.
  { "<space>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
-- Línea documentada: `{ "<space>sH", "<cmd>Telescope highlights<cr>", desc = "Find highlight groups" },`.
  { "<space>sH", "<cmd>Telescope highlights<cr>", desc = "Find highlight groups" },
-- Línea documentada: `{ "<space>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },`.
  { "<space>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
-- Línea documentada: `{ "<space>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },`.
  { "<space>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
-- Línea documentada: `{ "<space>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },`.
  { "<space>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
-- Línea documentada: `{ "<space>st", "<cmd>Telescope live_grep<cr>", desc = "Text" },`.
  { "<space>st", "<cmd>Telescope live_grep<cr>", desc = "Text" },
-- Línea documentada: `{ "<space>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },`.
  { "<space>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
-- Línea documentada: `{ "<space>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },`.
  { "<space>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
-- Línea documentada: `{ "<space>sl", "<cmd>Telescope lines<cr>", desc = "Lines" },`.
  { "<space>sl", "<cmd>Telescope lines<cr>", desc = "Lines" },
-- Línea documentada: `{ "<space>sg", ":Telescope live_grep<cr>", desc = "Telescope Live Grep" },`.
  { "<space>sg", ":Telescope live_grep<cr>", desc = "Telescope Live Grep" },
-- Línea documentada: `{ "<space>sp", "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", desc = "Colorscheme with Preview" },`.
  { "<space>sp", "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", desc = "Colorscheme with Preview" },
  
  -- Edit
-- Línea documentada: `{ "<space>e", group = "edit" },`.
  { "<space>e", group = "edit" },
-- Línea documentada: `{ "<space>ej", ':move .+1<CR>==', desc = 'move line down' },`.
  { "<space>ej", ':move .+1<CR>==', desc = 'move line down' },
-- Línea documentada: `{ "<space>ek", ':move .-2<CR>==', desc = 'move line up' },`.
  { "<space>ek", ':move .-2<CR>==', desc = 'move line up' },
-- Línea documentada: `{ "<space>eh", ':move <left>', desc = 'move char left' },`.
  { "<space>eh", ':move <left>', desc = 'move char left' },
-- Línea documentada: `{ "<space>el", ':move <right>', desc = 'move char right' },`.
  { "<space>el", ':move <right>', desc = 'move char right' },
-- Línea documentada: `{ "<space>eJ", ':m .+1<CR>==', desc = 'move line down' },`.
  { "<space>eJ", ':m .+1<CR>==', desc = 'move line down' },
-- Línea documentada: `{ "<space>eK", ':m .-2<CR>==', desc = 'move line up' },`.
  { "<space>eK", ':m .-2<CR>==', desc = 'move line up' },
-- Línea documentada: `{ "<space>eH", ':m <', desc = 'move line left' },`.
  { "<space>eH", ':m <', desc = 'move line left' },
-- Línea documentada: `{ "<space>eL", ':m >', desc = 'move line right' },`.
  { "<space>eL", ':m >', desc = 'move line right' },
-- Línea documentada: `{ "<space>ed", ':call DeleteTrailingWhitespace()<CR>', desc = 'delete trailing whitespace' },`.
  { "<space>ed", ':call DeleteTrailingWhitespace()<CR>', desc = 'delete trailing whitespace' },
  
  -- Workspace
-- Línea documentada: `{ "<space>W", group = "Workspace" },`.
  { "<space>W", group = "Workspace" },
-- Línea documentada: `{ "<space>WA", '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', desc = "Add workspace folder" },`.
  { "<space>WA", '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', desc = "Add workspace folder" },
-- Línea documentada: `{ "<space>WR", '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', desc = "Remove workspace folder" },`.
  { "<space>WR", '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', desc = "Remove workspace folder" },
-- Línea documentada: `{ "<space>Wl", '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', desc = "List workspace folder" },`.
  { "<space>Wl", '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', desc = "List workspace folder" },
-- Línea documentada: `{ "<space>Ww", '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', desc = "Add Workspace Folder" },`.
  { "<space>Ww", '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', desc = "Add Workspace Folder" },
-- Línea documentada: `{ "<space>WW", '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', desc = "Remove Workspace Folder" },`.
  { "<space>WW", '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', desc = "Remove Workspace Folder" },
  
  -- Format
-- Línea documentada: `{ "<space>f", group = "Format" },`.
  { "<space>f", group = "Format" },
-- Línea documentada: `{ "<space>ff", '<cmd> lua vim.lsp.buf.format()<CR>', desc = "format file" },`.
  { "<space>ff", '<cmd> lua vim.lsp.buf.format()<CR>', desc = "format file" },
  
  -- Treesitter
-- Línea documentada: `{ "<space>T", group = "Treesitter" },`.
  { "<space>T", group = "Treesitter" },
-- Línea documentada: `{ "<space>Ti", ":TSConfigInfo<cr>", desc = "Treesitter info" },`.
  { "<space>Ti", ":TSConfigInfo<cr>", desc = "Treesitter info" },
-- Línea documentada: `{ "<space>Tp", ":TSPlaygroundToggle<cr>", desc = "Treesitter playground" },`.
  { "<space>Tp", ":TSPlaygroundToggle<cr>", desc = "Treesitter playground" },
-- Línea documentada: `{ "<space>Tr", ":TSBufEnable highlight<cr>", desc = "Treesitter highlight" },`.
  { "<space>Tr", ":TSBufEnable highlight<cr>", desc = "Treesitter highlight" },
-- Línea documentada: `{ "<space>TR", ":TSBufDisable highlight<cr>", desc = "Treesitter highlight" },`.
  { "<space>TR", ":TSBufDisable highlight<cr>", desc = "Treesitter highlight" },
  
  -- Open
-- Línea documentada: `{ "<space>o", group = "Open" },`.
  { "<space>o", group = "Open" },
-- Línea documentada: `{ "<space>oo", ":Open<cr>", desc = "Open" },`.
  { "<space>oo", ":Open<cr>", desc = "Open" },
-- Línea documentada: `{ "<space>oc", ":OpenCwd<cr>", desc = "Open Cwd" },`.
  { "<space>oc", ":OpenCwd<cr>", desc = "Open Cwd" },
-- Línea documentada: `{ "<space>oC", ":OpenDir<cr>", desc = "Open Dir" },`.
  { "<space>oC", ":OpenDir<cr>", desc = "Open Dir" },
-- Línea documentada: `{ "<space>of", ":OpenFile<cr>", desc = "Open File" },`.
  { "<space>of", ":OpenFile<cr>", desc = "Open File" },
-- Línea documentada: `{ "<space>os", ":OpenSplit<cr>", desc = "Open Split" },`.
  { "<space>os", ":OpenSplit<cr>", desc = "Open Split" },
-- Línea documentada: `{ "<space>ot", ":OpenTab<cr>", desc = "Open Tab" },`.
  { "<space>ot", ":OpenTab<cr>", desc = "Open Tab" },
-- Línea documentada: `{ "<space>ow", ":OpenWin<cr>", desc = "Open Win" },`.
  { "<space>ow", ":OpenWin<cr>", desc = "Open Win" },
-- Línea documentada: `{ "<space>ov", ":OpenVertSplit<cr>", desc = "Open Vert Split" },`.
  { "<space>ov", ":OpenVertSplit<cr>", desc = "Open Vert Split" },
-- Línea documentada: `{ "<space>oh", ":OpenHorizSplit<cr>", desc = "Open Horiz Split" },`.
  { "<space>oh", ":OpenHorizSplit<cr>", desc = "Open Horiz Split" },
-- Línea documentada: `{ "<space>oa", ":OpenAll<cr>", desc = "Open All" },`.
  { "<space>oa", ":OpenAll<cr>", desc = "Open All" },
-- Línea documentada: `{ "<space>op", ":OpenPane<cr>", desc = "Open Pane" },`.
  { "<space>op", ":OpenPane<cr>", desc = "Open Pane" },
-- Línea documentada: `{ "<space>or", ":OpenWinRight<cr>", desc = "Open Win Right" },`.
  { "<space>or", ":OpenWinRight<cr>", desc = "Open Win Right" },
-- Línea documentada: `{ "<space>ol", ":OpenWinLeft<cr>", desc = "Open Win Left" },`.
  { "<space>ol", ":OpenWinLeft<cr>", desc = "Open Win Left" },
-- Línea documentada: `{ "<space>ou", ":OpenWinUp<cr>", desc = "Open Win Up" },`.
  { "<space>ou", ":OpenWinUp<cr>", desc = "Open Win Up" },
-- Línea documentada: `{ "<space>od", ":OpenWinDown<cr>", desc = "Open Win Down" },`.
  { "<space>od", ":OpenWinDown<cr>", desc = "Open Win Down" },
-- Línea documentada: `{ "<space>oj", ":OpenWinDown<cr>", desc = "Open Win Down" },`.
  { "<space>oj", ":OpenWinDown<cr>", desc = "Open Win Down" },
-- Línea documentada: `{ "<space>ok", ":OpenWinDown<cr>", desc = "Open Win Down" },`.
  { "<space>ok", ":OpenWinDown<cr>", desc = "Open Win Down" },
-- Línea documentada: `{ "<space>on", ":OpenNewTab<cr>", desc = "Open New Tab" },`.
  { "<space>on", ":OpenNewTab<cr>", desc = "Open New Tab" },
-- Línea documentada: `{ "<space>oq", ":OpenNewWin<cr>", desc = "Open New Win" },`.
  { "<space>oq", ":OpenNewWin<cr>", desc = "Open New Win" },
-- Línea documentada: `{ "<space>og", ":OpenNewVertSplit<cr>", desc = "Open New Vert Split" },`.
  { "<space>og", ":OpenNewVertSplit<cr>", desc = "Open New Vert Split" },
-- Línea documentada: `{ "<space>ob", ":OpenNewHorizSplit<cr>", desc = "Open New Horiz Split" },`.
  { "<space>ob", ":OpenNewHorizSplit<cr>", desc = "Open New Horiz Split" },
-- Línea documentada: `{ "<space>om", ":OpenNewPane<cr>", desc = "Open New Pane" },`.
  { "<space>om", ":OpenNewPane<cr>", desc = "Open New Pane" },
  
  -- Insert
-- Línea documentada: `{ "<space>i", group = "Insert" },`.
  { "<space>i", group = "Insert" },
-- Línea documentada: `{ "<space>ii", ":Insert<cr>", desc = "Insert" },`.
  { "<space>ii", ":Insert<cr>", desc = "Insert" },
-- Línea documentada: `{ "<space>ic", ":InsertCwd<cr>", desc = "Insert Cwd" },`.
  { "<space>ic", ":InsertCwd<cr>", desc = "Insert Cwd" },
-- Línea documentada: `{ "<space>iC", ":InsertDir<cr>", desc = "Insert Dir" },`.
  { "<space>iC", ":InsertDir<cr>", desc = "Insert Dir" },
-- Línea documentada: `{ "<space>if", ":InsertFile<cr>", desc = "Insert File" },`.
  { "<space>if", ":InsertFile<cr>", desc = "Insert File" },
-- Línea documentada: `{ "<space>is", ":InsertSplit<cr>", desc = "Insert Split" },`.
  { "<space>is", ":InsertSplit<cr>", desc = "Insert Split" },
-- Línea documentada: `{ "<space>it", ":InsertTab<cr>", desc = "Insert Tab" },`.
  { "<space>it", ":InsertTab<cr>", desc = "Insert Tab" },
-- Línea documentada: `{ "<space>iw", ":InsertWin<cr>", desc = "Insert Win" },`.
  { "<space>iw", ":InsertWin<cr>", desc = "Insert Win" },
-- Línea documentada: `{ "<space>iv", ":InsertVertSplit<cr>", desc = "Insert Vert Split" },`.
  { "<space>iv", ":InsertVertSplit<cr>", desc = "Insert Vert Split" },
-- Línea documentada: `{ "<space>ih", ":InsertHorizSplit<cr>", desc = "Insert Horiz Split" },`.
  { "<space>ih", ":InsertHorizSplit<cr>", desc = "Insert Horiz Split" },
-- Línea documentada: `{ "<space>ia", ":InsertAll<cr>", desc = "Insert All" },`.
  { "<space>ia", ":InsertAll<cr>", desc = "Insert All" },
-- Línea documentada: `{ "<space>ip", ":InsertPane<cr>", desc = "Insert Pane" },`.
  { "<space>ip", ":InsertPane<cr>", desc = "Insert Pane" },
-- Línea documentada: `{ "<space>ir", ":InsertWinRight<cr>", desc = "Insert Win Right" },`.
  { "<space>ir", ":InsertWinRight<cr>", desc = "Insert Win Right" },
-- Línea documentada: `{ "<space>il", ":InsertWinLeft<cr>", desc = "Insert Win Left" },`.
  { "<space>il", ":InsertWinLeft<cr>", desc = "Insert Win Left" },
-- Línea documentada: `{ "<space>iu", ":InsertWinUp<cr>", desc = "Insert Win Up" },`.
  { "<space>iu", ":InsertWinUp<cr>", desc = "Insert Win Up" },
-- Línea documentada: `{ "<space>id", ":InsertWinDown<cr>", desc = "Insert Win Down" },`.
  { "<space>id", ":InsertWinDown<cr>", desc = "Insert Win Down" },
  
  -- SQL dadbod
-- Línea documentada: `{ "<space>S", group = "Sql dadbod" },`.
  { "<space>S", group = "Sql dadbod" },
-- Línea documentada: `{ "<space>SC", ":DBUIConnect<cr>", desc = "DBUI Connect" },`.
  { "<space>SC", ":DBUIConnect<cr>", desc = "DBUI Connect" },
-- Línea documentada: `{ "<space>SD", ":DBUIDisconnect<cr>", desc = "DBUI Disconnect" },`.
  { "<space>SD", ":DBUIDisconnect<cr>", desc = "DBUI Disconnect" },
-- Línea documentada: `{ "<space>SE", ":DBUIExecute<cr>", desc = "DBUI Execute" },`.
  { "<space>SE", ":DBUIExecute<cr>", desc = "DBUI Execute" },
-- Línea documentada: `{ "<space>Sf", ":DBUIFindBuffer<cr>", desc = "DBUI Find Buffer" },`.
  { "<space>Sf", ":DBUIFindBuffer<cr>", desc = "DBUI Find Buffer" },
-- Línea documentada: `{ "<space>Si", ":DBUI<cr>", desc = "DBUI" },`.
  { "<space>Si", ":DBUI<cr>", desc = "DBUI" },
-- Línea documentada: `{ "<space>SI", ":DBUILastQueryInfo<cr>", desc = "DBUI Last Query Info" },`.
  { "<space>SI", ":DBUILastQueryInfo<cr>", desc = "DBUI Last Query Info" },
-- Línea documentada: `{ "<space>Sn", ":DBUINewQuery<cr>", desc = "DBUI New Query" },`.
  { "<space>Sn", ":DBUINewQuery<cr>", desc = "DBUI New Query" },
-- Línea documentada: `{ "<space>So", ":DBUIOpen<cr>", desc = "DBUI Open" },`.
  { "<space>So", ":DBUIOpen<cr>", desc = "DBUI Open" },
-- Línea documentada: `{ "<space>Sq", ":DBUIQuickQuery<cr>", desc = "DBUI Quick Query" },`.
  { "<space>Sq", ":DBUIQuickQuery<cr>", desc = "DBUI Quick Query" },
-- Línea documentada: `{ "<space>Sr", ":DBUIRenameBuffer<cr>", desc = "DBUI Rename Buffer" },`.
  { "<space>Sr", ":DBUIRenameBuffer<cr>", desc = "DBUI Rename Buffer" },
-- Línea documentada: `{ "<space>Ss", ":DBUIShowHistory<cr>", desc = "DBUI Show History" },`.
  { "<space>Ss", ":DBUIShowHistory<cr>", desc = "DBUI Show History" },
-- Línea documentada: `{ "<space>St", ":DBUIToggleResults<cr>", desc = "DBUI Toggle Results" },`.
  { "<space>St", ":DBUIToggleResults<cr>", desc = "DBUI Toggle Results" },
-- Línea documentada: `{ "<space>Su", ":DBUIUseConnection<cr>", desc = "DBUI Use Connection" },`.
  { "<space>Su", ":DBUIUseConnection<cr>", desc = "DBUI Use Connection" },
-- Línea documentada: `{ "<space>Sw", ":DBUIWhereAmI<cr>", desc = "DBUI Where Am I" },`.
  { "<space>Sw", ":DBUIWhereAmI<cr>", desc = "DBUI Where Am I" },
-- Línea documentada: `{ "<space>Sa", ":DBUIAddConnection<cr>", desc = "DBUI Add Connection" },`.
  { "<space>Sa", ":DBUIAddConnection<cr>", desc = "DBUI Add Connection" },
-- Línea documentada: `{ "<space>Sd", ":DBUIDeleteConnection<cr>", desc = "DBUI Delete Connection" },`.
  { "<space>Sd", ":DBUIDeleteConnection<cr>", desc = "DBUI Delete Connection" },
-- Línea documentada: `{ "<space>Se", ":DBUIEditConnection<cr>", desc = "DBUI Edit Connection" },`.
  { "<space>Se", ":DBUIEditConnection<cr>", desc = "DBUI Edit Connection" },
-- Línea documentada: `{ "<space>Sl", ":DBUIListConnections<cr>", desc = "DBUI List Connections" },`.
  { "<space>Sl", ":DBUIListConnections<cr>", desc = "DBUI List Connections" },
-- Línea documentada: `{ "<space>SR", ":DBUIRenameConnection<cr>", desc = "DBUI Rename Connection" },`.
  { "<space>SR", ":DBUIRenameConnection<cr>", desc = "DBUI Rename Connection" },
  
  -- Focus
-- Línea documentada: `{ "<space>z", group = "Focus" },`.
  { "<space>z", group = "Focus" },
-- Línea documentada: `{ "<space>zz", ":ZenMode<cr>", desc = "Toggle Zen Mode" },`.
  { "<space>zz", ":ZenMode<cr>", desc = "Toggle Zen Mode" },
-- Línea documentada: `{ "<space>zt", ":Twilight<cr>", desc = "Toggle Twilight" },`.
  { "<space>zt", ":Twilight<cr>", desc = "Toggle Twilight" },
  
  -- DevContainer
-- Línea documentada: `{ "<space>D", group = "DevContainer" },`.
  { "<space>D", group = "DevContainer" },
-- Línea documentada: `{ "<space>Da", "<cmd>DevcontainerAttach<cr>", desc = "Attach to Container" },`.
  { "<space>Da", "<cmd>DevcontainerAttach<cr>", desc = "Attach to Container" },
-- Línea documentada: `{ "<space>Db", "<cmd>DevcontainerBuild<cr>", desc = "Build Container" },`.
  { "<space>Db", "<cmd>DevcontainerBuild<cr>", desc = "Build Container" },
-- Línea documentada: `{ "<space>Dc", "<cmd>DevcontainerConnect<cr>", desc = "Connect to Container" },`.
  { "<space>Dc", "<cmd>DevcontainerConnect<cr>", desc = "Connect to Container" },
-- Línea documentada: `{ "<space>De", "<cmd>DevcontainerExec<cr>", desc = "Execute in Container" },`.
  { "<space>De", "<cmd>DevcontainerExec<cr>", desc = "Execute in Container" },
-- Línea documentada: `{ "<space>Dl", "<cmd>DevcontainerLogs<cr>", desc = "Show Container Logs" },`.
  { "<space>Dl", "<cmd>DevcontainerLogs<cr>", desc = "Show Container Logs" },
-- Línea documentada: `{ "<space>Do", "<cmd>DevcontainerOpen<cr>", desc = "Open Container Config" },`.
  { "<space>Do", "<cmd>DevcontainerOpen<cr>", desc = "Open Container Config" },
-- Línea documentada: `{ "<space>Dr", "<cmd>DevcontainerRemove<cr>", desc = "Remove Container" },`.
  { "<space>Dr", "<cmd>DevcontainerRemove<cr>", desc = "Remove Container" },
-- Línea documentada: `{ "<space>Ds", "<cmd>DevcontainerStart<cr>", desc = "Start Container" },`.
  { "<space>Ds", "<cmd>DevcontainerStart<cr>", desc = "Start Container" },
-- Línea documentada: `{ "<space>DS", "<cmd>DevcontainerStop<cr>", desc = "Stop Container" },`.
  { "<space>DS", "<cmd>DevcontainerStop<cr>", desc = "Stop Container" },
-- Línea documentada: `{ "<space>Dt", "<cmd>DevcontainerToggle<cr>", desc = "Toggle Container Terminal" },`.
  { "<space>Dt", "<cmd>DevcontainerToggle<cr>", desc = "Toggle Container Terminal" },
  
  -- Visual mode mappings
-- Línea documentada: `{ "<space>/", "<Plug>(comment_toggle_linewise_visual)", desc = "Comment toggle linewise (visual)", mode = "v" },`.
  { "<space>/", "<Plug>(comment_toggle_linewise_visual)", desc = "Comment toggle linewise (visual)", mode = "v" },
  
-- Línea documentada: `{ "<space>l", group = "LSP", mode = "v" },`.
  { "<space>l", group = "LSP", mode = "v" },
-- Línea documentada: `{ "<space>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", mode = "v" },`.
  { "<space>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", mode = "v" },
-- Línea documentada: `{ "<space>lv", "<cmd>lua require('lsp_lines').toggle()<cr>", desc = "Virtual Lines Info Toggle", mode = "v" },`.
  { "<space>lv", "<cmd>lua require('lsp_lines').toggle()<cr>", desc = "Virtual Lines Info Toggle", mode = "v" },
  
-- Línea documentada: `{ "<space>R", group = "Refactor", mode = "v" },`.
  { "<space>R", group = "Refactor", mode = "v" },
-- Línea documentada: `{ "<space>Rf", "<cmd>lua require('refactoring').refactor('Extract Function')<CR>", desc = "Extract Function", mode = "v" },`.
  { "<space>Rf", "<cmd>lua require('refactoring').refactor('Extract Function')<CR>", desc = "Extract Function", mode = "v" },
-- Línea documentada: `{ "<space>RF", "<cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", desc = "Extract to File", mode = "v" },`.
  { "<space>RF", "<cmd>lua require('refactoring').refactor('Extract Function To File')<CR>", desc = "Extract to File", mode = "v" },
-- Línea documentada: `{ "<space>Rb", "<cmd>lua require('refactoring').refactor('Extract Block')<CR>", desc = "Extract Block", mode = "v" },`.
  { "<space>Rb", "<cmd>lua require('refactoring').refactor('Extract Block')<CR>", desc = "Extract Block", mode = "v" },
-- Línea documentada: `{ "<space>RB", "<cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", desc = "Extract Block to File", mode = "v" },`.
  { "<space>RB", "<cmd>lua require('refactoring').refactor('Extract Block To File')<CR>", desc = "Extract Block to File", mode = "v" },
-- Línea documentada: `{ "<space>Rl", "<cmd>lua require('refactoring').refactor('Extract Local')<CR>", desc = "Extract Local", mode = "v" },`.
  { "<space>Rl", "<cmd>lua require('refactoring').refactor('Extract Local')<CR>", desc = "Extract Local", mode = "v" },
-- Línea documentada: `{ "<space>Rv", "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>", desc = "Extract Variable", mode = "v" },`.
  { "<space>Rv", "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>", desc = "Extract Variable", mode = "v" },
-- Línea documentada: `{ "<space>Rm", "<cmd>lua require('refactoring').refactor('Extract Method')<CR>", desc = "Extract Method", mode = "v" },`.
  { "<space>Rm", "<cmd>lua require('refactoring').refactor('Extract Method')<CR>", desc = "Extract Method", mode = "v" },
-- Línea documentada: `{ "<space>RL", "<cmd>lua require('refactoring').refactor('Inline Local')<CR>", desc = "Inline Local", mode = "v" },`.
  { "<space>RL", "<cmd>lua require('refactoring').refactor('Inline Local')<CR>", desc = "Inline Local", mode = "v" },
-- Línea documentada: `{ "<space>RV", "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", desc = "Inline Variable", mode = "v" },`.
  { "<space>RV", "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", desc = "Inline Variable", mode = "v" },
-- Línea documentada: `{ "<space>RM", "<cmd>lua require('refactoring').refactor('Inline Method')<CR>", desc = "Inline Method", mode = "v" },`.
  { "<space>RM", "<cmd>lua require('refactoring').refactor('Inline Method')<CR>", desc = "Inline Method", mode = "v" },
-- Línea documentada: `{ "<space>RS", "<cmd>lua require('refactoring').select_refactor()<CR>", desc = "Select", mode = "v" },`.
  { "<space>RS", "<cmd>lua require('refactoring').select_refactor()<CR>", desc = "Select", mode = "v" },
-- Línea documentada: `{ "<space>RR", '<cmd>Lspsaga rename<cr>', desc = "Rename", mode = "v" },`.
  { "<space>RR", '<cmd>Lspsaga rename<cr>', desc = "Rename", mode = "v" },
  
-- Línea documentada: `{ "<space>j", group = "Java", mode = "v" },`.
  { "<space>j", group = "Java", mode = "v" },
-- Línea documentada: `{ "<space>je", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", desc = "extract variables", mode = "v" },`.
  { "<space>je", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", desc = "extract variables", mode = "v" },
-- Línea documentada: `{ "<space>jE", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", desc = "extract method", mode = "v" },`.
  { "<space>jE", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", desc = "extract method", mode = "v" },
-- Línea documentada: `})`.
})
