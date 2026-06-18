-- Documentación: módulo `lua/lsp/cmp.lua`.
-- Propósito: define integración de LSP y autocompletado dentro de BlindNvim sin alterar lógica de ejecución.

local function compat_source(name, opts)
  opts = opts or {}
  opts.name = opts.name or name
  opts.module = "blink.compat.source"
  return opts
end

require("blink.cmp").setup({
  enabled = function()
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = 0 })
    return buftype ~= "prompt" or vim.tbl_contains({ "dap-repl", "dapui_watches", "dapui_hover" }, vim.bo.filetype)
  end,

  keymap = {
    preset = "default",
    ["<C-u>"] = { "scroll_documentation_up", "fallback" },
    ["<C-d>"] = { "scroll_documentation_down", "fallback" },
    ["<C-c>"] = { "hide", "fallback" },
    ["<C-e>"] = { "cancel", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Tab>"] = { "select_and_accept", "fallback" },
    ["<CR>"] = { "select_and_accept", "fallback" },
    ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<S-Tab>"] = {
      function(cmp)
        return cmp.accept({ force = true })
      end,
      "fallback",
    },
    ["<S-CR>"] = {
      function(cmp)
        return cmp.accept({ force = true })
      end,
      "fallback",
    },
  },

  appearance = {
    nerd_font_variant = "normal",
  },

  snippets = {
    preset = "luasnip",
  },

  completion = {
    documentation = { auto_show = false },
    list = {
      selection = {
        preselect = true,
        auto_insert = false,
      },
    },
    menu = {
      draw = {
        columns = {
          { "kind_icon", "label", "label_description", gap = 1 },
          { "source_name" },
        },
      },
    },
  },

  signature = {
    enabled = true,
    window = { border = "rounded" },
  },

  sources = {
    default = {
      "lsp",
      "path",
      "snippets",
      "buffer",
      "copilot",
      "rg",
      "plugins",
      "tags",
      "npm",
      "dbee",
      "dictionary",
      "spell",
    },
    per_filetype = {
      ["dap-repl"] = { "dap" },
      dapui_watches = { "dap" },
      dapui_hover = { "dap" },
      gitcommit = { "commit" },
      sql = { "dadbod" },
      mysql = { "dadbod" },
      plsql = { "dadbod" },
      zsh = vim.fn.executable("/bin/zsh") == 1 and { "zsh" } or {},
    },
    providers = {
      lsp = {
        fallbacks = {},
        transform_items = function(_, items)
          table.sort(items, function(a, b)
            local a_under = (a.label:match("^_+") or ""):len()
            local b_under = (b.label:match("^_+") or ""):len()
            if a_under ~= b_under then
              return a_under < b_under
            end
          end)
          return items
        end,
      },
      buffer = {
        min_keyword_length = 5,
      },
      copilot = { name = "copilot", module = "blink-copilot", score_offset = 100, async = true },
      rg = compat_source("rg"),
      plugins = compat_source("plugins"),
      tags = compat_source("tags"),
      npm = compat_source("npm", { min_keyword_length = 4 }),
      dbee = compat_source("cmp-dbee"),
      dictionary = compat_source("dictionary", { min_keyword_length = 2 }),
      spell = compat_source("spell", {
        opts = {
          keep_all_entries = false,
          enable_in_context = function()
            return true
          end,
        },
      }),
      dap = compat_source("dap"),
      commit = compat_source("commit"),
      dadbod = { module = "vim_dadbod_completion.blink" },
      zsh = compat_source("zsh"),
    },
  },

  cmdline = {
    enabled = true,
    keymap = {
      preset = "cmdline",
      ["<CR>"] = { "select_accept_and_enter", "fallback" },
    },
    completion = {
      menu = { auto_show = true },
    },
  },

  fuzzy = {
    implementation = "prefer_rust_with_warning",
    sorts = {
      "exact",
      "score",
      "sort_text",
    },
  },
})

vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpMenuOpen",
  callback = function()
    pcall(function()
      require("copilot.suggestion").dismiss()
    end)
    vim.b.copilot_suggestion_hidden = true
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "BlinkCmpMenuClose",
  callback = function()
    vim.b.copilot_suggestion_hidden = false
  end,
})
