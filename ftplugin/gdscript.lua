-- Documentación: módulo `ftplugin/gdscript.lua`.
-- Propósito: ajustes locales para buffers GDScript sin afectar otros filetypes.

require('language.godot.ftplugin').setup({
  commentstring = '# %s',
  desc_prefix = 'Godot',
})
