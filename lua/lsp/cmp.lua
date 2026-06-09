-- Documentación: módulo `lua/lsp/cmp.lua`.
-- Propósito: define integración de LSP y autocompletado dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `local lspkind = require "lspkind"`.
local lspkind = require "lspkind"
-- Línea documentada: `local cmp = require "cmp"`.
local cmp = require "cmp"
-- Línea documentada: `local luasnip = require 'luasnip'`.
local luasnip = require 'luasnip'
-- Línea documentada: `cmp.setup {`.
cmp.setup {
-- Línea documentada: `enabled = function()`.
  enabled = function()
-- Línea documentada: `return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"`.
    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
-- Línea documentada: `or require("cmp_dap").is_dap_buffer()`.
        or require("cmp_dap").is_dap_buffer()
-- Línea documentada: `end,`.
  end,
-- Línea documentada: `view = {`.
  view = {
    -- I like the new menu better! Nice work hrsh7th
-- Línea documentada: `native_menu = true,`.
    native_menu = true,
-- Línea documentada: `},`.
  },
-- Línea documentada: `snippet = {`.
  snippet = {
-- Línea documentada: `expand = function(args)`.
    expand = function(args)
-- Línea documentada: `require("luasnip").lsp_expand(args.body)`.
      require("luasnip").lsp_expand(args.body)
-- Línea documentada: `end,`.
    end,
-- Línea documentada: `},`.
  },
-- Línea documentada: `sorting = {`.
  sorting = {
    -- TODO: Would be cool to add stuff like "See variable names before method names" in rust, or something like that.
-- Línea documentada: `comparators = {`.
    comparators = {
-- Línea documentada: `cmp.config.compare.offset,`.
      cmp.config.compare.offset,
-- Línea documentada: `cmp.config.compare.exact,`.
      cmp.config.compare.exact,
-- Línea documentada: `cmp.config.compare.score,`.
      cmp.config.compare.score,

      -- copied from cmp-under, but I don't think I need the plugin for this.
      -- I might add some more of my own.
-- Línea documentada: `function(entry1, entry2)`.
      function(entry1, entry2)
-- Línea documentada: `local _, entry1_under = entry1.completion_item.label:find "^_+"`.
        local _, entry1_under = entry1.completion_item.label:find "^_+"
-- Línea documentada: `local _, entry2_under = entry2.completion_item.label:find "^_+"`.
        local _, entry2_under = entry2.completion_item.label:find "^_+"
-- Línea documentada: `entry1_under = entry1_under or 0`.
        entry1_under = entry1_under or 0
-- Línea documentada: `entry2_under = entry2_under or 0`.
        entry2_under = entry2_under or 0
-- Línea documentada: `if entry1_under > entry2_under then`.
        if entry1_under > entry2_under then
-- Línea documentada: `return false`.
          return false
-- Línea documentada: `elseif entry1_under < entry2_under then`.
        elseif entry1_under < entry2_under then
-- Línea documentada: `return true`.
          return true
-- Línea documentada: `end`.
        end
-- Línea documentada: `end,`.
      end,

-- Línea documentada: `cmp.config.compare.kind,`.
      cmp.config.compare.kind,
-- Línea documentada: `cmp.config.compare.sort_text,`.
      cmp.config.compare.sort_text,
-- Línea documentada: `cmp.config.compare.length,`.
      cmp.config.compare.length,
-- Línea documentada: `cmp.config.compare.order,`.
      cmp.config.compare.order,
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
-- Línea documentada: `formatting = {`.
  formatting = {
    -- Youtube: How to set up nice formatting for your sources.
-- Línea documentada: `format = lspkind.cmp_format {`.
    format = lspkind.cmp_format {
-- Línea documentada: `mode = 'symbol_text',`.
      mode = 'symbol_text',
-- Línea documentada: `preset = 'default',`.
      preset = 'default',
-- Línea documentada: `menu = {`.
      menu = {
-- Línea documentada: `buffer = "[buf]",`.
        buffer = "[buf]",
-- Línea documentada: `treesitter = "[ts]",`.
        treesitter = "[ts]",
-- Línea documentada: `nvim_lsp = "[LSP]",`.
        nvim_lsp = "[LSP]",
-- Línea documentada: `nvim_lua = "[lua]",`.
        nvim_lua = "[lua]",
-- Línea documentada: `path = "[path]",`.
        path = "[path]",
  --      vsnip = "[snip]",
-- Línea documentada: `gh_issues = "[issues]",`.
        gh_issues = "[issues]",
-- Línea documentada: `cmp_tabnine = "[TN]",`.
        cmp_tabnine = "[TN]",
-- Línea documentada: `copilot_cmp = "[copilot]",`.
        copilot_cmp = "[copilot]",
-- Línea documentada: `},`.
      },
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },

-- Línea documentada: `mapping = {`.
  mapping = {
-- Línea documentada: `['<C-u>'] = cmp.mapping.scroll_docs(-4),`.
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
-- Línea documentada: `['<C-d>'] = cmp.mapping.scroll_docs(4),`.
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
-- Línea documentada: `["<C-c>"] = cmp.mapping.close(),`.
    ["<C-c>"] = cmp.mapping.close(),
-- Línea documentada: `["<C-e>"] = cmp.mapping.abort(),`.
    ["<C-e>"] = cmp.mapping.abort(),
-- Línea documentada: `['<Down>'] = cmp.mapping(function(fallback)`.
    ['<Down>'] = cmp.mapping(function(fallback)
-- Línea documentada: `if cmp.visible() then`.
      if cmp.visible() then
-- Línea documentada: `cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })`.
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
--      elseif luasnip.expand_or_jumpable() then
--        luasnip.expand_or_jump()
-- Línea documentada: `else`.
      else
-- Línea documentada: `fallback()`.
        fallback()
-- Línea documentada: `end`.
      end
-- Línea documentada: `end, { 'i', 's' }),`.
    end, { 'i', 's' }),
-- Línea documentada: `['<Up>'] = cmp.mapping(function(fallback)`.
    ['<Up>'] = cmp.mapping(function(fallback)
-- Línea documentada: `if cmp.visible() then`.
      if cmp.visible() then
-- Línea documentada: `cmp.select_prev_item()`.
        cmp.select_prev_item()
--      elseif luasnip.jumpable(-1) then
--        luasnip.jump(-1)
-- Línea documentada: `else`.
      else
-- Línea documentada: `fallback()`.
        fallback()
-- Línea documentada: `end`.
      end
-- Línea documentada: `end, { 'i', 's' }),`.
    end, { 'i', 's' }),
-- Línea documentada: `['<Tab>'] = cmp.mapping(`.
    ['<Tab>'] = cmp.mapping(
-- Línea documentada: `cmp.mapping.confirm({`.
          cmp.mapping.confirm({
-- Línea documentada: `behavior = cmp.ConfirmBehavior.Insert,`.
            behavior = cmp.ConfirmBehavior.Insert,
-- Línea documentada: `select = true,`.
            select = true,
-- Línea documentada: `}),{ "i", "c" }`.
          }),{ "i", "c" }
-- Línea documentada: `),`.
    ),
-- Línea documentada: `['<Cr>'] = cmp.mapping(`.
    ['<Cr>'] = cmp.mapping(
-- Línea documentada: `cmp.mapping.confirm ({`.
          cmp.mapping.confirm ({
-- Línea documentada: `behavior = cmp.ConfirmBehavior.Insert,`.
            behavior = cmp.ConfirmBehavior.Insert,
-- Línea documentada: `select = true,`.
            select = true,
-- Línea documentada: `}), { "i", "c" }`.
          }), { "i", "c" }
-- Línea documentada: `),`.
    ),
-- Línea documentada: `['<C-Space>'] = cmp.mapping.complete(),`.
    ['<C-Space>'] = cmp.mapping.complete(),
-- Línea documentada: `['<S-Tab>'] = cmp.mapping(`.
    ['<S-Tab>'] = cmp.mapping(
-- Línea documentada: `cmp.mapping.confirm ({`.
          cmp.mapping.confirm ({
-- Línea documentada: `behavior = cmp.ConfirmBehavior.Replace,`.
            behavior = cmp.ConfirmBehavior.Replace,
-- Línea documentada: `select = true,`.
            select = true,
-- Línea documentada: `}),{"i","c"}),`.
          }),{"i","c"}),
-- Línea documentada: `['<S-Cr>'] = cmp.mapping(`.
    ['<S-Cr>'] = cmp.mapping(
-- Línea documentada: `cmp.mapping.confirm ({`.
          cmp.mapping.confirm ({
-- Línea documentada: `behavior = cmp.ConfirmBehavior.Replace,`.
            behavior = cmp.ConfirmBehavior.Replace,
-- Línea documentada: `select = true,`.
            select = true,
-- Línea documentada: `}),{"i","c"}),`.
          }),{"i","c"}),
-- Línea documentada: `},`.
  },
-- Línea documentada: `sources = cmp.config.sources({`.
  sources = cmp.config.sources({
-- Línea documentada: `{ name = 'gh_issues' },`.
    { name = 'gh_issues' },
-- Línea documentada: `{ name = 'nvim_lua' },`.
    { name = 'nvim_lua' },
-- Línea documentada: `{ name = 'cmp_tabnine' },`.
    { name = 'cmp_tabnine' },
-- Línea documentada: `{ name = 'nvim_lsp' },`.
    { name = 'nvim_lsp' },
-- Línea documentada: `{ name = 'copilot_cmp' },`.
    { name = 'copilot_cmp' },
-- Línea documentada: `{ name = 'treesitter' },`.
    { name = 'treesitter' },
  --  { name = 'luasnip' },
-- Línea documentada: `{ name = 'path' },`.
    { name = 'path' },
-- Línea documentada: `{ name = 'rg' },`.
    { name = 'rg' },
-- Línea documentada: `{ name = 'vsnip' },`.
    { name = 'vsnip' },
-- Línea documentada: `{ name = 'buffer', keyword_length = 5 },`.
    { name = 'buffer', keyword_length = 5 },
-- Línea documentada: `{ name = 'plugins' },`.
    { name = 'plugins' },
-- Línea documentada: `{ name = 'tags' },`.
    { name = 'tags' },
-- Línea documentada: `{ name = 'npm', keyword_length = 4 },`.
    { name = 'npm', keyword_length = 4 },
-- Línea documentada: `{ name = 'cmp-dbee'},`.
    { name = 'cmp-dbee'},
-- Línea documentada: `{ name = 'nvim_lsp_signature_help' },`.
    { name = 'nvim_lsp_signature_help' },
-- Línea documentada: `{ name = 'nvim_lsp_document_symbol' },`.
    { name = 'nvim_lsp_document_symbol' },
-- Línea documentada: `{`.
    {
-- Línea documentada: `name = "dictionary",`.
      name = "dictionary",
-- Línea documentada: `keyword_length = 2,`.
      keyword_length = 2,
-- Línea documentada: `},`.
    },
-- Línea documentada: `{`.
    {
-- Línea documentada: `name = 'spell',`.
      name = 'spell',
-- Línea documentada: `option = {`.
      option = {
-- Línea documentada: `keep_all_entries = false,`.
        keep_all_entries = false,
-- Línea documentada: `enable_in_context = function()`.
        enable_in_context = function()
-- Línea documentada: `return true`.
          return true
-- Línea documentada: `end,`.
        end,
-- Línea documentada: `},`.
      },
-- Línea documentada: `},`.
    },
-- Línea documentada: `{`.
    {
-- Línea documentada: `name = 'look',`.
      name = 'look',
-- Línea documentada: `keyword_length = 2,`.
      keyword_length = 2,
-- Línea documentada: `option = {`.
      option = {
-- Línea documentada: `convert_case = true,`.
        convert_case = true,
-- Línea documentada: `loud = true`.
        loud = true
        --dict = '/usr/share/dict/words'
-- Línea documentada: `}`.
      }
-- Línea documentada: `},`.
    },

    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
-- Línea documentada: `}, {`.
  }, {
-- Línea documentada: `{ name = 'buffer' },`.
    { name = 'buffer' },
-- Línea documentada: `}),`.
  }),
  --   sources = {
  --   },
-- Línea documentada: `}`.
}


-- Línea documentada: `if vim.fn.executable('/bin/zsh') == 1 then`.
if vim.fn.executable('/bin/zsh') == 1 then 
  -- append zsh cmp to sources
-- Línea documentada: `sources = cmp.config.sources({`.
  sources = cmp.config.sources({
-- Línea documentada: `{ name = 'zsh' }`.
    { name = 'zsh' }
-- Línea documentada: `})`.
  })
-- Línea documentada: `end`.
 end



-- Línea documentada: `cmp.setup.cmdline("/", {`.
cmp.setup.cmdline("/", {
-- Línea documentada: `completion = {`.
  completion = {
-- Línea documentada: `},`.
  },
-- Línea documentada: `sources = cmp.config.sources({`.
  sources = cmp.config.sources({
-- Línea documentada: `{ name = "nvim_lsp_document_symbol" },`.
    { name = "nvim_lsp_document_symbol" },
-- Línea documentada: `}, {`.
  }, {
    -- { name = "buffer", keyword_length = 5 },
-- Línea documentada: `}),`.
  }),
-- Línea documentada: `})`.
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- Línea documentada: `cmp.setup.cmdline(':', {`.
  cmp.setup.cmdline(':', {
-- Línea documentada: `mapping = cmp.mapping.preset.cmdline(),`.
    mapping = cmp.mapping.preset.cmdline(),
-- Línea documentada: `sources = cmp.config.sources({`.
    sources = cmp.config.sources({
-- Línea documentada: `{ name = 'path' }`.
      { name = 'path' }
-- Línea documentada: `}, {`.
    }, {
-- Línea documentada: `{ name = 'cmdline' }`.
      { name = 'cmdline' }
-- Línea documentada: `})`.
    })
-- Línea documentada: `})`.
  })
-- Línea documentada: `require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {`.
require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
-- Línea documentada: `sources = {`.
  sources = {
-- Línea documentada: `{ name = "dap" },`.
    { name = "dap" },
-- Línea documentada: `},`.
  },
-- Línea documentada: `})`.
})

-- Línea documentada: `cmp.setup.filetype('gitcommit', {`.
cmp.setup.filetype('gitcommit', {
-- Línea documentada: `sources = {`.
  sources = {
-- Línea documentada: `{ name = 'commit' }`.
    { name = 'commit' }
-- Línea documentada: `}`.
  }
-- Línea documentada: `})`.
})

--[[
-- Línea documentada: `" Setup buffer configuration (nvim-lua source only enables in Lua filetype).`.
" Setup buffer configuration (nvim-lua source only enables in Lua filetype).
-- Línea documentada: `"`.
"
-- Línea documentada: `" ON YOUTUBE I SAID: This only _adds_ sources for a filetype, not removes the global ones.`.
" ON YOUTUBE I SAID: This only _adds_ sources for a filetype, not removes the global ones.
-- Línea documentada: `"`.
"
-- Línea documentada: `" BUT I WAS WRONG! This will override the global setup. Sorry for any confusion.`.
" BUT I WAS WRONG! This will override the global setup. Sorry for any confusion.
-- Línea documentada: `autocmd FileType lua lua require'cmp'.setup.buffer {`.
autocmd FileType lua lua require'cmp'.setup.buffer {
-- Línea documentada: `\   sources = {`.
\   sources = {
-- Línea documentada: `\     { name = 'nvim_lua' },`.
\     { name = 'nvim_lua' },
-- Línea documentada: `\     { name = 'buffer' },`.
\     { name = 'buffer' },
-- Línea documentada: `\   },`.
\   },
-- Línea documentada: `\ }`.
\ }
--]]

-- Add vim-dadbod-completion in sql files
-- Línea documentada: `_ = vim.cmd [[`.
_ = vim.cmd [[
-- Línea documentada: `augroup DadbodSql`.
  augroup DadbodSql
-- Línea documentada: `au!`.
    au!
-- Línea documentada: `autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion' } } }`.
    autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion' } } }
-- Línea documentada: `augroup END`.
  augroup END
-- Línea documentada: `]]`.
]]



-- Línea documentada: `local cmp_zsh = vim.api.nvim_create_augroup("CmpZsh", {})`.
local cmp_zsh = vim.api.nvim_create_augroup("CmpZsh", {})
-- Línea documentada: `vim.api.nvim_create_autocmd(`.
vim.api.nvim_create_autocmd(
-- Línea documentada: `"FileType",`.
    "FileType",
-- Línea documentada: `{`.
    {
-- Línea documentada: `pattern = 'zsh lua',`.
        pattern = 'zsh lua',
-- Línea documentada: `group = cmp_zsh,`.
        group = cmp_zsh,
-- Línea documentada: `callback = function()`.
        callback = function()
-- Línea documentada: `if vim.fn.executable('/bin/zsh') then`.
          if vim.fn.executable('/bin/zsh') then
-- Línea documentada: `require'cmp'.setup.buffer { sources = { { name = "zsh" }}}`.
            require'cmp'.setup.buffer { sources = { { name = "zsh" }}}
-- Línea documentada: `end`.
          end
-- Línea documentada: `end,`.
        end,
-- Línea documentada: `})`.
    })
  
--[[
-- Línea documentada: `" Disable cmp for a buffer`.
" Disable cmp for a buffer
-- Línea documentada: `autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }`.
autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
--]]

-- Línea documentada: `cmp.event:on("menu_opened", function()`.
cmp.event:on("menu_opened", function()
-- Línea documentada: `vim.b.copilot_suggestion_hidden = true`.
  vim.b.copilot_suggestion_hidden = true
-- Línea documentada: `end)`.
end)

-- Línea documentada: `cmp.event:on("menu_closed", function()`.
cmp.event:on("menu_closed", function()
-- Línea documentada: `vim.b.copilot_suggestion_hidden = false`.
  vim.b.copilot_suggestion_hidden = false
-- Línea documentada: `end)`.
end)
