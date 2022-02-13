-- tokyonight
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_transparent_sidebar = true
-- vim.g.tokyonight_transparent = true
-- local colorscheme = "tokyonight"

-- tokyodark
-- vim.g.tokyodark_transparent_background = true
-- vim.g.tokyodark_enable_italic_comment = true
-- vim.g.tokyodark_enable_italic = true
-- vim.g.tokyodark_color_gamma = "1.0"
-- local colorscheme = "tokyodark"

-- rvcs
-- local colorscheme = "rvcs"

-- rose-pine
-- local colorscheme = "rose-pine"

-- kanagawa
-- local colorscheme = "kanagawa"
-- require('kanagawa').setup({
--     undercurl = true,           -- enable undercurls
--     commentStyle = "italic",
--     functionStyle = "NONE",
--     keywordStyle = "italic",
--     statementStyle = "bold",
--     typeStyle = "NONE",
--     variablebuiltinStyle = "italic",
--     specialReturn = true,       -- special highlight for the return keyword
--     specialException = true,    -- special highlight for exception handling keywords
--     transparent = true,        -- do not set background color
--     dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
--     colors = {},
--     overrides = {},
-- })

-- Set the theme style
local colorscheme = "material"
vim.g.material_style = 'deep ocean'

require('material').setup({
	contrast = {
		sidebars = true,
		cursor_line = true,
    non_current_windows = true
	},
	italics = {
		comments = true,
		functions = true,
	},
	contrast_filetypes = {
		"terminal",
		"packer",
		"qf",
	},

	disable = {

		borders = true,
		eob_lines = false,
    background = true
	},
	lualine_style = 'stealth'
})

-- Enable the colorscheme
vim.cmd 'colorscheme material'

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")

  return
end
