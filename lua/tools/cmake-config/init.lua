-- Documentación: módulo `lua/tools/cmake-config/init.lua`.
-- Propósito: define utilidades y herramientas de edición dentro de BlindNvim sin alterar lógica de ejecución.

-- Línea documentada: `require("cmake-tools").setup {`.
require("cmake-tools").setup {
-- Línea documentada: `cmake_command = "cmake", -- this is used to specify cmake command path`.
  cmake_command = "cmake", -- this is used to specify cmake command path
-- Línea documentada: `ctest_command = "ctest", -- this is used to specify ctest command path`.
  ctest_command = "ctest", -- this is used to specify ctest command path
-- Línea documentada: `cmake_regenerate_on_save = true, -- auto generate when save CMakeLists.txt`.
  cmake_regenerate_on_save = true, -- auto generate when save CMakeLists.txt
-- Línea documentada: `cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- this will be passed when invoke `CMakeGenerate``.
  cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- this will be passed when invoke `CMakeGenerate`
-- Línea documentada: `cmake_build_options = {}, -- this will be passed when invoke `CMakeBuild``.
  cmake_build_options = {}, -- this will be passed when invoke `CMakeBuild`
  -- support macro expansion:
  --       ${kit}
  --       ${kitGenerator}
  --       ${variant:xx}
-- Línea documentada: `cmake_build_directory = "out/${variant:buildType}", -- this is used to specify generate directory for cmake, allows macro expansion, relative to vim.loop.cwd()`.
  cmake_build_directory = "out/${variant:buildType}", -- this is used to specify generate directory for cmake, allows macro expansion, relative to vim.loop.cwd()
-- Línea documentada: `cmake_soft_link_compile_commands = true, -- this will automatically make a soft link from compile commands file to project root dir`.
  cmake_soft_link_compile_commands = true, -- this will automatically make a soft link from compile commands file to project root dir
-- Línea documentada: `cmake_compile_commands_from_lsp = false, -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false`.
  cmake_compile_commands_from_lsp = false, -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
-- Línea documentada: `cmake_kits_path = nil, -- this is used to specify global cmake kits path, see CMakeKits for detailed usage`.
  cmake_kits_path = nil, -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
-- Línea documentada: `cmake_variants_message = {`.
  cmake_variants_message = {
-- Línea documentada: `short = { show = true }, -- whether to show short message`.
    short = { show = true }, -- whether to show short message
-- Línea documentada: `long = { show = true, max_length = 40 }, -- whether to show long message`.
    long = { show = true, max_length = 40 }, -- whether to show long message
-- Línea documentada: `},`.
  },
-- Línea documentada: `cmake_dap_configuration = { -- debug settings for cmake`.
  cmake_dap_configuration = { -- debug settings for cmake
-- Línea documentada: `name = "cpp",`.
    name = "cpp",
-- Línea documentada: `type = "codelldb",`.
    type = "codelldb",
-- Línea documentada: `request = "launch",`.
    request = "launch",
-- Línea documentada: `stopOnEntry = false,`.
    stopOnEntry = false,
-- Línea documentada: `runInTerminal = true,`.
    runInTerminal = true,
-- Línea documentada: `console = "integratedTerminal",`.
    console = "integratedTerminal",
-- Línea documentada: `},`.
  },
-- Línea documentada: `cmake_executor = { -- executor to use`.
  cmake_executor = { -- executor to use
-- Línea documentada: `name = "quickfix", -- name of the executor`.
    name = "quickfix", -- name of the executor
-- Línea documentada: `opts = {}, -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.`.
    opts = {}, -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
-- Línea documentada: `default_opts = { -- a list of default and possible values for executors`.
    default_opts = { -- a list of default and possible values for executors
-- Línea documentada: `quickfix = {`.
      quickfix = {
-- Línea documentada: `show = "always", -- "always", "only_on_error"`.
        show = "always", -- "always", "only_on_error"
-- Línea documentada: `position = "belowright", -- "vertical", "horizontal", "leftabove", "aboveleft", "rightbelow", "belowright", "topleft", "botright", use `:h vertical` for example to see help on them`.
        position = "belowright", -- "vertical", "horizontal", "leftabove", "aboveleft", "rightbelow", "belowright", "topleft", "botright", use `:h vertical` for example to see help on them
-- Línea documentada: `size = 10,`.
        size = 10,
-- Línea documentada: `encoding = "utf-8", -- if encoding is not "utf-8", it will be converted to "utf-8" using `vim.fn.iconv``.
        encoding = "utf-8", -- if encoding is not "utf-8", it will be converted to "utf-8" using `vim.fn.iconv`
-- Línea documentada: `auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.`.
        auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
-- Línea documentada: `},`.
      },
-- Línea documentada: `toggleterm = {`.
      toggleterm = {
-- Línea documentada: `direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'`.
        direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
-- Línea documentada: `close_on_exit = false, -- whether close the terminal when exit`.
        close_on_exit = false, -- whether close the terminal when exit
-- Línea documentada: `auto_scroll = true, -- whether auto scroll to the bottom`.
        auto_scroll = true, -- whether auto scroll to the bottom
-- Línea documentada: `},`.
      },
-- Línea documentada: `overseer = {`.
      overseer = {
-- Línea documentada: `new_task_opts = {`.
        new_task_opts = {
-- Línea documentada: `strategy = {`.
            strategy = {
-- Línea documentada: `"toggleterm",`.
                "toggleterm",
-- Línea documentada: `direction = "horizontal",`.
                direction = "horizontal",
-- Línea documentada: `autos_croll = true,`.
                autos_croll = true,
-- Línea documentada: `quit_on_exit = "success"`.
                quit_on_exit = "success"
-- Línea documentada: `}`.
            }
-- Línea documentada: `}, -- options to pass into the `overseer.new_task` command`.
        }, -- options to pass into the `overseer.new_task` command
-- Línea documentada: `on_new_task = function(task)`.
        on_new_task = function(task)
-- Línea documentada: `require("overseer").open(`.
            require("overseer").open(
-- Línea documentada: `{ enter = false, direction = "right" }`.
                { enter = false, direction = "right" }
-- Línea documentada: `)`.
            )
-- Línea documentada: `end,   -- a function that gets overseer.Task when it is created, before calling `task:start``.
        end,   -- a function that gets overseer.Task when it is created, before calling `task:start`
-- Línea documentada: `},`.
      },
-- Línea documentada: `terminal = {`.
      terminal = {
-- Línea documentada: `name = "Main Terminal",`.
        name = "Main Terminal",
-- Línea documentada: `prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name`.
        prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
-- Línea documentada: `split_direction = "horizontal", -- "horizontal", "vertical"`.
        split_direction = "horizontal", -- "horizontal", "vertical"
-- Línea documentada: `split_size = 11,`.
        split_size = 11,

        -- Window handling
-- Línea documentada: `single_terminal_per_instance = true, -- Single viewport, multiple windows`.
        single_terminal_per_instance = true, -- Single viewport, multiple windows
-- Línea documentada: `single_terminal_per_tab = true, -- Single viewport per tab`.
        single_terminal_per_tab = true, -- Single viewport per tab
-- Línea documentada: `keep_terminal_static_location = true, -- Static location of the viewport if avialable`.
        keep_terminal_static_location = true, -- Static location of the viewport if avialable

        -- Running Tasks
-- Línea documentada: `start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun`.
        start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
-- Línea documentada: `focus = false, -- Focus on terminal when cmake task is launched.`.
        focus = false, -- Focus on terminal when cmake task is launched.
-- Línea documentada: `do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.`.
        do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
-- Línea documentada: `}, -- terminal executor uses the values in cmake_terminal`.
      }, -- terminal executor uses the values in cmake_terminal
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
-- Línea documentada: `cmake_runner = { -- runner to use`.
  cmake_runner = { -- runner to use
-- Línea documentada: `name = "terminal", -- name of the runner`.
    name = "terminal", -- name of the runner
-- Línea documentada: `opts = {}, -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.`.
    opts = {}, -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
-- Línea documentada: `default_opts = { -- a list of default and possible values for runners`.
    default_opts = { -- a list of default and possible values for runners
-- Línea documentada: `quickfix = {`.
      quickfix = {
-- Línea documentada: `show = "always", -- "always", "only_on_error"`.
        show = "always", -- "always", "only_on_error"
-- Línea documentada: `position = "belowright", -- "bottom", "top"`.
        position = "belowright", -- "bottom", "top"
-- Línea documentada: `size = 10,`.
        size = 10,
-- Línea documentada: `encoding = "utf-8",`.
        encoding = "utf-8",
-- Línea documentada: `auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.`.
        auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
-- Línea documentada: `},`.
      },
-- Línea documentada: `toggleterm = {`.
      toggleterm = {
-- Línea documentada: `direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'`.
        direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
-- Línea documentada: `close_on_exit = false, -- whether close the terminal when exit`.
        close_on_exit = false, -- whether close the terminal when exit
-- Línea documentada: `auto_scroll = true, -- whether auto scroll to the bottom`.
        auto_scroll = true, -- whether auto scroll to the bottom
-- Línea documentada: `},`.
      },
-- Línea documentada: `overseer = {`.
      overseer = {
-- Línea documentada: `new_task_opts = {`.
        new_task_opts = {
-- Línea documentada: `strategy = {`.
            strategy = {
-- Línea documentada: `"toggleterm",`.
                "toggleterm",
-- Línea documentada: `direction = "horizontal",`.
                direction = "horizontal",
-- Línea documentada: `autos_croll = true,`.
                autos_croll = true,
-- Línea documentada: `quit_on_exit = "success"`.
                quit_on_exit = "success"
-- Línea documentada: `}`.
            }
-- Línea documentada: `}, -- options to pass into the `overseer.new_task` command`.
        }, -- options to pass into the `overseer.new_task` command
-- Línea documentada: `on_new_task = function(task)`.
        on_new_task = function(task)
-- Línea documentada: `end,   -- a function that gets overseer.Task when it is created, before calling `task:start``.
        end,   -- a function that gets overseer.Task when it is created, before calling `task:start`
-- Línea documentada: `},`.
      },
-- Línea documentada: `terminal = {`.
      terminal = {
-- Línea documentada: `name = "Main Terminal",`.
        name = "Main Terminal",
-- Línea documentada: `prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name`.
        prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
-- Línea documentada: `split_direction = "horizontal", -- "horizontal", "vertical"`.
        split_direction = "horizontal", -- "horizontal", "vertical"
-- Línea documentada: `split_size = 11,`.
        split_size = 11,

        -- Window handling
-- Línea documentada: `single_terminal_per_instance = true, -- Single viewport, multiple windows`.
        single_terminal_per_instance = true, -- Single viewport, multiple windows
-- Línea documentada: `single_terminal_per_tab = true, -- Single viewport per tab`.
        single_terminal_per_tab = true, -- Single viewport per tab
-- Línea documentada: `keep_terminal_static_location = true, -- Static location of the viewport if avialable`.
        keep_terminal_static_location = true, -- Static location of the viewport if avialable

        -- Running Tasks
-- Línea documentada: `start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun`.
        start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
-- Línea documentada: `focus = false, -- Focus on terminal when cmake task is launched.`.
        focus = false, -- Focus on terminal when cmake task is launched.
-- Línea documentada: `do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.`.
        do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
-- Línea documentada: `},`.
      },
-- Línea documentada: `},`.
    },
-- Línea documentada: `},`.
  },
-- Línea documentada: `cmake_notifications = {`.
  cmake_notifications = {
-- Línea documentada: `runner = { enabled = true },`.
    runner = { enabled = true },
-- Línea documentada: `executor = { enabled = true },`.
    executor = { enabled = true },
-- Línea documentada: `spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display`.
    spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
-- Línea documentada: `refresh_rate_ms = 100, -- how often to iterate icons`.
    refresh_rate_ms = 100, -- how often to iterate icons
-- Línea documentada: `},`.
  },
-- Línea documentada: `}`.
}
