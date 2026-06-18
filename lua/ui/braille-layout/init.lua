-- Shared picker layout tuned for braille mode.
local M = {}

function M.picker(opts)
  return vim.tbl_deep_extend("force", {
    border = "none",
    preview = "main",
    layout = {
      box = "vertical",
      backdrop = false,
      width = 1,
      height = 1,
      border = "none",
      {
        box = "vertical",
        border = "none",
        title = "{title} {live} {flags}",
        { win = "input", height = 1, border = "bottom" },
        { win = "list", border = "none" },
      },
      { win = "preview", title = "{preview}", height = 0.35, border = "none" },
    },
  }, opts or {})
end

return M
