-- Documentación: módulo `ftplugin/python.lua`.
-- Propósito: define ajustes específicos por tipo de archivo dentro de BlindNvim sin alterar lógica de ejecución.

require('dap-python').setup('/bin/python3')
require('language.python.whichkey').setup()

require('language.tools.neogen-whichkey').setup()
