return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        require("telescope").setup({
            -- pickers = {
            --     find_files = {
            --         theme = "ivy",
            --     },
            -- },
            extensions = {
                fzf = {},
            },
        })

        require("telescope").load_extension("fzf")

        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
        -- vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "[F]ind [O]ld files" })
        vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
        -- vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind [G]rep" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffer" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
        vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics" })
        -- vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind Res[u]me" })
        vim.keymap.set("n", "<leader>fr", builtin.registers, { desc = "[F]ind [R]egisters" })
        -- vim.keymap.set("n", "<leader>ft", "<cmd>:TodoTelescope<cr>", { desc = "[F]ind [T]odo" })
        vim.keymap.set("n", "<leader>fc", function()
            builtin.live_grep({
                ---@diagnostic disable-next-line: param-type-mismatch
                cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
            })
        end, { desc = "[F]ind [C]ode" })

        -- add my own multigrep
        require("telescope.multigrep").setup()

        -- vim.api.nvim_set_keymap(
        --     "n",
        --     "<leader>fk",
        --     [[:lua require('telescope.builtin').live_grep({ glob_pattern = vim.fn.input("Glob pattern: ") })<CR>]],
        --     { noremap = true, silent = true, desc = "[F]ind [K]rep with glob" }
        -- )

        -- local lga_actions = require("telescope-live-grep-args.actions")
        -- local actions = require("telescope.actions")
        --
        -- require("telescope").setup({
        --     extensions = {
        --         live_grep_args = {
        --             auto_quoting = true, -- enable/disable auto-quoting
        --             -- define mappings, e.g.
        --             mappings = { -- extend mappings
        --                 i = {
        --                     ["<C-k>"] = lga_actions.quote_prompt(),
        --                     ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        --                     -- freeze the current list and start a fuzzy search in the frozen list
        --                     ["<C-space>"] = actions.to_fuzzy_refine,
        --                 },
        --             },
        --             -- ... also accepts theme settings, for example:
        --             -- theme = "dropdown", -- use dropdown theme
        --             -- theme = { }, -- use own theme spec
        --             -- layout_config = { mirror=true }, -- mirror preview pane
        --         },
        --     },
        -- })
    end,
}
