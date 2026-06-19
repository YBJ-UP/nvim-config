local titles = require("plugins.dashboard.titles")
local footers = require("plugins.dashboard.footers")
local docker = require("plugins.docker")
local term = require("plugins.terminal_plus")
local which = require("plugins.which-key")

vim.pack.add({
	{ src = "https://github.com/nvimdev/dashboard-nvim" }
})

---@param icon string
---@param desc string
---@param key string
---@param keymap string
---@param action string | function
---@return table
local function item(icon, desc, key, keymap, action)
	return {
		icon = icon..' ', icon_hl = 'Title',
		desc = desc, desc_hl = 'Title',
		key = key, key_hl = 'Number', key_format = ' [%s]',
		keymap = keymap, action = action
	}
end

require("dashboard").setup(
	{
		theme = "doom",

		config = {
			header = titles.eyes3,

			center = {
				item('', 'Explorar directorio',	'e', 'SPC e', 'NvimTreeToggle'),
				item('󰥩', 'Buscar archivos',		'f', 'SPC f', 'Pick files'),
				item('󰦨', 'Grep',					'w', 'SPC gr', 'Pick grep_live'),
				-- item('󰋗', 'Ayuda',					'h', 'SPC h', 'Pick help'),
				item('󰋗', 'Ayuda',					'h', 'SPC ?', which.show),
				-- item('', 'Terminal',				't', 'SPC t', term.open_term),
				item('', 'Git',					'g', 'SPC g', 'LazyGitCurrentFile'),
				item('', 'Proyectos',				'p', '', 'cd ~/Proyectos | NvimTreeToggle'),
				-- item('', 'Docker',					'd', 'SPC ld', docker.open_docker),
				-- item('', 'Mason',					'm', 'SPC m', 'Mason'),
				item('', 'Directorio actual',		'c', '', 'pwd'),
				-- item('', 'Reiniciar',				'r', '', 'restart'),
				-- item('', 'Configuración',			'E', 'SPC rc', 'cd ~/.config/nvim | NvimTreeToggle'),
				-- item('󰩈', 'Salir',					'q', ':q', 'q'),
			},

			footer = footers.gemmy,
			vertical_center = true
		}
	}
)
