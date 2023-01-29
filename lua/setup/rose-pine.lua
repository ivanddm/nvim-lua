-- "rose-pine/neovim"

local t = os.date("*t").hour + os.date("*t").min / 60
local variant = ""

if t >= 8 and t < 18 then
	variant = "moon"
else
	-- variant = "main"
	variant = "moon"
	-- vim.cmd("colorscheme rose-pine")
end

require("rose-pine").setup({
	--- @usage 'main' | 'moon'
	dark_variant = variant,
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = true,
	disable_float_background = true,
	disable_italics = false,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = "base",
		panel = "surface",
		border = "highlight_med",
		comment = "muted",
		link = "iris",
		punctuation = "subtle",

		error = "love",
		hint = "iris",
		info = "foam",
		warn = "gold",

		git_add = "pine",
		git_rename = "foam",

		headings = {
			h1 = "iris",
			h2 = "foam",
			h3 = "rose",
			h4 = "gold",
			h5 = "pine",
			h6 = "foam",
		},
		-- or set all headings at once
		-- headings = 'subtle'
	},

	-- Change specific vim highlight groups
	highlight_groups = {
		IndentBlanklineChar = { fg = "overlay" },
		-- IndentBlanklineChar = { fg = "highlight_med" },
		-- CursorLine = { bg = "#302E45" },
		Variable = { fg = "text", style = "NONE" },
		TSVariable = { fg = "text", style = "NONE" },
		["@variable"] = { fg = "text", style = "NONE" },
		Parameter = { fg = "iris", style = "NONE" },
		TSParameter = { fg = "iris", style = "NONE" },
		["@parameter"] = { fg = "iris", style = "NONE" },
		Property = { fg = "iris", style = "NONE" },
		["@property"] = { fg = "iris", style = "NONE" },
		TSProperty = { fg = "iris", style = "NONE" },
		Keyword = { fg = "pine", style = "italic" },
		TSKeyword = { fg = "pine", style = "italic" },
		["@keyword"] = { fg = "pine", style = "italic" },
		Function = { fg = "rose", style = "italic" },
		TSFunction = { fg = "rose", style = "italic" },
	},
})

-- Load the colorscheme

-- vim.cmd("colorscheme rose-pine")
