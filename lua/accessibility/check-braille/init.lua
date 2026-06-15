-- Modulo de deteccion de perfil Braille/accesible.
-- Propósito: detectar un perfil accesible sin añadir ruido durante el arranque.

-- La detección debe ser silenciosa: algunos entornos no permiten leer partes
-- del sistema y cualquier salida en stdout/stderr ensucia la UI de Neovim.

local M = {}
local cached_result

local function run_command(cmd)
  local handle = io.popen(cmd .. ' 2>/dev/null')
  if not handle then return '' end
  local result = handle:read('*a')
  handle:close()
  return result or ''
end

local function env_flag(name)
  local value = vim.env[name]
  if value == nil then
    return nil
  end

  value = tostring(value):lower()
  if value == '' then
    return nil
  end

  if value == '0' or value == 'false' or value == 'no' or value == 'off' then
    return false
  end

  return true
end

local function log_details(found, details)
  if not env_flag('BLINDNVIM_BRAILLE_DEBUG') then
    return
  end

  local message = found and 'Braille device detected' or 'No Braille device detected'
  if #details > 0 then
    message = message .. ':\n- ' .. table.concat(details, '\n- ')
  end

  vim.schedule(function()
    vim.notify(message, vim.log.levels.INFO, { title = 'BlindNvim' })
  end)
end

local function has_braille_device()
  if cached_result ~= nil then
    return cached_result
  end

  local found = false
  local details = {}

  -- Prefer cheap, unprivileged probes. Missing commands fail closed, and users
  -- can force the profile with BLINDNVIM_VISUAL_IMPAIRING when autodetect is not enough.
  local lsusb = run_command('command -v lsusb >/dev/null && lsusb')
  for line in lsusb:gmatch('[^\r\n]+') do
    local lower = line:lower()
    if lower:match('braille') or lower:match('handy') or lower:match('baum') or lower:match('freedom') then
      found = true
      table.insert(details, 'USB: ' .. line)
    end
  end

  local brltty_status = run_command('command -v systemctl >/dev/null && systemctl is-active brltty')
  if brltty_status:match('^active') then
    found = true
    table.insert(details, 'BRLTTY active')
  end

  local input = run_command('test -r /proc/bus/input/devices && cat /proc/bus/input/devices')
  for line in input:gmatch('[^\r\n]+') do
    if line:lower():match('braille') then
      found = true
      table.insert(details, 'Input: ' .. line)
    end
  end

  cached_result = found
  log_details(found, details)
  return found
end

local function is_visual_impairing()
  local override = env_flag('BLINDNVIM_VISUAL_IMPAIRING')
  if override ~= nil then
    return override
  end

  -- Compatibility with the previous misspelled environment variable.
  override = env_flag('BLINDNIM_VISUAL_IMPAIRING')
  if override ~= nil then
    return override
  end

  local global_override = vim.g.visual_impairing
  if global_override ~= nil then
    return not not global_override
  end

  return has_braille_device()
end

M.has_braille_device = has_braille_device
M.is_visual_impairing = is_visual_impairing

return M
