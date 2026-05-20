-- nvim-dev-container configuration
-- Plugin for managing development containers from within Neovim
require("devcontainer").setup({
  -- Auto-start containers when opening a project with devcontainer config
  autostart = false,
  
  -- Automatically install tree-sitter parsers on container start
  autoinstall_treesitter = true,
  
  -- Configuration for the devcontainer CLI
  devcontainer_cli = {
    -- Custom path to devcontainer CLI if not in PATH
    -- path = "/path/to/devcontainer",
  },
  
  -- Terminal settings for devcontainer operations
  terminal = {
    -- Position of the terminal window
    -- Options: "horizontal", "vertical", "float", "tab"
    position = "horizontal",
    
    -- Size of the terminal (percentage or absolute value)
    size = 15,
    
    -- Close terminal automatically on successful commands
    close_on_success = false,
  },
  
  -- Logging configuration
  log_level = "info",  -- "trace", "debug", "info", "warn", "error"
  
  -- Container lifecycle hooks
  hooks = {
    -- Run before attaching to container
    pre_attach = function()
      -- Custom setup before container attachment
    end,
    
    -- Run after attaching to container
    post_attach = function()
      -- Custom setup after container attachment
    end,
    
    -- Run before building container
    pre_build = function()
      -- Custom setup before container build
    end,
    
    -- Run after building container
    post_build = function()
      -- Custom setup after container build
    end,
  },
  
  -- Workspace folder behavior
  workspace_folder_provider = function()
    -- Return the workspace folder for the devcontainer
    -- By default, uses current working directory
    return vim.fn.getcwd()
  end,
  
  -- Container configuration
  container = {
    -- Environment variables to pass to container
    env = {},
    
    -- Mount additional volumes
    mounts = {},
  },
  
  -- UI customization
  ui = {
    -- Use icons in UI elements
    use_icons = true,
    
    -- Border style for floating windows
    -- Options: "none", "single", "double", "rounded", "solid", "shadow"
    border = "rounded",
  },
})
