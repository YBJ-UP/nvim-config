vim.pack.add({ "https://github.com/folke/which-key.nvim" })

local G = {}

G.show = function()
	require("which-key").show({})
end

vim.keymap.set("n", "<leader>?", G.show, { desc = "Ver atajos" })
return G
