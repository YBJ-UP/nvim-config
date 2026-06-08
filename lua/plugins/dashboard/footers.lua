local function info_footer()
	local date = os.date("%d/%m/%Y - %H:%M:%S")
	local version = vim.version()
	local version_info = version.major .. "." .. version.minor .. "." .. version.patch
	local plugins = require("core.plugin_manager").get_active_packs()

	return {
		"󰃭 " .. date,
		" " .. version_info,
		--plugins
	}
end

local footers = {
	gemmy = {
		"Alerta de gema"
	},
	coal = {
		"Alerta de carbón"
	},
	emacs = {
		"Apoyo la destrucción total de emacs"
	},
	nvimbtw = {
		"Uso neovim por cierto"
	},
	sabiduria = {
		"Hay un dicho chino, no sé chino así que no sé qué dice"
	},
	codigo = {
		'hola.mundo("system.out.println;")'
	},
	experienciapromedio = {
		"Paso más tiempo configurando neovim que programando"
	},
	info = info_footer()
}

return footers
