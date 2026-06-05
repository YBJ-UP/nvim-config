local colors = {
	bg = "#03102c",
	bg_unfocused = "#000b20",
	fg = "#ff2e97",
	fg_unfocused = "#b00060",
	surface = "#0e0952",
	primary_txt = "#ffffff",
	functions = "#ffd400", --amarillo
	keywords = "#ff2cf1", --magenta
	strings = "#0ef3ff", --cian
	comments = "#0098df", --azulito
	visual = "#052355",  --azul oscurillo
	cursorLine = "#1C1347", --azul más oscuro
	special = "#7CD492",
	error = "#AC077A",
	warn = "#FFE629"
}

local G = {}

function G.colorscheme()
	vim.cmd("highlight clear")
	vim.cmd("syntax reset")

	vim.o.background = "dark"
	vim.g.colors_name = "2077"
	local set = vim.api.nvim_set_hl

	set(0, "Normal", { bg = colors.bg, fg = colors.fg })
	set(0, "NormalNc", { bg = colors.bg_unfocused, fg = colors.fg_unfocused })

	set(0, "ColorColumn", { bg = colors.cursorLine })

	set(0, "NormalFloat", { bg = "black" })
	set(0, "FloatBorder", { bg = "black" ,fg = colors.fg })

	set(0, "Pmenu", { bg = "black", fg = colors.fg })

	set(0, "StatusLine", { bg = colors.surface, fg = colors.primary_txt })
	set(0, "StatusLineNC", { bg = colors.surface, fg = colors.primary_txt })

	set(0, "TabLine", { bg = colors.surface, fg = colors.primary_txt })
	set(0, "TabLineFill", { bg = colors.surface, fg = colors.primary_txt })
	set(0, "TabLineSel", { bg = colors.visual, fg = colors.special })

	set(0, "Title", { fg = colors.strings, bold = true })

	set(0, "Substitute", { bg = colors.strings, fg = colors.bg })

	set(0, "CursorLine", { bg = colors.cursorLine })
	set(0, "Visual", { bg = colors.visual })

	set(0, "Comment", { fg = colors.comments, italic = true })
	set(0, "Constant", { fg = colors.functions })
	set(0, "String", { fg = colors.strings })
	set(0, "Identifier", { fg = colors.fg })
	set(0, "Statement", { fg = colors.keywords })
	set(0, "Type", { fg = colors.functions, italic = true })

	set(0, "Special", { fg = colors.fg })

	set(0, "Keyword", { fg = colors.keywords })

	set(0, "Function", { fg = colors.functions })
	set(0, "TSFunction", { fg = colors.fg })

	set(0, "Error", { fg = colors.error, bold = true })
end

G.colorscheme()

return G
