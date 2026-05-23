vim.keymap.set("n", "<C-i>", ":bn<CR>")
vim.keymap.set("n", "<C-S-i>", ":bp<CR>")
vim.keymap.set("n", "<C-A-i>", ":%bd|e#|bd#<CR>")
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format) -- Aplica formato según el LSP activo, si no hay ninguno pues no funciona
