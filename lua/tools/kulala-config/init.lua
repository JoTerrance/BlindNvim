-- Documentación: módulo `lua/tools/kulala-config/init.lua`.
-- Propósito: define la configuración de Kulala dentro de BlindNvim sin alterar lógica de ejecución.

local M = {}

local function default_kulala_core_path()
  return vim.fn.expand("~/.local/share/kulala-core/kulala-core")
end

function M.setup(opts)
  opts = opts or {}
  opts.kulala_core = vim.tbl_deep_extend("force", {
    -- Use the locally installed backend so exit-time session hooks never trigger a download.
    path = default_kulala_core_path(),
  }, opts.kulala_core or {})

  require("kulala").setup(opts)
end

return M
