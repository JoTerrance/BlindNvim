-- Documentación: módulo `lua/navigation/aerial-config/init.lua`.
-- Propósito: define herramientas de navegación y búsqueda dentro de BlindNvim sin alterar lógica de ejecución.

local config = {
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
}

if vim.g.visual_impairing then
  config.icons = {}
  config.nerd_font = false
  config.show_guides = false
  config.nav = {
    border = "rounded",
    max_height = 0.9,
    min_height = { 10, 0.1 },
    max_width = 0.5,
    min_width = { 0.2, 20 },
    win_opts = {
      cursorline = false,
      winblend = 0,
    },
    autojump = false,
    preview = false,
    keymaps = {
      ["<CR>"] = "actions.jump",
      ["<2-LeftMouse>"] = "actions.jump",
      ["<C-v>"] = "actions.jump_vsplit",
      ["<C-s>"] = "actions.jump_split",
      ["h"] = "actions.left",
      ["l"] = "actions.right",
      ["<C-c>"] = "actions.close",
    },
  }
end

require("aerial").setup(config)
