vim.pack.add({"https://github.com/YBJ-UP/terminal_plus.nvim"})

local G = {}

G.open_term = function()
	local term = require("term")
	term.setup({ preset = "spawn_on_bottom" })
	term.new()
end

vim.keymap.set("n", "<leader>t", G.open_term)

return G
