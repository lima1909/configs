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
                lualine_c = { full_file_path },
            },
        })
    end,
}
