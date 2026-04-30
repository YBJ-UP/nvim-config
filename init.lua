require("yae")

-- ============================================================================
-- USEFUL FUNCTIONS
-- ============================================================================

-- Copy Full File-Path
vim.keymap.set("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end)

-- Basic autocommands
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		local line = mark[1]
		local ft = vim.bo.filetype
		if line > 0 and line <= lcount
			and vim.fn.index({ "commit", "gitrebase", "xxd" }, ft) == -1
			and not vim.o.diff then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Auto-close terminal when process exits
vim.api.nvim_create_autocmd("TermClose", {
	group = augroup,
	callback = function()
		if vim.v.event.status == 0 then
			vim.api.nvim_buf_delete(0, {})
		end
	end,
})

-- Disable line numbers in terminal
vim.api.nvim_create_autocmd("TermOpen", {
	group = augroup,
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.opt_local.signcolumn = "no"
	end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
	group = augroup,
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- Create directories when saving files
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	callback = function()
		local dir = vim.fn.expand('<afile>:p:h')
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, 'p')
		end
	end,
})

-- Command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Better diff options
vim.opt.diffopt:append("linematch:60")

-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

local lsp_servers = { "lua_ls", "clangd", "pyright", "vscode-html-server" }

vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },

	{ src = "https://github.com/nvim-mini/mini.nvim" },

	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/saghen/blink.cmp" }, -- blink.cmp depende de blink.lib

	{ src = "https://github.com/lewis6991/gitsigns.nvim" },

	{ src = "https://github.com/nvimdev/dashboard-nvim" },

	{ src = "https://github.com/nvim-lua/plenary.nvim" }, -- Estos dos dependen de plenary
	{ src = "https://github.com/mikavilpas/yazi.nvim" },
	{ src = "https://github.com//kdheepak/lazygit.nvim" },

	{ src = 'https://github.com/akinsho/toggleterm.nvim' },
	{ src = 'https://github.com/mgierada/lazydocker.nvim' },

	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },

	{ src = 'https://github.com/nvim-tree/nvim-web-devicons' },

	{ src = 'https://github.com/nvim-lualine/lualine.nvim' },

	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' }, -- autotag depende de tree sitter
	{ src = 'https://github.com/windwp/nvim-ts-autotag' }
})

require("mini.pick").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.notify").setup()
require("mini.icons").setup()
require("mini.tabline").setup()
require("mini.animate").setup()
require("mini.trailspace").setup()

require("lualine").setup()

require("nvim-treesitter").install { 'typescript', 'javascript', 'tsx', 'lua' }
require("nvim-ts-autotag").setup({
	ft = {
		'javascript',
		'javascriptreact',
		'typescript',
		'typescriptreact'
	}
})

require("blink.cmp").setup({
	fuzzy = { implementation = "prefer_rust" }
})

require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		delete = { text = "x" },
		change = { text = "~" },
		topdelete = { text = "_" },
		changedelete = { text = "~" }
	}
})

require("mason").setup()
require("mason-lspconfig").setup()

require("toggleterm").setup()
require("lazydocker").setup()

require("dashboard").setup(
	{
		theme = "doom",

		config = {
			header = {
				[[                                                     ]],
				[[  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ]],
				[[  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ]],
				[[ ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ]],
				[[ ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ]],
				[[ ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ]],
				[[ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ]],
				[[ ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ]],
				[[    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ]],
				[[          ░    ░  ░    ░ ░        ░   ░         ░    ]],
				[[                                 ░                   ]],
				[[                                                     ]],
				'Opciones:',
				''
			},

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
				}
			},

			footer = {
				"Eso tilín"
			},
			vertical_center = true
		}
	}
)

local function pack_clean()
	local used_plugins = {}
	local unused_plugins = {}

	for _, plugin in ipairs(vim.pack.get()) do
		used_plugins[plugin.spec.name] = plugin.active
	end

	for _, plugin in ipairs(vim.pack.get()) do
		if not used_plugins[plugin.spec.name] then
			table.insert(unused_plugins, plugin.spec.name)
		end
	end

	local choice = vim.fn.confirm("¿Eliminar plugins no utilizados?", "Sí\nNo", 2)
	if choice == 1 then
		vim.pack.delete(unused_plugins)
	end
end

for _, server in ipairs(lsp_servers) do
	vim.lsp.enable(server)
end

vim.keymap.set("n", "<leader>pc", pack_clean)
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
vim.keymap.set("n", "<leader>gr", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>b", ":Pick buffers<CR>")

vim.keymap.set("n", "<leader>m", ":Mason<CR>")
vim.cmd("set completeopt+=noselect")
vim.keymap.set("n", "<leader>g", ":LazyGitCurrentFile<CR>")
vim.keymap.set("n", "<leader>ld", ":Lazydocker<CR>")
