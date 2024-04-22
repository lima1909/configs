-- use space as a the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- spell checker,
-- "z=" for suggestions
-- "zg" add an unknown word
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- enable listchars, like tab, enter, ...
vim.opt.list = true
vim.opt.listchars = {
    trail = "-",
    eol = "↲",
    tab = "» ",
}

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- :map <leader>s -> printed the description 'desc'
vim.keymap.set("i", "jk", "<Esc>", { desc = "simulate the Esc key" })
vim.keymap.set("n", "<Leader>s", ":write<CR>:source<CR>", { desc = "my first test keymap" })
vim.keymap.set("i", "77", "{ }<Esc>hi", { desc = "insert { }" })

-- LSP keymaps
vim.keymap.set("n", "ch", vim.lsp.buf.hover, { desc = "[C]ode show [H]elp (hover)" })
vim.keymap.set("n", "ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_user_command("MyRun", function()
    print("Run Command")
end, { nargs = "*" })
