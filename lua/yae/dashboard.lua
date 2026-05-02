local titles = require("yae.titles")
local footers = require("yae.footers")

vim.pack.add({
		{ src = "https://github.com/nvimdev/dashboard-nvim" }
	}
)

require("dashboard").setup(
	{
		theme = "doom",

		config = {
				header = titles.cheese,

			center = {
				{
					desc = 'Abrir explorador de archivos',
					desc_hl = 'Title',
					key = 'e',
					keymap = 'SPC e',
					key_hl = 'Number',
					key_format = ' [%s]', -- remove default surrounding `[]`
					action = 'Yazi'
				},

				{
					desc = 'Buscar archivos en el directorio',
					desc_hl = 'Title',
					key = 'f',
					keymap = 'SPC f',
					key_hl = 'Number',
					key_format = ' [%s]', -- remove default surrounding `[]`
					action = 'Pick files'
				},

				{
					desc = 'Ver buffers abiertos',
					desc_hl = 'Title',
					key = "b",
					keymap = 'SPC b',
					key_hl = 'Number',
					key_format = ' [%s]',
					action = 'Pick buffers'
				},

				{
					desc = 'Buscar palabras',
					desc_hl = 'Title',
					key = 'w',
					keymap = 'SPC gr',
					key_hl = 'Number',
					key_format = ' [%s]',
					action = 'Pick grep_live'
				},

				{
					desc = 'Abrir Git',
					desc_hl = 'Title',
					key = 'g',
					keymap = 'SPC g',
					key_hl = 'Number',
					key_format = ' [%s]',
					action = 'LazyGitCurrentFile'
				},

				{
					desc = 'Abrir Docker',
					desc_hl = 'Title',
					key = 'd',
					keymap = 'SPC ld',
					key_hl = 'Number',
					key_format = ' [%s]',
					action = 'Lazydocker'
				},

				{
					desc = 'Imprimir directorio actual',
					desc_hl = 'Title',
					key = 'c',
					key_hl = 'Number',
					key_format = ' [%s]',
					action = 'pwd'
				},

				{
					desc = 'Reiniciar configuraciones',
					desc_hl = 'Title',
					key = 'r',
					key_hl = 'Number',
					key_format = ' [%s]',
					action = 'restart'
				},

				{
					desc = 'Editar configuraciones',
					desc_hl = 'Title',
					key = 'E',
					key_hl = 'Number',
					key_format = ' [%s]',
					action = 'e ~/.config/nvim/init.lua'
				},

				{
					desc = 'Cerrar NeoVim',
					desc_hl = 'Title',
					key = 'q',
					key_hl = 'Number',
					keymap = ':q',
					key_format = ' [%s]',
					action = 'q'
				}
			},

			footer = footers.gemmy,
			vertical_center = true
		}
	}
)
