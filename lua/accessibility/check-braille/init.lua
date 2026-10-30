-- Modulo de deteccion de perfil Braille/accesible.
-- Propósito: detectar un perfil accesible sin añadir ruido durante el arranque.

-- La detección debe ser silenciosa: algunos entornos no permiten leer partes
-- del sistema y cualquier salida en stdout/stderr ensucia la UI de Neovim.

local M = {}
local cached_result

-- Run a program without a shell so probes behave the same on every platform.
-- Missing executables return '' instead of printing errors.
local function run_command(argv)
  if vim.fn.executable(argv[1]) ~= 1 then
    return ''
  end
  local ok, result = pcall(vim.fn.system, argv)
  if not ok or vim.v.shell_error ~= 0 then
    return ''
  end
  return result or ''
end

local function read_file(path)
  local handle = io.open(path, 'r')
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

-- Debug opt-in: useful when autodetection fails, but quiet for daily startup.
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

  -- All probes below are Linux-specific (lsusb, systemd, /proc). Elsewhere
  -- skip them entirely; users can still force the profile with the env var.
  if vim.fn.has('linux') ~= 1 then
    cached_result = false
    log_details(found, { 'Autodetection only runs on Linux' })
    return found
  end

  -- Prefer cheap, unprivileged probes. Missing commands fail closed, and users
  -- can force the profile with BLINDNVIM_VISUAL_IMPAIRING when autodetect is not enough.
  local lsusb = run_command({ 'lsusb' })
  for line in lsusb:gmatch('[^\r\n]+') do
    local lower = line:lower()
    if lower:match('braille') or lower:match('handy') or lower:match('baum') or lower:match('freedom') then
      found = true
      table.insert(details, 'USB: ' .. line)
    end
  end

  local brltty_status = run_command({ 'systemctl', 'is-active', 'brltty' })
  if brltty_status:match('^active') then
    found = true
    table.insert(details, 'BRLTTY active')
  end

  local input = read_file('/proc/bus/input/devices')
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

-- Precedence: explicit env var, legacy env var, vim global, then autodetect.
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
