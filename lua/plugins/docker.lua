-- Plugins usados para la gestión de contenedores de Docker dentro de NeoVim
-- SE DEBE DE TENER LAZYDOCKER (y docker) INSTALADO EN EL SISTEMA PARA UTILIZAR ESTE PLUGIN
vim.pack.add(
	{
		{ src = 'https://github.com/akinsho/toggleterm.nvim' },
		{ src = 'https://github.com/mgierada/lazydocker.nvim' }
	}
)

require("toggleterm").setup()
require("lazydocker").setup()

vim.keymap.set("n", "<leader>ld", ":Lazydocker<CR>")
