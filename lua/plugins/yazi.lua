-- SE DEBE DE TENER YAZI INSTALADO EN EL SISTEMA PARA USAR ESTE PLUGIN
-- No sé si está disponible en Windows
-- Si estás usando NeoVim en Windows ya pásate a Linux
require("plugins.plenary")

vim.pack.add({"https://github.com/mikavilpas/yazi.nvim"})

vim.keymap.set("n", "<leader>e", ":Yazi<CR>", { desc = "Open file explorer" })
