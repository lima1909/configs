return {
    { "nvim-treesitter/playground" },
    {
        -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "bash",
                "go",
                "rust",
                "html",
                "http",
                "lua",
                "luadoc",
                "markdown",
                "vim",
                "vimdoc",
                "json",
            },
            auto_install = true,
            indent = { enable = true },
            highlight = {
                enable = true,
            },
        },

        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
