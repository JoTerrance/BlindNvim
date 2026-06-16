-- MCPHub.nvim: real MCP client integration for Neovim chat plugins.

require('mcphub').setup({
  use_bundled_binary = true,
  extensions = {
    avante = {
      enabled = true,
      make_slash_commands = true,
    },
  },
})
