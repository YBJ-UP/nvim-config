-- Plugins usados para la gestión de contenedores de Docker dentro de NeoVim
-- SE DEBE DE TENER LAZYDOCKER (y docker) INSTALADO EN EL SISTEMA PARA UTILIZAR ESTE PLUGIN
vim.pack.add(
	{
		{ src = 'https://github.com/akinsho/toggleterm.nvim' },
		{ src = 'https://github.com/mgierada/lazydocker.nvim' }
	}
)

local G = {}

G.open_docker = function() -- No sé si esto funciona como carga perezosa pero pues a ver si sí
	require("toggleterm").setup()
	require("lazydocker").setup()
	vim.cmd('Lazydocker')
end

vim.keymap.set("n", "<leader>ld", G.open_docker)
return G
