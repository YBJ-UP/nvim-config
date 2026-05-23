-- Incluye configuración de LSPs, Snippets y gestión de LSPs a través de Mason
vim.pack.add(
	{
		{ src = "https://github.com/neovim/nvim-lspconfig" },

		{ src = "https://github.com/saghen/blink.lib" },
		{ src = "https://github.com/saghen/blink.cmp" }, -- blink.cmp depende de blink.lib

		{ src = "https://github.com/mason-org/mason.nvim" },
		{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },

		{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' }, -- autotag depende de tree sitter
		{ src = 'https://github.com/windwp/nvim-ts-autotag' }
	}
)

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

require("mason").setup()
require("mason-lspconfig").setup()

vim.keymap.set("n", "<leader>m", ":Mason<CR>")
