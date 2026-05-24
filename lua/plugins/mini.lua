-- Uso de pick para la búsqueda de archivos, grep, buffers y de documentación
-- Uso de pairs para cierre automático de "", '', (), {} y []
-- Uso de surround para envolver líneas o fragmentos en los símbolo de arriba
-- Los demás se explican solos no quiero escribir
vim.pack.add( {"https://github.com/nvim-mini/mini.nvim" } )

require("mini.pick").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.notify").setup()
require("mini.icons").setup()
require("mini.animate").setup()
require("mini.trailspace").setup()

vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")
vim.keymap.set("n", "<leader>gr", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>b", ":Pick buffers<CR>")

