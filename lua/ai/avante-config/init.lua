-- Documentación: módulo `lua/ai/avante-config/init.lua`.
-- Propósito: ajustar Avante para uso normal y para un modo braille más textual.

local codex_acp_cache
local function has_codex_acp()
  if codex_acp_cache ~= nil then
    return codex_acp_cache
  end

  if vim.fn.executable("npx") ~= 1 then
    codex_acp_cache = false
    return codex_acp_cache
  end

  if vim.system then
    local result = vim.system({ "npx", "--no-install", "@zed-industries/codex-acp", "--help" }, { text = true }):wait()
    codex_acp_cache = result.code == 0
    return codex_acp_cache
  end

  vim.fn.system({ "npx", "--no-install", "@zed-industries/codex-acp", "--help" })
  codex_acp_cache = vim.v.shell_error == 0
  return codex_acp_cache
end

local braille_layout = require("ui.braille-layout")

if not has_codex_acp() then
  return
end

-- Normal profile favors richer UI: snacks input, suggestions and highlighted diffs.
local normal = {
  provider = "codex",
  mode = "agentic",
  auto_suggestions_provider = "copilot",
  input_provider = "snacks",
  selector = {
    provider = "snacks",
    provider_opts = {
      layout = {
        preset = "vertical",
        layout = {
          position = "top",
          width = 1,
          height = 0.78,
        },
      },
    },
  },
  acp_providers = {
    codex = {
      command = "npx",
      args = { "@zed-industries/codex-acp" },
      env = {
        NODE_NO_WARNINGS = "1",
        OPENAI_API_KEY = os.getenv("OPENAI_API_KEY"),
      },
    },
  },
  behaviour = {
    auto_suggestions = true,
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
    support_paste_from_clipboard = false,
  },
  mappings = {
    --- @class AvanteConflictMappings
    diff = {
      ours = "co",
      theirs = "ct",
      all_theirs = "ca",
      both = "cb",
      cursor = "cc",
      next = "]x",
      prev = "[x",
    },
    suggestion = {
      accept = "<C-g>a",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
    jump = {
      next = "]]",
      prev = "[[",
    },
    submit = {
      normal = "<CR>",
      insert = "<C-s>",
    },
    sidebar = {
      switch_windows = "<Tab>",
      reverse_switch_windows = "<S-Tab>",
    },
  },
  hints = { enabled = true },
  windows = {
    position = "right",
    wrap = true,
    width = 30,
    sidebar_header = {
      enabled = true,
      align = "center",
      rounded = true,
    },
  },
  selection = {
    enabled = true,
    hint_display = "delayed",
  },
  highlights = {
    diff = {
      current = "DiffText",
      incoming = "DiffAdd",
    },
  },
  diff = {
    autojump = true,
    list_opener = "copen",
  },
}

-- Braille profile favors deterministic text: native input, no suggestions, no decorative hints.
local braille = {
  provider = "codex",
  mode = "agentic",
  auto_suggestions_provider = "copilot",
  input_provider = "native",
  selector = {
    provider = "snacks",
    provider_opts = {
      layout = braille_layout.picker(),
    },
  },
  acp_providers = normal.acp_providers,
  behaviour = {
    auto_suggestions = false,
    auto_set_highlight_group = false,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
    support_paste_from_clipboard = false,
  },
  mappings = {
    diff = {
      ours = "o",
      theirs = "t",
      all_theirs = "a",
      both = "b",
      cursor = "c",
      next = "n",
      prev = "p",
    },
    suggestion = {
      accept = "a",
      next = "n",
      prev = "p",
      dismiss = "d",
    },
    jump = {
      next = "n",
      prev = "p",
    },
    submit = {
      normal = "<CR>",
      insert = "<C-s>",
    },
    sidebar = {
      switch_windows = "w",
      reverse_switch_windows = "W",
      apply_all = "A",
      apply_cursor = "a",
      retry_user_request = "r",
      edit_user_request = "e",
      remove_file = "d",
      add_file = "+",
      close = { "q", "<Esc>" },
      close_from_input = { normal = "q", insert = "<C-d>" },
    },
    cancel = {
      normal = { "<C-c>", "<Esc>", "q" },
      insert = { "<C-c>" },
    },
  },
  hints = { enabled = false },
  windows = {
    position = "left",
    height = 1,
    wrap = true,
    width = 100,
    sidebar_header = {
      enabled = false,
      align = "bottom",
      rounded = false,
    },
    input = {
      prefix = ">",
      height = 1,
      width = 100,
    },
    ask = {
      floating = false,
      start_insert = true,
      border = "none",
      focus_on_apply = "ours",
    },
    edit = {
      border = "none",
      start_insert = true,
    },
    spinner = {
      editing = { "-", "\\", "|", "/" },
      generating = { ".", "o", "O", "o" },
      thinking = { ".", "." },
    },
  },
  selection = {
    enabled = false,
  },
  highlights = {
    diff = {
      current = nil,
      incoming = nil,
    },
  },
  diff = {
    autojump = true,
    list_opener = "copen",
  },
}

require("avante").setup(BlindReturn(braille, normal))
