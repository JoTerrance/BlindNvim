-- Documentación: módulo `lua/tools/tree-sitter-manager-config/init.lua`.
-- Propósito: configura el gestor ligero de parsers Tree-sitter para Neovim 0.12+.

local has_tree_sitter_cli = vim.fn.executable("tree-sitter") == 1

require("tree-sitter-manager").setup({
  auto_install = false,
  ensure_installed = {},
  highlight = true,
  nerdfont = BlindReturn(false, true),
  border = BlindReturn("none", "rounded"),
  noauto_install = {
    -- Parsers bundled with Neovim or better handled explicitly.
    "c",
    "lua",
    "markdown",
    "markdown_inline",
    "query",
    "vim",
    "vimdoc",
  },
})

if not has_tree_sitter_cli then
  vim.schedule(function()
    vim.notify(
      "tree-sitter CLI not found; :TSInstall from tree-sitter-manager.nvim will need it in PATH",
      vim.log.levels.WARN,
      { title = "tree-sitter-manager.nvim" }
    )
  end)
end
