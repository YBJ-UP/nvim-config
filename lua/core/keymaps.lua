-- Centra el cursor al usar estos comandos
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Split de ventanas
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "split vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "split horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -3<CR>", { desc = "decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "increase window width" })
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Permite mover líneas de manera similar a VSCode
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set("n", "<leader>rc", ":e $MYVIMRC<CR>", { desc = "Edit config" })
vim.keymap.set("n", "<A-r>", ":restart<CR>") -- Reinicia NeoVim

-- Permite ver diagnosticos, acciones y definiciones de código
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "show diagnostics" })
vim.keymap.set("n", "<leader>def", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

-- Reemplaza la palabra bajo el cursor (solo dentro del archivo)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
