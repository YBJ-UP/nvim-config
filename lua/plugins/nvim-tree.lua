vim.pack.add({ "https://github.com/nvim-tree/nvim-tree.lua" })

local opts = {
	reload_on_bufenter = true,
	diagnostics = {
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

local open_tree = function()
	require("nvim-tree").setup(opts)
	vim.cmd("NvimTreeFocus")
end

vim.keymap.set("n", "<leader>ee", open_tree)
