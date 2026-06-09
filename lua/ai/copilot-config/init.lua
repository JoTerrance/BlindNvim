-- Documentación: módulo `lua/ai/copilot-config/init.lua`.
-- Propósito: define integraciones de asistentes de IA dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `require('copilot').setup({`.
require('copilot').setup({
-- Línea documentada: `panel = {`.
  panel = {
-- Línea documentada: `enabled = true,`.
    enabled = true,
-- Línea documentada: `auto_refresh = false,`.
    auto_refresh = false,
-- Línea documentada: `keymap = {`.
    keymap = {
-- Línea documentada: `jump_prev = "[[",`.
      jump_prev = "[[",
-- Línea documentada: `jump_next = "]]",`.
      jump_next = "]]",
-- Línea documentada: `accept = "<C-CR>",`.
      accept = "<C-CR>",
-- Línea documentada: `refresh = "gr",`.
      refresh = "gr",
-- Línea documentada: `},`.
    },
-- Línea documentada: `layout = {`.
    layout = {
-- Línea documentada: `position = "bottom", -- | top | left | right | bottom |`.
      position = "bottom", -- | top | left | right | bottom |
-- Línea documentada: `ratio = 0.4`.
      ratio = 0.4
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
-- Línea documentada: `suggestion = {`.
  suggestion = {
-- Línea documentada: `enabled = true,`.
    enabled = true,
-- Línea documentada: `auto_trigger = true,`.
    auto_trigger = true,
-- Línea documentada: `hide_during_completion = true,`.
    hide_during_completion = true,
-- Línea documentada: `debounce = 75,`.
    debounce = 75,
-- Línea documentada: `trigger_on_accept = true,`.
    trigger_on_accept = true,
-- Línea documentada: `keymap = {`.
    keymap = {
-- Línea documentada: `accept = "<CR>",`.
      accept = "<CR>",
-- Línea documentada: `accept_word = false,`.
      accept_word = false,
-- Línea documentada: `accept_line = false,`.
      accept_line = false,
-- Línea documentada: `next = "<M-n>",`.
      next = "<M-n>",
-- Línea documentada: `prev = "<M-p>",`.
      prev = "<M-p>",
-- Línea documentada: `dismiss = "<C-c>",`.
      dismiss = "<C-c>",
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
-- Línea documentada: `nes = {`.
  nes = {
-- Línea documentada: `enabled = false, -- requires copilot-lsp as a dependency`.
    enabled = false, -- requires copilot-lsp as a dependency
-- Línea documentada: `auto_trigger = false,`.
    auto_trigger = false,
-- Línea documentada: `keymap = {`.
    keymap = {
-- Línea documentada: `accept_and_goto = false,`.
      accept_and_goto = false,
-- Línea documentada: `accept = false,`.
      accept = false,
-- Línea documentada: `dismiss = false,`.
      dismiss = false,
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
-- Línea documentada: `auth_provider_url = nil, -- URL to authentication provider, if not "https://github.com/"`.
  auth_provider_url = nil, -- URL to authentication provider, if not "https://github.com/"
-- Línea documentada: `logger = {`.
  logger = {
-- Línea documentada: `file = vim.fn.stdpath("log") .. "/copilot-lua.log",`.
    file = vim.fn.stdpath("log") .. "/copilot-lua.log",
-- Línea documentada: `file_log_level = vim.log.levels.OFF,`.
    file_log_level = vim.log.levels.OFF,
-- Línea documentada: `print_log_level = vim.log.levels.WARN,`.
    print_log_level = vim.log.levels.WARN,
-- Línea documentada: `trace_lsp = "off", -- "off" | "messages" | "verbose"`.
    trace_lsp = "off", -- "off" | "messages" | "verbose"
-- Línea documentada: `trace_lsp_progress = false,`.
    trace_lsp_progress = false,
-- Línea documentada: `log_lsp_messages = false,`.
    log_lsp_messages = false,
-- Línea documentada: `},`.
  },
-- Línea documentada: `copilot_node_command = 'node', -- Node.js version must be > 22`.
  copilot_node_command = 'node', -- Node.js version must be > 22
-- Línea documentada: `workspace_folders = {},`.
  workspace_folders = {},
-- Línea documentada: `copilot_model = "",`.
  copilot_model = "",
-- Línea documentada: `disable_limit_reached_message = false,  -- Set to `true` to suppress completion limit reached popup`.
  disable_limit_reached_message = false,  -- Set to `true` to suppress completion limit reached popup
-- Línea documentada: `root_dir = function()`.
  root_dir = function()
-- Línea documentada: `return vim.fs.dirname(vim.fs.find(".git", { upward = true })[1])`.
    return vim.fs.dirname(vim.fs.find(".git", { upward = true })[1])
-- Línea documentada: `end,`.
  end,
-- Línea documentada: `should_attach = function(_, _)`.
  should_attach = function(_, _)
-- Línea documentada: `if not vim.bo.buflisted then`.
    if not vim.bo.buflisted then
-- Línea documentada: `print("not attaching, buffer is not 'buflisted'")`.
      print("not attaching, buffer is not 'buflisted'")
-- Línea documentada: `return false`.
      return false
-- Línea documentada: `end`.
    end

-- Línea documentada: `if vim.bo.buftype ~= "" then`.
    if vim.bo.buftype ~= "" then
-- Línea documentada: `print("not attaching, buffer 'buftype' is " .. vim.bo.buftype)`.
      print("not attaching, buffer 'buftype' is " .. vim.bo.buftype)
-- Línea documentada: `return false`.
      return false
-- Línea documentada: `end`.
    end

-- Línea documentada: `return true`.
    return true
-- Línea documentada: `end,`.
  end,
-- Línea documentada: `server = {`.
  server = {
-- Línea documentada: `type = "nodejs", -- "nodejs" | "binary"`.
    type = "nodejs", -- "nodejs" | "binary"
-- Línea documentada: `custom_server_filepath = nil,`.
    custom_server_filepath = nil,
-- Línea documentada: `},`.
  },
-- Línea documentada: `server_opts_overrides = {},`.
  server_opts_overrides = {},
-- Línea documentada: `})`.
})