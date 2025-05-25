local full_file_path = function()
    return vim.fn.expand("%")
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "dracula",
            },
            sections = {
                -- lualine_c = { full_file_path },
                -- path = 0 → Only the filename (default)
                -- path = 1 → Relative path from the working directory.
                -- path = 2 → Absolute path.
                lualine_c = { { "filename", path = 1, symbols = { modified = "[+]", readonly = "[RO]" } } },
            },
        })
    end,
}
