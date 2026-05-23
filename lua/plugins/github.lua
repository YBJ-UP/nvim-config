-- Colección de plugins para el manejo de GitHub
require("plugins.plenary")

vim.pack.add({"https://github.com/lewis6991/gitsigns.nvim"})
vim.pack.add({"https://github.com//kdheepak/lazygit.nvim"})

require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		delete = { text = "x" },
		change = { text = "~" },
		topdelete = { text = "_" },
		changedelete = { text = "~" }
	}
})

vim.keymap.set("n", "<leader>g", ":LazyGitCurrentFile<CR>")
