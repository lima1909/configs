vim.keymap.set({ "i", "n" }, ";", "<Esc>A;", { desc = "insert a semiconlon at the end of the line" })

-- Set the color for line numbers
vim.api.nvim_set_hl(0, "LineNr", { fg = "#A9A9A9" }) -- dark grey line numbers
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFFFFF" }) -- white current line number
