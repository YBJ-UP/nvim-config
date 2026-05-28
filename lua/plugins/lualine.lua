vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })

require("lualine").setup({
	options = {
		theme = 'auto',
		section_separators = { left = '', right = ''},
		component_separators = { left='', right='' }
	},
	sections = {
		lualine_c = { 'filename', 'lsp_status' },
		lualine_z = { 'location', '""' }
	}
})
--local lol = require('lualine').get_config()
--print(vim.inspect(lol))
