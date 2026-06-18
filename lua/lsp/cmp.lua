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
      "dbee",
      "npm",
      "dictionary",
      "spell",
      "env",
      "register",
    },
    per_filetype = {
      lua = { "lazydev", inherit_defaults = true },
      ["dap-repl"] = { "dap" },
      dapui_watches = { "dap" },
      dapui_hover = { "dap" },
      gitcommit = { "conventional_commits", "git" },
      markdown = { "git" },
      octo = { "git" },
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
      rg = { name = "Ripgrep", module = "blink-cmp-rg" },
      git = {
        name = "Git",
        module = "blink-cmp-git",
        enabled = function()
          return vim.tbl_contains({ "octo", "gitcommit", "markdown" }, vim.bo.filetype)
        end,
      },
      npm = {
        name = "npm",
        module = "blink-cmp-npm",
        async = true,
        score_offset = 100,
        opts = {
          ignore = {},
          only_semantic_versions = true,
          only_latest_version = false,
        },
      },
      plugins = compat_source("plugins"),
      tags = compat_source("tags"),
      dbee = compat_source("cmp-dbee"),
      dictionary = { name = "Dictionary", module = "blink-cmp-dictionary", min_keyword_length = 2 },
      spell = {
        name = "Spell",
        module = "blink-cmp-spell",
        opts = {
          enable_in_context = function()
            return true
          end,
        },
      },
      env = { name = "Env", module = "blink-cmp-env" },
      register = { name = "Registers", module = "blink-cmp-register" },
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      },
      conventional_commits = {
        name = "Conventional Commits",
        module = "blink-cmp-conventional-commits",
        enabled = function()
          return vim.bo.filetype == "gitcommit"
        end,
      },
      dap = compat_source("dap"),
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
