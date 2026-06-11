-- Documentación: módulo `lua/ui/render-markdown-config/init.lua`.
-- Propósito: define componentes de interfaz de usuario dentro de BlindNvim sin alterar lógica de ejecución.

-- Configuration for render-markdown.nvim
-- This plugin provides enhanced markdown rendering in Neovim
-- Using default configuration for standard markdown rendering
require('render-markdown').setup({
  enabled = BlindReturn(false, true),
})
