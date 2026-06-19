vim.keymap.set("n", "<C-i>", ":bn<CR>", { desc = "Siguiente búfer" })
vim.keymap.set("n", "<S-Tab>", ":bp<CR>", { desc = "Búfer anterior" })
vim.keymap.set("n", "<C-A-i>", ":%bd!|e#|bd#<CR>", { desc = "Cerrar todos los búfers excepto el activo" }) -- Cierra todos los buffers excepto el que esté activo
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Aplicar formato según el LSP" }) -- Aplica formato según el LSP activo, si no hay ninguno pues no funciona
