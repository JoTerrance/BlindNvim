-- Unified formatting through conform.nvim.

local conform = require('conform')

conform.setup({
  formatters_by_ft = {
    html = { 'prettier' },
    css = { 'prettier' },
    json = { 'prettier' },
    yaml = { 'prettier' },
    javascript = { 'prettier', 'eslint_fix' },
    javascriptreact = { 'prettier', 'eslint_fix' },
    typescript = { 'prettier', 'eslint_fix' },
    typescriptreact = { 'prettier', 'eslint_fix' },
    lua = { 'lua_format' },
    python = { 'isort', 'black' },
    go = { 'gofmt' },
    sh = { 'shfmt' },
    c = { 'clang_format' },
    cpp = { 'clang_format' },
    cmake = { 'cmake_format' },
    dart = { 'dart_format' },
    java = { 'google_java_format' },
    ruby = { 'rufo' },
    vue = { 'vue_beautify' },
    php = { 'php_formatter' },
  },
  formatters = {
    lua_format = {
      command = 'lua-format',
      args = {
        '-i',
        '--no-keep-simple-function-one-line',
        '--no-break-after-operator',
        '--column-limit=150',
        '--break-after-table-lb',
        '--indent-width=2',
        '$FILENAME',
      },
      stdin = false,
    },
    eslint_fix = {
      command = './node_modules/.bin/eslint',
      args = { '--fix', '$FILENAME' },
      stdin = false,
      condition = function()
        return vim.fn.filereadable(vim.fn.getcwd() .. '/node_modules/.bin/eslint') == 1
      end,
    },
    php_formatter = {
      command = 'php-formatter',
      args = { 'formatter:use:sort', '--quiet', '$FILENAME' },
      stdin = false,
    },
    vue_beautify = {
      command = 'vue-beautify',
      args = { '$FILENAME' },
      stdin = false,
    },
  },

})
