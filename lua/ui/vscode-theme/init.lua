-- Documentación: módulo `lua/ui/vscode-theme/init.lua`.
-- Propósito: define componentes de interfaz de usuario dentro de BlindNvim sin alterar lógica de ejecución.

-- Lua:
-- For dark theme (neovim's default)
vim.o.background = "dark"
-- For light theme
-- vim.o.background = 'light'

if vim.g.visual_impairing then
	-- In braille mode, use a monochrome theme with flatter styling and
	-- neutral UI highlights to keep the screen quieter for assistive tools.
	require("github-monochrome").load({
		style = "dark",
		transparent = false,
		terminal_colors = false,
		lualine_bold = { a = false, b = false, c = false },
		styles = {
			comments = { italic = false },
			keywords = { bold = false },
			functions = { bold = false },
			statements = { bold = false },
			conditionals = { bold = false },
			loops = { bold = false },
			variables = {},
			floats = "normal",
			sidebars = "normal",
		},
		on_colors = function(c, _)
			c.number = c.text_muted
		end,
		on_highlights = function(hl, c)
			local normal = { fg = c.fg, bg = c.bg, bold = false, italic = false }
			local muted = { fg = c.fg_dark, bg = c.bg, bold = false, italic = false }

			hl.Cursor = { fg = c.bg, bg = c.fg, bold = false }
			hl.LineNr = muted
			hl.CursorLineNr = { fg = c.fg, bold = false }
			hl.Visual = { bg = c.bg_highlight }
			hl.StatusLine = normal
			hl.StatusLineNC = muted
			hl.NormalFloat = normal
			hl.FloatBorder = muted
			hl.SignColumn = { bg = c.bg }
			hl.WinSeparator = muted
			hl.VertSplit = muted
			hl.FoldColumn = muted
			hl.MatchParen = { fg = c.fg, bg = c.bg_highlight, bold = false }
			hl.TreesitterContext = { bg = c.bg }
			hl.TreesitterContextBottom = { bg = c.bg, underline = false }
			hl.IblScope = { fg = c.fg_dark }

			hl.Pmenu = normal
			hl.PmenuSel = { fg = c.fg, bg = c.bg_highlight, bold = false }
			hl.PmenuSbar = { bg = c.bg_highlight }
			hl.PmenuThumb = { bg = c.fg_dark }

			hl.TelescopeNormal = normal
			hl.TelescopeBorder = muted
			hl.TelescopePromptNormal = normal
			hl.TelescopePromptBorder = muted
			hl.TelescopePromptPrefix = { fg = c.fg_dark, bg = c.bg, bold = false }
			hl.TelescopeSelection = { bg = c.bg_highlight }
			hl.TelescopeResultsNormal = normal
			hl.TelescopeResultsBorder = muted
			hl.TelescopePreviewNormal = normal
			hl.TelescopePreviewBorder = muted

			hl.WhichKeyFloat = normal
			hl.WhichKeyBorder = muted
			hl.WhichKeyDesc = { fg = c.fg, bold = false }
			hl.WhichKeyGroup = { fg = c.fg_dark, bold = false }
			hl.WhichKeySeparator = { fg = c.fg_dark, bold = false }

			hl.BufferLineFill = { bg = c.bg }
			hl.BufferLineBackground = normal
			hl.BufferLineBufferSelected = { fg = c.fg, bg = c.bg_highlight, bold = false }
			hl.BufferLineBufferVisible = muted
			hl.BufferLineIndicatorSelected = { fg = c.fg_dark, bg = c.bg_highlight }
			hl.BufferLineSeparator = { fg = c.bg, bg = c.bg }
			hl.BufferLineSeparatorSelected = { fg = c.bg_highlight, bg = c.bg_highlight }
			hl.BufferLineSeparatorVisible = { fg = c.bg, bg = c.bg }

			hl.AerialNormal = normal
			hl.AerialLine = { bg = c.bg_highlight }
			hl.AerialGuide = muted
			hl.AerialGuides = muted
			hl.AerialFileIcon = muted
			hl.AerialArrayIcon = muted
			hl.AerialBooleanIcon = muted
			hl.AerialClassIcon = muted
			hl.AerialConstantIcon = muted
			hl.AerialConstructorIcon = muted
			hl.AerialEnumIcon = muted
			hl.AerialEnumMemberIcon = muted
			hl.AerialEventIcon = muted
			hl.AerialFieldIcon = muted
			hl.AerialFunctionIcon = muted
			hl.AerialInterfaceIcon = muted
			hl.AerialKeyIcon = muted
			hl.AerialMethodIcon = muted
			hl.AerialModuleIcon = muted
			hl.AerialNamespaceIcon = muted
			hl.AerialNullIcon = muted
			hl.AerialNumberIcon = muted
			hl.AerialObjectIcon = muted
			hl.AerialOperatorIcon = muted
			hl.AerialPackageIcon = muted
			hl.AerialPropertyIcon = muted
			hl.AerialStringIcon = muted
			hl.AerialStructIcon = muted
			hl.AerialTypeParameterIcon = muted
			hl.AerialVariableIcon = muted

			hl.TroubleNormal = normal
			hl.TroubleText = { fg = c.fg, bold = false }
			hl.TroubleCount = muted
			hl.TroubleFile = { fg = c.fg_dark, bold = false }
			hl.TroubleIndent = muted

			hl.NoicePopup = normal
			hl.NoicePopupBorder = muted
			hl.NoiceCmdlinePopup = normal
			hl.NoiceCmdlinePopupBorder = muted
			hl.NoiceCmdline = normal
			hl.NoiceSplit = normal
			hl.NoiceFormatProgressDone = muted
			hl.NoiceFormatProgressTodo = muted
		end,
	})
	return
end

-- Normal mode keeps vscode.nvim, but selected groups still use BlindReturn
-- so manual visual-impairing overrides remain available.
local c = require("vscode.colors").get_colors()
local blind_group_overrides = {
	Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = false },
	LineNr = { fg = c.vscCursorDarkDark },
	CursorLineNr = { fg = c.vscLightBlue, bold = false },
	Visual = { bg = c.vscLightBlue, bold = false },
	StatusLine = { fg = c.vscFront, bg = c.vscDarkBlue },
	StatusLineNC = { fg = c.vscFront, bg = c.vscDarkBlue },
	NormalFloat = { bg = c.vscDarkBlue },
	FloatBorder = { fg = c.vscDarkBlue, bg = c.vscDarkBlue },
	Comment = { fg = c.vscCursorDarkGrey, italic = false },
}

