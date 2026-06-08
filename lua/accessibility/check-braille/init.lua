-- check_braille.lua
-- Detecta si hay un dispositivo Braille conectado en Linux

local function run_command(cmd)
  local handle = io.popen(cmd)
  if not handle then return "" end
  local result = handle:read("*a")
  handle:close()
  return result or ""
end

local function has_braille_device()
  local found = false
  local details = {}
  

  -- 1️⃣ Buscar en lsusb
  local lsusb = run_command("lsusb")
  for line in lsusb:gmatch("[^\r\n]+") do
    if line:lower():match("braille") or line:lower():match("handy") or line:lower():match("baum") or line:lower():match("freedom") then
      found = true
      table.insert(details, "USB: " .. line)
    end
  end

  -- 2️⃣ Buscar en dmesg
  local dmesg = run_command("dmesg | grep -i braille")
  for line in dmesg:gmatch("[^\r\n]+") do
    found = true
    table.insert(details, "dmesg: " .. line)
  end
  
  -- 3️⃣ Verificar estado de brltty
  local brltty_status = run_command("systemctl is-active brltty 2>/dev/null")
  if brltty_status:match("^active") then
    found = true
    table.insert(details, "BRLTTY activo")
  end

  -- 4️⃣ Buscar dispositivos de entrada relacionados
  local input = run_command("cat /proc/bus/input/devices 2>/dev/null")
  for line in input:gmatch("[^\r\n]+") do
    if line:lower():match("braille") then
      found = true
      table.insert(details, "Entrada: " .. line)
    end
  end

  -- Resultado final
  if found then
    print("✅ Dispositivo(s) Braille detectado(s):")
    for _, d in ipairs(details) do print("  - " .. d) end
    return true
  else
    print("❌ No se detectó ningún dispositivo Braille.")
    return false
  end
end

-- Export module table so callers can use the function when requiring this file
local M = {}
M.has_braille_device = has_braille_device

return M
