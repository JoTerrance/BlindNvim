-- Documentación: módulo `lua/tools/devcontainer-config/init.lua`.
-- Propósito: define utilidades y herramientas de edición dentro de BlindNvim sin alterar lógica de ejecución.

-- nvim-dev-container configuration
-- Plugin for managing development containers from within Neovim
-- Línea documentada: `require("devcontainer").setup({`.
require("devcontainer").setup({
  -- Auto-start containers when opening a project with devcontainer config
-- Línea documentada: `autostart = false,`.
  autostart = false,
  
  -- Automatically install tree-sitter parsers on container start
-- Línea documentada: `autoinstall_treesitter = true,`.
  autoinstall_treesitter = true,
  
  -- Configuration for the devcontainer CLI
-- Línea documentada: `devcontainer_cli = {`.
  devcontainer_cli = {
    -- Custom path to devcontainer CLI if not in PATH
    -- path = "/path/to/devcontainer",
-- Línea documentada: `},`.
  },
  
  -- Terminal settings for devcontainer operations
-- Línea documentada: `terminal = {`.
  terminal = {
    -- Position of the terminal window
    -- Options: "horizontal", "vertical", "float", "tab"
-- Línea documentada: `position = "horizontal",`.
    position = "horizontal",
    
    -- Size of the terminal (percentage or absolute value)
-- Línea documentada: `size = 15,`.
    size = 15,
    
    -- Close terminal automatically on successful commands
-- Línea documentada: `close_on_success = false,`.
    close_on_success = false,
-- Línea documentada: `},`.
  },
  
  -- Logging configuration
-- Línea documentada: `log_level = "info",  -- "trace", "debug", "info", "warn", "error"`.
  log_level = "info",  -- "trace", "debug", "info", "warn", "error"
  
  -- Container lifecycle hooks
-- Línea documentada: `hooks = {`.
  hooks = {
    -- Run before attaching to container
-- Línea documentada: `pre_attach = function()`.
    pre_attach = function()
      -- Custom setup before container attachment
-- Línea documentada: `end,`.
    end,
    
    -- Run after attaching to container
-- Línea documentada: `post_attach = function()`.
    post_attach = function()
      -- Custom setup after container attachment
-- Línea documentada: `end,`.
    end,
    
    -- Run before building container
-- Línea documentada: `pre_build = function()`.
    pre_build = function()
      -- Custom setup before container build
-- Línea documentada: `end,`.
    end,
    
    -- Run after building container
-- Línea documentada: `post_build = function()`.
    post_build = function()
      -- Custom setup after container build
-- Línea documentada: `end,`.
    end,
-- Línea documentada: `},`.
  },
  
  -- Workspace folder behavior
-- Línea documentada: `workspace_folder_provider = function()`.
  workspace_folder_provider = function()
    -- Return the workspace folder for the devcontainer
    -- By default, uses current working directory
-- Línea documentada: `return vim.fn.getcwd()`.
    return vim.fn.getcwd()
-- Línea documentada: `end,`.
  end,
  
  -- Container configuration
-- Línea documentada: `container = {`.
  container = {
    -- Environment variables to pass to container
-- Línea documentada: `env = {},`.
    env = {},
    
    -- Mount additional volumes
-- Línea documentada: `mounts = {},`.
    mounts = {},
-- Línea documentada: `},`.
  },
  
  -- UI customization
-- Línea documentada: `ui = {`.
  ui = {
    -- Use icons in UI elements
-- Línea documentada: `use_icons = true,`.
    use_icons = true,
    
    -- Border style for floating windows
    -- Options: "none", "single", "double", "rounded", "solid", "shadow"
-- Línea documentada: `border = "rounded",`.
    border = "rounded",
-- Línea documentada: `},`.
  },
-- Línea documentada: `})`.
})
