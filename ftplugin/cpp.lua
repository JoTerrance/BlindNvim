-- Documentación: módulo `ftplugin/cpp.lua`.
-- Propósito: define ajustes específicos por tipo de archivo dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `local scan = require "plenary.scandir"`.
local scan = require "plenary.scandir"
-- Línea documentada: `local contains = function(tbl, str)`.
local contains = function(tbl, str)
-- Línea documentada: `for _, v in ipairs(tbl) do`.
    for _, v in ipairs(tbl) do
-- Línea documentada: `if v == str then`.
        if v == str then
-- Línea documentada: `return true`.
            return true
-- Línea documentada: `end`.
        end
-- Línea documentada: `end`.
    end
-- Línea documentada: `return false`.
    return false
-- Línea documentada: `end`.
end
-- Línea documentada: `local exists = function(dir, file_pattern)`.
local exists = function(dir, file_pattern)
-- Línea documentada: `local dirs = scan.scan_dir(dir, { depth = 1, search_pattern = file_pattern })`.
    local dirs = scan.scan_dir(dir, { depth = 1, search_pattern = file_pattern })
-- Línea documentada: `return contains(dirs, dir .. "/" .. file_pattern)`.
    return contains(dirs, dir .. "/" .. file_pattern)
-- Línea documentada: `end`.
end

-- Línea documentada: `local capabilities = vim.lsp.protocol.make_client_capabilities()`.
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- Línea documentada: `capabilities.offsetEncoding = { "utf-16" }`.
capabilities.offsetEncoding = { "utf-16" }
-- Línea documentada: `require("lspconfig").clangd.setup({ capabilities = capabilities,`.
require("lspconfig").clangd.setup({ capabilities = capabilities,
-- Línea documentada: `cmd = { "clangd", '--background-index', '--clang-tidy' }`.
                                    cmd = { "clangd", '--background-index', '--clang-tidy' }
-- Línea documentada: `})`.
})

-- Línea documentada: `local dap_ok, dap = pcall(require, "dap")`.
local dap_ok, dap = pcall(require, "dap")
-- Línea documentada: `if not (dap_ok) then`.
if not (dap_ok) then
-- Línea documentada: `print("nvim-dap not installed!")`.
    print("nvim-dap not installed!")
-- Línea documentada: `return`.
    return
-- Línea documentada: `end`.
end

-- Línea documentada: `require("mason-nvim-dap").setup({`.
require("mason-nvim-dap").setup({
-- Línea documentada: `ensure_installed = { "cpptools" }`.
    ensure_installed = { "cpptools" }
-- Línea documentada: `})`.
})
-- Línea documentada: `require('dap').set_log_level('DEBUG') -- Helps when configuring DAP, see logs with :DapShowLog`.
require('dap').set_log_level('DEBUG') -- Helps when configuring DAP, see logs with :DapShowLog

-- Línea documentada: `local dap_ui_ok, ui = pcall(require, "dapui")`.
local dap_ui_ok, ui = pcall(require, "dapui")
-- Línea documentada: `if not (dap_ok and dap_ui_ok) then`.
if not (dap_ok and dap_ui_ok) then
-- Línea documentada: `require("notify")("dap-ui not installed!", "warning")`.
    require("notify")("dap-ui not installed!", "warning")
-- Línea documentada: `return`.
    return
-- Línea documentada: `end`.
end
-- Línea documentada: `vim.fn.sign_define('DapBreakpoint', { text = '🐞' })`.
vim.fn.sign_define('DapBreakpoint', { text = '🐞' })

-- Línea documentada: `dap.configurations.cpp = {`.
dap.configurations.cpp = {
-- Línea documentada: `{`.
    {
-- Línea documentada: `name = "C++ Debug And Run",`.
        name = "C++ Debug And Run",
-- Línea documentada: `type = "codelldb",`.
        type = "codelldb",
-- Línea documentada: `request = "launch",`.
        request = "launch",
-- Línea documentada: `program = function()`.
        program = function()
            -- First, check if exists CMakeLists.txt
-- Línea documentada: `local cwd = vim.fn.getcwd()`.
            local cwd = vim.fn.getcwd()
-- Línea documentada: `if exists(cwd, "CMakeLists.txt") then`.
            if exists(cwd, "CMakeLists.txt") then
                -- Then invoke cmake commands
                -- Then ask user to provide execute file
-- Línea documentada: `return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")`.
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
-- Línea documentada: `else`.
            else
-- Línea documentada: `local fileName = vim.fn.expand("%:t:r")`.
                local fileName = vim.fn.expand("%:t:r")
                -- create this directory
-- Línea documentada: `os.execute("mkdir -p " .. "bin")`.
                os.execute("mkdir -p " .. "bin")
-- Línea documentada: `local cmd = "!g++ -g % -o bin/" .. fileName`.
                local cmd = "!g++ -g % -o bin/" .. fileName
                -- First, compile it
-- Línea documentada: `vim.cmd(cmd)`.
                vim.cmd(cmd)
                -- Then, return it
-- Línea documentada: `return "${fileDirname}/bin/" .. fileName`.
                return "${fileDirname}/bin/" .. fileName
-- Línea documentada: `end`.
            end
-- Línea documentada: `end,`.
        end,
-- Línea documentada: `cwd = "${workspaceFolder}",`.
        cwd = "${workspaceFolder}",
-- Línea documentada: `stopOnEntry = false,`.
        stopOnEntry = false,
-- Línea documentada: `runInTerminal = true,`.
        runInTerminal = true,
-- Línea documentada: `console = "integratedTerminal",`.
        console = "integratedTerminal",
-- Línea documentada: `},`.
    },
-- Línea documentada: `}`.
}

-- Línea documentada: `dap.adapters.executable = {`.
dap.adapters.executable = {
-- Línea documentada: `type = 'executable',`.
    type = 'executable',
-- Línea documentada: `command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',`.
    command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
-- Línea documentada: `name = 'lldb1',`.
    name = 'lldb1',
-- Línea documentada: `host = '127.0.0.1',`.
    host = '127.0.0.1',
-- Línea documentada: `port = 13000`.
    port = 13000
-- Línea documentada: `}`.
}

-- Línea documentada: `dap.adapters.codelldb = {`.
dap.adapters.codelldb = {
-- Línea documentada: `name = "codelldb server",`.
    name = "codelldb server",
-- Línea documentada: `type = 'server',`.
    type = 'server',
-- Línea documentada: `port = "${port}",`.
    port = "${port}",
-- Línea documentada: `executable = {`.
    executable = {
-- Línea documentada: `command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',`.
        command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
-- Línea documentada: `args = { "--port", "${port}" },`.
        args = { "--port", "${port}" },
-- Línea documentada: `}`.
    }
-- Línea documentada: `}`.
}
