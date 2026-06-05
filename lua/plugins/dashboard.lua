local titles = require("core.titles")
local footers = require("core.footers")
local docker = require("plugins.docker")

vim.pack.add({
	{ src = "https://github.com/nvimdev/dashboard-nvim" }
}
)

require("dashboard").setup(
	{
		theme = "doom",

		config = {
			header = titles.eyes,

			center = {
				{
					icon = ' ',
					icon_hl = 'Title',
					desc = 'Abrir explorador de archivos',
					desc_hl = 'Title',
					key = 'e',
					keymap = 'SPC e',
					key_hl = 'Number',
					key_format = ' [%s]', -- remove default surrounding `[]`
					action = 'NvimTreeToggle'
				},

				{
					icon = '󰥩 ',
					icon_hl = 'Title',
					desc = 'Buscar archivos en el directorio',
					desc_hl = 'Title',
					key = 'f',
					keymap = 'SPC f',
					key_hl = 'Number',
					key_format = ' [%s]', -- remove default surrounding `[]`
					action = 'Pick files'
				},

				{
					icon = '󰋗 ',
					icon_hl = 'Title',
					desc = 'Buscar documentación',
					desc_hl = 'Title',
					key = "h",
					keymap = 'SPC h',
					key_hl = 'Number',
					key_format = ' [%s]',
					action = 'Pick help'
				},

				{
					icon = '󰦨 ',
					icon_hl = 'Title',
					desc = 'Buscar texto',
					desc_hl = 'Title',
					key = 'w',
					keymap = 'SPC gr',
					key_hl = 'Number',
					key_format = ' [%s]',
					action = 'Pick grep_live'
				},

				{
					icon = ' ',
					icon_hl = 'Title',
					desc = 'Abrir Git',
					desc_hl = 'Title',
					key = 'g',
					keymap = 'SPC g',
					key_hl = 'Number',
					key_format = ' [%s]',
					action = 'LazyGitCurrentFile'
				},

				{
					icon = ' ',
					icon_hl = 'Title',
					desc = 'Abrir Docker',
					desc_hl = 'Title',
					key = 'd',
					keymap = 'SPC ld',
					key_hl = 'Number',
					key_format = ' [%s]',
					action = docker.open_docker
				},

				{
					icon = ' ',
					icon_hl = 'Title',
					desc = 'Panel de Godot',
					desc_hl = 'Title',
					key = 'gd',
					keymap = 'SPC gd',
					key_hl = 'Number',
					key_format = ' [%s]',
					action = 'Gdt'
				},

				{
					icon = ' ',
					icon_hl = 'Title',
					desc = 'Imprimir directorio actual',
					desc_hl = 'Title',
					key = 'c',
					key_hl = 'Number',
					key_format = ' [%s]',
					action = 'pwd'
				},

				{
					icon = ' ',
					icon_hl = 'Title',
					desc = 'Reiniciar configuraciones',
					desc_hl = 'Title',
					key = 'r',
					key_hl = 'Number',
					key_format = ' [%s]',
					action = 'restart'
				},

				{
					icon = ' ',
					icon_hl = 'Title',
					desc = 'Editar configuraciones',
					desc_hl = 'Title',
					key = 'E',
					key_hl = 'Number',
					key_format = ' [%s]',
					action = 'e ~/.config/nvim/init.lua'
				},

				{
					icon = '󰩈 ',
					icon_hl = 'Title',
					desc = 'Cerrar NeoVim',
					desc_hl = 'Title',
					key = 'q',
					key_hl = 'Number',
					keymap = ':q',
					key_format = ' [%s]',
					action = 'q'
				}
			},

			footer = footers.sabiduria,
			vertical_center = true
		}
	}
)
