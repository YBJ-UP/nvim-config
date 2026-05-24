-- Lista de buffers abiertos más bonita
require("plugins.web_devicons")

vim.pack.add({ "https://github.com/akinsho/bufferline.nvim" })

vim.opt.termguicolors = true
require("bufferline").setup()
