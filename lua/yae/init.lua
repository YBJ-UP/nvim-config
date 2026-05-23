require("yae.keymaps")
require("yae.settings")
require("yae.terminal")
require("yae.tabs")
require("yae.functions")
require("yae.godotdevtui.godotdevtui").setup()
require("yae.buffers")

vim.keymap.set("n", "<leader>gd", ":Gdt<CR>")
