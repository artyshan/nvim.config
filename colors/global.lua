local str = require 'string'

-- Helper functions

local function parseHex(color)
	local result = {}
	result.r = tonumber(str.sub(color, 2, 3), 16)
	result.g = tonumber(str.sub(color, 4, 5), 16)
	result.b = tonumber(str.sub(color, 6, 7), 16)
	return result
end

local function toHex(color)
	return str.format('#%x%x%x', color.r, color.g, color.b)
end

local function lerp(a, b, t)
	return (a * t) + (b * (1 - t))
end

local function blend(c1, c2, t)
	local c1_parsed = parseHex(c1)
	local c2_parsed = parseHex(c2)
	local result = {}
	result.r = lerp(c1_parsed.r, c2_parsed.r, t)
	result.g = lerp(c1_parsed.g, c2_parsed.g, t)
	result.b = lerp(c1_parsed.b, c2_parsed.b, t)
	return toHex(result)
end

local function setup(colors)
	-- Base colors
	local bg = colors[1]
	local fg = colors[8]
	local fg_red = colors[2]
	local fg_green = colors[3]
	local fg_yellow = colors[4]
	local fg_blue = colors[5]
	local fg_purple = colors[6]
	local fg_cyan = colors[7]
	local accent1 = colors[17]
	local accent2 = colors[18]

	-- Derived colors

	local fg_dim1 = blend(fg, bg, 0.6)
	local fg_dim2 = blend(fg, bg, 0.4)
	local bg_dim = blend(bg, fg, 0.9)
	local bg_yellow = blend(bg, fg_yellow, 0.6)

	local groups = {
		-- Main hl groups

		Normal = { fg = fg, bg = bg },
		Cursor = { fg = bg, bg = fg },
		CurSearch = { link = 'Cursor' },
		lCursor = { link = 'Cursor' },
		CursorIM = { link = 'Cursor' },
		IncSearch = { link = 'Cursor' },
		Substitute = { link = 'Cursor' },
		Search = { link = 'Cursor' },
		ColorColumn = { bg = bg_dim },
		CursorColumn = { link = 'ColorColumn' },
		CursorLine = { link = 'ColorColumn' },
		WinSeparator = { link = 'Normal' },
		MatchParen = { fg = fg, bg = bg_yellow },
		Visual = { bg = bg_dim },

		-- Statusline
		StatusLine = { link = 'Cursor' },
		StatusLineNC = { fg = fg, bg = bg_dim },
		MiniStatuslineFilename = { link = 'StatusLine' },

		-- Code elements
		Comment = { fg = blend(fg_green, bg, 0.4) },
		Constant = { fg = accent2 },
		String = { fg = fg_green },
		Character = { fg = fg_blue },
		Number = { fg = fg_purple },
		Boolean = { fg = fg_purple },
		Float = { fg = fg_purple },
		LineNr = { fg = fg_dim2 },
		NonText = { link = 'LineNr' },

		Identifier = { fg = fg },
		Function = { fg = accent1 },
		Statement = { fg = fg_cyan },
		Conditional = { fg = fg_dim1 },
		Repeat = { fg = fg_cyan },
		Label = { fg = fg_blue },
		Operator = { fg = fg_yellow },
		Keyword = { fg = fg_dim1 },
		Exception = { fg = fg_cyan },

		PreProc = { fg = fg_cyan },
		Include = { fg = fg_cyan },
		Define = { fg = fg_cyan },
		Macro = { fg = fg },
		PreCondit = { fg = fg_cyan },

		Type = { fg = fg_cyan },
		StorageClass = { fg = fg_blue },
		Structure = { fg = fg },
		TypeDef = { fg = fg_cyan },

		Special = { fg = fg_cyan },
		SpecialChar = { fg = fg_yellow },
		Tag = { fg = fg_red },
		-- TODO: blending?
		Delimiter = { fg = fg },
		SpecialComment = { fg = fg_cyan },
		Debug = { fg = fg },

		Error = { fg = fg_red },
		Ignore = { fg = fg },
		Todo = { fg = fg_yellow },

		-- Git
		-- TODO: add bg
		DiffAdd = { fg = fg_green },
		DiffChange = { fg = fg_yellow },
		DiffDelete = { fg = fg_red },

		ErrorMsg = { fg = fg_red },
		WarningMsg = { fg = fg_yellow },

		-- wtf is this
		-- should only be links here
		['@variable'] = { link = 'Identifier' },
		TodoBGTodo = { link = 'Search' },
		TodoFgTODO = { link = 'SpecialComment' },
	}

	for k, v in pairs(groups) do
		vim.api.nvim_set_hl(0, k, v)
	end
end

-- Setting colors

vim.cmd 'hi clear'
-- TODO: assume file exists
local colors_file = os.getenv 'XDG_CONFIG_HOME' .. '/colors'
local file = io.open(colors_file, 'r')
if file ~= nil then
	local colors = {}
	for line in file:lines() do
		colors[#colors + 1] = line
	end
	setup(colors)
	file:close()
else
	print('Could not find colors config file: ', colors_file)
end
