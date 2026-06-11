-- Documentación: módulo `lua/tools/dbee-config/init.lua`.
-- Propósito: ajustar DBee para accesibilidad en modo braille.

local dbee = require("dbee")
local layouts = require("dbee.layouts")
local tools = require("dbee.layouts.tools")
local api_ui = require("dbee.api.ui")

local function create_braille_layout()
  local layout = layouts.Default:new({
    result_height = 20,
    call_log_height = 12,
  })
  layout.drawer_height = 18

  function layout:open()
    self.egg = tools.save()
    self.windows = {}

    tools.make_only(0)

    local editor_win = vim.api.nvim_get_current_win()
    self.windows.editor = editor_win
    api_ui.editor_show(editor_win)
    self:configure_window_on_switch(self.on_switch, editor_win, api_ui.editor_show, true)
    self:configure_window_on_quit(editor_win)

    vim.cmd("belowright " .. self.result_height .. "split")
    local result_win = vim.api.nvim_get_current_win()
    self.windows.result = result_win
    api_ui.result_show(result_win)
    self:configure_window_on_switch(self.on_switch, result_win, api_ui.result_show)
    self:configure_window_on_quit(result_win)

    vim.cmd("belowright " .. self.drawer_height .. "split")
    local drawer_win = vim.api.nvim_get_current_win()
    self.windows.drawer = drawer_win
    api_ui.drawer_show(drawer_win)
    self:configure_window_on_switch(self.on_switch, drawer_win, api_ui.drawer_show)
    self:configure_window_on_quit(drawer_win)

    vim.cmd("belowright " .. self.call_log_height .. "split")
    local call_log_win = vim.api.nvim_get_current_win()
    self.windows.call_log = call_log_win
    api_ui.call_log_show(call_log_win)
    self:configure_window_on_switch(self.on_switch, call_log_win, api_ui.call_log_show)
    self:configure_window_on_quit(call_log_win)

    vim.api.nvim_set_current_win(editor_win)
    self.is_opened = true
  end

  function layout:reset()
    vim.api.nvim_win_set_height(self.windows.result, self.result_height)
    vim.api.nvim_win_set_height(self.windows.drawer, self.drawer_height)
    vim.api.nvim_win_set_height(self.windows.call_log, self.call_log_height)
  end

  return layout
end

local normal = {
  window_layout = layouts.Default:new(),
}

local braille = {
  window_layout = create_braille_layout(),
}

dbee.setup(BlindReturn(braille, normal))
