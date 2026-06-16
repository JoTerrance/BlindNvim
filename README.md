# BlindNeoVim

Configuración personal de Neovim centrada en accesibilidad, productividad y atajos consistentes.

## Resumen rápido
- Punto de entrada: `init.lua` en la raíz del repositorio.
- Organización: `lua/` agrupa la configuración por dominio (`core`, `lsp`, `ui`, `tools`, `navigation`, `git`, `ai`, etc.).
- Bloqueo de plugins: `lazy-lock.json`.
- Overrides por tipo de archivo: `ftplugin/`.

## Requisitos
- Neovim 0.8 o superior. Se recomienda 0.9+.
- Git.
- Linux o un entorno tipo Unix es la ruta principal soportada.
- En Windows, la experiencia es parcial; WSL2 suele dar mejores resultados.

## Modo accesible
La configuración usa `BlindReturn(...)` para adaptar valores cuando detecta un entorno braille.

- La detección automática activa el modo braille si encuentra un dispositivo braille o BRLTTY.
- Para forzarlo manualmente: `BLINDNVIM_VISUAL_IMPAIRING=1 nvim`
- Para desactivarlo explícitamente: `BLINDNVIM_VISUAL_IMPAIRING=0 nvim`
- Para compatibilidad histórica, también se acepta `BLINDNIM_VISUAL_IMPAIRING`.
- La prioridad es: variable de entorno > `vim.g.visual_impairing` > detección automática.

## Instalación
1. Haz una copia de seguridad de tu configuración actual si ya existe.
2. Clona este repositorio en tu directorio de configuración de Neovim.
3. Abre Neovim y sincroniza plugins con `:Lazy sync`.

Ejemplo en Linux o macOS:
```bash
git clone --depth 1 "<ruta-al-repo-o-remote>" "${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
cd "${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
nvim
```

Ejemplo en Windows con PowerShell:
```powershell
git clone --depth 1 "<ruta-al-repo-o-remote>" $env:LOCALAPPDATA\nvim
nvim
```

## Estructura del proyecto
- `init.lua`: orquestación de arranque.
- `lua/core/`: opciones base, keymaps y registro de plugins.
- `lua/lsp/`: cliente LSP, signos diagnósticos y completado.
- `lua/navigation/`: navegación, buscadores y exploración de buffers/archivos.
- `lua/tools/`: utilidades de edición, terminal, formato y automatización.
- `lua/ui/`: tema, barra de estado, bufferline y componentes visuales.
- `lua/git/`: integración con Git y GitHub.
- `lua/ai/`: asistentes y flujos de IA.
- `lua/language/`: configuración por lenguaje.
- `ftplugin/`: ajustes específicos por tipo de archivo.

## Validación
Este repositorio no define un script de build ni una suite de tests propia. La validación habitual es cargar la configuración en Neovim y revisar la integración afectada.

Comandos útiles:
- `:Lazy sync` para instalar o actualizar plugins.
- `:checkhealth` para revisar el estado general de Neovim y sus integraciones.
- `:LspInfo` para inspeccionar servidores LSP activos.
- `:Mason` para ver herramientas gestionadas por Mason.

## Notas de compatibilidad
- La configuración está pensada principalmente para Linux y flujos de trabajo Unix.
- Muchas integraciones asumen herramientas como `ripgrep`, `fd`, `make` y `git`.
- Algunas funciones de UI y terminal no están pensadas para ejecutarse dentro de VSCode; `init.lua` reserva esos módulos para sesiones fuera de VSCode.

## Contribuir
1. Trabaja en cambios pequeños y enfocados.
2. Mantén la documentación cerca del comportamiento real de la configuración.
3. Abre un issue o una PR con el contexto necesario para revisar el cambio.

## Contacto
Abre un issue en el repositorio si encuentras un problema o tienes una duda concreta.
