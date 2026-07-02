-- Incluye configuración de LSPs, Snippets y gestión de LSPs a través de Mason
vim.pack.add(
	{
		{ src = "https://github.com/neovim/nvim-lspconfig" },

		{ src = "https://github.com/saghen/blink.lib" },
		{ src = "https://github.com/saghen/blink.cmp" },          -- blink.cmp depende de blink.lib

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

vim.diagnostic.config({
	virtual_text = true
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
})
vim.lsp.enable("lua_ls")

vim.lsp.enable("nil_ls")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then return end

		if client:supports_method("textDocument/formatting") then
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ async = false, id = client.id })
				end
			})
		end
	end
})
