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

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
-- vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
-- vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- spell checker,
-- "z=" for suggestions
-- "zg" add an unknown word
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- enable listchars, like tab, enter, ...
-- vim.opt.list = true
-- vim.opt.listchars = { trail = "-", eol = "↲", tab = "» ", nbsp = "␣" }

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 7

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- run a golang main.go
vim.keymap.set("n", "<leader>gr", ":! go run *.go<CR>")

-- change to terminal mod
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "go into terminal mode" })

-- :map <leader>s -> printed the description 'desc'
vim.keymap.set(
    { "n", "v", "i" },
    "<C-s>",
    "<Esc>:write<CR>:source %<CR>",
    { desc = "<leader>s write and reload source" }
)

vim.keymap.set("i", "jk", "<Esc>", { desc = "[jk] simulate the Esc key" })
vim.keymap.set("i", "77", "{}<Esc>i", { desc = "[77] insert { }" })
vim.keymap.set("i", "88", "[]<Esc>i", { desc = "[88] insert [ ]" })

-- lua snipped
vim.keymap.set({ "i", "s" }, "<C-L>", function()
    require("luasnip").jump(1)

    if require("luasnip").choice_active() then
        require("luasnip").change_choice(1)
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-J>", function()
    require("luasnip").jump(-1)

    if require("luasnip").choice_active() then
        require("luasnip").change_choice(1)
    end
end, { silent = true })

-- move up and down
vim.keymap.set({ "i", "n" }, "<C-Up>", function()
    vim.cmd(":m -2")
end, { silent = true })
vim.keymap.set({ "i", "n" }, "<C-Down>", function()
    vim.cmd(":m +1")
end, { silent = true })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Diagnostic keymaps
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

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

vim.keymap.set({ "n", "v" }, "<leader>rr", ":Resty run<CR>", { desc = "[R]esty [R]un request under the cursor" })
vim.keymap.set({ "n", "v" }, "<leader>rl", ":Resty last<CR>", { desc = "[R]esty [L]ast" })
vim.keymap.set({ "n", "v" }, "<leader>rv", ":Resty favorite<CR>", { desc = "[R]esty [V]iew favorites" })
vim.keymap.set({ "n", "v" }, "<leader>rz", ":Resty debug<CR>", { desc = "[R]esty debug [Z]" })

vim.api.nvim_create_user_command("MyRun", function(args)
    print("Run Command " .. table.concat(args.fargs, ", "))
end, {
    nargs = "*",
    complete = function(opt)
        -- print(" -- " .. opt.input)
        return { "foo", "bar" }
    end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
