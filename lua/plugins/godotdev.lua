-- Plugins para el desarrollo de videojuegos en Godot
vim.pack.add(
	{
		{ src = 'https://github.com/mfussenegger/nvim-dap' },
		{ src = 'https://github.com/rcarriga/nvim-dap-ui' },
		{ src = 'https://github.com/Mathijs-Bakker/godotdev.nvim' }
	}
)

require("godotdev").setup()
