-- Documentación: módulo `ftplugin/gdscript.lua`.
-- Propósito: ajustes locales para buffers GDScript sin afectar otros filetypes.

require('godot.ftplugin').setup({
  commentstring = '# %s',
  desc_prefix = 'Godot',
})
