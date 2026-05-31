-- Lista de buffers abiertos más bonita
require("plugins.web_devicons")

vim.pack.add({ "https://github.com/akinsho/bufferline.nvim" })

require("bufferline").setup(
	{
		options = {
			hover = {
				enabled = true,
				delay = 100,
				reveal = { 'close' }
			},
			indicator = { style = 'underline' },
			separator_style = "slope"
		}
	}
)
