return {
    -- Detect tabstop and shiftwidth automatically
    { "tpope/vim-sleuth" },

    -- This plugin adds indentation guides to Neovim.
    -- It uses Neovim's virtual text feature and no conceal
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    -- comments
    { "numToStr/Comment.nvim", lazy = false, opts = {} },

    -- color - schema
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin")
        end,
    },

    -- Highlight todo, notes, etc in comments
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { signs = true },
    },

    { -- Useful plugin to show you pending keybinds.
        "folke/which-key.nvim",
        event = "VimEnter", -- Sets the loading event to 'VimEnter'
        config = function() -- This is the function that runs, AFTER loading
            require("which-key").setup({
                plugins = {
                    marks = false, -- shows a list of your marks on ' and `
                    presets = {
                        operators = false, -- adds help for operators like d, y, ...
                        motions = false, -- adds help for motions
                        text_objects = false, -- help for text objects triggered after entering an operator
                        windows = false, -- default bindings on <c-w>
                        nav = false, -- misc bindings to work with windows
                        z = true, -- bindings for folds, spelling and others prefixed with z
                        g = false, -- bindings for prefixed with g
                    },
                },
            })

            -- Document existing key chains
            require("which-key").register({
                ["<leader>f"] = { name = "[F]ind", _ = "which_key_ignore" },
                ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
                ["<leader>d"] = { name = "[D]ebug", _ = "which_key_ignore" },
                ["<leader>r"] = { name = "[R]un", _ = "which_key_ignore" },
                ["<leader>t"] = { name = "neo [T]ree", _ = "which_key_ignore" },
                -- ["<leader>h"] = { name = "Git [H]unk", _ = "which_key_ignore" },
            }, { mode = "n" })
            -- visual mode
            -- require("which-key").register({
            -- ["<leader>h"] = { "Git [H]unk" },
            -- }, { mode = "v" })
        end,
    },
    -- nicer look for messages
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
    },
}