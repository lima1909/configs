vim.keymap.set("n", "<leader>rf", ":PlenaryBustedFile %<CR>", { desc = "[R]un plenary [F]ile tests" })
vim.keymap.set(
    "n",
    "<leader>rd",
    ":PlenaryBustedDirectory spec<CR>",
    { desc = "[R]un plenary [D]irectory tests: ./tests" }
)
