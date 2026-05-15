require("yae")

vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },

	{ src = "https://github.com/nvim-mini/mini.nvim" },

	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/saghen/blink.cmp" }, -- blink.cmp depende de blink.lib

	{ src = "https://github.com/lewis6991/gitsigns.nvim" },

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
	{ src = 'https://github.com/windwp/nvim-ts-autotag' },

	{ src = 'https://github.com/mfussenegger/nvim-dap' },
	{ src = 'https://github.com/rcarriga/nvim-dap-ui' },
	{ src = 'https://github.com/Mathijs-Bakker/godotdev.nvim' },

	{ src = "https://github.com/OXY2DEV/markview.nvim" }
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

require("godotdev").setup()

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
