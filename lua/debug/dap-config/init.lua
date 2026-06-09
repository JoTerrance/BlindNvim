-- Documentación: módulo `lua/debug/dap-config/init.lua`.
-- Propósito: define configuración de depuración dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `require("dapui").setup()`.
require("dapui").setup()
-- Línea documentada: `require("mason-nvim-dap").setup()`.
require("mason-nvim-dap").setup()
-- Línea documentada: `require("nvim-dap-virtual-text").setup {`.
require("nvim-dap-virtual-text").setup {
-- Línea documentada: `enabled = true,                     -- enable this plugin (the default)`.
    enabled = true,                     -- enable this plugin (the default)
-- Línea documentada: `enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)`.
    enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
-- Línea documentada: `highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText`.
    highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
-- Línea documentada: `highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)`.
    highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
-- Línea documentada: `show_stop_reason = true,            -- show stop reason when stopped for exceptions`.
    show_stop_reason = true,            -- show stop reason when stopped for exceptions
-- Línea documentada: `commented = false,                  -- prefix virtual text with comment string`.
    commented = false,                  -- prefix virtual text with comment string
    -- experimental features:
-- Línea documentada: `virt_text_pos = 'eol',              -- position of virtual text, see `:h nvim_buf_set_extmark()``.
    virt_text_pos = 'eol',              -- position of virtual text, see `:h nvim_buf_set_extmark()`
-- Línea documentada: `all_frames = false,                 -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.`.
    all_frames = false,                 -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
-- Línea documentada: `virt_lines = false,                 -- show virtual lines instead of virtual text (will flicker!)`.
    virt_lines = false,                 -- show virtual lines instead of virtual text (will flicker!)
-- Línea documentada: `virt_text_win_col = nil             -- position the virtual text at a fixed window column (starting from the first text column) ,`.
    virt_text_win_col = nil             -- position the virtual text at a fixed window column (starting from the first text column) ,
                                        -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
-- Línea documentada: `}`.
}
