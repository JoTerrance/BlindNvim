# Copilot instructions for BlindNeoVim

## Commands

| Purpose | Command | Notes |
| --- | --- | --- |
| Install or update plugins after changing plugin specs | `:Lazy sync` | Main repo-specific bootstrap command. |
| Check runtime health after changing editor integrations | `:checkhealth` | Also exposed in the Telescope command palette. |
| Inspect LSP state after changing language tooling | `:LspInfo` | Use alongside `:Mason` when adjusting LSP or Mason configuration. |
| Inspect Mason-managed tooling | `:Mason` | Useful because servers are not auto-forced globally. |

This repository does **not** define a dedicated build script, lint script, test suite, or single-test command in the repo itself. Validation is primarily done by loading the config in Neovim and checking the affected integration.

## High-level architecture

- `init.lua` is the startup orchestrator. It always loads `core.options`, `core.keybindings`, and `core.plugins` first, then loads a small set of modules that work in both Neovim and VSCode, and only loads the full UI/LSP/git/debug/tooling/AI stack when `vim.g.vscode` is false.
- `lua/core/plugins/init.lua` is the single source of truth for plugin registration and lazy-loading rules. Plugin-specific behavior is expected to live outside that file.
- Detailed plugin configuration is organized by domain under `lua/<domain>/<plugin>-config/init.lua` (for example `lua/navigation/telescope-config/init.lua` or `lua/tools/null-ls-config/init.lua`). When a feature is missing, check both the plugin spec in `lua/core/plugins/init.lua` and the matching `*-config` module.
- `lua/lsp/init.lua` composes completion, diagnostic signs, and server setup. `lua/lsp/language_servers.lua` wires Mason, `mason-lspconfig`, `lsp-zero`, and `cmp_nvim_lsp`; language-specific overrides can also live in `ftplugin/*.lua`.
- Accessibility is a cross-cutting concern. `lua/core/options/init.lua` defines `BlindReturn(...)`, which switches values based on `accessibility.check-braille.has_braille_device()`. UI modules reuse that helper to choose accessible text-first values versus icon-heavy values.
- AI integrations are part of the main config, not an external add-on layer: `lua/ai/` contains Copilot, Avante, and MCPHub/gp.nvim setup and is loaded from `init.lua`.

## Key conventions

- Keep plugin declarations centralized in `lua/core/plugins/init.lua`. Do **not** move plugin setup logic there beyond specs, dependencies, load conditions, and small inline callbacks already following the current pattern.
- Put substantial plugin behavior in a matching `lua/<domain>/<plugin>-config/init.lua` module and load it from `init.lua` or from the plugin spec’s `config` callback.
- Preserve the VSCode split: modules that depend on Neovim TUI behavior, embedded terminals, floating windows, or full LSP/UI integrations should remain gated with `if not vim.g.vscode then ... end` and/or `enabled = not vscode`.
- Reuse `BlindReturn(...)` when changing UI text, borders, glyphs, layout, or wrapping behavior that may need an accessibility-friendly alternative.
- Do not assume Mason should auto-install language servers. `lua/lsp/language_servers.lua` intentionally leaves `local servers = {}` empty so contributors opt into toolchains explicitly.
- Follow the module header style already used across the repo: short file-level comments describing the module and its purpose are part of the existing documentation pattern.
- Treat `README.md` as the authoritative source for environment assumptions: Linux/Unix-like environments are the primary target, Neovim `>= 0.8` is expected, and many integrations assume tools such as `git`, `rg`, `fd`, and `make`.
- Use WhichKey groupings and the configured leader key (`vim.g.mapleader = "º"`) when adding discoverable mappings; global mappings live in `lua/core/keybindings/init.lua`, while grouped `<space>` mappings are maintained in `lua/ui/whichkey-config/init.lua`.
