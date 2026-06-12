-- Documentación: módulo `lua/navigation/trouble-config/init.lua`.
-- Propósito: define herramientas de navegación y búsqueda dentro de BlindNvim sin alterar lógica de ejecución.

local config = {}

if vim.g.visual_impairing then
  config.auto_preview = false
  config.follow = false
  config.icons = {
    indent = {
      top = "| ",
      middle = "|-",
      last = "`-",
      fold_open = "[-] ",
      fold_closed = "[+] ",
      ws = "  ",
    },
    folder_closed = "DIR ",
    folder_open = "OPEN ",
    kinds = {
      Array = "Array ",
      Boolean = "Bool ",
      Class = "Class ",
      Constant = "Const ",
      Constructor = "Ctor ",
      Enum = "Enum ",
      EnumMember = "EnumM ",
      Event = "Event ",
      Field = "Field ",
      File = "File ",
      Function = "Fn ",
      Interface = "Iface ",
      Key = "Key ",
      Method = "Meth ",
      Module = "Mod ",
      Namespace = "NS ",
      Null = "Null ",
      Number = "Num ",
      Object = "Obj ",
      Operator = "Op ",
      Package = "Pkg ",
      Property = "Prop ",
      String = "Str ",
      Struct = "Struct ",
      TypeParameter = "Type ",
      Variable = "Var ",
    },
  }
end

require("trouble").setup(config)