require("vscode").setup({
	-- Alternatively set style in setup
	style = "dark",

	-- Enable transparent background
	transparent = BlindReturn(false, true),

	-- Enable italic comment
	italic_comments = BlindReturn(false, true),

	-- Enable italic inlay type hints
	italic_inlayhints = BlindReturn(false, true),

	-- Underline `@markup.link.*` variants
	underline_links = BlindReturn(false, true),

	-- Disable nvim-tree background color
	disable_nvimtree_bg = true,

	-- Apply theme colors to terminal
	terminal_colors = BlindReturn(false, true),

	-- Override colors (see ./lua/vscode/colors.lua)
	color_overrides = {
		vscLineNumber = BlindReturn("#A0A0A0", "#FFFFFF"),
	},

	-- Override highlight groups (see ./lua/vscode/theme.lua)
	group_overrides = {
		-- this supports the same val table as vim.api.nvim_set_hl
		-- use colors from this colorscheme by requiring vscode.colors!
		Cursor = BlindReturn(blind_group_overrides.Cursor, { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true }),
		LineNr = BlindReturn(blind_group_overrides.LineNr, {}),
		CursorLineNr = BlindReturn(blind_group_overrides.CursorLineNr, {}),
		Visual = BlindReturn(blind_group_overrides.Visual, { bg = c.vscDimHighlight, bold = false }),
		StatusLine = BlindReturn(blind_group_overrides.StatusLine, {}),
		StatusLineNC = BlindReturn(blind_group_overrides.StatusLineNC, {}),
		NormalFloat = BlindReturn(blind_group_overrides.NormalFloat, {}),
		FloatBorder = BlindReturn(blind_group_overrides.FloatBorder, {}),
		Comment = BlindReturn(blind_group_overrides.Comment, {}),
	},
})
-- require('vscode').load()

-- load the theme without affecting devicon colors.
vim.cmd.colorscheme("vscode")
