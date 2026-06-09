-- Documentación: módulo `lua/git/octo-config/init.lua`.
-- Propósito: define integraciones de flujo de trabajo con Git dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `require"octo".setup({`.
require"octo".setup({
-- Línea documentada: `use_local_fs = false,                    -- use local files on right side of reviews`.
  use_local_fs = false,                    -- use local files on right side of reviews
-- Línea documentada: `enable_builtin = false,                  -- shows a list of builtin actions when no action is provided`.
  enable_builtin = false,                  -- shows a list of builtin actions when no action is provided
-- Línea documentada: `default_remote = {"upstream", "origin"}, -- order to try remotes`.
  default_remote = {"upstream", "origin"}, -- order to try remotes
-- Línea documentada: `default_merge_method = "merge",         -- default merge method which should be used for both `Octo pr merge` and merging from picker, could be `merge`, `rebase` or `squash``.
  default_merge_method = "merge",         -- default merge method which should be used for both `Octo pr merge` and merging from picker, could be `merge`, `rebase` or `squash`
-- Línea documentada: `default_delete_branch = false,           -- whether to delete branch when merging pull request with either `Octo pr merge` or from picker (can be overridden with `delete`/`nodelete` argument to `Octo pr merge`)`.
  default_delete_branch = false,           -- whether to delete branch when merging pull request with either `Octo pr merge` or from picker (can be overridden with `delete`/`nodelete` argument to `Octo pr merge`)
-- Línea documentada: `ssh_aliases = {},                        -- SSH aliases. e.g. `ssh_aliases = {["github.com-work"] = "github.com"}`. The key part will be interpreted as an anchored Lua pattern.`.
  ssh_aliases = {},                        -- SSH aliases. e.g. `ssh_aliases = {["github.com-work"] = "github.com"}`. The key part will be interpreted as an anchored Lua pattern.
-- Línea documentada: `picker = "telescope",                    -- or "fzf-lua" or "snacks"`.
  picker = "telescope",                    -- or "fzf-lua" or "snacks"
-- Línea documentada: `picker_config = {`.
  picker_config = {
-- Línea documentada: `use_emojis = false,                    -- only used by "fzf-lua" picker for now`.
    use_emojis = false,                    -- only used by "fzf-lua" picker for now
-- Línea documentada: `mappings = {                           -- mappings for the pickers`.
    mappings = {                           -- mappings for the pickers
-- Línea documentada: `open_in_browser = { lhs = "<C-b>", desc = "open issue in browser" },`.
      open_in_browser = { lhs = "<C-b>", desc = "open issue in browser" },
-- Línea documentada: `copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },`.
      copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
-- Línea documentada: `copy_sha = { lhs = "<C-e>", desc = "copy commit SHA to system clipboard" },`.
      copy_sha = { lhs = "<C-e>", desc = "copy commit SHA to system clipboard" },
-- Línea documentada: `checkout_pr = { lhs = "<C-o>", desc = "checkout pull request" },`.
      checkout_pr = { lhs = "<C-o>", desc = "checkout pull request" },
-- Línea documentada: `merge_pr = { lhs = "<C-r>", desc = "merge pull request" },`.
      merge_pr = { lhs = "<C-r>", desc = "merge pull request" },
-- Línea documentada: `},`.
    },
-- Línea documentada: `snacks = {                                -- snacks specific config`.
    snacks = {                                -- snacks specific config
-- Línea documentada: `actions = {                             -- custom actions for specific snacks pickers (array of tables)`.
      actions = {                             -- custom actions for specific snacks pickers (array of tables)
-- Línea documentada: `issues = {                            -- actions for the issues picker`.
        issues = {                            -- actions for the issues picker
          -- { name = "my_issue_action", fn = function(picker, item) print("Issue action:", vim.inspect(item)) end, lhs = "<leader>a", desc = "My custom issue action" },
-- Línea documentada: `},`.
        },
-- Línea documentada: `pull_requests = {                     -- actions for the pull requests picker`.
        pull_requests = {                     -- actions for the pull requests picker
          -- { name = "my_pr_action", fn = function(picker, item) print("PR action:", vim.inspect(item)) end, lhs = "<leader>b", desc = "My custom PR action" },
-- Línea documentada: `},`.
        },
-- Línea documentada: `notifications = {},                   -- actions for the notifications picker`.
        notifications = {},                   -- actions for the notifications picker
-- Línea documentada: `issue_templates = {},                 -- actions for the issue templates picker`.
        issue_templates = {},                 -- actions for the issue templates picker
-- Línea documentada: `search = {},                          -- actions for the search picker`.
        search = {},                          -- actions for the search picker
        -- ... add actions for other pickers as needed
-- Línea documentada: `},`.
      },
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
-- Línea documentada: `comment_icon = "▎",                      -- comment marker`.
  comment_icon = "▎",                      -- comment marker
-- Línea documentada: `outdated_icon = "󰅒 ",                    -- outdated indicator`.
  outdated_icon = "󰅒 ",                    -- outdated indicator
-- Línea documentada: `resolved_icon = " ",                    -- resolved indicator`.
  resolved_icon = " ",                    -- resolved indicator
-- Línea documentada: `reaction_viewer_hint_icon = " ",        -- marker for user reactions`.
  reaction_viewer_hint_icon = " ",        -- marker for user reactions
-- Línea documentada: `commands = {},                           -- additional subcommands made available to `Octo` command`.
  commands = {},                           -- additional subcommands made available to `Octo` command
-- Línea documentada: `users = "search",                        -- Users for assignees or reviewers. Values: "search" | "mentionable" | "assignable"`.
  users = "search",                        -- Users for assignees or reviewers. Values: "search" | "mentionable" | "assignable"
-- Línea documentada: `user_icon = " ",                        -- user icon`.
  user_icon = " ",                        -- user icon
-- Línea documentada: `ghost_icon = "󰊠 ",                       -- ghost icon`.
  ghost_icon = "󰊠 ",                       -- ghost icon
-- Línea documentada: `timeline_marker = " ",                  -- timeline marker`.
  timeline_marker = " ",                  -- timeline marker
-- Línea documentada: `timeline_indent = 2,                   -- timeline indentation`.
  timeline_indent = 2,                   -- timeline indentation
-- Línea documentada: `use_timeline_icons = true,               -- toggle timeline icons`.
  use_timeline_icons = true,               -- toggle timeline icons
-- Línea documentada: `timeline_icons = {                       -- the default icons based on timelineItems`.
  timeline_icons = {                       -- the default icons based on timelineItems
-- Línea documentada: `commit = "  ",`.
    commit = "  ",
-- Línea documentada: `label = "  ",`.
    label = "  ",
-- Línea documentada: `reference = " ",`.
    reference = " ",
-- Línea documentada: `connected = "  ",`.
    connected = "  ",
-- Línea documentada: `subissue = "  ",`.
    subissue = "  ",
-- Línea documentada: `cross_reference = "  ",`.
    cross_reference = "  ",
-- Línea documentada: `parent_issue = "  ",`.
    parent_issue = "  ",
-- Línea documentada: `pinned = "  ",`.
    pinned = "  ",
-- Línea documentada: `milestone = "  ",`.
    milestone = "  ",
-- Línea documentada: `renamed = "  ",`.
    renamed = "  ",
-- Línea documentada: `merged = { "  ", "OctoPurple" },`.
    merged = { "  ", "OctoPurple" },
-- Línea documentada: `closed = {`.
    closed = {
-- Línea documentada: `closed = { "  ", "OctoRed" },`.
      closed = { "  ", "OctoRed" },
-- Línea documentada: `completed = { "  ", "OctoPurple" },`.
      completed = { "  ", "OctoPurple" },
-- Línea documentada: `not_planned = { "  ", "OctoGrey" },`.
      not_planned = { "  ", "OctoGrey" },
-- Línea documentada: `duplicate = { "  ", "OctoGrey" },`.
      duplicate = { "  ", "OctoGrey" },
-- Línea documentada: `},`.
    },
-- Línea documentada: `reopened = { "  ", "OctoGreen" },`.
    reopened = { "  ", "OctoGreen" },
-- Línea documentada: `assigned = "  ",`.
    assigned = "  ",
-- Línea documentada: `review_requested = "  ",`.
    review_requested = "  ",
-- Línea documentada: `},`.
  },
-- Línea documentada: `right_bubble_delimiter = "",            -- bubble delimiter`.
  right_bubble_delimiter = "",            -- bubble delimiter
-- Línea documentada: `left_bubble_delimiter = "",             -- bubble delimiter`.
  left_bubble_delimiter = "",             -- bubble delimiter
-- Línea documentada: `github_hostname = "",                    -- GitHub Enterprise host`.
  github_hostname = "",                    -- GitHub Enterprise host
-- Línea documentada: `snippet_context_lines = 4,               -- number or lines around commented lines`.
  snippet_context_lines = 4,               -- number or lines around commented lines
-- Línea documentada: `gh_cmd = "gh",                           -- Command to use when calling Github CLI`.
  gh_cmd = "gh",                           -- Command to use when calling Github CLI
-- Línea documentada: `gh_env = {},                             -- extra environment variables to pass on to GitHub CLI, can be a table or function returning a table`.
  gh_env = {},                             -- extra environment variables to pass on to GitHub CLI, can be a table or function returning a table
-- Línea documentada: `timeout = 5000,                          -- timeout for requests between the remote server`.
  timeout = 5000,                          -- timeout for requests between the remote server
-- Línea documentada: `default_to_projects_v2 = false,          -- use projects v2 for the `Octo card ...` command by default. Both legacy and v2 commands are available under `Octo cardlegacy ...` and `Octo cardv2 ...` respectively.`.
  default_to_projects_v2 = false,          -- use projects v2 for the `Octo card ...` command by default. Both legacy and v2 commands are available under `Octo cardlegacy ...` and `Octo cardv2 ...` respectively.
-- Línea documentada: `ui = {`.
  ui = {
-- Línea documentada: `use_signcolumn = false,                -- show "modified" marks on the sign column`.
    use_signcolumn = false,                -- show "modified" marks on the sign column
-- Línea documentada: `use_signstatus = true,                 -- show "modified" marks on the status column`.
    use_signstatus = true,                 -- show "modified" marks on the status column
-- Línea documentada: `},`.
  },
-- Línea documentada: `issues = {`.
  issues = {
-- Línea documentada: `order_by = {                           -- criteria to sort results of `Octo issue list``.
    order_by = {                           -- criteria to sort results of `Octo issue list`
-- Línea documentada: `field = "CREATED_AT",                -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)`.
      field = "CREATED_AT",                -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)
-- Línea documentada: `direction = "DESC"                   -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)`.
      direction = "DESC"                   -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
-- Línea documentada: `}`.
    }
-- Línea documentada: `},`.
  },
-- Línea documentada: `reviews = {`.
  reviews = {
-- Línea documentada: `auto_show_threads = true,              -- automatically show comment threads on cursor move`.
    auto_show_threads = true,              -- automatically show comment threads on cursor move
-- Línea documentada: `focus             = "right",           -- focus right buffer on diff open`.
    focus             = "right",           -- focus right buffer on diff open
-- Línea documentada: `},`.
  },
-- Línea documentada: `runs = {`.
  runs = {
-- Línea documentada: `icons = {`.
    icons = {
-- Línea documentada: `pending = "🕖",`.
      pending = "🕖",
-- Línea documentada: `in_progress = "🔄",`.
      in_progress = "🔄",
-- Línea documentada: `failed = "❌",`.
      failed = "❌",
-- Línea documentada: `succeeded = "",`.
      succeeded = "",
-- Línea documentada: `skipped = "⏩",`.
      skipped = "⏩",
-- Línea documentada: `cancelled = "✖",`.
      cancelled = "✖",
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
-- Línea documentada: `pull_requests = {`.
  pull_requests = {
-- Línea documentada: `order_by = {                            -- criteria to sort the results of `Octo pr list``.
    order_by = {                            -- criteria to sort the results of `Octo pr list`
-- Línea documentada: `field = "CREATED_AT",                 -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)`.
      field = "CREATED_AT",                 -- either COMMENTS, CREATED_AT or UPDATED_AT (https://docs.github.com/en/graphql/reference/enums#issueorderfield)
-- Línea documentada: `direction = "DESC"                    -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)`.
      direction = "DESC"                    -- either DESC or ASC (https://docs.github.com/en/graphql/reference/enums#orderdirection)
-- Línea documentada: `},`.
    },
-- Línea documentada: `always_select_remote_on_create = false, -- always give prompt to select base remote repo when creating PRs`.
    always_select_remote_on_create = false, -- always give prompt to select base remote repo when creating PRs
-- Línea documentada: `use_branch_name_as_title = false        -- sets branch name to be the name for the PR`.
    use_branch_name_as_title = false        -- sets branch name to be the name for the PR
-- Línea documentada: `},`.
  },
-- Línea documentada: `notifications = {`.
  notifications = {
-- Línea documentada: `current_repo_only = false,             -- show notifications for current repo only`.
    current_repo_only = false,             -- show notifications for current repo only
-- Línea documentada: `},`.
  },
-- Línea documentada: `file_panel = {`.
  file_panel = {
-- Línea documentada: `size = 10,                             -- changed files panel rows`.
    size = 10,                             -- changed files panel rows
    --ACTUALIZADO use_icons -> icons
-- Línea documentada: `icons = true                       -- use web-devicons in file panel (if false, nvim-web-devicons does not need to be installed)`.
    icons = true                       -- use web-devicons in file panel (if false, nvim-web-devicons does not need to be installed)
-- Línea documentada: `},`.
  },
-- Línea documentada: `colors = {                               -- used for highlight groups (see Colors section below)`.
  colors = {                               -- used for highlight groups (see Colors section below)
-- Línea documentada: `white = "#ffffff",`.
    white = "#ffffff",
-- Línea documentada: `grey = "#2A354C",`.
    grey = "#2A354C",
-- Línea documentada: `black = "#000000",`.
    black = "#000000",
-- Línea documentada: `red = "#fdb8c0",`.
    red = "#fdb8c0",
-- Línea documentada: `dark_red = "#da3633",`.
    dark_red = "#da3633",
-- Línea documentada: `green = "#acf2bd",`.
    green = "#acf2bd",
-- Línea documentada: `dark_green = "#238636",`.
    dark_green = "#238636",
-- Línea documentada: `yellow = "#d3c846",`.
    yellow = "#d3c846",
-- Línea documentada: `dark_yellow = "#735c0f",`.
    dark_yellow = "#735c0f",
-- Línea documentada: `blue = "#58A6FF",`.
    blue = "#58A6FF",
-- Línea documentada: `dark_blue = "#0366d6",`.
    dark_blue = "#0366d6",
-- Línea documentada: `purple = "#6f42c1",`.
    purple = "#6f42c1",
-- Línea documentada: `},`.
  },
-- Línea documentada: `mappings_disable_default = false,        -- disable default mappings if true, but will still adapt user mappings`.
  mappings_disable_default = false,        -- disable default mappings if true, but will still adapt user mappings
-- Línea documentada: `mappings = {`.
  mappings = {
-- Línea documentada: `runs = {`.
    runs = {
-- Línea documentada: `expand_step = { lhs = "o", desc = "expand workflow step" },`.
      expand_step = { lhs = "o", desc = "expand workflow step" },
-- Línea documentada: `open_in_browser = { lhs = "<C-b>", desc = "open workflow run in browser" },`.
      open_in_browser = { lhs = "<C-b>", desc = "open workflow run in browser" },
-- Línea documentada: `refresh = { lhs = "<C-r>", desc = "refresh workflow" },`.
      refresh = { lhs = "<C-r>", desc = "refresh workflow" },
-- Línea documentada: `rerun = { lhs = "<C-o>", desc = "rerun workflow" },`.
      rerun = { lhs = "<C-o>", desc = "rerun workflow" },
-- Línea documentada: `rerun_failed = { lhs = "<C-f>", desc = "rerun failed workflow" },`.
      rerun_failed = { lhs = "<C-f>", desc = "rerun failed workflow" },
-- Línea documentada: `cancel = { lhs = "<C-x>", desc = "cancel workflow" },`.
      cancel = { lhs = "<C-x>", desc = "cancel workflow" },
-- Línea documentada: `copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },`.
      copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
-- Línea documentada: `},`.
    },
-- Línea documentada: `issue = {`.
    issue = {
-- Línea documentada: `close_issue = { lhs = "<localleader>ic", desc = "close issue" },`.
      close_issue = { lhs = "<localleader>ic", desc = "close issue" },
-- Línea documentada: `reopen_issue = { lhs = "<localleader>io", desc = "reopen issue" },`.
      reopen_issue = { lhs = "<localleader>io", desc = "reopen issue" },
-- Línea documentada: `list_issues = { lhs = "<localleader>il", desc = "list open issues on same repo" },`.
      list_issues = { lhs = "<localleader>il", desc = "list open issues on same repo" },
-- Línea documentada: `reload = { lhs = "<C-r>", desc = "reload issue" },`.
      reload = { lhs = "<C-r>", desc = "reload issue" },
-- Línea documentada: `open_in_browser = { lhs = "<C-b>", desc = "open issue in browser" },`.
      open_in_browser = { lhs = "<C-b>", desc = "open issue in browser" },
-- Línea documentada: `copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },`.
      copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
-- Línea documentada: `add_assignee = { lhs = "<localleader>aa", desc = "add assignee" },`.
      add_assignee = { lhs = "<localleader>aa", desc = "add assignee" },
-- Línea documentada: `remove_assignee = { lhs = "<localleader>ad", desc = "remove assignee" },`.
      remove_assignee = { lhs = "<localleader>ad", desc = "remove assignee" },
-- Línea documentada: `create_label = { lhs = "<localleader>lc", desc = "create label" },`.
      create_label = { lhs = "<localleader>lc", desc = "create label" },
-- Línea documentada: `add_label = { lhs = "<localleader>la", desc = "add label" },`.
      add_label = { lhs = "<localleader>la", desc = "add label" },
-- Línea documentada: `remove_label = { lhs = "<localleader>ld", desc = "remove label" },`.
      remove_label = { lhs = "<localleader>ld", desc = "remove label" },
-- Línea documentada: `goto_issue = { lhs = "<localleader>gi", desc = "navigate to a local repo issue" },`.
      goto_issue = { lhs = "<localleader>gi", desc = "navigate to a local repo issue" },
-- Línea documentada: `add_comment = { lhs = "<localleader>ca", desc = "add comment" },`.
      add_comment = { lhs = "<localleader>ca", desc = "add comment" },
-- Línea documentada: `add_reply = { lhs = "<localleader>cr", desc = "add reply" },`.
      add_reply = { lhs = "<localleader>cr", desc = "add reply" },
-- Línea documentada: `delete_comment = { lhs = "<localleader>cd", desc = "delete comment" },`.
      delete_comment = { lhs = "<localleader>cd", desc = "delete comment" },
-- Línea documentada: `next_comment = { lhs = "]c", desc = "go to next comment" },`.
      next_comment = { lhs = "]c", desc = "go to next comment" },
-- Línea documentada: `prev_comment = { lhs = "[c", desc = "go to previous comment" },`.
      prev_comment = { lhs = "[c", desc = "go to previous comment" },
-- Línea documentada: `react_hooray = { lhs = "<localleader>rp", desc = "add/remove 🎉 reaction" },`.
      react_hooray = { lhs = "<localleader>rp", desc = "add/remove 🎉 reaction" },
-- Línea documentada: `react_heart = { lhs = "<localleader>rh", desc = "add/remove ❤️ reaction" },`.
      react_heart = { lhs = "<localleader>rh", desc = "add/remove ❤️ reaction" },
-- Línea documentada: `react_eyes = { lhs = "<localleader>re", desc = "add/remove 👀 reaction" },`.
      react_eyes = { lhs = "<localleader>re", desc = "add/remove 👀 reaction" },
-- Línea documentada: `react_thumbs_up = { lhs = "<localleader>r+", desc = "add/remove 👍 reaction" },`.
      react_thumbs_up = { lhs = "<localleader>r+", desc = "add/remove 👍 reaction" },
-- Línea documentada: `react_thumbs_down = { lhs = "<localleader>r-", desc = "add/remove 👎 reaction" },`.
      react_thumbs_down = { lhs = "<localleader>r-", desc = "add/remove 👎 reaction" },
-- Línea documentada: `react_rocket = { lhs = "<localleader>rr", desc = "add/remove 🚀 reaction" },`.
      react_rocket = { lhs = "<localleader>rr", desc = "add/remove 🚀 reaction" },
-- Línea documentada: `react_laugh = { lhs = "<localleader>rl", desc = "add/remove 😄 reaction" },`.
      react_laugh = { lhs = "<localleader>rl", desc = "add/remove 😄 reaction" },
-- Línea documentada: `react_confused = { lhs = "<localleader>rc", desc = "add/remove 😕 reaction" },`.
      react_confused = { lhs = "<localleader>rc", desc = "add/remove 😕 reaction" },
-- Línea documentada: `},`.
    },
-- Línea documentada: `pull_request = {`.
    pull_request = {
-- Línea documentada: `checkout_pr = { lhs = "<localleader>po", desc = "checkout PR" },`.
      checkout_pr = { lhs = "<localleader>po", desc = "checkout PR" },
-- Línea documentada: `merge_pr = { lhs = "<localleader>pm", desc = "merge commit PR" },`.
      merge_pr = { lhs = "<localleader>pm", desc = "merge commit PR" },
-- Línea documentada: `squash_and_merge_pr = { lhs = "<localleader>psm", desc = "squash and merge PR" },`.
      squash_and_merge_pr = { lhs = "<localleader>psm", desc = "squash and merge PR" },
-- Línea documentada: `rebase_and_merge_pr = { lhs = "<localleader>prm", desc = "rebase and merge PR" },`.
      rebase_and_merge_pr = { lhs = "<localleader>prm", desc = "rebase and merge PR" },
-- Línea documentada: `merge_pr_queue = { lhs = "<localleader>pq", desc = "merge commit PR and add to merge queue (Merge queue must be enabled in the repo)" },`.
      merge_pr_queue = { lhs = "<localleader>pq", desc = "merge commit PR and add to merge queue (Merge queue must be enabled in the repo)" },
-- Línea documentada: `squash_and_merge_queue = { lhs = "<localleader>psq", desc = "squash and add to merge queue (Merge queue must be enabled in the repo)" },`.
      squash_and_merge_queue = { lhs = "<localleader>psq", desc = "squash and add to merge queue (Merge queue must be enabled in the repo)" },
-- Línea documentada: `rebase_and_merge_queue = { lhs = "<localleader>prq", desc = "rebase and add to merge queue (Merge queue must be enabled in the repo)" },`.
      rebase_and_merge_queue = { lhs = "<localleader>prq", desc = "rebase and add to merge queue (Merge queue must be enabled in the repo)" },
-- Línea documentada: `list_commits = { lhs = "<localleader>pc", desc = "list PR commits" },`.
      list_commits = { lhs = "<localleader>pc", desc = "list PR commits" },
-- Línea documentada: `list_changed_files = { lhs = "<localleader>pf", desc = "list PR changed files" },`.
      list_changed_files = { lhs = "<localleader>pf", desc = "list PR changed files" },
-- Línea documentada: `show_pr_diff = { lhs = "<localleader>pd", desc = "show PR diff" },`.
      show_pr_diff = { lhs = "<localleader>pd", desc = "show PR diff" },
-- Línea documentada: `add_reviewer = { lhs = "<localleader>va", desc = "add reviewer" },`.
      add_reviewer = { lhs = "<localleader>va", desc = "add reviewer" },
-- Línea documentada: `remove_reviewer = { lhs = "<localleader>vd", desc = "remove reviewer request" },`.
      remove_reviewer = { lhs = "<localleader>vd", desc = "remove reviewer request" },
-- Línea documentada: `close_issue = { lhs = "<localleader>ic", desc = "close PR" },`.
      close_issue = { lhs = "<localleader>ic", desc = "close PR" },
-- Línea documentada: `reopen_issue = { lhs = "<localleader>io", desc = "reopen PR" },`.
      reopen_issue = { lhs = "<localleader>io", desc = "reopen PR" },
-- Línea documentada: `list_issues = { lhs = "<localleader>il", desc = "list open issues on same repo" },`.
      list_issues = { lhs = "<localleader>il", desc = "list open issues on same repo" },
-- Línea documentada: `reload = { lhs = "<C-r>", desc = "reload PR" },`.
      reload = { lhs = "<C-r>", desc = "reload PR" },
-- Línea documentada: `open_in_browser = { lhs = "<C-b>", desc = "open PR in browser" },`.
      open_in_browser = { lhs = "<C-b>", desc = "open PR in browser" },
-- Línea documentada: `copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },`.
      copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
-- Línea documentada: `goto_file = { lhs = "gf", desc = "go to file" },`.
      goto_file = { lhs = "gf", desc = "go to file" },
-- Línea documentada: `add_assignee = { lhs = "<localleader>aa", desc = "add assignee" },`.
      add_assignee = { lhs = "<localleader>aa", desc = "add assignee" },
-- Línea documentada: `remove_assignee = { lhs = "<localleader>ad", desc = "remove assignee" },`.
      remove_assignee = { lhs = "<localleader>ad", desc = "remove assignee" },
-- Línea documentada: `create_label = { lhs = "<localleader>lc", desc = "create label" },`.
      create_label = { lhs = "<localleader>lc", desc = "create label" },
-- Línea documentada: `add_label = { lhs = "<localleader>la", desc = "add label" },`.
      add_label = { lhs = "<localleader>la", desc = "add label" },
-- Línea documentada: `remove_label = { lhs = "<localleader>ld", desc = "remove label" },`.
      remove_label = { lhs = "<localleader>ld", desc = "remove label" },
-- Línea documentada: `goto_issue = { lhs = "<localleader>gi", desc = "navigate to a local repo issue" },`.
      goto_issue = { lhs = "<localleader>gi", desc = "navigate to a local repo issue" },
-- Línea documentada: `add_comment = { lhs = "<localleader>ca", desc = "add comment" },`.
      add_comment = { lhs = "<localleader>ca", desc = "add comment" },
-- Línea documentada: `add_reply = { lhs = "<localleader>cr", desc = "add reply" },`.
      add_reply = { lhs = "<localleader>cr", desc = "add reply" },
-- Línea documentada: `delete_comment = { lhs = "<localleader>cd", desc = "delete comment" },`.
      delete_comment = { lhs = "<localleader>cd", desc = "delete comment" },
-- Línea documentada: `next_comment = { lhs = "]c", desc = "go to next comment" },`.
      next_comment = { lhs = "]c", desc = "go to next comment" },
-- Línea documentada: `prev_comment = { lhs = "[c", desc = "go to previous comment" },`.
      prev_comment = { lhs = "[c", desc = "go to previous comment" },
-- Línea documentada: `react_hooray = { lhs = "<localleader>rp", desc = "add/remove 🎉 reaction" },`.
      react_hooray = { lhs = "<localleader>rp", desc = "add/remove 🎉 reaction" },
-- Línea documentada: `react_heart = { lhs = "<localleader>rh", desc = "add/remove ❤️ reaction" },`.
      react_heart = { lhs = "<localleader>rh", desc = "add/remove ❤️ reaction" },
-- Línea documentada: `react_eyes = { lhs = "<localleader>re", desc = "add/remove 👀 reaction" },`.
      react_eyes = { lhs = "<localleader>re", desc = "add/remove 👀 reaction" },
-- Línea documentada: `react_thumbs_up = { lhs = "<localleader>r+", desc = "add/remove 👍 reaction" },`.
      react_thumbs_up = { lhs = "<localleader>r+", desc = "add/remove 👍 reaction" },
-- Línea documentada: `react_thumbs_down = { lhs = "<localleader>r-", desc = "add/remove 👎 reaction" },`.
      react_thumbs_down = { lhs = "<localleader>r-", desc = "add/remove 👎 reaction" },
-- Línea documentada: `react_rocket = { lhs = "<localleader>rr", desc = "add/remove 🚀 reaction" },`.
      react_rocket = { lhs = "<localleader>rr", desc = "add/remove 🚀 reaction" },
-- Línea documentada: `react_laugh = { lhs = "<localleader>rl", desc = "add/remove 😄 reaction" },`.
      react_laugh = { lhs = "<localleader>rl", desc = "add/remove 😄 reaction" },
-- Línea documentada: `react_confused = { lhs = "<localleader>rc", desc = "add/remove 😕 reaction" },`.
      react_confused = { lhs = "<localleader>rc", desc = "add/remove 😕 reaction" },
-- Línea documentada: `review_start = { lhs = "<localleader>vs", desc = "start a review for the current PR" },`.
      review_start = { lhs = "<localleader>vs", desc = "start a review for the current PR" },
-- Línea documentada: `review_resume = { lhs = "<localleader>vr", desc = "resume a pending review for the current PR" },`.
      review_resume = { lhs = "<localleader>vr", desc = "resume a pending review for the current PR" },
-- Línea documentada: `resolve_thread = { lhs = "<localleader>rt", desc = "resolve PR thread" },`.
      resolve_thread = { lhs = "<localleader>rt", desc = "resolve PR thread" },
-- Línea documentada: `unresolve_thread = { lhs = "<localleader>rT", desc = "unresolve PR thread" },`.
      unresolve_thread = { lhs = "<localleader>rT", desc = "unresolve PR thread" },
-- Línea documentada: `},`.
    },
-- Línea documentada: `review_thread = {`.
    review_thread = {
-- Línea documentada: `goto_issue = { lhs = "<localleader>gi", desc = "navigate to a local repo issue" },`.
      goto_issue = { lhs = "<localleader>gi", desc = "navigate to a local repo issue" },
-- Línea documentada: `add_comment = { lhs = "<localleader>ca", desc = "add comment" },`.
      add_comment = { lhs = "<localleader>ca", desc = "add comment" },
-- Línea documentada: `add_reply = { lhs = "<localleader>cr", desc = "add reply" },`.
      add_reply = { lhs = "<localleader>cr", desc = "add reply" },
-- Línea documentada: `add_suggestion = { lhs = "<localleader>sa", desc = "add suggestion" },`.
      add_suggestion = { lhs = "<localleader>sa", desc = "add suggestion" },
-- Línea documentada: `delete_comment = { lhs = "<localleader>cd", desc = "delete comment" },`.
      delete_comment = { lhs = "<localleader>cd", desc = "delete comment" },
-- Línea documentada: `next_comment = { lhs = "]c", desc = "go to next comment" },`.
      next_comment = { lhs = "]c", desc = "go to next comment" },
-- Línea documentada: `prev_comment = { lhs = "[c", desc = "go to previous comment" },`.
      prev_comment = { lhs = "[c", desc = "go to previous comment" },
-- Línea documentada: `select_next_entry = { lhs = "]q", desc = "move to next changed file" },`.
      select_next_entry = { lhs = "]q", desc = "move to next changed file" },
-- Línea documentada: `select_prev_entry = { lhs = "[q", desc = "move to previous changed file" },`.
      select_prev_entry = { lhs = "[q", desc = "move to previous changed file" },
-- Línea documentada: `select_first_entry = { lhs = "[Q", desc = "move to first changed file" },`.
      select_first_entry = { lhs = "[Q", desc = "move to first changed file" },
-- Línea documentada: `select_last_entry = { lhs = "]Q", desc = "move to last changed file" },`.
      select_last_entry = { lhs = "]Q", desc = "move to last changed file" },
-- Línea documentada: `select_next_unviewed_entry = { lhs = "]u", desc = "move to next unviewed changed file" },`.
      select_next_unviewed_entry = { lhs = "]u", desc = "move to next unviewed changed file" },
-- Línea documentada: `select_prev_unviewed_entry = { lhs = "[u", desc = "move to previous unviewed changed file" },`.
      select_prev_unviewed_entry = { lhs = "[u", desc = "move to previous unviewed changed file" },
-- Línea documentada: `close_review_tab = { lhs = "<C-c>", desc = "close review tab" },`.
      close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
-- Línea documentada: `react_hooray = { lhs = "<localleader>rp", desc = "add/remove 🎉 reaction" },`.
      react_hooray = { lhs = "<localleader>rp", desc = "add/remove 🎉 reaction" },
-- Línea documentada: `react_heart = { lhs = "<localleader>rh", desc = "add/remove ❤️ reaction" },`.
      react_heart = { lhs = "<localleader>rh", desc = "add/remove ❤️ reaction" },
-- Línea documentada: `react_eyes = { lhs = "<localleader>re", desc = "add/remove 👀 reaction" },`.
      react_eyes = { lhs = "<localleader>re", desc = "add/remove 👀 reaction" },
-- Línea documentada: `react_thumbs_up = { lhs = "<localleader>r+", desc = "add/remove 👍 reaction" },`.
      react_thumbs_up = { lhs = "<localleader>r+", desc = "add/remove 👍 reaction" },
-- Línea documentada: `react_thumbs_down = { lhs = "<localleader>r-", desc = "add/remove 👎 reaction" },`.
      react_thumbs_down = { lhs = "<localleader>r-", desc = "add/remove 👎 reaction" },
-- Línea documentada: `react_rocket = { lhs = "<localleader>rr", desc = "add/remove 🚀 reaction" },`.
      react_rocket = { lhs = "<localleader>rr", desc = "add/remove 🚀 reaction" },
-- Línea documentada: `react_laugh = { lhs = "<localleader>rl", desc = "add/remove 😄 reaction" },`.
      react_laugh = { lhs = "<localleader>rl", desc = "add/remove 😄 reaction" },
-- Línea documentada: `react_confused = { lhs = "<localleader>rc", desc = "add/remove 😕 reaction" },`.
      react_confused = { lhs = "<localleader>rc", desc = "add/remove 😕 reaction" },
-- Línea documentada: `resolve_thread = { lhs = "<localleader>rt", desc = "resolve PR thread" },`.
      resolve_thread = { lhs = "<localleader>rt", desc = "resolve PR thread" },
-- Línea documentada: `unresolve_thread = { lhs = "<localleader>rT", desc = "unresolve PR thread" },`.
      unresolve_thread = { lhs = "<localleader>rT", desc = "unresolve PR thread" },
-- Línea documentada: `},`.
    },
-- Línea documentada: `submit_win = {`.
    submit_win = {
-- Línea documentada: `approve_review = { lhs = "<C-a>", desc = "approve review", mode = { "n", "i" } },`.
      approve_review = { lhs = "<C-a>", desc = "approve review", mode = { "n", "i" } },
-- Línea documentada: `comment_review = { lhs = "<C-m>", desc = "comment review", mode = { "n", "i" } },`.
      comment_review = { lhs = "<C-m>", desc = "comment review", mode = { "n", "i" } },
-- Línea documentada: `request_changes = { lhs = "<C-r>", desc = "request changes review", mode = { "n", "i" } },`.
      request_changes = { lhs = "<C-r>", desc = "request changes review", mode = { "n", "i" } },
-- Línea documentada: `close_review_tab = { lhs = "<C-c>", desc = "close review tab", mode = { "n", "i" } },`.
      close_review_tab = { lhs = "<C-c>", desc = "close review tab", mode = { "n", "i" } },
-- Línea documentada: `},`.
    },
-- Línea documentada: `review_diff = {`.
    review_diff = {
-- Línea documentada: `submit_review = { lhs = "<localleader>vs", desc = "submit review" },`.
      submit_review = { lhs = "<localleader>vs", desc = "submit review" },
-- Línea documentada: `discard_review = { lhs = "<localleader>vd", desc = "discard review" },`.
      discard_review = { lhs = "<localleader>vd", desc = "discard review" },
-- Línea documentada: `add_review_comment = { lhs = "<localleader>ca", desc = "add a new review comment", mode = { "n", "x" } },`.
      add_review_comment = { lhs = "<localleader>ca", desc = "add a new review comment", mode = { "n", "x" } },
-- Línea documentada: `add_review_suggestion = { lhs = "<localleader>sa", desc = "add a new review suggestion", mode = { "n", "x" } },`.
      add_review_suggestion = { lhs = "<localleader>sa", desc = "add a new review suggestion", mode = { "n", "x" } },
-- Línea documentada: `focus_files = { lhs = "<localleader>e", desc = "move focus to changed file panel" },`.
      focus_files = { lhs = "<localleader>e", desc = "move focus to changed file panel" },
-- Línea documentada: `toggle_files = { lhs = "<localleader>b", desc = "hide/show changed files panel" },`.
      toggle_files = { lhs = "<localleader>b", desc = "hide/show changed files panel" },
-- Línea documentada: `next_thread = { lhs = "]t", desc = "move to next thread" },`.
      next_thread = { lhs = "]t", desc = "move to next thread" },
-- Línea documentada: `prev_thread = { lhs = "[t", desc = "move to previous thread" },`.
      prev_thread = { lhs = "[t", desc = "move to previous thread" },
-- Línea documentada: `select_next_entry = { lhs = "]q", desc = "move to next changed file" },`.
      select_next_entry = { lhs = "]q", desc = "move to next changed file" },
-- Línea documentada: `select_prev_entry = { lhs = "[q", desc = "move to previous changed file" },`.
      select_prev_entry = { lhs = "[q", desc = "move to previous changed file" },
-- Línea documentada: `select_first_entry = { lhs = "[Q", desc = "move to first changed file" },`.
      select_first_entry = { lhs = "[Q", desc = "move to first changed file" },
-- Línea documentada: `select_last_entry = { lhs = "]Q", desc = "move to last changed file" },`.
      select_last_entry = { lhs = "]Q", desc = "move to last changed file" },
-- Línea documentada: `select_next_unviewed_entry = { lhs = "]u", desc = "move to next unviewed changed file" },`.
      select_next_unviewed_entry = { lhs = "]u", desc = "move to next unviewed changed file" },
-- Línea documentada: `select_prev_unviewed_entry = { lhs = "[u", desc = "move to previous unviewed changed file" },`.
      select_prev_unviewed_entry = { lhs = "[u", desc = "move to previous unviewed changed file" },
-- Línea documentada: `close_review_tab = { lhs = "<C-c>", desc = "close review tab" },`.
      close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
-- Línea documentada: `toggle_viewed = { lhs = "<localleader><space>", desc = "toggle viewer viewed state" },`.
      toggle_viewed = { lhs = "<localleader><space>", desc = "toggle viewer viewed state" },
-- Línea documentada: `goto_file = { lhs = "gf", desc = "go to file" },`.
      goto_file = { lhs = "gf", desc = "go to file" },
-- Línea documentada: `},`.
    },
-- Línea documentada: `file_panel = {`.
    file_panel = {
-- Línea documentada: `submit_review = { lhs = "<localleader>vs", desc = "submit review" },`.
      submit_review = { lhs = "<localleader>vs", desc = "submit review" },
-- Línea documentada: `discard_review = { lhs = "<localleader>vd", desc = "discard review" },`.
      discard_review = { lhs = "<localleader>vd", desc = "discard review" },
-- Línea documentada: `next_entry = { lhs = "j", desc = "move to next changed file" },`.
      next_entry = { lhs = "j", desc = "move to next changed file" },
-- Línea documentada: `prev_entry = { lhs = "k", desc = "move to previous changed file" },`.
      prev_entry = { lhs = "k", desc = "move to previous changed file" },
-- Línea documentada: `select_entry = { lhs = "<cr>", desc = "show selected changed file diffs" },`.
      select_entry = { lhs = "<cr>", desc = "show selected changed file diffs" },
-- Línea documentada: `refresh_files = { lhs = "R", desc = "refresh changed files panel" },`.
      refresh_files = { lhs = "R", desc = "refresh changed files panel" },
-- Línea documentada: `focus_files = { lhs = "<localleader>e", desc = "move focus to changed file panel" },`.
      focus_files = { lhs = "<localleader>e", desc = "move focus to changed file panel" },
-- Línea documentada: `toggle_files = { lhs = "<localleader>b", desc = "hide/show changed files panel" },`.
      toggle_files = { lhs = "<localleader>b", desc = "hide/show changed files panel" },
-- Línea documentada: `select_next_entry = { lhs = "]q", desc = "move to next changed file" },`.
      select_next_entry = { lhs = "]q", desc = "move to next changed file" },
-- Línea documentada: `select_prev_entry = { lhs = "[q", desc = "move to previous changed file" },`.
      select_prev_entry = { lhs = "[q", desc = "move to previous changed file" },
-- Línea documentada: `select_first_entry = { lhs = "[Q", desc = "move to first changed file" },`.
      select_first_entry = { lhs = "[Q", desc = "move to first changed file" },
-- Línea documentada: `select_last_entry = { lhs = "]Q", desc = "move to last changed file" },`.
      select_last_entry = { lhs = "]Q", desc = "move to last changed file" },
-- Línea documentada: `select_next_unviewed_entry = { lhs = "]u", desc = "move to next unviewed changed file" },`.
      select_next_unviewed_entry = { lhs = "]u", desc = "move to next unviewed changed file" },
-- Línea documentada: `select_prev_unviewed_entry = { lhs = "[u", desc = "move to previous unviewed changed file" },`.
      select_prev_unviewed_entry = { lhs = "[u", desc = "move to previous unviewed changed file" },
-- Línea documentada: `close_review_tab = { lhs = "<C-c>", desc = "close review tab" },`.
      close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
-- Línea documentada: `toggle_viewed = { lhs = "<localleader><space>", desc = "toggle viewer viewed state" },`.
      toggle_viewed = { lhs = "<localleader><space>", desc = "toggle viewer viewed state" },
-- Línea documentada: `},`.
    },
-- Línea documentada: `notification = {`.
    notification = {
-- Línea documentada: `read = { lhs = "<localleader>nr", desc = "mark notification as read" },`.
      read = { lhs = "<localleader>nr", desc = "mark notification as read" },
-- Línea documentada: `done = { lhs = "<localleader>nd", desc = "mark notification as done" },`.
      done = { lhs = "<localleader>nd", desc = "mark notification as done" },
-- Línea documentada: `unsubscribe = { lhs = "<localleader>nu", desc = "unsubscribe from notifications" },`.
      unsubscribe = { lhs = "<localleader>nu", desc = "unsubscribe from notifications" },
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
-- Línea documentada: `})`.
})
