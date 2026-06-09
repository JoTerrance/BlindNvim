-- Documentación: módulo `lua/ai/avante-config/init.lua`.
-- Propósito: define integraciones de asistentes de IA dentro de BlindNvim sin alterar lógica de ejecución.

-- Avante.nvim configuration
-- AI coding assistant for Neovim with GitHub Copilot integration

-- Línea documentada: `require('avante').setup({`.
require('avante').setup({
-- Línea documentada: `provider = "copilot",`.
  provider = "copilot",
-- Línea documentada: `mode = "agentic",`.
  mode = "agentic",
-- Línea documentada: `auto_suggestions_provider = "copilot",`.
  auto_suggestions_provider = "copilot",
-- Línea documentada: `input_provider = "snacks",  -- Use snacks.nvim for password inputs`.
  input_provider = "snacks",  -- Use snacks.nvim for password inputs
-- Línea documentada: `providers ={`.
  providers ={
-- Línea documentada: `copilot = {`.
    copilot = {
-- Línea documentada: `endpoint = "https://api.githubcopilot.com",`.
      endpoint = "https://api.githubcopilot.com",
-- Línea documentada: `model = "gpt-4o-copilot",`.
      model = "gpt-4o-copilot",
-- Línea documentada: `timeout = 30000,`.
      timeout = 30000,
-- Línea documentada: `extra_request_body = {`.
      extra_request_body = {

-- Línea documentada: `temperature = 0,`.
      temperature = 0,
-- Línea documentada: `max_tokens = 4096,`.
      max_tokens = 4096,
-- Línea documentada: `},`.
      },
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
-- Línea documentada: `behaviour = {`.
  behaviour = {
-- Línea documentada: `auto_suggestions = true,`.
    auto_suggestions = true,
-- Línea documentada: `auto_set_highlight_group = true,`.
    auto_set_highlight_group = true,
-- Línea documentada: `auto_set_keymaps = true,`.
    auto_set_keymaps = true,
-- Línea documentada: `auto_apply_diff_after_generation = false,`.
    auto_apply_diff_after_generation = false,
-- Línea documentada: `support_paste_from_clipboard = false,`.
    support_paste_from_clipboard = false,
-- Línea documentada: `},`.
  },
-- Línea documentada: `mappings = {`.
  mappings = {
    --- @class AvanteConflictMappings
-- Línea documentada: `diff = {`.
    diff = {
-- Línea documentada: `ours = "co",`.
      ours = "co",
-- Línea documentada: `theirs = "ct",`.
      theirs = "ct",
-- Línea documentada: `all_theirs = "ca",`.
      all_theirs = "ca",
-- Línea documentada: `both = "cb",`.
      both = "cb",
-- Línea documentada: `cursor = "cc",`.
      cursor = "cc",
-- Línea documentada: `next = "]x",`.
      next = "]x",
-- Línea documentada: `prev = "[x",`.
      prev = "[x",
-- Línea documentada: `},`.
    },
-- Línea documentada: `suggestion = {`.
    suggestion = {
-- Línea documentada: `accept = "<M-l>",`.
      accept = "<M-l>",
-- Línea documentada: `next = "<M-]>",`.
      next = "<M-]>",
-- Línea documentada: `prev = "<M-[>",`.
      prev = "<M-[>",
-- Línea documentada: `dismiss = "<C-]>",`.
      dismiss = "<C-]>",
-- Línea documentada: `},`.
    },
-- Línea documentada: `jump = {`.
    jump = {
-- Línea documentada: `next = "]]",`.
      next = "]]",
-- Línea documentada: `prev = "[[",`.
      prev = "[[",
-- Línea documentada: `},`.
    },
-- Línea documentada: `submit = {`.
    submit = {
-- Línea documentada: `normal = "<CR>",`.
      normal = "<CR>",
-- Línea documentada: `insert = "<C-s>",`.
      insert = "<C-s>",
-- Línea documentada: `},`.
    },
-- Línea documentada: `sidebar = {`.
    sidebar = {
-- Línea documentada: `switch_windows = "<Tab>",`.
      switch_windows = "<Tab>",
-- Línea documentada: `reverse_switch_windows = "<S-Tab>",`.
      reverse_switch_windows = "<S-Tab>",
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
-- Línea documentada: `hints = { enabled = true },`.
  hints = { enabled = true },
-- Línea documentada: `windows = {`.
  windows = {
-- Línea documentada: `position = "right",`.
    position = "right",
-- Línea documentada: `wrap = true,`.
    wrap = true,
-- Línea documentada: `width = 30,`.
    width = 30,
-- Línea documentada: `sidebar_header = {`.
    sidebar_header = {
-- Línea documentada: `align = "center",`.
      align = "center",
-- Línea documentada: `rounded = true,`.
      rounded = true,
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
-- Línea documentada: `highlights = {`.
  highlights = {
-- Línea documentada: `diff = {`.
    diff = {
-- Línea documentada: `current = "DiffText",`.
      current = "DiffText",
-- Línea documentada: `incoming = "DiffAdd",`.
      incoming = "DiffAdd",
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
-- Línea documentada: `diff = {`.
  diff = {
-- Línea documentada: `autojump = true,`.
    autojump = true,
-- Línea documentada: `list_opener = "copen",`.
    list_opener = "copen",
-- Línea documentada: `},`.
  },
-- Línea documentada: `})`.
})
