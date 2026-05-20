-- MCPHub.nvim configuration (using gp.nvim as MCP integration)
-- Model Context Protocol Hub for Neovim

require("gp").setup({
  providers = {
    copilot = {
      endpoint = "https://api.githubcopilot.com/chat/completions",
      secret = { "bash", "-c", "cat ~/.config/github-copilot/hosts.json | sed -e 's/.*oauth_token...//;s/\".*//' 2>/dev/null || echo ''" },
    },
  },
  
  agents = {
    {
      provider = "copilot",
      name = "ChatCopilot",
      chat = true,
      command = false,
      model = { model = "gpt-4o-2024-05-13", temperature = 0.8, top_p = 1 },
      system_prompt = require("gp.defaults").chat_system_prompt,
    },
    {
      provider = "copilot",
      name = "ChatCopilot-Precise",
      chat = true,
      command = false,
      model = { model = "gpt-4o-2024-05-13", temperature = 0.3, top_p = 1 },
      system_prompt = require("gp.defaults").chat_system_prompt,
    },
    {
      provider = "copilot",
      name = "CodeCopilot",
      chat = false,
      command = true,
      model = { model = "gpt-4o-2024-05-13", temperature = 0.7, top_p = 1 },
      system_prompt = require("gp.defaults").code_system_prompt,
    },
  },
  
  chat_dir = vim.fn.stdpath("data"):gsub("/$", "") .. "/gp/chats",
  chat_user_prefix = "## User:",
  chat_assistant_prefix = { "## Assistant:", "[{{agent}}]" },
  chat_topic_gen_prompt = "Summarize the topic of our conversation above in two or three words. Respond only with those words.",
  chat_topic_gen_model = "gpt-4o-2024-05-13",
  chat_confirm_delete = true,
  chat_conceal_model_params = true,
  chat_shortcut_respond = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g><C-g>" },
  chat_shortcut_delete = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>d" },
  chat_shortcut_stop = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>s" },
  chat_shortcut_new = { modes = { "n", "i", "v", "x" }, shortcut = "<C-g>c" },
  chat_free_cursor = false,
  toggle_target = "vsplit",
  
  style_chat_finder_border = "single",
  style_chat_finder_margin_bottom = 8,
  style_chat_finder_margin_left = 1,
  style_chat_finder_margin_right = 2,
  style_chat_finder_margin_top = 2,
  style_chat_finder_preview_ratio = 0.5,
  
  style_popup_border = "single",
  style_popup_margin_bottom = 8,
  style_popup_margin_left = 1,
  style_popup_margin_right = 2,
  style_popup_margin_top = 2,
  style_popup_max_width = 160,
  
  command_prompt_prefix_template = "🤖 {{agent}} ~ ",
  command_auto_select_response = true,
  
  curl_params = {},
  
  log_file = vim.fn.stdpath("log"):gsub("/$", "") .. "/gp.nvim.log",
  log_sensitive = false,
  
  hooks = {
    InspectPlugin = function(plugin, params)
      local bufnr = vim.api.nvim_create_buf(false, true)
      local copy = vim.deepcopy(plugin)
      local key = copy.config.openai_api_key or ""
      copy.config.openai_api_key = key:sub(1, 3) .. string.rep("*", #key - 6) .. key:sub(-3)
      local plugin_info = string.format("Plugin structure:\n%s", vim.inspect(copy))
      local params_info = string.format("Command params:\n%s", vim.inspect(params))
      local lines = vim.split(plugin_info .. "\n" .. params_info, "\n")
      vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
      vim.api.nvim_win_set_buf(0, bufnr)
    end,
    
    Explain = function(gp, params)
      local template = "I have the following code from {{filename}}:\n\n"
        .. "```{{filetype}}\n{{selection}}\n```\n\n"
        .. "Please respond by explaining the code above."
      local agent = gp.get_command_agent()
      gp.Prompt(params, gp.Target.popup, agent, template)
    end,
    
    CodeReview = function(gp, params)
      local template = "I have the following code from {{filename}}:\n\n"
        .. "```{{filetype}}\n{{selection}}\n```\n\n"
        .. "Please analyze for code smells and suggest improvements."
      local agent = gp.get_chat_agent()
      gp.Prompt(params, gp.Target.enew("markdown"), agent, template, nil, nil)
    end,
    
    Translator = function(gp, params)
      local agent = gp.get_command_agent()
      local chat_system_prompt = "You are a Translator, please translate between English and Chinese."
      gp.cmd.ChatNew(params, agent.model, chat_system_prompt)
    end,
    
    BufferChatNew = function(gp, _)
      vim.api.nvim_command("%" .. gp.config.chat_shortcut_respond.shortcut)
    end,
  },
})
