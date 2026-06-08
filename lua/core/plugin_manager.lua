-- Sinceramente no hace nada realmete útil por el momento xd
-- Solo se pueden ver cuántos plugns hay pero no cuáles son
local M = {}

M.pkg_count = #vim.pack.get()

M.pack_clean = function()
	local used_plugins = {}
	local unused_plugins = {}

	for _, plugin in ipairs(vim.pack.get()) do
		used_plugins[plugin.spec.name] = plugin.active
	end

	for _, plugin in ipairs(vim.pack.get()) do
		if not used_plugins[plugin.spec.name] then
			table.insert(unused_plugins, plugin.spec.name)
			print(plugin.spec.name)
		end
	end
	if next(unused_plugins) == nil then
		print("No hay plugins sin utilizar.")
		return
	end

	local choice = vim.fn.confirm("¿Eliminar plugins no utilizados?", "Sí\nNo", 2)
	if choice == 1 then
		vim.pack.del(unused_plugins)
	end
end


M.get_active_packs = function()
	local counter = 0

	for _, plugin in ipairs(vim.pack.get()) do
		if plugin.active then
			counter = counter + 1
		end
	end
	return (counter .. "/" .. M.pkg_count .. " paquetes están activos.")
end

return M
