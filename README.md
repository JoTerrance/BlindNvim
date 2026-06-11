# BlindNeoVim

Configuración personal de Neovim pensada para accesibilidad y productividad.

Resumen rápido
- Base: `init.lua` en la raíz del repositorio.
- Estructura principal: la carpeta `lua/` contiene la configuración modular (plugins, LSP, UI, tools, etc.).
- Lockfile de plugins: `lazy-lock.json`.

Requisitos
- Neovim >= 0.8 (se recomienda 0.9+). Instalar según tu sistema operativo.
- Linux (recomendado). Esta configuración está pensada para entornos tipo Unix.
- Git. En Windows algunas integraciones pueden requerir PowerShell o WSL.

Modo accesible y simulación
- La configuración usa `BlindReturn(...)` para elegir variantes más limpias cuando detecta un entorno braille.
- Para simular la experiencia sin hardware, arranca Neovim con `BLINDNIM_VISUAL_IMPAIRING=1`.
- Para forzar el modo normal, usa `BLINDNIM_VISUAL_IMPAIRING=0`.
- Prioridad de detección: variable de entorno > `vim.g.visual_impairing` > detección automática de braille.

Compatibilidad de plataformas
- Plataforma principal: Linux. Muchos plugins y utilidades asumen herramientas Unix (ripgrep, fd, make, etc.).
- Windows: puede funcionar parcialmente, pero varios plugins (terminal integraciones, herramientas de building, soporte de rutas) pueden no funcionar sin adaptaciones. Se recomienda usar WSL2 para una experiencia más fiel a Linux.

Instalación (Linux recomendada; Windows con limitaciones)
1. Haz una copia de seguridad de tu configuración actual (si existe):
```bash
mkdir -p "$HOME/nvim_backup"; cp -r "$XDG_CONFIG_HOME/nvim" "$HOME/nvim_backup" 2>/dev/null || cp -r "$HOME/.config/nvim" "$HOME/nvim_backup" 2>/dev/null || true
```
2. Clona este repositorio en tu carpeta de configuración de Neovim (Linux/macOS):
```bash
# Opción A: usar como configuración principal
git clone --depth 1 "<ruta-al-repo-o-remote>" "$XDG_CONFIG_HOME/nvim" || git clone --depth 1 "<ruta-al-repo-o-remote>" "$HOME/.config/nvim"

# Opción B: clonar en una carpeta aparte para probar
git clone "<ruta-al-repo-o-remote>" "$HOME/source/BlindNeoVim"
```
3. Si estás en Windows y quieres probar, usar PowerShell (ten en cuenta las limitaciones):
```powershell
# Crear copia de seguridad (opcional)
mkdir $env:USERPROFILE\nvim_backup -Force; copy-item $env:USERPROFILE\AppData\Local\nvim\* $env:USERPROFILE\nvim_backup -Recurse -Force -ErrorAction SilentlyContinue

# Clonar como configuración (no recomendado si usas muchas utilidades Unix)
git clone --depth 1 "<ruta-al-repo-o-remote>" $env:USERPROFILE\AppData\Local\nvim
```
4. Inicia Neovim y deja que el gestor de plugins instale dependencias (se usa `lazy` si está presente). Abre Neovim y ejecuta:
```
:Lazy sync
```

Notas de configuración importantes
- Archivo principal: `init.lua` (raíz).
- Configuración modular: `lua/core/` (keybindings, options, plugins).
- LSP y completado: `lua/lsp/` y `lua/lsp/language_servers.lua`.
- Plugins y ajustes UI/Tools en `lua/*/*-config/init.lua`.

Cómo contribuir
1. Fork y crea una rama con un nombre descriptivo.
2. Haz cambios pequeños y documentados. Añade comentarios donde sea útil.
3. Abrir PR hacia el repo original con una descripción clara.

Contacto
- Abre un issue en el repositorio para preguntas o reportes de errores.

Gracias por usar y contribuir a BlindNeoVim.

