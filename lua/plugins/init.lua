require("plugins.markview")
require("plugins.mini")
require("plugins.lualine")
require("plugins.plenary")
require("plugins.github")
require("plugins.lsp")
require("plugins.godotdev")
require("plugins.yazi")
require("plugins.docker")
require("plugins.web_devicons")
require("plugins.dashboard")

local function pack_clean()
	local used_plugins = {}
	local unused_plugins = {}

	for _, plugin in ipairs(vim.pack.get()) do
		used_plugins[plugin.spec.name] = plugin.active
	end

	for _, plugin in ipairs(vim.pack.get()) do
		if not used_plugins[plugin.spec.name] then
			table.insert(unused_plugins, plugin.spec.name)
		end
	end

	local choice = vim.fn.confirm("¿Eliminar plugins no utilizados?", "Sí\nNo", 2)
	if choice == 1 then
		vim.pack.delete(unused_plugins)
	end
end

vim.keymap.set("n", "<leader>pc", pack_clean)
