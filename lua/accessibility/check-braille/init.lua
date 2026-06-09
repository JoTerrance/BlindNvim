-- Documentación: módulo `lua/accessibility/check-braille/init.lua`.
-- Propósito: define funcionalidades de accesibilidad dentro de BlindNvim sin alterar lógica de ejecución.

-- check_braille.lua
-- Detecta si hay un dispositivo Braille conectado en Linux

-- Línea documentada: `local function run_command(cmd)`.
local function run_command(cmd)
-- Línea documentada: `local handle = io.popen(cmd)`.
  local handle = io.popen(cmd)
-- Línea documentada: `if not handle then return "" end`.
  if not handle then return "" end
-- Línea documentada: `local result = handle:read("*a")`.
  local result = handle:read("*a")
-- Línea documentada: `handle:close()`.
  handle:close()
-- Línea documentada: `return result or ""`.
  return result or ""
-- Línea documentada: `end`.
end

-- Línea documentada: `local function has_braille_device()`.
local function has_braille_device()
-- Línea documentada: `local found = false`.
  local found = false
-- Línea documentada: `local details = {}`.
  local details = {}
  

  -- 1️⃣ Buscar en lsusb
-- Línea documentada: `local lsusb = run_command("lsusb")`.
  local lsusb = run_command("lsusb")
-- Línea documentada: `for line in lsusb:gmatch("[^\r\n]+") do`.
  for line in lsusb:gmatch("[^\r\n]+") do
-- Línea documentada: `if line:lower():match("braille") or line:lower():match("handy") or line:lower():match("baum") or line:lower():match("freedom") then`.
    if line:lower():match("braille") or line:lower():match("handy") or line:lower():match("baum") or line:lower():match("freedom") then
-- Línea documentada: `found = true`.
      found = true
-- Línea documentada: `table.insert(details, "USB: " .. line)`.
      table.insert(details, "USB: " .. line)
-- Línea documentada: `end`.
    end
-- Línea documentada: `end`.
  end

  -- 2️⃣ Buscar en dmesg
-- Línea documentada: `local dmesg = run_command("dmesg | grep -i braille")`.
  local dmesg = run_command("dmesg | grep -i braille")
-- Línea documentada: `for line in dmesg:gmatch("[^\r\n]+") do`.
  for line in dmesg:gmatch("[^\r\n]+") do
-- Línea documentada: `found = true`.
    found = true
-- Línea documentada: `table.insert(details, "dmesg: " .. line)`.
    table.insert(details, "dmesg: " .. line)
-- Línea documentada: `end`.
  end
  
  -- 3️⃣ Verificar estado de brltty
-- Línea documentada: `local brltty_status = run_command("systemctl is-active brltty 2>/dev/null")`.
  local brltty_status = run_command("systemctl is-active brltty 2>/dev/null")
-- Línea documentada: `if brltty_status:match("^active") then`.
  if brltty_status:match("^active") then
-- Línea documentada: `found = true`.
    found = true
-- Línea documentada: `table.insert(details, "BRLTTY activo")`.
    table.insert(details, "BRLTTY activo")
-- Línea documentada: `end`.
  end

  -- 4️⃣ Buscar dispositivos de entrada relacionados
-- Línea documentada: `local input = run_command("cat /proc/bus/input/devices 2>/dev/null")`.
  local input = run_command("cat /proc/bus/input/devices 2>/dev/null")
-- Línea documentada: `for line in input:gmatch("[^\r\n]+") do`.
  for line in input:gmatch("[^\r\n]+") do
-- Línea documentada: `if line:lower():match("braille") then`.
    if line:lower():match("braille") then
-- Línea documentada: `found = true`.
      found = true
-- Línea documentada: `table.insert(details, "Entrada: " .. line)`.
      table.insert(details, "Entrada: " .. line)
-- Línea documentada: `end`.
    end
-- Línea documentada: `end`.
  end

  -- Resultado final
-- Línea documentada: `if found then`.
  if found then
-- Línea documentada: `print("✅ Dispositivo(s) Braille detectado(s):")`.
    print("✅ Dispositivo(s) Braille detectado(s):")
-- Línea documentada: `for _, d in ipairs(details) do print("  - " .. d) end`.
    for _, d in ipairs(details) do print("  - " .. d) end
-- Línea documentada: `return true`.
    return true
-- Línea documentada: `else`.
  else
-- Línea documentada: `print("❌ No se detectó ningún dispositivo Braille.")`.
    print("❌ No se detectó ningún dispositivo Braille.")
-- Línea documentada: `return false`.
    return false
-- Línea documentada: `end`.
  end
-- Línea documentada: `end`.
end

-- Export module table so callers can use the function when requiring this file
-- Línea documentada: `local M = {}`.
local M = {}
-- Línea documentada: `M.has_braille_device = has_braille_device`.
M.has_braille_device = has_braille_device

-- Línea documentada: `return M`.
return M
