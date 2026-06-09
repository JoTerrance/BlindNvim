-- Documentación: módulo `lua/ai/mcphub-config/init.lua`.
-- Propósito: define integraciones de asistentes de IA dentro de BlindNvim sin alterar lógica de ejecución.

-- MCPHub.nvim configuration (using gp.nvim as MCP integration)
-- Model Context Protocol Hub for Neovim

-- Línea documentada: `require("gp").setup({`.
require("gp").setup({
-- Línea documentada: `providers = {`.
  providers = {
-- Línea documentada: `copilot = {`.
    copilot = {
-- Línea documentada: `endpoint = "https://api.githubcopilot.com/chat/completions",`.
      endpoint = "https://api.githubcopilot.com/chat/completions",
-- Línea documentada: `secret = { "bash", "-c", "cat ~/.config/github-copilot/hosts.json | sed -e 's/.*oauth_token...//;s/\".*//' 2>/dev/null || echo ''" },`.
      secret = { "bash", "-c", "cat ~/.config/github-copilot/hosts.json | sed -e 's/.*oauth_token...//;s/\".*//' 2>/dev/null || echo ''" },
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
  
-- Línea documentada: `agents = {`.
  agents = {
-- Línea documentada: `{`.
    {
-- Línea documentada: `provider = "copilot",`.
      provider = "copilot",
-- Línea documentada: `name = "ChatCopilot",`.
      name = "ChatCopilot",
-- Línea documentada: `chat = true,`.
      chat = true,
-- Línea documentada: `command = false,`.
      command = false,
-- Línea documentada: `model = { model = "gpt-4o-2024-05-13", temperature = 0.8, top_p = 1 },`.
      model = { model = "gpt-4o-2024-05-13", temperature = 0.8, top_p = 1 },
-- Línea documentada: `system_prompt = require("gp.defaults").chat_system_prompt,`.
      system_prompt = require("gp.defaults").chat_system_prompt,
-- Línea documentada: `},`.
    },
-- Línea documentada: `{`.
    {
-- Línea documentada: `provider = "copilot",`.
      provider = "copilot",
-- Línea documentada: `name = "ChatCopilot-Precise",`.
      name = "ChatCopilot-Precise",
-- Línea documentada: `chat = true,`.
      chat = true,
-- Línea documentada: `command = false,`.
      command = false,
-- Línea documentada: `model = { model = "gpt-4o-2024-05-13", temperature = 0.3, top_p = 1 },`.
      model = { model = "gpt-4o-2024-05-13", temperature = 0.3, top_p = 1 },
-- Línea documentada: `system_prompt = require("gp.defaults").chat_system_prompt,`.
      system_prompt = require("gp.defaults").chat_system_prompt,
-- Línea documentada: `},`.
    },
-- Línea documentada: `{`.
    {
-- Línea documentada: `provider = "copilot",`.
      provider = "copilot",
-- Línea documentada: `name = "CodeCopilot",`.
      name = "CodeCopilot",
-- Línea documentada: `chat = false,`.
      chat = false,
-- Línea documentada: `command = true,`.
      command = true,
-- Línea documentada: `model = { model = "gpt-4o-2024-05-13", temperature = 0.7, top_p = 1 },`.
      model = { model = "gpt-4o-2024-05-13", temperature = 0.7, top_p = 1 },
-- Línea documentada: `system_prompt = require("gp.defaults").code_system_prompt,`.
      system_prompt = require("gp.defaults").code_system_prompt,
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
  
-- Línea documentada: `chat_dir = vim.fn.stdpath("data"):gsub("/$", "") .. "/gp/chats",`.
  chat_dir = vim.fn.stdpath("data"):gsub("/$", "") .. "/gp/chats",
-- Línea documentada: `chat_user_prefix = "## User:",`.
  chat_user_prefix = "## User:",
-- Línea documentada: `chat_assistant_prefix = { "## Assistant:", "[{{agent}}]" },`.
  chat_assistant_prefix = { "## Assistant:", "[{{agent}}]" },
-- Línea documentada: `chat_topic_gen_prompt = "Summarize the topic of our conversation above in two or three words. Respond only with those words.",`.
  chat_topic_gen_prompt = "Summarize the topic of our conversation above in two or three words. Respond only with those words.",
-- Línea documentada: `chat_topic_gen_model = "gpt-4o-2024-05-13",`.
  chat_topic_gen_model = "gpt-4o-2024-05-13",
-- Línea documentada: `chat_confirm_delete = true,`.
  chat_confirm_delete = true,
-- Línea documentada: `chat_conceal_model_params = true,`.
  chat_conceal_model_params = true,
-- Línea documentada: `chat_shortcut_respond = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g><C-g>" },`.
  chat_shortcut_respond = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g><C-g>" },
-- Línea documentada: `chat_shortcut_delete = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>d" },`.
  chat_shortcut_delete = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>d" },
-- Línea documentada: `chat_shortcut_stop = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>s" },`.
  chat_shortcut_stop = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>s" },
-- Línea documentada: `chat_shortcut_new = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>c" },`.
  chat_shortcut_new = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>c" },
-- Línea documentada: `chat_free_cursor = false,`.
  chat_free_cursor = false,
-- Línea documentada: `toggle_target = "vsplit",`.
  toggle_target = "vsplit",
  
-- Línea documentada: `style_chat_finder_border = "single",`.
  style_chat_finder_border = "single",
-- Línea documentada: `style_chat_finder_margin_bottom = 8,`.
  style_chat_finder_margin_bottom = 8,
-- Línea documentada: `style_chat_finder_margin_left = 1,`.
  style_chat_finder_margin_left = 1,
-- Línea documentada: `style_chat_finder_margin_right = 2,`.
  style_chat_finder_margin_right = 2,
-- Línea documentada: `style_chat_finder_margin_top = 2,`.
  style_chat_finder_margin_top = 2,
-- Línea documentada: `style_chat_finder_preview_ratio = 0.5,`.
  style_chat_finder_preview_ratio = 0.5,
  
-- Línea documentada: `style_popup_border = "single",`.
  style_popup_border = "single",
-- Línea documentada: `style_popup_margin_bottom = 8,`.
  style_popup_margin_bottom = 8,
-- Línea documentada: `style_popup_margin_left = 1,`.
  style_popup_margin_left = 1,
-- Línea documentada: `style_popup_margin_right = 2,`.
  style_popup_margin_right = 2,
-- Línea documentada: `style_popup_margin_top = 2,`.
  style_popup_margin_top = 2,
-- Línea documentada: `style_popup_max_width = 160,`.
  style_popup_max_width = 160,
  
-- Línea documentada: `command_prompt_prefix_template = "🤖 {{agent}} ~ ",`.
  command_prompt_prefix_template = "🤖 {{agent}} ~ ",
-- Línea documentada: `command_auto_select_response = true,`.
  command_auto_select_response = true,
  
-- Línea documentada: `curl_params = {},`.
  curl_params = {},
  
-- Línea documentada: `log_file = vim.fn.stdpath("log"):gsub("/$", "") .. "/gp.nvim.log",`.
  log_file = vim.fn.stdpath("log"):gsub("/$", "") .. "/gp.nvim.log",
-- Línea documentada: `log_sensitive = false,`.
  log_sensitive = false,
  
-- Línea documentada: `hooks = {`.
  hooks = {
-- Línea documentada: `InspectPlugin = function(plugin, params)`.
    InspectPlugin = function(plugin, params)
-- Línea documentada: `local bufnr = vim.api.nvim_create_buf(false, true)`.
      local bufnr = vim.api.nvim_create_buf(false, true)
-- Línea documentada: `local copy = vim.deepcopy(plugin)`.
      local copy = vim.deepcopy(plugin)
-- Línea documentada: `local key = copy.config.openai_api_key or ""`.
      local key = copy.config.openai_api_key or ""
-- Línea documentada: `copy.config.openai_api_key = key:sub(1, 3) .. string.rep("*", #key - 6) .. key:sub(-3)`.
      copy.config.openai_api_key = key:sub(1, 3) .. string.rep("*", #key - 6) .. key:sub(-3)
-- Línea documentada: `local plugin_info = string.format("Plugin structure:\n%s", vim.inspect(copy))`.
      local plugin_info = string.format("Plugin structure:\n%s", vim.inspect(copy))
-- Línea documentada: `local params_info = string.format("Command params:\n%s", vim.inspect(params))`.
      local params_info = string.format("Command params:\n%s", vim.inspect(params))
-- Línea documentada: `local lines = vim.split(plugin_info .. "\n" .. params_info, "\n")`.
      local lines = vim.split(plugin_info .. "\n" .. params_info, "\n")
-- Línea documentada: `vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)`.
      vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
-- Línea documentada: `vim.api.nvim_win_set_buf(0, bufnr)`.
      vim.api.nvim_win_set_buf(0, bufnr)
-- Línea documentada: `end,`.
    end,
    
-- Línea documentada: `Explain = function(gp, params)`.
    Explain = function(gp, params)
-- Línea documentada: `local template = "I have the following code from {{filename}}:\n\n"`.
      local template = "I have the following code from {{filename}}:\n\n"
-- Línea documentada: `.. "```{{filetype}}\n{{selection}}\n```\n\n"`.
        .. "```{{filetype}}\n{{selection}}\n```\n\n"
-- Línea documentada: `.. "Please respond by explaining the code above."`.
        .. "Please respond by explaining the code above."
-- Línea documentada: `local agent = gp.get_command_agent()`.
      local agent = gp.get_command_agent()
-- Línea documentada: `gp.Prompt(params, gp.Target.popup, agent, template)`.
      gp.Prompt(params, gp.Target.popup, agent, template)
-- Línea documentada: `end,`.
    end,
    
-- Línea documentada: `CodeReview = function(gp, params)`.
    CodeReview = function(gp, params)
-- Línea documentada: `local template = "I have the following code from {{filename}}:\n\n"`.
      local template = "I have the following code from {{filename}}:\n\n"
-- Línea documentada: `.. "```{{filetype}}\n{{selection}}\n```\n\n"`.
        .. "```{{filetype}}\n{{selection}}\n```\n\n"
-- Línea documentada: `.. "Please analyze for code smells and suggest improvements."`.
        .. "Please analyze for code smells and suggest improvements."
-- Línea documentada: `local agent = gp.get_chat_agent()`.
      local agent = gp.get_chat_agent()
-- Línea documentada: `gp.Prompt(params, gp.Target.enew("markdown"), agent, template, nil, nil)`.
      gp.Prompt(params, gp.Target.enew("markdown"), agent, template, nil, nil)
-- Línea documentada: `end,`.
    end,
    
-- Línea documentada: `Translator = function(gp, params)`.
    Translator = function(gp, params)
-- Línea documentada: `local agent = gp.get_command_agent()`.
      local agent = gp.get_command_agent()
-- Línea documentada: `local chat_system_prompt = "You are a Translator, please translate between English and Chinese."`.
      local chat_system_prompt = "You are a Translator, please translate between English and Chinese."
-- Línea documentada: `gp.cmd.ChatNew(params, agent.model, chat_system_prompt)`.
      gp.cmd.ChatNew(params, agent.model, chat_system_prompt)
-- Línea documentada: `end,`.
    end,
    
-- Línea documentada: `BufferChatNew = function(gp, _)`.
    BufferChatNew = function(gp, _)
-- Línea documentada: `vim.api.nvim_command("%" .. gp.config.chat_shortcut_respond.shortcut)`.
      vim.api.nvim_command("%" .. gp.config.chat_shortcut_respond.shortcut)
-- Línea documentada: `end,`.
    end,
-- Línea documentada: `},`.
  },
-- Línea documentada: `})`.
})
