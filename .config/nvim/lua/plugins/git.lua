return {
    "kdheepak/lazygit.nvim",
    config = function()
        require("lazy").setup({
            {
                "kdheepak/lazygit.nvim",
                cmd = {
                    "LazyGit",
                    "LazyGitConfig",
                    "LazyGitCurrentFile",
                    "LazyGitFilter",
                    "LazyGitFilterCurrentFile",
                },
                -- optional for floating window border decoration
                dependencies = {
                    "nvim-lua/plenary.nvim",
                },
                -- setting the keybinding for LazyGit with 'keys' is recommended in
                -- order to load the plugin when the command is run for the first time
                keys = {
                    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
                },
            },
        })

        vim.keymap.set("n", "<leader>gl", "<cmd>LazyGit<cr>", { desc = "[G]it [L]azy" })
    end,
}
--[[ return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
            signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
            linehl = true, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`

            current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100,
            },
            current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
            current_line_blame_formatter_opts = {
                relative_time = false,
            },
        })
    end,
} ]]
