-- Documentación: módulo `lua/tools/dadbod-ui-config/init.lua`.
-- Propósito: ajustar la UI de vim-dadbod-ui para flujos de accesibilidad.

local fullscreen_for_braille = BlindReturn(true, false)

if fullscreen_for_braille then
  local group = vim.api.nvim_create_augroup("DadbodUiFullscreen", { clear = true })

  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "dbui",
    callback = function()
      vim.schedule(function()
        vim.cmd("wincmd |")
        vim.cmd("wincmd _")
      end)
    end,
  })
end
