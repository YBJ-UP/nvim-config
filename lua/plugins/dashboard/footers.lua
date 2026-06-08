local function date_footer()
	local date = os.date("%d/%m/%Y - %H:%M:%S")
	return "󰃭 " .. date
end

local function version_footer()
	local version = vim.version()
	local version_info = version.major .. "." .. version.minor .. "." .. version.patch

	return " " .. version_info
end

local function info_footer()
	local plugins = require("core.plugin_manager").get_active_packs() -- da mal el número xd

	return date_footer() .. "\t" .. version_footer()
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
	info = {
		info_footer()
	}
}

return footers
