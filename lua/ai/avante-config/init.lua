-- Avante.nvim configuration
-- AI coding assistant for Neovim with GitHub Copilot integration

require('avante').setup({
  provider = "copilot",
  mode = "agentic",
  auto_suggestions_provider = "copilot",
  input_provider = "snacks",  -- Use snacks.nvim for password inputs
  providers ={
    copilot = {
      endpoint = "https://api.githubcopilot.com",
      model = "gpt-4o-copilot",
      timeout = 30000,
      extra_request_body = {

      temperature = 0,
      max_tokens = 4096,
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
      accept = "<M-l>",
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
      align = "center",
      rounded = true,
    },
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
})
