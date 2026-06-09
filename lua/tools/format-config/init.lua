-- Documentación: módulo `lua/tools/format-config/init.lua`.
-- Propósito: define utilidades y herramientas de edición dentro de BlindNvim sin alterar lógica de ejecución.

  -- Create a command `:Format` local to the LSP buffer
-- Línea documentada: `require'format'.setup {`.
require'format'.setup {
-- Línea documentada: `html = {{cmd = {"prettier -w"}}},`.
  html = {{cmd = {"prettier -w"}}},
-- Línea documentada: `css = {{cmd = {"prettier -w"}}},`.
  css = {{cmd = {"prettier -w"}}},
-- Línea documentada: `json = {{cmd = {"prettier -w"}}},`.
  json = {{cmd = {"prettier -w"}}},
-- Línea documentada: `yaml = {{cmd = {"prettier -w"}}},`.
  yaml = {{cmd = {"prettier -w"}}},
-- Línea documentada: `javascript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},`.
  javascript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
-- Línea documentada: `javascriptreact = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},`.
  javascriptreact = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
-- Línea documentada: `typescript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},`.
  typescript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
-- Línea documentada: `typescriptreact = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},`.
  typescriptreact = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
-- Línea documentada: `lua = {`.
  lua = {
-- Línea documentada: `{`.
    {
-- Línea documentada: `cmd = {`.
      cmd = {
-- Línea documentada: `function(file)`.
        function(file)
-- Línea documentada: `return string.format(`.
          return string.format(
-- Línea documentada: `'lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb --indent-width=2 %s',`.
                'lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb --indent-width=2 %s',
-- Línea documentada: `file)`.
                file)
-- Línea documentada: `end`.
        end
-- Línea documentada: `}`.
      }
-- Línea documentada: `}`.
    }
-- Línea documentada: `},`.
  },
-- Línea documentada: `python = {`.
  python = {
-- Línea documentada: `{`.
    {
-- Línea documentada: `cmd = {`.
      cmd = {
-- Línea documentada: `function(file)`.
        function(file)
-- Línea documentada: `return string.format('black --quiet %s', file)`.
          return string.format('black --quiet %s', file)
-- Línea documentada: `end`.
        end
-- Línea documentada: `}`.
      }
-- Línea documentada: `}`.
    }
-- Línea documentada: `},`.
  },
-- Línea documentada: `go = {`.
  go = {
-- Línea documentada: `{`.
    {
-- Línea documentada: `cmd = {`.
      cmd = {
-- Línea documentada: `function(file)`.
        function(file)
-- Línea documentada: `return string.format("gofmt -w %s", file)`.
          return string.format("gofmt -w %s", file)
-- Línea documentada: `end`.
        end
-- Línea documentada: `},`.
      },
-- Línea documentada: `tempfile_postfix = ".tmp"`.
      tempfile_postfix = ".tmp"
-- Línea documentada: `}`.
    }
-- Línea documentada: `},`.
  },
-- Línea documentada: `ruby = {`.
  ruby = {
-- Línea documentada: `{`.
    {
-- Línea documentada: `cmd = {`.
      cmd = {
-- Línea documentada: `function(file)`.
        function(file)
-- Línea documentada: `return string.format("rufo %s", file)`.
          return string.format("rufo %s", file)
-- Línea documentada: `end`.
        end
-- Línea documentada: `},`.
      },
-- Línea documentada: `tempfile_postfix = ".tmp"`.
      tempfile_postfix = ".tmp"
-- Línea documentada: `}`.
    }
-- Línea documentada: `},`.
  },
-- Línea documentada: `vue = {`.
  vue = {
-- Línea documentada: `{`.
    {
-- Línea documentada: `cmd = {`.
      cmd = {
-- Línea documentada: `function(file)`.
        function(file)
-- Línea documentada: `return string.format("vue-beautify %s", file)`.
          return string.format("vue-beautify %s", file)
-- Línea documentada: `end`.
        end
-- Línea documentada: `},`.
      },
-- Línea documentada: `tempfile_postfix = ".tmp"`.
      tempfile_postfix = ".tmp"
-- Línea documentada: `}`.
    }
-- Línea documentada: `},`.
  },
-- Línea documentada: `php = {`.
  php = {
-- Línea documentada: `{`.
    {
-- Línea documentada: `cmd = {`.
      cmd = {
-- Línea documentada: `function(file)`.
        function(file)
-- Línea documentada: `return string.format("php-formatter formatter:use:sort --quiet %s", file)`.
          return string.format("php-formatter formatter:use:sort --quiet %s", file)
-- Línea documentada: `end`.
        end
-- Línea documentada: `},`.
      },
-- Línea documentada: `tempfile_postfix = ".tmp"`.
      tempfile_postfix = ".tmp"
-- Línea documentada: `}`.
    }
-- Línea documentada: `}`.
  }
-- Línea documentada: `}`.
}

-- Línea documentada: `vim.cmd('autocmd BufWritePost * FormatWrite')`.
vim.cmd('autocmd BufWritePost * FormatWrite')
