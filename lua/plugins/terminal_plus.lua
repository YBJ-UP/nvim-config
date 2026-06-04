vim.pack.add({"https://github.com/YBJ-UP/terminal_plus.nvim"})

vim.keymap.set("n", "<leader>t", function()
	local term = require("term")
	term.setup()
	term.new()
end)
