vim.keymap.set({ "n", "v" }, "<leader>dr", ":w | RustLsp debug<CR>", { desc = "[D]ebug [R]un debug" })
vim.keymap.set({ "i", "n" }, ";", "<Esc>A;", { desc = "insert a semiconlon at the end of the line" })
