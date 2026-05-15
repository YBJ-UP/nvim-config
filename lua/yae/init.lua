require("yae.keymaps")
require("yae.settings")
require("yae.terminal")
require("yae.tabs")
require("yae.functions")
require("yae.dashboard")
require("yae.godotdevtui.godotdevtui").setup()

vim.keymap.set("n", "<leader>gd", ":Gdt<CR>")
