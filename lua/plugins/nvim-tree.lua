vim.pack.add({ "https://github.com/nvim-tree/nvim-tree.lua" })

local opts = {
	reload_on_bufenter = true,
	diagnostics = {
		enable = true
	},
	modified = {
		enable = true
	},
	renderer = {
		icons = {
			glyphs = {
				git = {
					unstaged = "~",
					untracked = "+"
				}
			}
		}
	}
}

require("nvim-tree").setup(opts)

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
