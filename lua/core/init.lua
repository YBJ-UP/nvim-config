require("core.keymaps")
require("core.settings")
require("core.tabs")
require("core.functions")
require("core.godotdevtui.godotdevtui").setup()
require("core.buffers")


vim.keymap.set("n", "<leader>gd", ":Gdt<CR>")

local function call_mgr()
	return require("core.plugin_manager")
end

local function active_packs()
	local m = call_mgr()
	m.get_active_packs()
end

local function pack_clean()
	local m = call_mgr()
	m.pack_clean()
end

vim.keymap.set("n", "<leader>pk", active_packs)
vim.keymap.set("n", "<leader>pc", pack_clean)
vim.keymap.set("n", "<leader>pku", vim.pack.update)
