vim.pack.add({ "https://github.com/nvim-telescope/telescope.nvim" })
require("plugins.plenary")

require("telescope").setup()

vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>h", ":Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>gr", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>")
