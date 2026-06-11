-- Documentación: módulo `lua/git/gitsigns-config/init.lua`.
-- Propósito: define integraciones de flujo de trabajo con Git dentro de BlindNvim sin alterar lógica de ejecución.

require('gitsigns').setup {
  current_line_blame = false,
  signs = BlindReturn({
    add = { text = "add" },
    change = { text = "chg" },
    delete = { text = "del" },
    topdelete = { text = "top" },
    changedelete = { text = "mod" },
  }, {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  }),
}
