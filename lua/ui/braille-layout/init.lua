-- Shared picker layout tuned for braille mode.
local M = {}

function M.picker(opts)
  return vim.tbl_deep_extend("force", {
    preset = "default",
    preview = false,
    layout = {
      width = 0.99,
      height = 0.99,
    },
  }, opts or {})
end

return M
