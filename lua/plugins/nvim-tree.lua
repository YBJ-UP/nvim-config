vim.pack.add({ "https://github.com/nvim-tree/nvim-tree.lua" })

local opts = {
	reload_on_bufenter = true,
	auto_reload_on_write = true,
	disable_netrw = true,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = true,
	respect_buf_cwd = false,
	view = {
		centralize_selection = true,
		side = "right",
		width = 50
	},
	diagnostics = {
		enable = true
	},
	modified = {
		enable = true
	},
	renderer = {
		icons = {
			web_devicons = {
				folder = {
					enable = true
				}
			},
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
vim.keymap.set("n", "<leader>ee", ":NvimTreeFocus<CR>")
