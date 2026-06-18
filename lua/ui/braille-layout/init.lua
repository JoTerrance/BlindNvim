-- Shared picker layout tuned for braille mode.
local M = {}

function M.picker(opts)
  return vim.tbl_deep_extend("force", {
    preset = "default",
    border = "none",
    preview = true,
    layout = {
      box = "vertical",
      backdrop = false,
      width = 0.99,
      height = 0.99,
      border = "none",
      {
        box = "vertical",
        border = "none",
        title = "{title} {live} {flags}",
        { win = "input", height = 1,     border = "bottom" },
        { win = "list",  border = "none" },
      },
      { win = "preview", title = "{preview}", height = 0.45, border = "none" },
    },
  }, opts or {})
end

return M
