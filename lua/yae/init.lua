require("yae.keymaps")
require("yae.settings")
require("yae.terminal")
require("yae.tabs")
require("yae.functions")
require("yae.godotdevtui.godotdevtui").setup()
require("yae.buffers")

vim.keymap.set("n", "<leader>gd", ":Gdt<CR>")

local function call_mgr()
	return require("yae.plugin_manager")
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
