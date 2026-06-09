-- Documentación: módulo `lua/ui/noice-config/init.lua`.
-- Propósito: define componentes de interfaz de usuario dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `local blind = {`.
local blind = {
-- Línea documentada: `cmdline = {`.
  cmdline = {
-- Línea documentada: `view = "cmdline",`.
    view = "cmdline",
-- Línea documentada: `},`.
  },
-- Línea documentada: `lsp = {`.
  lsp = {
-- Línea documentada: `signature = {`.
    signature = {
-- Línea documentada: `enabled = false,`.
      enabled = false,
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
-- Línea documentada: `}`.
}
-- Línea documentada: `local default = {`.
local default = {
-- Línea documentada: `cmdline = {`.
  cmdline = {
-- Línea documentada: `enabled = true, -- enables the Noice cmdline UI`.
    enabled = true, -- enables the Noice cmdline UI
-- Línea documentada: `view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom`.
    view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
-- Línea documentada: `opts = {}, -- global options for the cmdline. See section on views`.
    opts = {}, -- global options for the cmdline. See section on views
-- Línea documentada: `format = {`.
    format = {
      -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
      -- view: (default is cmdline view)
      -- opts: any options passed to the view
      -- icon_hl_group: optional hl_group for the icon
      -- title: set to anything or empty string to hide
-- Línea documentada: `cmdline = { pattern = "^:", icon = "", lang = "vim" },`.
      cmdline = { pattern = "^:", icon = "", lang = "vim" },
-- Línea documentada: `search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },`.
      search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
-- Línea documentada: `search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },`.
      search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
-- Línea documentada: `filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },`.
      filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
-- Línea documentada: `lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },`.
      lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
-- Línea documentada: `help = { pattern = "^:%s*he?l?p?%s+", icon = "" },`.
      help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
      -- input = {}, -- Used by input()
      -- lua = false, -- to disable a format, set to `false`
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
-- Línea documentada: `messages = {`.
  messages = {
    -- NOTE: If you enable messages, then the cmdline is enabled automatically.
    -- This is a current Neovim limitation.
-- Línea documentada: `enabled = true, -- enables the Noice messages UI`.
    enabled = true, -- enables the Noice messages UI
-- Línea documentada: `view = "messages", -- default view for messages`.
    view = "messages", -- default view for messages
-- Línea documentada: `view_error = "messages", -- view for errors`.
    view_error = "messages", -- view for errors
-- Línea documentada: `view_warn = "messages", -- view for warnings`.
    view_warn = "messages", -- view for warnings
-- Línea documentada: `view_history = "messages", -- view for :messages`.
    view_history = "messages", -- view for :messages
-- Línea documentada: `view_search = "virtualtext", -- view for search count messages. Set to `false` to disable`.
    view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
-- Línea documentada: `},`.
  },
-- Línea documentada: `popupmenu = {`.
  popupmenu = {
-- Línea documentada: `enabled = true, -- enables the Noice popupmenu UI`.
    enabled = true, -- enables the Noice popupmenu UI
    ---@type 'nui'|'cmp'
-- Línea documentada: `backend = "nui", -- backend to use to show regular cmdline completions`.
    backend = "nui", -- backend to use to show regular cmdline completions
    -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
-- Línea documentada: `kind_icons = {}, -- set to `false` to disable icons`.
    kind_icons = {}, -- set to `false` to disable icons
-- Línea documentada: `},`.
  },
  -- default options for require('noice').redirect
  -- see the section on Command Redirection
-- Línea documentada: `redirect = {`.
  redirect = {
-- Línea documentada: `view = "popup",`.
    view = "popup",
-- Línea documentada: `filter = { event = "msg_show" },`.
    filter = { event = "msg_show" },
-- Línea documentada: `},`.
  },
  -- You can add any custom commands below that will be available with `:Noice command`
-- Línea documentada: `commands = {`.
  commands = {
-- Línea documentada: `history = {`.
    history = {
      -- options for the message history that you get with `:Noice`
-- Línea documentada: `view = "split",`.
      view = "split",
-- Línea documentada: `opts = { enter = true, format = "details" },`.
      opts = { enter = true, format = "details" },
-- Línea documentada: `filter = {`.
      filter = {
-- Línea documentada: `any = {`.
        any = {
-- Línea documentada: `{ event = "notify" },`.
          { event = "notify" },
-- Línea documentada: `{ error = true },`.
          { error = true },
-- Línea documentada: `{ warning = true },`.
          { warning = true },
-- Línea documentada: `{ event = "msg_show", kind = { "" } },`.
          { event = "msg_show", kind = { "" } },
-- Línea documentada: `{ event = "lsp", kind = "message" },`.
          { event = "lsp", kind = "message" },
-- Línea documentada: `},`.
        },
-- Línea documentada: `},`.
      },
-- Línea documentada: `},`.
    },
    -- :Noice last
-- Línea documentada: `last = {`.
    last = {
-- Línea documentada: `view = "popup",`.
      view = "popup",
-- Línea documentada: `opts = { enter = true, format = "details" },`.
      opts = { enter = true, format = "details" },
-- Línea documentada: `filter = {`.
      filter = {
-- Línea documentada: `any = {`.
        any = {
-- Línea documentada: `{ event = "notify" },`.
          { event = "notify" },
-- Línea documentada: `{ error = true },`.
          { error = true },
-- Línea documentada: `{ warning = true },`.
          { warning = true },
-- Línea documentada: `{ event = "msg_show", kind = { "" } },`.
          { event = "msg_show", kind = { "" } },
-- Línea documentada: `{ event = "lsp", kind = "message" },`.
          { event = "lsp", kind = "message" },
-- Línea documentada: `},`.
        },
-- Línea documentada: `},`.
      },
-- Línea documentada: `filter_opts = { count = 1 },`.
      filter_opts = { count = 1 },
-- Línea documentada: `},`.
    },
    -- :Noice errors
-- Línea documentada: `errors = {`.
    errors = {
      -- options for the message history that you get with `:Noice`
-- Línea documentada: `view = "popup",`.
      view = "popup",
-- Línea documentada: `opts = { enter = true, format = "details" },`.
      opts = { enter = true, format = "details" },
-- Línea documentada: `filter = { error = true },`.
      filter = { error = true },
-- Línea documentada: `filter_opts = { reverse = true },`.
      filter_opts = { reverse = true },
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
-- Línea documentada: `notify = {`.
  notify = {
    -- Noice can be used as `vim.notify` so you can route any notification like other messages
    -- Notification messages have their level and other properties set.
    -- event is always "notify" and kind can be any log level as a string
    -- The default routes will forward notifications to nvim-notify
    -- Benefit of using Noice for this is the routing and consistent history view
-- Línea documentada: `enabled = true,`.
    enabled = true,
-- Línea documentada: `view = "notify",`.
    view = "notify",
-- Línea documentada: `},`.
  },
-- Línea documentada: `lsp = {`.
  lsp = {
-- Línea documentada: `progress = {`.
    progress = {
-- Línea documentada: `enabled = true,`.
      enabled = true,
      -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
      -- See the section on formatting for more details on how to customize.
-- Línea documentada: `format = "lsp_progress",`.
      format = "lsp_progress",
-- Línea documentada: `format_done = "lsp_progress_done",`.
      format_done = "lsp_progress_done",
-- Línea documentada: `throttle = 1000 / 30, -- frequency to update lsp progress message`.
      throttle = 1000 / 30, -- frequency to update lsp progress message
-- Línea documentada: `view = "mini",`.
      view = "mini",
-- Línea documentada: `},`.
    },
-- Línea documentada: `override = {`.
    override = {
      -- override the default lsp markdown formatter with Noice
-- Línea documentada: `["vim.lsp.util.convert_input_to_markdown_lines"] = false,`.
      ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
      -- override the lsp markdown formatter with Noice
-- Línea documentada: `["vim.lsp.util.stylize_markdown"] = false,`.
      ["vim.lsp.util.stylize_markdown"] = false,
      -- override cmp documentation with Noice (needs the other options to work)
-- Línea documentada: `["cmp.entry.get_documentation"] = false,`.
      ["cmp.entry.get_documentation"] = false,
-- Línea documentada: `},`.
    },
-- Línea documentada: `hover = {`.
    hover = {
-- Línea documentada: `enabled = true,`.
      enabled = true,
-- Línea documentada: `silent = false, -- set to true to not show a message if hover is not available`.
      silent = false, -- set to true to not show a message if hover is not available
-- Línea documentada: `view = nil, -- when nil, use defaults from documentation`.
      view = nil, -- when nil, use defaults from documentation
-- Línea documentada: `opts = {}, -- merged with defaults from documentation`.
      opts = {}, -- merged with defaults from documentation
-- Línea documentada: `},`.
    },
-- Línea documentada: `signature = {`.
    signature = {
-- Línea documentada: `enabled = false,`.
      enabled = false,
-- Línea documentada: `auto_open = {`.
      auto_open = {
-- Línea documentada: `enabled = true,`.
        enabled = true,
-- Línea documentada: `trigger = true, -- Automatically show signature help when typing a trigger character from the LSP`.
        trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
        -- luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
-- Línea documentada: `throttle = 50, -- Debounce lsp signature help request by 50ms`.
        throttle = 50, -- Debounce lsp signature help request by 50ms
-- Línea documentada: `},`.
      },
-- Línea documentada: `view = nil, -- when nil, use defaults from documentation`.
      view = nil, -- when nil, use defaults from documentation
-- Línea documentada: `opts = {}, -- merged with defaults from documentation`.
      opts = {}, -- merged with defaults from documentation
-- Línea documentada: `},`.
    },
-- Línea documentada: `message = {`.
    message = {
      -- Messages shown by lsp servers
-- Línea documentada: `enabled = true,`.
      enabled = true,
-- Línea documentada: `view = "notify",`.
      view = "notify",
-- Línea documentada: `opts = {},`.
      opts = {},
-- Línea documentada: `},`.
    },
    -- defaults for hover and signature help
-- Línea documentada: `documentation = {`.
    documentation = {
-- Línea documentada: `view = "hover",`.
      view = "hover",
      ---@type NoiceViewOptions
-- Línea documentada: `opts = {`.
      opts = {
-- Línea documentada: `lang = "markdown",`.
        lang = "markdown",
-- Línea documentada: `replace = true,`.
        replace = true,
-- Línea documentada: `render = "plain",`.
        render = "plain",
-- Línea documentada: `format = { "{message}" },`.
        format = { "{message}" },
-- Línea documentada: `win_options = { concealcursor = "n", conceallevel = 3 },`.
        win_options = { concealcursor = "n", conceallevel = 3 },
-- Línea documentada: `},`.
      },
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
-- Línea documentada: `markdown = {`.
  markdown = {
-- Línea documentada: `hover = {`.
    hover = {
-- Línea documentada: `["|(%S-)|"] = vim.cmd.help, -- vim help links`.
      ["|(%S-)|"] = vim.cmd.help, -- vim help links
-- Línea documentada: `["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links`.
      ["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
-- Línea documentada: `},`.
    },
-- Línea documentada: `highlights = {`.
    highlights = {
-- Línea documentada: `["|%S-|"] = "@text.reference",`.
      ["|%S-|"] = "@text.reference",
-- Línea documentada: `["@%S+"] = "@parameter",`.
      ["@%S+"] = "@parameter",
-- Línea documentada: `["^%s*(Parameters:)"] = "@text.title",`.
      ["^%s*(Parameters:)"] = "@text.title",
-- Línea documentada: `["^%s*(Return:)"] = "@text.title",`.
      ["^%s*(Return:)"] = "@text.title",
-- Línea documentada: `["^%s*(See also:)"] = "@text.title",`.
      ["^%s*(See also:)"] = "@text.title",
-- Línea documentada: `["{%S-}"] = "@parameter",`.
      ["{%S-}"] = "@parameter",
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
-- Línea documentada: `health = {`.
  health = {
-- Línea documentada: `checker = true, -- Disable if you don't want health checks to run`.
    checker = true, -- Disable if you don't want health checks to run
-- Línea documentada: `},`.
  },
-- Línea documentada: `smart_move = {`.
  smart_move = {
    -- noice tries to move out of the way of existing floating windows.
-- Línea documentada: `enabled = true, -- you can disable this behaviour here`.
    enabled = true, -- you can disable this behaviour here
    -- add any filetypes here, that shouldn't trigger smart move.
-- Línea documentada: `excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },`.
    excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
-- Línea documentada: `},`.
  },
-- Línea documentada: `presets = {`.
  presets = {
    -- you can enable a preset by setting it to true, or a table that will override the preset config
    -- you can also add custom presets that you can enable/disable with enabled=true
-- Línea documentada: `bottom_search = false, -- use a classic bottom cmdline for search`.
    bottom_search = false, -- use a classic bottom cmdline for search
-- Línea documentada: `command_palette = false, -- position the cmdline and popupmenu together`.
    command_palette = false, -- position the cmdline and popupmenu together
-- Línea documentada: `long_message_to_split = false, -- long messages will be sent to a split`.
    long_message_to_split = false, -- long messages will be sent to a split
-- Línea documentada: `inc_rename = false, -- enables an input dialog for inc-rename.nvim`.
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
-- Línea documentada: `lsp_doc_border = false, -- add a border to hover docs and signature help`.
    lsp_doc_border = false, -- add a border to hover docs and signature help
-- Línea documentada: `},`.
  },
-- Línea documentada: `throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.`.
  throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.

-- Línea documentada: `routes = {`.
  routes = {
-- Línea documentada: `{`.
    {
-- Línea documentada: `filter = {`.
      filter = {
-- Línea documentada: `event = "msg_show",`.
        event = "msg_show",
-- Línea documentada: `kind = "",`.
        kind = "",
-- Línea documentada: `find = "written",`.
        find = "written",
-- Línea documentada: `},`.
      },
-- Línea documentada: `opts = { skip = true },`.
      opts = { skip = true },
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
-- Línea documentada: `views = {}, ---@see section on views`.
  views = {}, ---@see section on views
-- Línea documentada: `status = {},`.
  status = {}, 
-- Línea documentada: `format = {},`.
  format = {}, 
-- Línea documentada: `}`.
}
-- Línea documentada: `require("noice").setup(BlindReturn(blind, default))`.
require("noice").setup(BlindReturn(blind, default))

