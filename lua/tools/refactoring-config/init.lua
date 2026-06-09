-- Documentación: módulo `lua/tools/refactoring-config/init.lua`.
-- Propósito: define utilidades y herramientas de edición dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `require('refactoring').setup({`.
require('refactoring').setup({
-- Línea documentada: `prompt_func_return_type = {`.
    prompt_func_return_type = {
-- Línea documentada: `go = false,`.
        go = false,
-- Línea documentada: `java = true,`.
        java = true,

-- Línea documentada: `cpp = false,`.
        cpp = false,
-- Línea documentada: `c = false,`.
        c = false,
-- Línea documentada: `h = false,`.
        h = false,
-- Línea documentada: `hpp = false,`.
        hpp = false,
-- Línea documentada: `cxx = false,`.
        cxx = false,
-- Línea documentada: `},`.
    },
-- Línea documentada: `prompt_func_param_type = {`.
    prompt_func_param_type = {
-- Línea documentada: `go = false,`.
        go = false,
-- Línea documentada: `java = true,`.
        java = true,

-- Línea documentada: `cpp = false,`.
        cpp = false,
-- Línea documentada: `c = false,`.
        c = false,
-- Línea documentada: `h = false,`.
        h = false,
-- Línea documentada: `hpp = false,`.
        hpp = false,
-- Línea documentada: `cxx = false,`.
        cxx = false,
-- Línea documentada: `},`.
    },
-- Línea documentada: `printf_statements = {},`.
    printf_statements = {},
-- Línea documentada: `print_var_statements = {},`.
    print_var_statements = {},
-- Línea documentada: `})`.
})
